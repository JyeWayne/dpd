unit IPDCertificate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, DB, ADODB, StdCtrls, ComCtrls, Spin, Buttons, ExtCtrls, dateutils,
  XPMan;

type
  TFrmIPDCertificate = class(TFrmMain)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    sextype: TLabel;
    idno: TLabel;
    birthday: TLabel;
    ipddate: TLabel;
    Ldept: TLabel;
    chrno: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    patname: TEdit;
    Panel1: TPanel;
    Label8: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    BtnOk: TBitBtn;
    BtnClose: TBitBtn;
    Pagecount: TSpinEdit;
    BtnPgk: TBitBtn;
    BtnUsePgk: TBitBtn;
    DateTimePrint: TDateTimePicker;
    Query1: TADOQuery;
    GroupBox4: TGroupBox;
    ListBox1: TListBox;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Memo1: TRichEdit;
    GroupBox3: TGroupBox;
    Memo2: TRichEdit;
    BtnHISTreat: TBitBtn;
    ComboBox1: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnUsePgkClick(Sender: TObject);
    procedure BtnPgkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
    procedure Memo2Enter(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure BtnHISTreatClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    Adr : String;
  public
    { Public declarations }
    isOpen : Boolean;
    ShowKind : String;
    Dia : TStringList;
  end;

var
  FrmIPDCertificate: TFrmIPDCertificate;

implementation

uses Commfunc, DBDM, Global, PubEngCertificatePrint,
  PubTwCertificatePrint, PubPrintMain, IPDCertificatePkg, PrintCeificate,
  DPDFunc, SqlCenter, Ditto, DittoDate;

{$R *.dfm}

procedure TFrmIPDCertificate.FormShow(Sender: TObject);
var
  i : Integer;
  myControl : TControl;
begin
  inherited;
  DateTimePrint.DateTime := now;
  If ShowKind = 'E' then
  begin
    for i := 0 to FrmIPDCertificate.ComponentCount -1 do
    begin
      myControl := TControl(FrmIPDCertificate.Components[i]);
      if myControl is TLabel then
        TLabel(myControl).Caption := TLabel(myControl).Hint;
      if myControl is TGroupBox then
        TGroupBox(myControl).Caption := TGroupBox(myControl).Hint;
      if MyControl.Tag = 777 then
        MyControl.Visible := False;
    end;
  end;
  chrno.Caption := getchrno;
  idno.Caption := getidno;
  patname.text := getpatName;
  if ShowKind <>'E' then
  begin
    ipddate.Caption := Format(RocDate(RocToDate(getOpdDate),'%s'),['年','月'])+'日';
    birthday.Caption := Format(RocDate(RocToDate(getBirthDate),'%s'),['年','月'])+'日';
    Sextype.Caption := Global.SexType(getPSex);
  end
  else
  begin
    //ipddate.Caption := FormatDateTime('ddd	yyyy/mmm/dd',RocToDate(getipddate));

    ipddate.Caption := DateToStr(RocToDate(getOpdDate));
    birthday.Caption := DateToStr(RocToDate(getBirthDate));
    if getPSex = '0' then
      Sextype.Caption := 'FEMALE'
    else
      Sextype.Caption := 'MALE';
  end;
  With DM.QryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from chr_basic where chr_no='+Qt(getChrno));
    open;
    adr := FieldByName('ADDR_NAME1').AsString;

    Close;
    SQL.Clear;
    SQL.Add('select * from phrase_dtl where Type_code=''01'' and Class_code=''0z''');
    open;
    While not Eof do
    begin
      ListBox1.Items.Add(Trim(FieldByName('PHRASE_DESC').AsString));
      Next;
    end;

    ComboBox1.Items.Clear;
    Close;
    SQL.Clear;
    SQL.Add('select trim(dept_code)||''_''||trim(smpl_desc) as aa from dept_basic where nh_div=''40''');
    open;
    While not Eof do
    begin
      ComboBox1.Items.Add(Trim(FieldByName('aa').AsString));
      Next;
    end;
    close;


  end;
  SetCbbitem(ComboBox1,getDeptCode);
  //Ldept.Caption :=GetDeptName(getDeptCode);
  Ldept.Caption :=ReturnName(ComboBox1.Text);
  Memo1.Lines.AddStrings(Dia);
end;

procedure TFrmIPDCertificate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := Cafree;
end;

procedure TFrmIPDCertificate.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmIPDCertificate := nil;
end;

procedure TFrmIPDCertificate.Memo1Change(Sender: TObject);
begin
  inherited;
  if Tmemo(sender).Lines.Count > 9 then
    Showmessage('您所輸入的資料超過列印範圍！');
end;

procedure TFrmIPDCertificate.BtnOkClick(Sender: TObject);
var
 i : Integer;
 SourKind : String;
 SQLs:TStrings;
 tmpSql:string;
begin
  inherited;
  isOpen:=true;
  if showKind = 'E' then
    SourKind := '3'
  else
    SourKind:='2';
  HasPrint := False;

  SQLs:=TStringList.Create;
  tmpSql:=getInsertSql(26);
  SetParamter(tmpSql,'$ORDER_KIND$',SourKind);
  SetParamter(tmpSql,'$SOUR_KIND$','D');
  SetParamter(tmpSql,'$PAT_NAME$',Trim(PatName.Text));
  SetParamter(tmpSql,'$CHR_NO$',GetChrno);
  SetParamter(tmpSql,'$SEX_TYPE$',getPSex);
  SetParamter(tmpSql,'$ID_NO$',getIdno);
  SetParamter(tmpSql,'$BIRTH_DATE$',getBirthDate);
  SetParamter(tmpSql,'$BIRTH_PLACE$',' ');
  SetParamter(tmpSql,'$OPD_DATE$',getOpdDate);
  SetParamter(tmpSql,'$DEPT_DESC$',getDeptCode);
  SetParamter(tmpSql,'$WORKS$',Trim(Edit2.text));
  SetParamter(tmpSql,'$DIAGNOSIS$',FrmIPDCertificate.Memo1.Lines.Text);
  SetParamter(tmpSql,'$TREATMENT$',FrmIPDCertificate.Memo2.Lines.Text);
  SetParamter(tmpSql,'$DOC_CODE$',getDocCode);
  SetParamter(tmpSql,'$OPER_ID$',getDocCode);
  SetParamter(tmpSql,'$OPER_DATE$',RocDate(DateTimePrint.DateTime,''));
  SetParamter(tmpSql,'$OPER_TIME$',RocTimes(now,''));
  SQLs.Text:=tmpSql;
  if not DM.ExecSQL(SQLs) then
  begin
    MessageDlg('存檔失敗!!',mtWarning,[mbOk],0);
    Exit;
  end;

  if not Assigned(FrmPrintCericifate) then
    FrmPrintCericifate := TFrmPrintCericifate.Create(self);
  With FrmPrintCericifate do
  begin
    QRLName.Caption := patname.Text;
    QRLBirthplace.Caption := Edit1.Text;
    QRLSex.Caption := sextype.Caption;
    QRLJob.Caption := Edit2.Text;
    QrlBirthdate.Caption := '民國 '+ Trim(birthday.Caption);
    QrlAge.Caption := GetAge(getBirthDate,RocDate(DateTimePrint.DateTime,''),acyear)+'歲';
    QRLIdno.Caption := GetIdNo;
    QRLAddress.Caption := Trim(adr);//地址
    QRLDept.Caption := Ldept.Caption;
    QRLCHR.Caption := 'NO.'+getChrNo;
    QRLBDate.Caption := '自民國 '+ipddate.Caption;
    QRLEDate.Caption := '至民國 '+Format(RocDate(DateTimePrint.Date,'%s'),['年','月'])+'日';
    QRLdays.Caption :=  '';//需求單號20151119-A003取消天數'共 '+IntToStr(DaysBetween(RocToDate(getOpdDate),DateTimePrint.Date)+1)+' 天';
    QRMemo2.Lines.Text := Memo1.Lines.Text;
    QRMemo3.Lines.Text := Memo2.Lines.Text;
    QrlRocDate.Caption := ' 中 華 民 國 '+ Format(RocDate(DateTimePrint.DateTime,'%s'),[' 年 ',' 月 '])+' 日 ' ;
    QRLEngDate.Caption := DateToStr(DateTimePrint.DateTime );
    QuickRep1.PrinterSettings.Copies := FrmIPDCertificate.Pagecount.Value + 1;
    QuickRep1.Preview;   
  end;
  //FrmPrintCericifate.Destroy;
  if FrmPrintCericifate <> nil then
    FrmPrintCericifate := nil;
  Exit;

end;

procedure TFrmIPDCertificate.BtnCloseClick(Sender: TObject);
begin
  inherited;
  OutList.Clear;
  if HasPrint then
    if ShowKind='C' then
      OutList.Add('中文乙種診斷書 ('+IntToStr(Pagecount.Value)+') 份_'+SetSys.ReadString('SYSTEM','診斷書計價','')+'_'+IntToStr(Pagecount.Value))
    else
      OutList.Add('英文乙種診斷書 ('+IntToStr(Pagecount.Value)+') 份_'+SetSys.ReadString('SYSTEM','診斷書計價','')+'_'+IntToStr(Pagecount.Value));
  Dia.Free;
  Close;
end;

procedure TFrmIPDCertificate.BtnUsePgkClick(Sender: TObject);
begin
  inherited;
  if not Assigned(FrmIPDCertificatePkg) then
    FrmIPDCertificatePkg := TFrmIPDCertificatePkg.Create(self);
  FrmIPDCertificatePkg.ShowModal;
  if not (FrmIPDCertificatePkg = nil) then
    FrmIPDCertificatePkg := nil;
end;

procedure TFrmIPDCertificate.BtnPgkClick(Sender: TObject);
Var
  sample_name: String;
  sample: integer;
begin
  inherited;
  sample := Showmessage('本次新增之範本為?',['個人','科範本'],msinfor) ;
  sample_name := inputbox('新增範本名稱', '請輸入新的範本名稱     .', '');
  If trim(sample_name) = '' Then
  Begin
    showmessage('您並未輸入新的範本名稱，所以並未將本次資料加入您的範本！');
    Exit;
  End
  Else
  Begin
    If (trim(memo1.Text) = '') Or (trim(memo1.Text) = '') Then
    Begin
      showmessage('您未輸入傷病名稱或醫師囑言！');
      abort;
    End;
    query1.Close;
    query1.SQL.Clear;
    query1.SQL.Add('select * from sample_medical_certificate where sample_name=' + Qt(sample_name));
    if sample = 0 then
      Query1.SQL.Add(' And DOC_CODE='+Qt(getDocCode1))
    else
      Query1.SQL.Add(' And DOC_CODE='+Qt(getDocCode1));
    query1.Open;
    If query1.RecordCount > 0 Then
    Begin                            
      showmessage('您所輸入的名稱已經與您先前的名稱重複，請重新輸入新的名稱！');
    End
    Else
    Begin
      if DM.ADOLink.InTransaction then
        DM.ADOLink.CommitTrans;
      try
        DM.ADOLink.BeginTrans;
        query1.Close;
        query1.SQL.Clear;
        query1.SQL.Add('INSERT INTO sample_medical_certificate ');
        query1.SQL.Add('VALUES( ');//:sample_name,:doc_code,:Diagnosis,:Treatment,:oper_id,:oper_date,:oper_time)');
        Query1.SQL.Add(Qt(sample_name)+',');
        if sample = 0 then
          Query1.SQL.Add(Qt(getDocCode1))
        else
          Query1.SQL.Add(Qt(getDeptCode));
        Query1.SQL.Add(','+Qt(Memo1.Text)+','+Qt(Memo2.Text)+','+Qt(getDocCode1));
        Query1.SQL.Add(','+Qt(RocDate(now,''))+','+Qt(RocTimes(now,''))+')');
        query1.ExecSQL;
        DM.ADOLink.CommitTrans;
        showmessage('已將本次資料加入範本中！');
      except
        DM.ADOLink.RollbackTrans;
        showmessage('加入範本失敗！',['OK'],MsError);
      end;
      Query1.Close;
    End;
  End;
end;

procedure TFrmIPDCertificate.FormCreate(Sender: TObject);
begin
  inherited;
  Dia := TStringList.Create;
end;

procedure TFrmIPDCertificate.Memo1Enter(Sender: TObject);
begin
  inherited;
  GroupBox4.Hint := 'memo1';
end;

procedure TFrmIPDCertificate.Memo2Enter(Sender: TObject);
begin
  inherited;
  GroupBox4.Hint := 'memo2';
end;

procedure TFrmIPDCertificate.ListBox1DblClick(Sender: TObject);
VAR
  str1,str2: string;
  KMemo : TMemo;
begin
  inherited;
  if ListBox1.ItemIndex >= 0 then
  begin
    KMemo :=TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint));
    str1 := Copy(TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).Lines.Text,0,TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).SelStart);
    str2 := copy(TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).Lines.Text,TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).SelStart+
    TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).SelLength+1,Length(TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).Lines.Text)-
    TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).SelStart+TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).SelLength);
    TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).Lines.Text := str1+ListBox1.Items.Strings[ListBox1.ItemIndex]+Str2;
    TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).SelStart := Length(str1);
    TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).SelLength:= 0;
    TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).Refresh;
  end;
  TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).SelStart := Length(TMemo(FrmIPDCertificate.FindComponent(FrmIPDCertificate.GroupBox4.Hint)).Lines.Text);
end;

procedure TFrmIPDCertificate.BtnHISTreatClick(Sender: TObject);
VAR
  str1,str2: string;
begin
  inherited;
  if not assigned(FrmDittoDate) then
    FrmDittoDate := TFrmDittoDate.Create(self);
  FrmDittoDate.chr_no:=getChrNo;
  FrmDittoDate.dept_code:=getDeptCode;
  FrmDittoDate.mask_begday.Text:=ROCDate(IncYear(now,-1),'');
  FrmDittoDate.mask_endday.Text:=ROCDate(now,'');
  FrmDittoDate.CheckBox1.Checked:=true;
  FrmDittoDate.CheckBox1Click(FrmDittoDate.CheckBox1);
  FrmDittoDate.ShowModal;
  if FrmDittoDate.isSelect then
  begin
    str1 := Copy(Memo2.Text,0,Memo2.SelStart);
    str2 := Copy(Memo2.Text,Memo2.SelStart + 1,length(Memo2.Text)-Memo2.SelStart+Memo2.SelLength);
    Memo2.Lines.Text:=str1+FrmDittoDate.bringStr+str2;
    Memo2.SelStart:=length(str1);
    Memo2.SelLength:=0;
    Memo2.Refresh;
  end;
  Memo2.SelStart:=length(Memo2.Text);
  FreeAndNil(FrmDittoDate);
end;

procedure TFrmIPDCertificate.ComboBox1Change(Sender: TObject);
begin
  inherited;
  Ldept.Caption :=ReturnName(ComboBox1.Text);
end;

end.
