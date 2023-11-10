unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, OleCtrls, SHDocVw, ExtCtrls, XPMan, ComCtrls,
  Buttons, IniFiles, jpeg, ShellAPI;

type
  TFrmLogin = class(TFrmMain)
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    Panel3: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtUserID: TEdit;
    EdtUserName: TEdit;
    EdtUserPW: TEdit;
    EdtDept: TEdit;
    BtnLogin: TBitBtn;
    BtnCancle: TBitBtn;
    RichEdit1: TRichEdit;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    procedure EdtUserIDChange(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure BtnCancleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    MaxTimes, Gline: Integer;
    procedure LoadVer;
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses DBDM, Commfunc, PatList, Global, qrprntr, qrprev, Maintain,
  ICFunction, PKG, NowUsedMed, CloudDrug;

{$R *.dfm}

procedure TFrmLogin.EdtUserIDChange(Sender: TObject);
begin
  inherited;
  edtUserPw.Hint := '';
  if EdtUserId.Text = '' then
    BtnLogin.Tag := 0;
  if Length(EdtUserId.Text) < 5 then
    exit;

  //特定帳號 doc_code 
  {  附醫 = 'DPDTH'
     雙和 = 'SHDPD'
     萬芳 = 'DENT' or 'DENT1'
  }

  with Dm.QrySearch do
  begin
    Close;
    SQL.Clear;
    //20140213 學承mark 同步人事系統的在職狀態
    SQL.Add(' SELECT A.*,NVL((SELECT USER_DEPT FROM USER_BASIC WHERE USER_ID=A.DOC_CODE ),''' + gsDefaultDeptNo + ''') USER_DEPT ');
    SQL.Add(' FROM DENTAL_DOC_BASIC A WHERE A.DOC_CODE=' + Qt(EdtUserId.Text) + ' and A.REMARK <> ''D'' ');
    //SQL.Add('select a.*,b.user_dept as USER_DEPT from dental_doc_basic a ');
    //SQL.Add('join user_basic b on b.user_id=a.doc_code and b.use_flag=''Y'' where a.doc_code=' + Qt(EdtUserId.Text));
    //SQL.SaveToFile('loging.sql');
    open;
    if recordcount = 1 then
    begin
      EdtUserName.Text := FieldByName('DOC_NAME').AsString;
      EdtUserPW.Hint := Trim(FieldByName('PSWD_DESC').AsString);
      EdtUserName.Hint := FieldByName('VS_TS').AsString;
      EdtDept.Text := FieldByName('DEPT_CODE').AsString;
      EdtDept.Hint := FieldByName('USER_DEPT').AsString;
      Label1.Hint := FieldByName('PSWD_DESC').AsString;
      Label2.Hint := FieldByName('UPD_DATE').AsString;
      EdtUserID.Hint := FieldByName('dec_doc').AsString;
      EdtUserPW.SetFocus;
    end
    else
    begin
      EdtUserName.Text := '';
      EdtUserPW.Hint := '';
      EdtUserName.Hint := '';
      EdtDept.Text := '';
      EdtDept.Hint := '';
      Label1.Hint := '';
      Label2.Hint := '';
    end;
    Close;
  end;
end;

procedure TFrmLogin.BtnLoginClick(Sender: TObject);
var
  key: Word;
  iDay, Days, myStr, myParamter: string;
  i: Integer;
  ls_chk, ls_psw_msg: string;
begin
  inherited;

  ClearReg;
  //111.01.07 shh ITe 11138 modify 雙和新密碼認證機制
  {DM.QryTemp.Close;
  DM.QryTemp.SQL.Clear;
  DM.QryTemp.SQL.Text := 'select f_use_pwd(''L'',' + Qt(trim(EdtUserID.Text)) + ',' + Qt(trim(EdtUserPw.Text)) + ') chk from DUAL';
  DM.QryTemp.Open;

  ls_chk := DM.QryTemp.fieldbyname('CHK').AsString;
  ls_psw_msg:= copy(TRIM(ls_chk), 3, length(ls_chk));
  ls_chk := copy(TRIM(ls_chk),1,1);

  if ls_chk = 'U' then
  begin
    //登入成功  需改密碼
    ShowMessage(ls_psw_msg);
    if not Assigned(FrmPKG) then
    begin
      FrmPKG := TFrmPKG.Create(Self);

      FrmPKG.doc_code := EdtUserID.Text;
      FrmPKG.doc_name := trim(EdtUserName.Text);
      FrmPKG.PageControl1.ActivePageIndex := 0;
      edtUserPw.Text := '';

      try
        FrmPkg.ShowModal;
        if FrmPkg <> nil then
          FrmPkg := nil;
      except
        if FrmPkg <> nil then
          FrmPkg := nil;
      end;

      edtUserPw.Text:='';
      EdtUserID.OnChange(EdtUserID);
      Exit;
    end;
  end
  else if ls_chk = 'Y' then
  begin
    //登入成功  do nothing;
  end
  else
  begin
    ShowMessage(ls_psw_msg);
  end;
  

  //111.01.07 shh ITe 11138 modify 雙和新密碼認證機制
  if ls_chk = 'Y' then
  begin}

  if (Trim(edtUserPw.Hint) <> '') and (edtUserPw.Text = EdtUserPw.Hint) then
  begin

    iDay := NullStrTo(SetSys.ReadString('SYSTEM', 'ISO27001', '0'), '0');
    if iDay <> '0' then
    begin
      try
        Days := RocDate(now - StrToInt(iDay), '');
        if Days > Trim(Label2.Hint) then
        begin
          ShowMessage('您的密碼已超過[' + iday + '天]沒有進行變更' + #10#13 + '請變更密碼後再行登入');
          if not Assigned(FrmPKG) then
            FrmPKG := TFrmPKG.Create(Self);
          FrmPKG.doc_code := EdtUserID.Text;
          FrmPKG.doc_name := trim(EdtUserName.Text);
          FrmPKG.PageControl1.ActivePageIndex := 0;
          FrmPkg.ShowModal;
          edtUserPw.Text := '';
          //111-04-07-先不修改
          //EdtUserPw.Hint := GetDOCPSW();
          Exit;
        end;
      except
      end;
    end;     
    setDocName(trim(EdtUserName.Text));
    setDocCode(EdtUserID.Text);
    setDocName1(trim(EdtUserName.Text));
    setDocCode1(EdtUserID.Text);
    setDocPsw(EdtUserPW.Text);
    setDocId(EdtUserName.Hint);
    setDecFlag(EdtUserID.Hint);
    setDocDeptCode(EdtDept.Hint);

    //20140113 藥品公告
    myStr := Setsys.ReadString('WEB', '藥品公告', '');
    myParamter := Setsys.ReadString('PARAMTER', '藥品公告', '');
    comStrRep(mystr);
    comstrRep(myParamter);
    if myStr <> '' then
    begin
      //ShowMessage('藥品公告:myStr:'+mystr+' /myParamter:'+myParamter );
      try
        if WinExecAndWait32(PChar(PChar(myStr) + ' ' + PChar(myParamter)), SW_SHOWNORMAL) = -1 then
        begin
          ShellExecute(Handle, 'open', PChar(myStr), PChar(myParamter), nil, SW_SHOWNORMAL);
        end;
      except
      end;
    end;

    if not Assigned(FrmPatList) then
      FrmPatList := TFrmPatList.Create(Self);
    FrmPatList.rdg_app.ItemIndex := 9;
    FrmPatList.CmbDocList.Text := '';
    Self.Hide;
    FrmPatList.SetCategory(0);
    FrmPatList.firsttime := true;
    FrmPatList.ShowModal;
    Self.Show;
  end
  else
  begin
    BtnLogin.Tag := BtnLogin.Tag + 1;
    edtUserPw.Text := '';
    edtUserPw.SetFocus;
    if BtnLogin.Tag >= 3 then
      BtnCancleClick(BtnCancle);
  end;
  DM.QrySearch.Close;
end;

procedure TFrmLogin.BtnCancleClick(Sender: TObject);
begin
  inherited;
  EdtUserId.Text := '';
  EdtUserName.Text := '';
  EdtUserPW.Text := '';
  EdtUserPW.Hint := '';
  EdtDept.Text := '';
  EdtDept.Hint := '';
  BtnLogin.Tag := 0;
  ClearReg;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
var
  TempS: string;
begin
  inherited;
  Setsys := TIniFile.Create(ExtractFileDir(Application.ExeName) + '/DPDConfig.ini');
  MaxTimes := StrToInt(Setsys.ReadString('SYSTEM', 'USE TIME', '120'));
  gsIniDeptCode := Setsys.ReadString('DPD', 'DEPTCODE', '''40''');
  gsDefaultDeptNo := Setsys.ReadString('DPD', 'DEFAULTDEPTCODE', '''40''');
  gsOpdKind := Setsys.ReadString('DPD', 'OPDKIND', '''O''');
  gsOpdCnt := Setsys.ReadString('DPD', 'OPDCNT', '20');
  isSign := StrToBool(SetSys.ReadString('DPD', 'SIGN', 'False'));
  isDXray := StrToBool(SetSys.ReadString('DPD', 'DPDXRAY', 'False'));
  isInsDoc := StrToBool(SetSys.ReadString('DPD', 'INSDOC', 'False'));
  isFatDoc := StrToBool(SetSys.ReadString('DPD', 'FATDOC', 'False'));
  isSOAP := StrToBool(SetSys.ReadString('DPD', 'SOAP', 'False'));
  gsSysMsg := SetSys.ReadString('SYSTEM', '系統訊息', '');
  PARTTYPE := SetSys.ReadString('DPD', 'PARTTYPE', '');
  CASETYPE := SetSys.ReadString('DPD', 'CASETYPE', '');
  PAYTYPE := SetSys.ReadString('DPD', 'PAYTYPE', '');
  Temps := SetSys.ReadString('SYSTEM', '印表機選項', '');
  SetUseTime(MaxTimes);
  VsDoc := TStringList.Create;
  Cost := TStringList.Create;
  Dept := TStringList.Create;
  Uuser := TStringList.Create;
  gsOrderType := TStringList.Create;
  gsCir := TStringList.Create;
  gsPath := TStringList.Create;
  gsXpath := TStringList.Create;
  gsLabGroup := TStringList.Create;
  gsLabSample := TStringList.Create;
  gsCheckRoom := TStringList.Create;
  gsunitDesc := TStringList.Create;
  OutList := TstringList.Create;
  SpecMed := TStringList.create;//20140115
  SpecbgMed:= TStringList.create;//20140115
  CheckPat;

  gsCir.Clear;
  with Dm.QrySearch do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select CIR_CODE,CIR_DESC from CIR_BASIC ORDER BY CIR_CODE');
    open;
    while not Eof do
    begin
      gsCir.Add(TRIM(FieldByName('CIR_CODE').AsString) + '_' + TRIM(FieldByName('CIR_DESC').AsString));
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select PATH_CODE,PATH_DESC from PATH_BASIC ORDER BY PATH_CODE');
    OPEN;
    while not Eof do
    begin
      gsPath.Add(Trim(FieldByName('Path_code').AsString) + '_' + Trim(FieldByName('PATH_DESC').AsString));
      Next;
    end;

    Close;//20140115
    SQL.Clear;
    SQL.Add('select trim(med_code)||''_''||trim(font_color_r)||''_''||trim(font_color_g)||''_''||trim(font_color_b) as med from SPEC_MED where MED_KIND=''01'' and CNCL_FLAG=''N'' ');
    Open;
    while not Eof do
    begin
      SpecMed.Add(DM.QrySearch.FIELDBYNAME('med').AsString);
      Next;
    end;

    Close;//20140115
    SQL.Clear;
    SQL.Add('select trim(med_code)||''_''||trim(bg_color_r)||''_''||trim(bg_color_g)||''_''||trim(bg_color_b) as med from SPEC_MED where MED_KIND=''05'' and CNCL_FLAG=''N'' ');
    Open;
    while not Eof do
    begin
      SpecbgMed.Add(DM.QrySearch.FIELDBYNAME('med').AsString);
      Next;
    end;


    Close;
    SQL.Clear;
    SQL.Add('Select Code_one,Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=' + Qt('R2') + ' Order by Code_one');
    Open;
    while not Eof do
    begin
      gsXpath.Add(Trim(FieldByName('Code_one').AsString) + '_' + Trim(FieldByName('Code_oneName').AsString) + ' Order by Code_one');
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select Code_one,Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=' + Qt('L1') + ' Order by Code_one');
    Open;
    while not Eof do
    begin
      gsLabGroup.Add(Trim(FieldByName('Code_one').AsString) + '_' + Trim(FieldByName('Code_oneName').AsString));
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select Code_one,Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=' + Qt('L2') + ' Order by Code_one');
    Open;
    while not Eof do
    begin
      gsLabSample.Add(Trim(FieldByName('Code_one').AsString) + '_' + Trim(FieldByName('Code_oneName').AsString));
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select Code_one,Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=' + Qt('C1') + ' Order by Code_one');
    Open;
    while not Eof do
    begin
      gsCheckRoom.Add(Trim(FieldByName('Code_one').AsString) + '_' + Trim(FieldByName('Code_oneName').AsString));
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select Code_one,Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=' + Qt('T1') + ' Order by Code_one');
    Open;
    while not Eof do
    begin
      gsOrderType.Add(Trim(FieldByName('Code_one').AsString) + '_' + Trim(FieldByName('Code_oneName').AsString));
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select Code_one,Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=' + Qt('M2') + ' Order by Code_one');
    Open;
    while not Eof do
    begin
      gsUnitDesc.Add(Trim(FieldByName('Code_one').AsString) + '_' + Trim(FieldByName('Code_oneName').AsString));
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select trim(dept_code) dept_code,trim(smpl_desc) smpl_desc from Dept_basic ');
    Open;
    while not Eof do
    begin
      Dept.Add(Trim(FieldByName('dept_code').AsString) + '_' + Trim(FieldByName('smpl_desc').AsString));
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('select * from printer_basic where pr_code=' + Qt('IPD'));
    open;
    IPDUsePrinter := NullStrTo(Trim(FieldByName('PR_NAME').AsString), 'LOCAL_A4');
    Close;

  end;

end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  inherited;
  LoadVer;
  WebBrowser1.Navigate(Setsys.ReadString('WEB', '登入網頁', ''));
  //雲端藥歷1031014
  IC_MachineStatus   := False;
  IC_PhysicianStatus := False;
  IC_PatientStatus   := False;

  BtnCancleClick(BtnCancle);

  if Label1.Tag = 0 then
  begin
    if (ParamStr(1) <> '') and (ParamStr(2) <> '') and (EdtUserPW.Tag = 0) then
    begin
      EdtUserID.Text := Trim(ParamStr(1));
      EdtUserPW.Text := Trim(ParamStr(2));
      Label1.Tag := 1;
      BtnLogin.SetFocus;
    end
    else
    begin
      ClearReg();
      ClearPat();
    end
  end
  else
  begin
    ClearReg();
    ClearPat();
  end;
  DELETEFILE(ExtractFileDir(Application.ExeName) + '\Count.ini');
  ic_start_thread := ic_start.Create(false);
  //
  if pos('環境',FrmLogin.Caption) = 0 then
     FrmLogin.Caption := FrmLogin.Caption + DM.gsTitle;
end;

procedure TFrmLogin.Timer1Timer(Sender: TObject);
var
  newPoint: TPoint;
begin
  inherited;
  Getcursorpos(newpoint);
  if (newpoint.x <> myPoint.x) or (newpoint.y <> myPoint.y) then
  begin
    SetUseTime(maxtimes);
    myPoint := newPoint;
  end
  else
  begin
    SetUseTime(GetUseTime - 1);
  end;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  try
    DM.ADOLink.Connected := False;
    Action := cafree;
  except
  end;
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
  inherited;
  try
    FrmLogin := nil;
  except
  end;
end;

procedure TFrmLogin.LoadVer;
var
  FileStr: string;
begin

  with DM.QryTemp do
  begin
    FileStr := SetSys.ReadString('SYSTEM', 'PATCH', '');
    Close;
    SQL.Clear;
    SQL.Add('select * from ipd_vision where KIND=''D''');
    open;
    RichEdit1.Lines.Text := FieldByName('Message').AsString;
    if DPD_Ver <> Trim(FieldByName('VER').AsString) then
    begin
      Close;
      WinExec(PChar(ExtractFileDir(Application.ExeName) + '/Leader.exe'), SW_SHOWNORMAL);
      self.Close;
    end;
  end;

end;

procedure TFrmLogin.Timer2Timer(Sender: TObject);
begin
  inherited;
  if FrmLogin.Visible then
  begin
    if Gline = RichEdit1.Lines.Count - 4 then
    begin
      GLine := 0;
      RichEdit1.Perform(WM_VSCROLL, SB_TOP, 0);
    end
    else
    begin
      RichEdit1.Perform(WM_VSCROLL, SB_LINEDOWN, 0);
      Inc(Gline);
    end;
  end;
end;

procedure TFrmLogin.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if (Trim(edtUserPw.Hint) <> '') and (edtUserPw.Text = EdtUserPw.Hint) and (EdtUserName.Hint = 'A') then
  begin
    if not Assigned(FrmMaintain) then
      FrmMaintain := TFrmMaintain.Create(Self);

    FrmMaintain.OperID := trim(EdtUserID.Text);
    FrmMaintain.Edt_LeaveDate.Text := '9991231';
    FrmMaintain.Edt_Dept.Text := gsDefaultDeptNo;
    Self.Hide;
    FrmMaintain.ShowModal;
    self.Show;
  end;
end;

end.

