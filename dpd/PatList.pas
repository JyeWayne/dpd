unit PatList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, ExtCtrls, ComCtrls, DBCtrls, dbcgrids, StdCtrls, Mask,
  Buttons, ToolWin, DB, ADODB, XPMan, Grids, ShellAPI, Registry;

type
  TDBCtrlGrid = class(DBCGrids.TDBCtrlGrid)
  protected
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean; override;
  public
  end;


type
  TFrmPatList = class(TFrmMain)
    Panel4: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    BegDay: TSpeedButton;
    edt_doc_name: TEdit;
    mask_begday: TMaskEdit;
    edt_doc_code: TEdit;
    G_condition: TGroupBox;
    Label5: TLabel;
    edt_chr_no: TEdit;
    rdo_chr: TRadioButton;
    rdg_app: TRadioGroup;
    RG_Shift_No: TRadioGroup;
    BtnConfirm: TButton;
    BtnICConfirm: TButton;
    Pnl_Category: TPanel;
    Panel3: TPanel;
    Pnl_Finish: TPanel;
    Pnl_Wait: TPanel;
    DBCG_PatLst: TDBCtrlGrid;
    Label2: TLabel;
    Pat_Name: TDBText;
    Label3: TLabel;
    Chr_No: TDBText;
    Label6: TLabel;
    SexType: TDBText;
    Label7: TLabel;
    Age: TDBText;
    DEC_name: TDBText;
    Label13: TLabel;
    Sqe_No: TDBText;
    Label15: TLabel;
    Label16: TLabel;
    Opd_Status: TDBText;
    ADORegQ: TADOQuery;
    ADORegD: TDataSource;
    Allergic: TDBText;
    Shape1: TShape;
    BtnOperICConfirm: TButton;
    Wait: TDBText;
    BtnHISTreat: TButton;
    Label12: TLabel;
    CmbDocList: TComboBox;
    BtnTtlAmt: TButton;
    BtnSingIn: TButton;
    BtnSingOut: TButton;
    Button3: TButton;
    opd_date: TDBText;
    Label9: TLabel;
    Shape2: TShape;
    Label8: TLabel;
    REG_SEQ_NO: TDBText;
    Label10: TLabel;
    idl_date: TDBText;
    idl_fee_code: TDBText;
    Label11: TLabel;
    EXE_Name: TDBText;
    Label14: TLabel;
    DEPT_DESC: TDBText;
    Timer1: TTimer;
    BtnRegLst: TButton;
    BtnLendChr: TButton;
    Shape3: TShape;
    idl_ins_seq_no: TDBText;
    PnlShow: TPanel;
    LblShow: TLabel;
    Shape4: TShape;
    Button4: TButton;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    Button5: TButton;
    CheckBox2: TCheckBox;
    ComboBox1: TComboBox;
    LblICCar: TLabel;
    ICSEQ_PB: TProgressBar;
    ICSEQ_Lbl: TLabel;
    Elderly_Mark: TLabel;
    procedure Addparams(Sender: TObject);
    procedure Pnl_WaitClick(Sender: TObject);
    procedure rdg_appClick(Sender: TObject);
    procedure rdo_chrClick(Sender: TObject);
    procedure BegDayClick(Sender: TObject);
    procedure Pat_NameClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnICConfirmClick(Sender: TObject);
    procedure BtnOperICConfirmClick(Sender: TObject);
    procedure BtnHISTreatClick(Sender: TObject);
    procedure DBCG_PatLstClick(Sender: TObject);
    procedure CmbDocListChange(Sender: TObject);
    procedure CmbDocListClick(Sender: TObject);
    procedure BtnTtlAmtClick(Sender: TObject);
    procedure BtnSingInClick(Sender: TObject);
    procedure BtnSingOutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBCG_PatLstPaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure edt_chr_noKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnRegLstClick(Sender: TObject);
    procedure BtnLendChrClick(Sender: TObject);
    procedure Shape2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure LblICCarClick(Sender: TObject);
  private
    { Private declarations }
    category, ms, printcount: integer;
    procedure SetOpdStatusPnl();
    procedure AppDoc;
    procedure ClearSet;
    procedure ChkSign();
    procedure ShowPnlMsg(str: string);
    procedure PDelay();
    function icrewrite():Boolean;
  public
    { Public declarations }
    firsttime : boolean;
    procedure SetCategory(no: integer);
    procedure barcodeprint();
    procedure Write_file(file_name,Desc: string);
  end;

var
  FrmPatList: TFrmPatList;

implementation

uses Global, Order, DBDM, SqlCenter, Commfunc, frm_calenderUnit1,
  DPDThread, ICFunction, Ditto, ChrEstimate, TtlAmt, DPDFunc, PKG,
  QR_RegLst, BarCodePrint, Chdate, Math;

{$R *.dfm}

function TDBCtrlGrid.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean;
begin
  if WheelDelta < 0 then datasource.DataSet.Next;
  if wheelDelta > 0 then DataSource.DataSet.Prior;
end;

procedure TFrmPatList.PDelay();
var FirstTickCount: longint;
begin
  FirstTickCount := GetTickCount;
  repeat
    Application.ProcessMessages;
  until ((GetTickCount - FirstTickCount) >= Longint(ms));
end;

procedure TFrmPatList.ShowPnlMsg(str: string);
begin
  LblShow.Caption := str;
  if length(LblShow.Caption) > 15 then
    PnlShow.Width := PnlShow.Constraints.MinWidth + (length(LblShow.Caption) - 15) * 5;
  PnlShow.Top := (Self.Height div 2) - (PnlShow.Height);
  PnlShow.Left := (Self.Width div 2) - (PnlShow.Width div 2);
  PnlShow.Visible := true;
  ms := 10000000;
  PDelay();
end;

procedure TFrmPatList.ClearSet;
begin
  setOpdDate('');
  setChrNo('');
  setDeptCode('');
  setFeeNo('');
  setShiftNo('');
  setSeqNo('');
  setPatID('');
  setOpdStatus('');
  setOrderStatus('');
  setOpdKind('');
  setDeptDesc('');
  setDeptRoom('');
  setIcSeqNo('');
  setIdlDate('');
  setIdlFeeCode('');
  setIdlPosition('');
  setIdlCardNo('');
  setROOMDESC('');
  setOPDSTATUSDESC('');
  setDocCode2('');
  setDocName2('');
  setDocCode3('');
  setDocName3('');
  setPARTDESC('');
  setCASEDESC('');
  setPAYDESC('');
  setDocCode('');
  setPatName('');
  setIdNo('');
  setAcType('');
  setBirthDate('');
  setPSex('');
  setPAge('');
  setMAge('');
  setDiscCode('');
  setPainScore('');
  setBodyWeight('');
end;

procedure TFrmPatList.SetCategory(no: integer);
begin
  category := no;
end;

procedure TFrmPatList.Addparams(Sender: TObject);
var
  SqlStr: string;
  begday, no, dept_code, chr_no, doc_code: string;
begin
  if (trim(edt_chr_no.Text) <> '') and (rdo_chr.Checked) then
    edt_chr_no.Text := ADChar(edt_chr_no.Text, '0', 8);

  if FrmPatList.Tag = 0 then
    ClearSet;
  if rdg_app.ItemIndex >= 0 then
    dept_code := rdg_app.Items[rdg_app.ItemIndex];
  no := IntToStr(RG_Shift_No.ItemIndex + 1);
  begday := mask_begday.Text;
  chr_no := trim(edt_chr_no.Text);
  if (CmbDocList.Text) <> '' then
    doc_code := ReturnName(CmbDocList.Text) + '%'
  else
    doc_code := '%';

  if (rdg_app.ItemIndex >= 0) and (rdg_app.ItemIndex < (rdg_app.Items.Count - 1)) then
  begin
    SqlStr := getRegSqlStr(2);

    SqlStr := StringReplace(SqlStr, '$DOC_CODE$', doc_code, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$OPD_KIND$', gsOpdKind, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$app_dept_code$', dept_code, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$OPD_DATE$', begday, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$SHIFT_NO$', no, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$DEPT_CODE$', gsIniDeptCode, [rfReplaceAll]);

  end
  else if rdo_chr.Checked then
  begin
    SqlStr := getRegSqlStr(1);
    SqlStr := StringReplace(SqlStr, '$DOC_CODE$', doc_code, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$OPD_KIND$', gsOpdKind, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$CHR_NO$', chr_no, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$DEPT_CODE$', gsIniDeptCode, [rfReplaceAll]);

  end
  else
  begin
    SqlStr := getRegSqlStr(0);
    SqlStr := StringReplace(SqlStr, '$DOC_CODE$', doc_code, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$OPD_KIND$', gsOpdKind, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$OPD_DATE$', begday, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$SHIFT_NO$', no, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$DEPT_CODE$', gsIniDeptCode, [rfReplaceAll]);

  end;

  SqlStr := StringReplace(SqlStr, '$PARTTYPE$', PARTTYPE, [rfReplaceAll]);
  SqlStr := StringReplace(SqlStr, '$CASETYPE$', CASETYPE, [rfReplaceAll]);
  with ADORegQ do
  begin
    Close;
    SQL.Clear;
    SQL.Text := SqlStr;
    SQL.SaveToFile('sql.sql');
  end;

  ADORegQ.Filtered := false;
  case (category) of
    3:
      ADORegQ.Filter := ' OPD_STATUSCODE = ''3'' or OPD_STATUSCODE = ''4'' or OPD_STATUSCODE = ''5''  ';
    2:
      ADORegQ.Filter := ' OPD_STATUSCODE = ''1'' ';
  else
    ADORegQ.Filter := ' OPD_STATUSCODE = ''1'' or OPD_STATUSCODE = ''2'' ';
  end;
  ADORegQ.Filtered := true;
  ADORegQ.Open;

  case (category) of
    3:
      begin
        Pnl_Finish.Caption := '*完診區*';
        Pnl_Finish.Font.Color := ClRed;
        Pnl_Finish.BorderStyle := bsSingle;
        Pnl_Finish.Caption := Pnl_Finish.Caption + '( ' + IntToStr(ADORegQ.RecordCount) + ' )';
      end;
  else
    begin
      Pnl_Wait.Caption := '*候診區*';
      Pnl_Wait.Font.Color := ClRed;
      Pnl_Wait.BorderStyle := bsSingle;
      Pnl_Wait.Caption := Pnl_Wait.Caption + '( ' + IntToStr(ADORegQ.RecordCount) + ' )';
    end;

  end;

  if TButton(Sender).Name = 'BtnConfirm' then
    DBCG_PatLst.SetFocus;

  if (ADORegQ.FieldByName('chr_no').AsString <> '') and (FrmPatList.Tag = 0) then
  begin
    setChrNo(ADORegQ.FieldByName('chr_no').AsString);
    setPatName(ADORegQ.FieldByName('pat_name').AsString);
    setFeeNo(ADORegQ.FieldByName('fee_no').AsString);
    setDocCode2(ADORegQ.FieldByName('dec_doc').AsString);
  end;
end;

procedure TFrmPatList.SetOpdStatusPnl();
begin
  Pnl_Wait.Caption := '候診區';
  Pnl_Wait.Font.Color := ClBlack;
  Pnl_Wait.BorderStyle := bsNone;
  Pnl_Finish.Caption := '完診區';
  Pnl_Finish.Font.Color := ClBlack;
  Pnl_Finish.BorderStyle := bsNone;
end;

procedure TFrmPatList.Pnl_WaitClick(Sender: TObject);
begin
  inherited;
  SetOpdStatusPnl;
  TPanel(Sender).Caption := '*' + TPanel(Sender).Caption + '*';
  TPanel(Sender).Font.Color := ClRed;
  TPanel(Sender).BorderStyle := bsSingle;
  category := TPanel(Sender).Tag;
  Addparams(Sender);
end;

procedure TFrmPatList.rdg_appClick(Sender: TObject);
var
  Qrys: TADOQuery;
  tmpSql: string;
  SQLs: TStrings;
begin
  inherited;
  AppDoc;
  rdo_chr.Checked := false;
  Addparams(Sender);
end;

procedure TFrmPatList.rdo_chrClick(Sender: TObject);
var
  Qrys: TADOQuery;
  tmpSql: string;
  SQLs: TStrings;
begin
  inherited;
  AppDoc;
  rdg_app.ItemIndex := -1;
end;

procedure TFrmPatList.BegDayClick(Sender: TObject);
var
  OneDate: string;
begin
  inherited;
  OneDate := '';
  frm_calendar := Tfrm_calendar.Create(nil);
  try
    frm_calendar.type_flag := '2';

    frm_calendar.Top := mouse.CursorPos.Y;
    frm_calendar.Left := mouse.CursorPos.X;
    frm_calendar.ShowModal;
    OneDate := frm_calendar.OneDate;
  finally
    frm_calendar.Free;
  end;
  if trim(OneDate) <> '' then
  begin
    mask_begday.Text := AddChar(OneDate, '0', 7);
    Addparams(Sender);
  end;
end;

procedure TFrmPatList.Pat_NameClick(Sender: TObject);
var
  today, SpName, ExeSPResult, tmp1, SqlStr: string;
  SQLs, Paramter, PType, RType, PData: TStrings;
  Qrys, TempQ: TADOQuery;
  isTrue, FirstChr, isChkSign: Boolean;
  PatUseDoc, patIP: string;
  ttStr : String;
begin
  inherited;
  PatUseDoc := '';
  if (not ADORegQ.IsEmpty) then
  begin
    SQLs := TStringList.Create;
    Paramter := TStringList.Create;
    PType := TStringList.Create;
    RType := TStringList.Create;
    PData := TStringList.Create;
    SpName := '';

    SQLs.Text := ' Select * from "SYSDATE" ';
    if DM.OpenSQL(SQLs, Qrys) then
      today := Qrys.FieldByName('date').AsString
    else
      today := ROCDate(now, '');

    if StrToInt(ADORegQ.FieldByName('opd_date').AsString) > StrToInt(today) then
    begin
      ShowPnlMsg('所選擇病患為未來預約病患' + #10#13 + '因此無法進入牙科醫令請醫師重新選擇！');
      Abort;
    end;

    if Trim(ADORegQ.FieldByName('death_flag').AsString) = 'Y' then
    begin
      ShowPnlMsg('此人***' + ADORegQ.FieldByName('pat_name').AsString + '***' + #10#13 + '已被通報為死亡病歷請詳細確認病人身分。');
      //Abort;
    end;

    if trim(ADORegQ.FieldByName('chr_no').AsString) = '' then
    begin
      ShowPnlMsg('所選擇病患尚未填寫病歷' + #10#13 + '請至掛號櫃臺報到！');
      Abort;
    end;

    isChkSign := false;
    case StrToInt(ADORegQ.FieldByName('SHIFT_NO').AsString) of
      1:
        if ROCTime(now, '') >= '0830' then
          isChkSign := true;
      2:
        if ROCTime(now, '') >= '1330' then
          isChkSign := true;
      3:
        if ROCTime(now, '') >= '1730' then
          isChkSign := true;

    end;

    if (not isSign) and (isChkSign) then
    begin
      SQLs.Clear;
      SqlStr := getChkSqlStr(70);
      SetParamter(SqlStr, '$OPD_DATE$', ADORegQ.FieldByName('OPD_DATE').AsString);
      SetParamter(SqlStr, '$SHIFT_NO$', ADORegQ.FieldByName('SHIFT_NO').AsString);
      SetParamter(SqlStr, '$DOC_CODE$', ADORegQ.FieldByName('doc_code').AsString);
      SqlStr := StringReplace(SqlStr, '$OPD_KIND$', gsOpdKind, [rfReplaceAll]);
      //20140919
      //SetParamter(SqlStr, '$OPD_KIND$', ADORegQ.FieldByName('OPD_KIND').AsString);
      SQLs.Text := SqlStr;
      if DM.OpenSQL(SQLs, Qrys) then
      begin
        if Qrys.FieldByName('login_time').AsString = '' then
        begin
          //簽到
          SQLs.Clear;
          ttStr := 'update opd_seq set login_time = ''' + ROCTime(now, '') + '''' +
                    ' where opd_kind = ''O'' and opd_date = ''' + ADORegQ.FieldByName('OPD_DATE').AsString + '''' +
                    ' and f_get_hia_dept(dept_code) like ''40%'' and shift_no=''' + ADORegQ.FieldByName('SHIFT_NO').AsString + '''' +
                    ' and doc_code=''' + ADORegQ.FieldByName('doc_code').AsString + '''';
          SQLs.Add(ttStr);
          DM.ExecSQL(SQLs);
        end;
      end;
    end;


    if (isChkSign) and (isSign) then
    begin
      SQLs.Clear;
      SqlStr := getChkSqlStr(70);
      SetParamter(SqlStr, '$OPD_DATE$', ADORegQ.FieldByName('OPD_DATE').AsString);
      SetParamter(SqlStr, '$SHIFT_NO$', ADORegQ.FieldByName('SHIFT_NO').AsString);
      SetParamter(SqlStr, '$DOC_CODE$', ADORegQ.FieldByName('doc_code').AsString);
      SqlStr := StringReplace(SqlStr, '$OPD_KIND$', gsOpdKind, [rfReplaceAll]);
      //SetParamter(SqlStr, '$OPD_KIND$', ADORegQ.FieldByName('OPD_KIND').AsString);
      SQLs.Text := SqlStr;
      if DM.OpenSQL(SQLs, Qrys) then
        if Qrys.FieldByName('login_time').AsString = '' then
        begin
          ShowPnlMsg('主治醫師' + ADORegQ.FieldByName('doc_name').AsString + '尚未簽到' + #13'請主治醫師先簽到在點選病人');
          Abort;
        end;
    end;

    SqlStr := getChkSqlStr(1);
    SqlStr := StringReplace(SqlStr, '$OPD_DATE$', ADORegQ.FieldByName('opd_date').AsString, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$SHIFT_NO$', ADORegQ.FieldByName('shift_no').AsString, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$CHR_NO$', ADORegQ.FieldByName('chr_no').AsString, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$SEQ_NO$', ADORegQ.FieldByName('reg_seq_no').AsString, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$DEPT_CODE$', ADORegQ.FieldByName('dept_code').AsString, [rfReplaceAll]);
    SqlStr := StringReplace(SqlStr, '$DEPT_ROOM$', ADORegQ.FieldByName('dept_room').AsString, [rfReplaceAll]);
    SQLs.Clear;
    SQLs.Text := SqlStr;
    //SQLs.SaveToFile('s1.sql');
    isTrue := DM.OpenSQL(SQLs, Qrys);

    if trim(Qrys.FieldByName('cncl_flag').AsString) = 'N' then
    begin

      if trim(Qrys.FieldByName('FEE_NO').AsString) = '' then
      begin
        repeat
          Paramter.Clear;
          PType.Clear;
          RType.Clear;
          PData.Clear;
          SpName := getSpSql(1, Paramter, PType, RType);
          PData.Add('F');
          PData.Add(getDocCode);
          PData.Add('');
          ExeSPResult := DM.ExecSP(Paramter, PType, RType, PData, SpName);
        until ReturnId(ExeSpResult) <> 'Error';

        while ReturnId(ExeSpResult) <> '' do
        begin
          tmp1 := ReturnId(ExeSpResult);
          if tmp1 <> '' then
            setFeeNo(tmp1);

          ExeSpResult := ReturnName(ExeSpResult);
        end;
      end
      else
      begin
        SetFeeNo(Qrys.FieldByName('Fee_No').AsString);
      end;
    end
    else
    begin
      ShowPnlMsg('此人' + ADORegQ.FieldByName('pat_name').AsString + '已向櫃檯退掛.請與櫃檯人員確認。');
      Abort;
    end;
    //取完FEE_NO後作業
    PatUseDoc := GetDocCode1;
    if CheckPatUsed(getFeeNo, PatUseDoc, patIP) then
    begin
      //如果有人正在使用該病人資料則無法進入
      ShowMessage('目前病人 : ' + Trim(ADORegQ.FieldByName('pat_name').AsString) + ' 資料正被鎖定使用中' + #10#13
        + '使用者 : ' + PatUseDoc + ' IP : ' + patIP + #10#13 + '請稍後再試，或是通知該使用者儘速完成作業');
      Exit;
    end;
    PatInUsing(GetFeeNo, Trim(ADORegQ.FieldByName('chr_no').AsString), GetDocCode1);

    SqlStr := getRegSqlStr(5);
    SetParamter(SqlStr, '$FEE_NO$', getFeeNo);
    //SetParamter(SqlStr, '$OPD_KIND$', gsOpdKind);
    SetParamter(SqlStr, '$SHIFT_NO$', ADORegQ.FieldByName('shift_no').AsString);
    SetParamter(SqlStr, '$OPD_DATE$', ADORegQ.FieldByName('opd_date').AsString);
    SetParamter(SqlStr, '$DEPT_CODE$', ADORegQ.FieldByName('dept_code').AsString);
    SqlStr := StringReplace(SqlStr, '$OPD_KIND$', gsOpdKind, [rfReplaceAll]);
    SQLs.Clear;
    SQLs.Text := SqlStr;
    //SQls.SaveToFile('s2.sql');
    if DM.OpenSQL(SQLs, Qrys) then
    begin
      setOpdDate(Qrys.FieldByName('opd_date').AsString);
      setChrNo(Qrys.FieldByName('chr_no').AsString);
      setDeptCode(Qrys.FieldByName('dept_code').AsString);
      setShiftNo(Qrys.FieldByName('shift_no').AsString);
      setSeqNo(Qrys.FieldByName('reg_seq_no').AsString);
      if (Qrys.FieldByName('pat_id').AsString = '1') or (Qrys.FieldByName('pat_id').AsString = '2') then
        setPatID(Qrys.FieldByName('pat_id').AsString)
      else
        setPatId('1');
      setOpdStatus(Qrys.FieldByName('opd_statuscode').AsString);
      setOrderStatus(Qrys.FieldByName('order_status').AsString);
      setOpdKind(Qrys.FieldByName('opd_kind').AsString);
      setDeptDesc(Qrys.FieldByName('dept_desc').AsString);
      setDeptRoom(Qrys.FieldByName('dept_room').AsString);
      setIcSeqNo(trim(Qrys.FieldByName('ins_seq_no').AsString));
      setIdlDate(Qrys.FieldByName('idl_date').AsString);
      setIdlFeeCode(Qrys.FieldByName('idl_fee_code').AsString);
      setIdlPosition(Qrys.FieldByName('idl_position').AsString);
      setIdlCardNo(Qrys.FieldByName('idl_ins_seq_no').AsString);
      setROOMDESC(Qrys.FieldByName('room_desc').AsString);
      setOPDSTATUSDESC(Qrys.FieldByName('opd_status').AsString);
      if Qrys.FieldByName('dec_doc').AsString = '' then
      begin
        setDocCode2(Qrys.FieldByName('doc_code').AsString);
        setDocName2(trim(Qrys.FieldByName('DOC_NAME').AsString));
      end
      else
      begin
        setDocCode2(Qrys.FieldByName('dec_doc').AsString);
        setDocName2(trim(Qrys.FieldByName('DEC_Name').AsString));
      end;
      if Qrys.FieldByName('fat_doc').AsString = '' then
      begin
        setDocCode3(Qrys.FieldByName('doc_code').AsString);
        setDocName3(trim(Qrys.FieldByName('DOC_NAME').AsString));
      end
      else
      begin
        setDocCode3(Qrys.FieldByName('fat_doc').AsString);
        setDocName3(trim(Qrys.FieldByName('FAT_Name').AsString));
      end;
      setPARTDESC(Qrys.FieldByName('part_desc').AsString);
      setCASEDESC(Qrys.FieldByName('case_desc').AsString);
      setPAYDESC(Qrys.FieldByName('pay_desc').AsString);
      setDocCode(Qrys.FieldByName('doc_code').AsString);
      setFirstDate(Qrys.FieldByName('idl_date').AsString);
      setFirstInsSeqNo(Qrys.FieldByName('idl_ins_seq_no').AsString);
      setIdlFeeNo(Qrys.FieldByName('idl_fee_no').AsString);
      setDiagFlag(Qrys.FieldByName('DiagFlag').AsString);
      setPatName(trim(Qrys.FieldByName('pat_name').AsString));
      setIdNo(Qrys.FieldByName('id_no').AsString);
      setAcType(Qrys.FieldByName('ac_type').AsString);
      setBirthDate(Qrys.FieldByName('birth_date').AsString);
      setPSex(Qrys.FieldByName('sex_type').AsString);
      tmp1 := IntToStr(StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcYear)));
      setPAge(tmp1);
      tmp1 := getMonth(GetAge(getBirthDate, ROCDate(now, ''), acDay));
      setMAge(tmp1);
      setDiscCode(Qrys.FieldByName('disc_code').AsString);
      setPainScore(Qrys.FieldByName('pain_score').AsString);
      //setBodyWeight(Qrys.FieldByName('bt').AsString);
    end
    else
    begin
      setOpdDate(ADORegQ.FieldByName('opd_date').AsString);
      setChrNo(ADORegQ.FieldByName('chr_no').AsString);
      setDeptCode(ADORegQ.FieldByName('dept_code').AsString);
      setShiftNo(ADORegQ.FieldByName('shift_no').AsString);
      setSeqNo(ADORegQ.FieldByName('reg_seq_no').AsString);
      if (ADORegQ.FieldByName('pat_id').AsString = '1') or (ADORegQ.FieldByName('pat_id').AsString = '2') then
        setPatID(ADORegQ.FieldByName('pat_id').AsString)
      else
        setPatId('1');
      setOpdStatus(ADORegQ.FieldByName('opd_statuscode').AsString);
      setOrderStatus(ADORegQ.FieldByName('order_status').AsString);
      setOpdKind(ADORegQ.FieldByName('opd_kind').AsString);
      setDeptDesc(ADORegQ.FieldByName('dept_desc').AsString);
      setDeptRoom(ADORegQ.FieldByName('dept_room').AsString);
      setIcSeqNo(trim(ADORegQ.FieldByName('ins_seq_no').AsString));
      setIdlDate(ADORegQ.FieldByName('idl_date').AsString);
      setIdlFeeCode(ADORegQ.FieldByName('idl_fee_code').AsString);
      setIdlPosition(ADORegQ.FieldByName('idl_position').AsString);
      setIdlCardNo(ADORegQ.FieldByName('idl_ins_seq_no').AsString);
      setROOMDESC(ADORegQ.FieldByName('room_desc').AsString);
      setOPDSTATUSDESC(ADORegQ.FieldByName('opd_status').AsString);
      if ADORegQ.FieldByName('dec_doc').AsString = '' then
      begin
        setDocCode2(ADORegQ.FieldByName('doc_code').AsString);
        setDocName2(trim(ADORegQ.FieldByName('DOC_NAME').AsString));
      end
      else
      begin
        setDocCode2(ADORegQ.FieldByName('dec_doc').AsString);
        setDocName2(trim(ADORegQ.FieldByName('DEC_Name').AsString));
      end;
      if ADORegQ.FieldByName('fat_doc').AsString = '' then
      begin
        setDocCode3(ADORegQ.FieldByName('doc_code').AsString);
        setDocName3(trim(ADORegQ.FieldByName('DOC_NAME').AsString));
      end
      else
      begin
        setDocCode3(ADORegQ.FieldByName('fat_doc').AsString);
        setDocName3(trim(ADORegQ.FieldByName('FAT_Name').AsString));
      end;
      setPARTDESC(ADORegQ.FieldByName('part_desc').AsString);
      setCASEDESC(ADORegQ.FieldByName('case_desc').AsString);
      setPAYDESC(ADORegQ.FieldByName('pay_desc').AsString);
      setDocCode(ADORegQ.FieldByName('doc_code').AsString);
      setFirstDate(ADORegQ.FieldByName('idl_date').AsString);
      setFirstInsSeqNo(ADORegQ.FieldByName('idl_ins_seq_no').AsString);
      setIdlFeeNo(ADORegQ.FieldByName('idl_fee_no').AsString);
      setDiagFlag(ADORegQ.FieldByName('DiagFlag').AsString);
      setPatName(trim(ADORegQ.FieldByName('pat_name').AsString));
      setIdNo(ADORegQ.FieldByName('id_no').AsString);
      setAcType(ADORegQ.FieldByName('ac_type').AsString);
      setBirthDate(ADORegQ.FieldByName('birth_date').AsString);
      setPSex(ADORegQ.FieldByName('sex_type').AsString);
      tmp1 := IntToStr(StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcYear)));
      setPAge(tmp1);
      tmp1 := getMonth(GetAge(getBirthDate, ROCDate(now, ''), acDay));
      setMAge(tmp1);
      setDiscCode(ADORegQ.FieldByName('disc_code').AsString);
      setPainScore(ADORegQ.FieldByName('pain_score').AsString);
      //setBodyWeight(ADORegQ.FieldByName('bt').AsString);
    end;

    TempQ := TADOQuery.Create(self);
    try
      TempQ.Connection := DM.ADOLink;
      with TempQ do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from opd_basic1 where chr_no='+Qt(getChrno)+' and opd_date='+ Qt(getOpdDate) +' and fee_no ='+Qt(getFeeno));
        open;
        if not Eof then
        begin
          if (TempQ.FieldByName('pat_id').AsString = '1') or (TempQ.FieldByName('pat_id').AsString = '2') then
            setPatID(TempQ.FieldByName('pat_id').AsString);
          Referral := NullStrTo(trim(TempQ.FieldByName('hosp_in').AsString),'');
        end;
      end;
    finally
      TempQ.free;
    end;

    TempQ := TADOQuery.Create(self);
    try
      TempQ.Connection := DM.ADOLink;
      with TempQ do
      begin
        SQL.Add(' SELECT WEIGHT FROM V_WEIGHT V WHERE CHR_NO = ''' + GetChrNo + ''' AND UPD_DATE_TIME = (SELECT MAX(UPD_DATE_TIME) FROM V_WEIGHT WHERE CHR_NO = V.CHR_NO) ');
        OPEN;
        setBodyWeight(FieldByName('WEIGHT').AsString);
        Close;
      end;
    finally
      FreeAndNil(TempQ);
    end;

    if Qrys.FieldByName('FEE_NO').AsString = '' then
    begin
      Paramter.Clear;
      PType.Clear;
      RType.Clear;
      PData.Clear;
      SpName := getSpSql(5, Paramter, PType, RType);
      PData.Add(getOpdDate);
      PData.Add(getChrNo);
      PData.Add(getDeptCode);
      PData.Add(getDocCode);
      PData.Add(getShiftNo);
      PData.Add(getFeeNo);
      PData.Add(getpPatId);
      PData.Add(getOpdStatus);
      PData.Add(getOrderStatus);
      PData.Add(getDocCode1);
      PData.Add(getDeptRoom);
      PData.Add(getSeqNo);
      ExeSPResult := DM.ExecSP(Paramter, PType, RType, PData, SpName);

      if ReturnID(ExeSPResult) = 'N' then
      begin
        MessageDlg(ReturnName(ExeSPResult), mtWarning, [mbOk], 0);
        use_opd_log(DPD_Ver, ReturnName(ExeSPResult));
      end;
    end;
    isReadOnly := false;
    if ((trim(ADORegQ.FieldByName('exe_doc').AsString) <> '') and (trim(ADORegQ.FieldByName('exe_doc').AsString) <> getDocCode1)) or (getDocId = 'A') then
    begin
      isReadOnly := true;
      ShowMessage('此病患已被其他醫師開單！' + #13 + '因此只能查閱無法修改病歷');
    end;

    //20160203取系統時間
    if UpperCase(SetSys.ReadString('DPD', 'SERVERDATE', '')) <> 'TURE' then
      today := trim(ROCDate(now, ''));
    //if MyIP <> '10.15.2.97' then
      if (getOpdDate < today) then
      begin
        ShowMessage('此病人已非看診當日不得修改！' + #13 + '因此只能查閱無法修改病歷');
        isReadOnly := true;
      end;
    
    SqlStr := getChkSqlStr(68);
    SQLs.Clear;
    SetParamter(SqlStr, '$OPD_KIND$', getOpdKind);
    SetParamter(SqlStr, '$OPD_DATE$', getOpdDate);
    SetParamter(SqlStr, '$DEPT_CODE$', getDeptCode);
    SetParamter(SqlStr, '$SHIFT_NO$', getShiftNo);
    SetParamter(SqlStr, '$DEPT_ROOM$', getDeptRoom);
    SetParamter(SqlStr, '$DOC_CODE$', getDocCode);
    SetParamter(SqlStr, '$SEQ_NO$', getSeqNo);
    SQLs.Text := SqlStr;
    //SQLs.SaveToFile('s3.sql');

    if DM.OpenSQL(SQLs, Qrys) then
      if Qrys.FieldByName('order_time').AsString = '' then
      begin
        SqlStr := getUpdSql(18);
        SQLs.Clear;
        SetParamter(SqlStr, '$ORDER_TIME$', ROCTime(now, ''));
        SetParamter(SqlStr, '$OPD_KIND$', getOpdKind);
        SetParamter(SqlStr, '$OPD_DATE$', getOpdDate);
        SetParamter(SqlStr, '$DEPT_CODE$', getDeptCode);
        SetParamter(SqlStr, '$SHIFT_NO$', getShiftNo);
        SetParamter(SqlStr, '$DEPT_ROOM$', getDeptRoom);
        SetParamter(SqlStr, '$DOC_CODE$', getDocCode);
        SetParamter(SqlStr, '$SEQ_NO$', getSeqNo);
        SQLs.Text := SqlStr;
        DM.ExecSQL(SQLs);
      end;

    if not Assigned(FrmOrder) then
      FrmOrder := TFrmOrder.Create(Self);
    FrmOrder.ICSEQ_Lbl.Visible := false;
    FrmOrder.ICSEQ_PB.Position := 0;
    Self.Hide;
    FrmPatList.Tag := 1;
    FrmOrder.frmshow := 'Y';
    FrmOrder.ShowModal;
    FrmPatList.Tag := 0;
    Self.Show;
    SQLs.Free;
    Paramter.Free;
    PType.Free;
    RType.Free;
    PData.Free;
    Addparams(Sender);
  end;

end;

procedure TFrmPatList.AppDoc;
var
  tmpSql: string;
  SQLs: TStrings;
  Qrys: TADOQuery;
begin

  SQLs := TStringList.Create;
  SQLs.Clear;
  tmpSql := getChkSqlStr(19);
  if length(trim(CmbDocList.Text)) < 5 then
    CmbDocList.Text := '';
  SetParamter(tmpSql, '$OPERATE$', 'like');
  SetParamter(tmpSql, '$DOC_CODE$', trim(CmbDocList.Text) + '%');
  case (rdg_app.ItemIndex) of
    0..8:
      SetParamter(tmpSql, '$DEPT_CODE$', rdg_app.Items[rdg_app.ItemIndex]);
  else
    SetParamter(tmpSql, '$DEPT_CODE$', '%');
  end;

  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs, Qrys) then
  begin
    while not Qrys.Eof do
    begin
      CmbDocList.Items.Add(trim(Qrys.FieldByName('doc_name').AsString) + '_' + trim(Qrys.FieldByName('doc_code').AsString));
      Qrys.Next;
    end;
  end;
  SQLs.Free;
end;

procedure TFrmPatList.FormShow(Sender: TObject);
var
  stime: string;
  SQLs: TStrings;
  Qrys: TADOQuery;
  tmpSql: string;
begin
  inherited;
  ICSEQ_Lbl.Visible := False;
  ICSEQ_PB.Visible  := False;
  //icd10切換註記
  DM.QrySearch3.Close;
  DM.QrySearch3.SQL.Clear;                                 // +qt(copy(epd_date,1,5))+
  DM.QrySearch3.SQL.Add('select F_GET_FUNC_value(''35001'','+qt(copy(mask_begday.Text,1,5))+') as code from dual');
  DM.QrySearch3.Open;
  if not DM.QrySearch3.IsEmpty then
  begin
    icdchange := DM.QrySearch3.FieldByName('code').AsString;
  end;

  //是否自動讀雲端藥歷
  if gsReadCloud then
    CheckBox1.Checked := True
  else
    CheckBox1.Checked := False;

  edt_doc_name.Text := getDocName1;
  edt_doc_code.Text := getDocCode1;

  //下手處
  //加入約診醫師
  if (CmbDocList.Text = '') and firsttime then
  begin
    CmbDocList.Text := getDocName1 + '_' + getDocCode1;
    firsttime := false;
  end;

  if DBCG_PatLst.Visible then
    DBCG_PatLst.SetFocus;
  if category = 0 then
  begin
    Pnl_Wait.OnClick(Pnl_Wait);
    stime := ROCTime(now, '');
    if (stime > '0800') and (stime <= '1359') then
      RG_Shift_No.ItemIndex := 0
    else if (stime > '1359') and (stime <= '1759') then
      RG_Shift_No.ItemIndex := 1
    else
      RG_Shift_No.ItemIndex := 2;

    rdg_app.Items.Clear;
    SQLs := TStringList.Create;
    tmpSql := getChkSqlStr(78);
    SQLs.Text := tmpSql;
    if DM.OpenSQL(SQLs, Qrys) then
    begin
      while not Qrys.Eof do
      begin
        rdg_app.Items.Add(Qrys.FieldByName('codeno').AsString);
        Qrys.Next;
      end;
      rdg_app.ItemIndex := rdg_app.Items.Count - 1;
    end;
    SQLs.Free;
  end;
  //
  if pos('環境',FrmPatList.Caption) = 0 then
     FrmPatList.Caption := FrmPatList.Caption + DM.gsTitle;
end;

procedure TFrmPatList.FormDestroy(Sender: TObject);
begin
  inherited;
  try
    FrmPatList := nil;
  except
  end;
end;

procedure TFrmPatList.BtnICConfirmClick(Sender: TObject);
begin
  inherited;
  ic_start_thread := ic_start.Create(false);
  Timer1.Enabled := true;
end;

procedure TFrmPatList.BtnOperICConfirmClick(Sender: TObject);
begin
  inherited;
  ic_HPCstart_thread := ic_HPCstart.Create(false);
  Timer1.Enabled := true;
end;

procedure TFrmPatList.BtnHISTreatClick(Sender: TObject);
begin
  inherited;
  if getChrNo <> '' then
  begin
    if not assigned(FrmDitto) then
      FrmDitto := TFrmDitto.Create(self);
    FrmDitto.Button1.Enabled := false;
    FrmDitto.EdtChrNo.Text := getChrNo;
    FrmDitto.EdtPatName.Text := getPatName;
    FrmDitto.ShowModal;
  end
  else
    ShowPnlMsg('請先選擇病患！再點選就醫記錄');
end;

procedure TFrmPatList.DBCG_PatLstClick(Sender: TObject);
begin
  inherited;
  if ADORegQ.FieldByName('chr_no').AsString <> '' then
  begin
    setChrNo(ADORegQ.FieldByName('chr_no').AsString);
    setPatName(ADORegQ.FieldByName('pat_name').AsString);
    setFeeNo(ADORegQ.FieldByName('fee_no').AsString);
    setDocCode2(ADORegQ.FieldByName('dec_doc').AsString);
    setIdNo(ADORegQ.FieldByName('id_no').AsString);
    setBirthDate(ADORegQ.FieldByName('birth_date').AsString);
    setPSex(ADORegQ.FieldByName('sex_type').AsString);
  end;
end;

procedure TFrmPatList.CmbDocListChange(Sender: TObject);
var
  Qrys: TADOQuery;
  tmpSql: string;
  SQLs: TStrings;
begin
  inherited;
  if length(trim(CmbDocList.Text)) >= 5 then
  begin
    SQLs := TStringList.Create;
    tmpSql := getChkSqlStr(19);
    SetParamter(tmpSql, '$OPERATE$', '=');
    SetParamter(tmpSql, '$DOC_CODE$', trim(CmbDocList.Text));
    case (rdg_app.ItemIndex) of
      1..8:
        SetParamter(tmpSql, '$DEPT_CODE$', rdg_app.Items[rdg_app.ItemIndex]);
    else
      SetParamter(tmpSql, '$DEPT_CODE$', '%');
    end;

    SQLs.Text := tmpSql;

    if DM.OpenSQL(SQLs, Qrys) then
    begin
      CmbDocList.Text := trim(Qrys.FieldByName('doc_name').AsString) + '_' + trim(Qrys.FieldByName('doc_code').AsString);
      CmbDocListClick(Sender);
    end;
    SQLs.Free;
  end;
end;

procedure TFrmPatList.CmbDocListClick(Sender: TObject);
begin
  inherited;
  Addparams(Sender);
end;

procedure TFrmPatList.BtnTtlAmtClick(Sender: TObject);
begin
  inherited;
  if getFeeNo <> '' then
  begin
    if not Assigned(FrmTtlAmt) then
      FrmTtlAmt := TFrmTtlAmt.Create(Self);

    FrmTtlAmt.ShowModal;
  end
  else
    ShowPnlMsg('此病患尚未看診！因此無任何費用');
end;

procedure TFrmPatList.BtnSingInClick(Sender: TObject);
var
  Qrys: TADOQuery;
  tmpSql, stime, Shif_no: string;
  OPDADV: string;
  SQLs: TStrings;
begin
  inherited;
  stime := ROCTime(now, '');
  if (stime > '0800') and (stime <= '1330') then
    Shif_no := '1'
  else if (stime > '1330') and (stime <= '1730') then
    Shif_no := '2'
  else
    Shif_no := '3';

  if ((ROCDate(now, '') >= mask_begday.Text)) and (StrToInt(Shif_no) > (RG_Shift_No.ItemIndex + 1)) then
    Shif_no := IntToStr((RG_Shift_No.ItemIndex + 1));
  SQLs := TStringList.Create;
  SQLs.Clear;
  tmpSql := getChkSqlStr(70);
  SetParamter(tmpSql, '$OPD_DATE$', ROCDate(now, ''));
  SetParamter(tmpSql, '$SHIFT_NO$', Shif_no);
  SetParamter(tmpSql, '$DOC_CODE$', getDocCode1);
  //SetParamter(tmpSql, '$OPD_KIND$', getOpdKind);
  tmpSql := StringReplace(tmpSql, '$OPD_KIND$', gsOpdKind, [rfReplaceAll]);

  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs, Qrys) then
    OPDADV := SetSys.ReadString('DPD', 'OPDADV', '');
  if OPDADV <> '' then
    if Qrys.FieldByName('login_time').AsString = '' then
      winexec(PChar(OPDADV + ' 2;1;X;C;' + getDocCode1 + ';' + Qrys.FieldByName('opd_date').AsString + ';' + Shif_no + ';' + Qrys.FieldByName('dept_code').AsString + ';' + trim(Qrys.FieldByName('dept_room').AsString)), 0)
    else
      ShowPnlMsg('您已完成簽到程序' + #13 + '簽到時間為：' + Qrys.FieldByName('login_time').AsString);

  ChkSign;
end;

procedure TFrmPatList.BtnSingOutClick(Sender: TObject);
var
  Qrys: TADOQuery;
  tmpSql, Shif_no, stime, OPDADV: string;
  SQLs: TStrings;
begin
  inherited;
  if not Assigned(FrmPKG) then
    FrmPKG := TFrmPKG.Create(Self);
  FrmPKG.doc_code := edt_doc_code.Text;
  FrmPKG.doc_name := edt_doc_name.Text;
  FrmPKG.PageControl1.ActivePageIndex := 1;
  FrmPKG.PageControl2.ActivePageIndex := 0;
  FrmPKG.ShowModal;
end;

procedure TFrmPatList.ChkSign();
var
  Qrys: TADOQuery;
  tmpSql, stime, Shif_no: string;
  OPDADV: string;
  SQLs: TStrings;
begin
  stime := ROCTime(now, '');
  if (stime > '0800') and (stime <= '1330') then
    Shif_no := '1'
  else if (stime > '1330') and (stime <= '1730') then
    Shif_no := '2'
  else
    Shif_no := '3';
  SQLs := TStringList.Create;
  SQLs.Clear;
  tmpSql := getChkSqlStr(70);
  SetParamter(tmpSql, '$OPD_DATE$', ROCDate(now, ''));
  SetParamter(tmpSql, '$SHIFT_NO$', Shif_no);
  SetParamter(tmpSql, '$DOC_CODE$', getDocCode1);
  //SetParamter(tmpSql, '$OPD_KIND$', getOpdKind);
  tmpSql := StringReplace(tmpSql, '$OPD_KIND$', gsOpdKind, [rfReplaceAll]);
  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs, Qrys) then
  begin
    if Qrys.FieldByName('login_time').AsString = '' then
      Self.MySBar.Panels[4].Text := '未簽到：'
    else
      Self.MySBar.Panels[4].Text := '已簽到：' + Qrys.FieldByName('login_time').AsString;
  end
  else
    Self.MySBar.Panels[4].Text := '無須簽到';
end;

procedure TFrmPatList.FormCreate(Sender: TObject);
begin
  inherited;
  mask_begday.Text := ROCDate(now, '');
  ChkSign;
  AppDoc;
  gsReadCloud := True;
  Panel2.Visible := False;
end;

procedure TFrmPatList.Button3Click(Sender: TObject);
var
  OPDADV: string;
  AdvParamStr: string;
begin
  inherited;
  if (getFeeNo <> '') and (getDocCode2 <> '') then
  begin
    OPDADV := SetSys.ReadString('DPD', 'OPDADV', '');
    AdvParamStr := SetSys.ReadString('ADV', 'REPRINT', '');
    comAdvStrRep(AdvParamStr, '');
    if OPDADV <> '' then
      ShellExecute(Handle, 'Open', PChar(OPDADV), PChar(AdvParamStr), nil, SW_SHOWNORMAL);
  end
  else
    ShowPnlMsg('此病患尚未看診！因此無任何資料可重印');
end;

procedure TFrmPatList.DBCG_PatLstPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  inherited;
  if category = 3 then
  begin
    if ADORegQ.FieldByName('ICSIGN').Asinteger > 0 then
      LblICCar.Visible := True
    else
      LblICCar.Visible := False;
    if ADORegQ.FieldByName('opd_statuscode').AsString = '3' then
      Opd_Status.Font.Color := clBlue
    else
      Opd_Status.Font.Color := clRed;
  end
  else
  begin
    LblICCar.Visible := False;
    if ADORegQ.FieldByName('order_status').AsString = '1' then
      Opd_Status.Font.Color := clRed
    else if ADORegQ.FieldByName('FV_RV').AsString = '初診' then
      Opd_Status.Font.Color := clBlue
    else if ADORegQ.FieldByName('opd_statuscode').AsString = '1' then
      Opd_Status.Font.Color := clGreen
    else if ADORegQ.FieldByName('opd_statuscode').AsString = '2' then
      Opd_Status.Font.Color := clRed;

  end;

  if ADORegQ.FieldByName('sex_type').AsString = '0' then
  begin
    Shape2.Brush.Color := $00FFC8FF;
    Shape3.Brush.Color := $00FFC8FF;
  end
  else
  begin
    Shape2.Brush.Color := $00FFCECE;
    Shape3.Brush.Color := $00FFCECE;
  end;

  if DBCG_PatLst.PanelIndex = index then
    if ADORegQ.FieldByName('sex_type').AsString = '0' then
    begin
      Shape2.Brush.Color := $00FF88FF;
      Shape3.Brush.Color := $00FF88FF;
    end
    else
    begin
      Shape2.Brush.Color := $00FF7575;
      Shape3.Brush.Color := $00FF7575;
    end;

    //109.08.31 shh ITe 11138 add 85歲以上老人註記＃
    Elderly_Mark.Visible := False;
    if ADORegQ.FieldByName('age').AsString >= '85' then
      Elderly_Mark.Visible := True
    else
      Elderly_Mark.Visible := False;

end;

procedure TFrmPatList.edt_chr_noKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    rdo_chr.Checked := true;
    rdg_app.ItemIndex := -1;
    Addparams(Sender);
  end;
end;

procedure TFrmPatList.Timer1Timer(Sender: TObject);
begin
  inherited;
  if ICFunction.isExecute then
  begin
    Timer1.Enabled := false;
    isExecute := false;
    if trim(ICFunction.ErrStr) <> '' then
      ShowPnlMsg(ICFunction.ErrStr);
  end;
end;

procedure TFrmPatList.BtnRegLstClick(Sender: TObject);
var
  Qrys, Qrys2: TADOQuery;
  tmpSql, opd_date, shift_no: string;
  SQLs: TStrings;
begin
  inherited;
  SQLs := TStringList.Create;
  opd_date := mask_begday.Text;
  shift_no := IntToStr(RG_Shift_No.ItemIndex + 1);
  tmpSql := getChkSqlStr(72);
  SetParamter(tmpSql, '$OPD_DATE$', opd_date);
  SetParamter(tmpSql, '$SHIFT_NO$', shift_no);
  SetParamter(tmpSql, '$DOC_CODE$', edt_doc_code.Text);
  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs, Qrys) then
  begin
    Qrys2 := TADOQUERY.Create(nil);
    Qrys2.Connection := DM.ADOLink;
    while not Qrys.Eof do
    begin
      if not assigned(FrmQR_RegLst) then
        FrmQR_RegLst := TFrmQR_RegLst.Create(self);
      try
        FrmQR_RegLst.QRLabel3.Caption := SetSys.ReadString('SYSTEM', 'HOSPTAILNAME', '');
        FrmQR_RegLst.QRLabel4.Caption := copy(opd_date, 1, 3) + '/' + copy(opd_date, 4, 2) + '/' + copy(opd_date, 6, 2);
        FrmQR_RegLst.QRLabel5.Caption := Qrys.FieldByName('room_desc').AsString;
        FrmQR_RegLst.QRLabel6.Caption := Qrys.FieldByName('shift_desc').AsString;
        FrmQR_RegLst.QRLabel7.Caption := Qrys.FieldByName('doc_name').AsString;
        FrmQR_RegLst.QRLabel2.Caption := Qrys.FieldByName('p_time').AsString;

        tmpSql := getChkSqlStr(73);
        SetParamter(tmpSql, '$DEPT_CODE$', Qrys.FieldByName('dept_code').AsString);
        SetParamter(tmpSql, '$DEPT_ROOM$', Qrys.FieldByName('dept_room').AsString);
        SetParamter(tmpSql, '$OPD_DATE$', opd_date);
        SetParamter(tmpSql, '$SHIFT_NO$', shift_no);
        SetParamter(tmpSql, '$DOC_CODE$', edt_doc_code.Text);
        Qrys2.SQL.Text := tmpSql;
        Qrys2.Open;
        FrmQR_RegLst.DataSet := Qrys2;
        FrmQR_RegLst.QRDBText1.DataSet := Qrys2;
        FrmQR_RegLst.QRDBText2.DataSet := Qrys2;
        FrmQR_RegLst.QRDBText3.DataSet := Qrys2;
        FrmQR_RegLst.QRDBText4.DataSet := Qrys2;

        FrmQR_RegLst.Preview;
        FrmQR_RegLst.DataSet := nil;
        FrmQR_RegLst.QRDBText1.DataSet := nil;
        FrmQR_RegLst.QRDBText2.DataSet := nil;
        FrmQR_RegLst.QRDBText3.DataSet := nil;
        FrmQR_RegLst.QRDBText4.DataSet := nil;
      finally
        FreeAndNil(FrmQR_RegLst);
      end;
      Qrys.Next;
    end;
    Qrys2.Free;
  end
  else
    ShowPnlMsg('醫師尚未在此時段排班');
  SQLs.Free;
end;

procedure TFrmPatList.BtnLendChrClick(Sender: TObject);
var
  SpName, ExeSPResult: string;
  Paramter, PType, RType, PData: TStrings;
begin
  inherited;
  if getFeeNo = '' then
  begin
    ShowMessage('此病人未取得批價號碼，請點入此病人再調病歷!!');
    exit;
  end;
  if getChrNo <> '' then
  begin
    Paramter := TStringList.Create;
    PType := TStringList.Create;
    RType := TStringList.Create;
    PData := TStringList.Create;
    SpName := '';
    SpName := getSpSql(3, Paramter, PType, RType);
    PData.Add(getFeeNo);
    PData.Add(getChrNo);
    PData.Add(ROCDate(now, ''));
    ExeSPResult := DM.ExecSP(Paramter, PType, RType, PData, SpName);
    if ReturnID(ExeSPResult) = 'N' then
    begin
      ShowPnlMsg(ReturnName(ExeSPResult));
      use_opd_log(DPD_Ver, ReturnName(ExeSPResult));
    end
    else
      ShowPnlMsg('調閱病歷成功');
  end
  else
    ShowPnlMsg('請先選擇病患！在點選調閱病歷');

end;

procedure TFrmPatList.Shape2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  DBCG_PatLstClick(DBCG_PatLst);
end;

procedure TFrmPatList.Shape3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Pat_NameClick(Sender);
end;

procedure TFrmPatList.Button4Click(Sender: TObject);
begin
  inherited;
  PnlShow.Visible := false;
  ms := 1;
end;

procedure TFrmPatList.Button1Click(Sender: TObject);
var
  OPDADV: string;
  AdvParamStr: string;
begin
  inherited;
  if getFeeNo <> '' then
  begin
    OPDADV := SetSys.ReadString('DPD', 'OPDADV', '');
    AdvParamStr := SetSys.ReadString('ADV', 'ADDREG', '');
    comAdvStrRep(AdvParamStr, '');
    if OPDADV <> '' then
      winexec(PChar(OPDADV + ' ' + AdvParamStr), 0);
  end
  else
  begin
    ShowMessage('請選擇一個病人才可加掛');
  end;
end;

procedure TFrmPatList.Button2Click(Sender: TObject);
begin
  inherited;
  if Panel2.Visible then
  begin
    Panel2.Visible := False;
    barcodeprint;
  end
  else
  begin
    Panel2.Top  := 0;
    Panel2.Left := Panel1.Width;
    Panel2.Visible := True;
  end;
end;

procedure TFrmPatList.Button5Click(Sender: TObject);
begin
  inherited;
  if CheckBox2.Checked then
  begin
    printcount := StrToInt(ComboBox1.Text);
    CheckBox2.Checked := False;
    barcodeprint;
  end;
  Panel2.Visible := False;
end;

procedure TFrmPatList.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
    gsReadCloud := True
  else
    gsReadCloud := False;
end;

procedure TFrmPatList.Write_file(file_name,Desc: string);
var
  openfileName : TextFile;
begin
  try
    AssignFile(openfileName,'D:\tmch\d_order\'+trim(file_name)+'.txt');
    if not FileExists('D:\tmch\d_order\'+trim(file_name)+'.txt') then
      Rewrite(openfileName)
    ELSE
      Append(openfileName);

    Writeln(openfileName, Desc );
    CloseFile(openfileName);
  except

  end;
end;


procedure TFrmPatList.barcodeprint;
var
  i: integer;
  reg : TRegistry;
  DefPrint, PRINTNAME, filename : String;
begin
  if SetSys.ReadString('SYSTEM','BARCODEREADINI','') <> '' then
  begin
    //產生文字檔列印
    Write_file(trim(getChrNo),trim(getChrNo)+dateformat(getBirthDate,'/',1,0)+CharAdd(getPatName,' ',20)+GetSex(getPSex)+getIdNo);

    filename := ' '+trim(getChrNo)+'.txt';
    try
      ShellExecute(Handle, 'open',PChar(SetSys.ReadString('SYSTEM','BARCODEREADINI','')),PChar(filename),nil,SW_SHOWNORMAL);
    except
      ShowMessage('呼叫條碼列印程式失敗，請重新列印');
    end;
  end
  else
  begin
    //呼叫印表一列印方式
    if assigned(FrmBarCodePrint) then
      FreeandNil(FrmBarCodePrint);
    if not assigned(FrmBarCodePrint) then
      FrmBarCodePrint := TFrmBarCodePrint.Create(self);
    FrmBarCodePrint.QRLStickbracode.Caption := trim(getChrNo) + '    ' + dateformat(getBirthDate,'/',1,0);
    FrmBarCodePrint.QRLChrnoName.Caption    := trim(getPatName) + '  ' + GetSex(getPSex);
    FrmBarCodePrint.QRLbIDNO.Caption        := getIdNo;
    FrmBarCodePrint.QuickRep2.PrinterSettings.Copies := printcount;
    FrmBarCodePrint.PrepareSQL;
  end;
end;



procedure TFrmPatList.LblICCarClick(Sender: TObject);
var
  ComRet,insert_med,insert_fee,i: integer;
  icQrys :TADOQuery;
begin
  inherited;
  insert_med := 0;
  insert_fee := 0;
  //20160629增加補簽章
  LblICCar.Enabled := False;
  ICSEQ_Lbl.Visible := True;
  if icrewrite then
  begin
    ICSEQ_Lbl.Caption := '確認卡機資訊...';
    ICSEQ_Lbl.Refresh;
    ComRet := csOpenCom(0);
    if (ComRet = 0) and (IC_check = 0) then
    begin
      icQrys := TADOQuery.Create(nil);
      icQrys.Connection := DM.ADOLink;
      try
        DM.ADOLink.BeginTrans;
        if High(icfunction.ic_med_record) > 0 then
        begin
          ICSEQ_Lbl.Visible := True;
          ICSEQ_PB.Position := 0;
          ICSEQ_Lbl.Caption := '寫入藥品資訊...';
          ICSEQ_Lbl.Refresh;
          ICSEQ_PB.Position := 30;
          ICSEQ_PB.Refresh;
          //insert_card_med();

          insert_med := icfunction.insert_med();
          for i := 0 to (High(icfunction.ic_med_record)) do
          begin
            icQrys.Close;
            icQrys.SQL.Clear;
            icQrys.SQL.Add('select trim(ic_date)||trim(ic_time) as dt,signature from ic_treat_dtl where fee_no=' + Qt(getFeeNo) + ' AND IC_DATE= ' + Qt(getOpdDate) + ' and fee_code in(select ins_feecode from orderitem_basic where fee_code=' + Qt(icfunction.ic_med_record[i][0])+')');
            icQrys.Open;
            if not icQrys.IsEmpty then
            begin
              DM.QryUpdate.Close;
              DM.QryUpdate.SQL.Clear;
              DM.QryUpdate.SQL.Add('update opd_his set diagnosedate='+Qt(icQrys.fieldbyname('dt').AsString)+' ,order_sign='+Qt(icQrys.fieldbyname('signature').AsString));
              DM.QryUpdate.SQL.Add('where opd_date='+Qt(getOpdDate)+' and fee_no='+Qt(getFeeNo)+' and fee_code='+Qt(icfunction.ic_med_record[i][0]));
              DM.QryUpdate.SQL.Add('and dc_type=''C'' and cncl_flag=''N'' and nvl(trim(order_sign),''0'')=''0'' ');
              DM.QryUpdate.ExecSQL;
            end;
          end;
          if insert_med = 1 then
            ICSEQ_Lbl.Caption := '寫入藥品資訊失敗'
          else
            ICSEQ_Lbl.Caption := '寫入藥品資訊完成';
          ICSEQ_Lbl.Refresh;
          ICSEQ_PB.Position := 50;
          ICSEQ_PB.Refresh;
        end;

        if High(icfunction.ic_fee_record)> 0 then
        begin
          ICSEQ_Lbl.Caption := '寫入處置資訊...';
          ICSEQ_Lbl.Refresh;
          ICSEQ_PB.Position := 75;
          ICSEQ_PB.Refresh;
          insert_fee := icfunction.insert_fee();
          //insert_card_fee();
          for i := 0 to (High(icfunction.ic_fee_record)) do
          begin
            icQrys.Close;
            icQrys.SQL.Clear;
            icQrys.SQL.Add('select trim(ic_date)||trim(ic_time) as dt,signature from ic_treat_dtl where fee_no=' + Qt(getFeeNo) + ' AND IC_DATE= ' + Qt(getOpdDate) + ' and fee_code in(select ins_feecode from orderitem_basic where fee_code=' + Qt(icfunction.ic_fee_record[i][0])+')');
            icQrys.Open;
            if not icQrys.IsEmpty then
            begin
              DM.QryUpdate.Close;
              DM.QryUpdate.SQL.Clear;
              DM.QryUpdate.SQL.Add('update opd_his set diagnosedate='+Qt(icQrys.fieldbyname('dt').AsString)+' ,order_sign='+Qt(icQrys.fieldbyname('signature').AsString));
              DM.QryUpdate.SQL.Add('where opd_date='+Qt(getOpdDate)+' and fee_no='+Qt(getFeeNo)+' and fee_code='+Qt(icfunction.ic_fee_record[i][0]));
              DM.QryUpdate.SQL.Add('and dc_type=''C'' and cncl_flag=''N'' and nvl(trim(order_sign),''0'')=''0'' ');
              DM.QryUpdate.ExecSQL;
            end;
          end;
          if insert_fee = 1 then
            ICSEQ_Lbl.Caption := '寫入處置資訊失敗'
          else
            ICSEQ_Lbl.Caption := '寫入處置資訊完成';
          ICSEQ_Lbl.Refresh;
          ICSEQ_PB.Position := 95;
          ICSEQ_PB.Refresh;
        end;
        DM.ADOLink.CommitTrans;
        FreeAndNil(icQrys);

        csCloseCom();
        
        ICSEQ_PB.Position := 0;
        ICSEQ_Lbl.Caption := '';
        LblICCar.Enabled := True;

        Addparams(BtnConfirm);
      except
        DM.ADOLink.RollbackTrans;
        LblICCar.Enabled := True;
        FreeAndNil(icQrys);
      end;
    end
    else
    begin
      showmessage('IC卡或無法開起讀卡機Com Port！');
      csCloseCom();
      ICSEQ_PB.Position := 0;
      ICSEQ_Lbl.Caption := '';
      LblICCar.Enabled := True;
    end;
  end;
end;


function TFrmPatList.icrewrite():Boolean;
var
  card_s2,i: Integer;  //卡片狀態傳回值
  med_row,fee_row :Integer;//記錄是否有開立健保項目
  icQrys :TADOQuery;
begin
  Result := False;
  icQrys := TADOQuery.Create(nil);
  try
    icQrys.Connection := DM.ADOLink;
    icQrys.Close;
    icQrys.SQL.Clear;
    icQrys.SQL.Add('select h.fee_code,h.path_code,h.med_days,h.per_qty,d.so_flag,h.seq_no from opd_his h,dpd_all_order d where h.fee_no=d.fee_no and h.fee_code=d.fee_code and h.seq_no=d.order_seq ');
    icQrys.SQL.Add('and h.cncl_flag=''N'' and h.dc_type=''C'' and d.dc_flag=''N'' and h.self_pay_flag in(''N'',''G'') and nvl(trim(h.order_sign),''0'')=''0'' and d.fee_no='''+getFeeNo+''' and d.so_flag=''M'' ');
    icQrys.Open;

    if icQrys.RecordCount > 0 then
    begin
      SetLength(IC_med_record, 0, 5);
      SetLength(IC_med_record, icQrys.RecordCount, 5);
      med_row := 0;
      while not icQrys.Eof do
      begin
        ic_med_record[med_row][0] := icQrys.FieldByName('fee_code').AsString;
        ic_med_record[med_row][1] := icQrys.FieldByName('path_code').AsString;
        ic_med_record[med_row][2] := icQrys.FieldByName('med_days').AsString;
        ic_med_record[med_row][3] := icQrys.FieldByName('per_qty').AsString;
        ic_med_record[med_row][4] := icQrys.FieldByName('seq_no').AsString;
        med_row := med_row + 1;
        icQrys.Next;
      end;
    end;
    icQrys.Close;
    icQrys.SQL.Clear;
    icQrys.SQL.Add('select h.fee_code,h.position,h.med_days,h.per_qty,d.so_flag,h.seq_no from opd_his h,dpd_all_order d where h.fee_no=d.fee_no and h.fee_code=d.fee_code and h.seq_no=d.order_seq ');
    icQrys.SQL.Add('and h.cncl_flag=''N'' and h.dc_type=''C'' and d.dc_flag=''N'' and h.self_pay_flag in(''N'',''G'') and nvl(trim(h.order_sign),''0'')=''0'' and d.fee_no='''+getFeeNo+''' and d.so_flag=''F'' ');
    icQrys.Open;
    if icQrys.RecordCount > 0 then
    begin
      SetLength(IC_fee_record, 0, 5);
      SetLength(IC_fee_record, icQrys.RecordCount, 5);
      fee_row := 0;
      while not icQrys.Eof do
      begin
        IC_fee_record[fee_row][0] := icQrys.FieldByName('fee_code').AsString;
        IC_fee_record[fee_row][1] := icQrys.FieldByName('position').AsString;
        IC_fee_record[fee_row][2] := '1';
        IC_fee_record[fee_row][3] := icQrys.FieldByName('per_qty').AsString;
        IC_fee_record[fee_row][4] := icQrys.FieldByName('seq_no').AsString;
        fee_row := fee_row + 1;
        icQrys.Next;
      end;
    end;
    if med_row = 0 then
      SetLength(IC_med_record, 0, 5)
    else
      Result := True;

    if fee_row = 0 then
      SetLength(ic_fee_record, 0, 5)
    else
      Result := True;
    ICSEQ_Lbl.Caption := '處置筆數:'+IntToStr(fee_row)+'藥品筆數:'+IntToStr(med_row);
    ICSEQ_Lbl.Refresh;
    FreeAndNil(icQrys);
  except
    FreeAndNil(icQrys);
  end;
end;


end.

