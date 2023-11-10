unit PatInf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, XPMan, ComCtrls, StdCtrls, Grids, ExtCtrls, DB, ADODB,
  DBGrids, Buttons;

type
  TFrmPatInf = class(TFrmMain)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label12: TLabel;
    Label10: TLabel;
    CHR_NO: TLabel;
    PAT_NAME: TLabel;
    ID_NO: TLabel;
    BIRTH_DATE: TLabel;
    RH_TYPE: TLabel;
    BLOOD_TYPE: TLabel;
    FST_OPD_DATE: TLabel;
    RECE_OPD_DATE: TLabel;
    ALLI_FLAG: TLabel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    AREA_CODE1: TLabel;
    AREA_CODE2: TLabel;
    ZIP_CODE1: TLabel;
    ADDR_NAME1: TLabel;
    ZIP_CODE2: TLabel;
    ADDR_NAME2: TLabel;
    HOME_TEL_NO: TLabel;
    OFFICE_TEL_NO: TLabel;
    GroupBox3: TGroupBox;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    CONT_NAME: TLabel;
    CONT_AREA_CODE: TLabel;
    CONT_ZIP_CODE: TLabel;
    CONT_ADDR: TLabel;
    CONT_TEL_NO: TLabel;
    SGTemp: TStringGrid;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label18: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox5: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    GroupBox6: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    Query1: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Query1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    myChrno,SOURCE_KIND,SOUR_AP, HaveFever, TEMPERATURE: String;

  end;

var
  FrmPatInf: TFrmPatInf;

implementation

uses Commfunc, DBDM, Global;

{$R *.dfm}

procedure TFrmPatInf.FormShow(Sender: TObject);
var
  i,j : Integer;
  SQLs : TStringList;
  mycontrol : Tcontrol;
begin
  inherited;
  SQLs := TstringList.Create;
  SQLs.Text := 'Select * from chr_basic where chr_no = '+Qt(nullstrTo(myChrno,getchrno));
  if DM.OpenSQL(SQLs,SGTemp) then
  begin
    for i := 0 to FrmPatInf.ComponentCount -1 do
    begin
      mycontrol := Tcontrol(FrmPatInf.Components[i]);
      if mycontrol is TLabel then
      begin
        if TLabel(mycontrol).Tag = 777 then
          TLabel(mycontrol).Caption := SGTemp.Cells[SGTemp.Rows[0].IndexOf(TLabel(mycontrol).Name),1]
      end;
    end;
  end;
  FreeAndNil(SQLs);
  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT * FROM BIO_INFORMATION_LOG where chr_no='+Qt(nullstrTo(myChrno,getchrno))) ;
    SQL.Add('     and Del_flag=''N''');
    SQL.Add(' ORDER BY UPD_DATE DESC,UPD_TIME DESC');
    open;
  end;
end;

procedure TFrmPatInf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := Cafree;
end;

procedure TFrmPatInf.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmPatInf := nil;
end;

procedure TFrmPatInf.BitBtn3Click(Sender: TObject);
var
  TheWinControl : TWinControl;
  i : Integer;
begin
  inherited;
  For i:= 0 to Screen.ActiveForm.ComponentCount -1 do
  begin
    TheWinControl :=TWinControl(Screen.ActiveForm.Components[i]);
    if TheWinControl is TEdit then
      TEdit(TheWinControl).Text := '';
    if TheWinControl is TMemo then
      TMemo(TheWinControl).Lines.Text := '';
    if TheWinControl is TCombobox then
      TComboBox(TheWinControl).ItemIndex := -1;
    if TheWinControl is TCheckBox then
      TCheckBox(TheWinControl).Checked := False;
  end;
end;

procedure TFrmPatInf.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
    Edit1.text := Query1.fieldByName('BODY_HIGH').Asstring;//身高
    edit2.text := Query1.fieldByName('BODY_WEIGHT').Asstring;//體重
    Edit3.text := Query1.fieldByName('TEMPERATURE').Asstring;//溫度
    edit4.text := Query1.fieldByName('SPHYGMUS').Asstring;//心跳
    Edit5.text := Query1.fieldByName('SYSTOLIC_PRESSURE').Asstring;//血壓
    edit6.text := Query1.fieldByName('DIASTOLIC_PRESSURE').Asstring;//血壓
    Edit7.text := Query1.fieldByName('HEAD_LEN').Asstring;//頭圍
    edit8.text := Query1.fieldByName('WAIST_LEN').Asstring;//胸圍
    if Query1.fieldByName('NA_FLAG').Asstring='C' then
    begin
      CheckBox1.Checked := True;
      CheckBox2.Checked := True;
    end
    else if Query1.fieldByName('NA_FLAG').Asstring='A' then
    begin
      CheckBox1.Checked := True;
      CheckBox2.Checked := FALSE;
    end
    else if Query1.fieldByName('NA_FLAG').Asstring='B' then
    begin
      CheckBox1.Checked := FALSE;
      CheckBox2.Checked := True;
    end
    else
    begin
      CheckBox1.Checked := FALSE;
      CheckBox2.Checked := FALSE;
    end;
end;

procedure TFrmPatInf.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if trim(Edit2.Text) ='' then
  begin
    ShowMessage('體重數值為必填項目!!!');
    edit2.SetFocus;
    Exit;
  end;
  try
    if StrToFloat(NullStrTo(Edit3.text,'0')) >= 38 then
    BEGIN
      HaveFever := 'Y';
      TEMPERATURE := trim(Edit3.text);
    end
    else
    begin
      HaveFever := 'N';
      TEMPERATURE := trim(Edit3.text);
    end;
  except
    HaveFever :='C';
  end;
  DM.ADOLink.BeginTrans;
  try
    with DM.QryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Insert into BIO_INFORMATION_LOG(SOURCE_KIND,FEE_NO,CHR_NO,SOUR_AP,BODY_HIGH,BODY_WEIGHT,TEMPERATURE,SYSTOLIC_PRESSURE,DIASTOLIC_PRESSURE,sphygmus,HEAD_LEN,WAIST_LEN,UPD_DATE,UPD_TIME,UPD_OPER,NA_flag)');
      SQL.Add('values('+Qt(SOURCE_KIND)+','+Qt(getFeeNo)+','+Qt(myChrno)+','+Qt(SOUR_AP)+',');
      SQL.Add(Qt(Edit1.text)+','+Qt(Edit2.text)+','+Qt(Edit3.text)+','+Qt(Edit4.text)+','+Qt(edit5.text)+','+Qt(Edit6.text)+','+Qt(Edit7.text)+','+Qt(Edit8.text)+','+Qt(RocDate(now,''))+','+Qt(RocTimes(now,''))+','+Qt(getDocCode)+',');
      if CheckBox1.Checked and CheckBox2.Checked then
        SQL.Add('''C'')')
      else if CheckBox1.Checked then
        SQL.Add('''A'')')
      else if CheckBox2.Checked then
        SQL.Add('''B'')')
      else
        SQL.Add('''N'')');
      SQL.SaveToFile('123.sql');
      Execsql;
      //發燒登錄
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO NSC_TEMPERATURE (fee_no,NSC_DATE,NSC_TIME,Fever,upd_kind,upd_oper,upd_date,upd_time)');
      SQL.Add(' Values ('+Qt(getfeeno)+','+Qt(ROCDATE(now,''))+','+Qt(ROCTIMES(now,''))+','+Qt(NullStrto(HaveFever,'C'))+','+Qt(SOURCE_KIND)+','+Qt(getDocCode)+','+Qt(RocDate(now,''))+','+Qt(RocTime(now,''))+')');
      execsql;
    end;
    DM.ADOLink.CommitTrans;
  except
    DM.ADOLink.RollbackTrans;
    ShowMessage('失敗')
  end;
  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT * FROM BIO_INFORMATION_LOG where chr_no='+Qt(nullstrTo(myChrno,getchrno))) ;
    SQL.Add('     and Del_flag=''N''');
    SQL.Add(' ORDER BY UPD_DATE DESC,UPD_TIME DESC');
    open;
  end;
end;

procedure TFrmPatInf.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmPatInf.Query1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  DBGrid1DblClick(DBGrid1);
end;

end.
