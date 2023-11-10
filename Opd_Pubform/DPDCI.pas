unit DPDCI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, ExtCtrls, ComCtrls, StdCtrls, DBCtrls, dbcgrids, DB,
  ADODB, Mask, Buttons, IniFiles;

type
  TFrmDPDCI = class(TFrmMain)
    Panel4: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    BegDay: TSpeedButton;
    mask_begday: TMaskEdit;
    G_condition: TGroupBox;
    Label5: TLabel;
    edt_chr_no: TEdit;
    rdo_chr: TRadioButton;
    rdg_app: TRadioGroup;
    RG_Shift_No: TRadioGroup;
    BtnConfirm: TButton;
    ADORegQ: TADOQuery;
    ADORegD: TDataSource;
    Panel3: TPanel;
    DBCG_PatLst: TDBCtrlGrid;
    Label2: TLabel;
    Pat_Name: TDBText;
    Label3: TLabel;
    Chr_No: TDBText;
    Label6: TLabel;
    SexType: TDBText;
    Label7: TLabel;
    Age: TDBText;
    Label10: TLabel;
    pat_desc: TDBText;
    Label16: TLabel;
    Opd_Status: TDBText;
    Label17: TLabel;
    FV_RV: TDBText;
    Shape1: TShape;
    Panel2: TPanel;
    procedure Addparams(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BegDayClick(Sender: TObject);
    procedure rdg_appClick(Sender: TObject);
    procedure rdo_chrClick(Sender: TObject);
    procedure DBCG_PatLstPaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure Pat_NameClick(Sender: TObject);
  private
    { Private declarations }
    MaxTimes : Integer;
    DEFAULT_DEPTCODE: string;
  public
    { Public declarations }
  end;

var
  FrmDPDCI: TFrmDPDCI;

implementation

uses SqlCenter, Commfunc, DBDM, Global, frm_calenderUnit1;

{$R *.dfm}

procedure TFrmDPDCI.Addparams(Sender: TObject);
var
  SqlStr:String;
  begday,no,dept_code,chr_no:string;
begin
  if rdg_app.ItemIndex >= 0 then
    dept_code := rdg_app.Items[rdg_app.ItemIndex];
  no:=IntToStr(RG_Shift_No.ItemIndex+1);
  if copy(mask_begday.Text,1,1) = '0' then
    begday := copy(mask_begday.Text,2,6)
  else
    begday := mask_begday.Text;
  chr_no:=trim(edt_chr_no.Text);
  if (rdg_app.ItemIndex >= 0) and (rdg_app.ItemIndex < 9) then
  begin
    SqlStr:=getRegSqlStr(2);
    SqlStr:=StringReplace(SqlStr,'$app_dept_code$',dept_code,[rfReplaceAll]);
    SqlStr:=StringReplace(SqlStr,'$OPD_DATE$',begday,[rfReplaceAll]);
    SqlStr:=StringReplace(SqlStr,'$SHIFT_NO$',no,[rfReplaceAll]);
    SqlStr:=StringReplace(SqlStr,'$DEPT_CODE$',gsIniDeptCode,[rfReplaceAll]);
  end
  else if rdo_chr.Checked then
  begin
    SqlStr:=getRegSqlStr(1);
    SqlStr:=StringReplace(SqlStr,'$CHR_NO$',chr_no,[rfReplaceAll]);
    SqlStr:=StringReplace(SqlStr,'$DEPT_CODE$',gsIniDeptCode,[rfReplaceAll]);
  end
  else
  begin
    SqlStr:=getRegSqlStr(0);
    SqlStr:=StringReplace(SqlStr,'$OPD_DATE$',begday,[rfReplaceAll]);
    SqlStr:=StringReplace(SqlStr,'$SHIFT_NO$',no,[rfReplaceAll]);
    SqlStr:=StringReplace(SqlStr,'$DEPT_CODE$',gsIniDeptCode,[rfReplaceAll]);
  end;

  SqlStr:=StringReplace(SqlStr,'$PARTTYPE$',PARTTYPE,[rfReplaceAll]);
  SqlStr:=StringReplace(SqlStr,'$CASETYPE$',CASETYPE,[rfReplaceAll]);
  with ADORegQ do
  begin
      Close;
      SQL.Clear;
      SQL.Text:=SqlStr;
      SQL.SaveToFile('sql.sql');

  end;

  ADORegQ.Filter:=' (DPDCI=''N'' or opd_status =''1'') or (DPDCI=''N'' or opd_status=''2'')  ';

  ADORegQ.Filtered := true;
  ADORegQ.Open;
end;

procedure TFrmDPDCI.FormCreate(Sender: TObject);
var
  TempS : String;
begin
  inherited;
  Setsys := TIniFile.Create(ExtractFileDir(Application.ExeName)+'/DPDConfig.ini');
  MaxTimes := StrToInt(Setsys.ReadString('SYSTEM','USE TIME','120'));
  gsIniDeptCode := Setsys.ReadString('OPD','DEPTCODE','''40''');
  DEFAULT_DEPTCODE := Setsys.ReadString('OPD','DEFAULT_DEPTCODE','''40''');
  gsSysMsg := SetSys.ReadString('SYSTEM','系統訊息','');
  PARTTYPE := SetSys.ReadString('OPD','PARTTYPE','');
  CASETYPE := SetSys.ReadString('OPD','CASETYPE','');
  Temps := SetSys.ReadString('SYSTEM','印表機選項','');
  {if Temps = 'True' then
    ShowPrint := true
  else
    ShowPrint := False;
  }
  SetUseTime(MaxTimes);
  VsDoc := TStringList.Create;
  Cost := TStringList.Create;
  Dept :=  TStringList.Create;
  Uuser :=  TStringList.Create;
  gsOrderType := TStringList.Create;
  gsCir := TStringList.Create;
  gsPath := TStringList.Create;
  gsXpath := TStringList.Create;//放射部位
  gsLabGroup := TStringList.Create;//檢驗組別
  gsLabSample := TStringList.Create;//檢體
  gsCheckRoom := TStringList.Create;//檢查室
  gsunitDesc :=  TStringList.Create;
  OutList := TstringList.Create;
  ClearReg;
  CheckPat;

  mask_begday.Text := ROCDate(now,'');
  Setsys := TIniFile.Create(ExtractFileDir(Application.ExeName)+'/DPDConfig.ini');
  gsIniDeptCode := Setsys.ReadString('OPD','DEPTCODE','''40''');
end;

procedure TFrmDPDCI.FormShow(Sender: TObject);
begin
  inherited;
  Addparams(Sender);
end;

procedure TFrmDPDCI.BegDayClick(Sender: TObject);
var
  OneDate:String;
begin
  inherited;
  OneDate:='';
  frm_calendar:=Tfrm_calendar.Create(nil);
  try
    frm_calendar.type_flag:='2';

    frm_calendar.Top:=mouse.CursorPos.Y;
    frm_calendar.Left:=mouse.CursorPos.X;
    frm_calendar.ShowModal;
    OneDate:=frm_calendar.OneDate;
  finally
    frm_calendar.Free;
  end;
  if trim(OneDate) <> '' then
  begin
    mask_begday.Text := OneDate;
    Addparams(Sender);
  end;
end;

procedure TFrmDPDCI.rdg_appClick(Sender: TObject);
begin
  inherited;
  rdo_chr.Checked:=false;
  Addparams(Sender);
end;

procedure TFrmDPDCI.rdo_chrClick(Sender: TObject);
begin
  inherited;
  rdg_app.ItemIndex := -1;
end;

procedure TFrmDPDCI.DBCG_PatLstPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  inherited;
  {
  IF DBCtrlGrid.DataSource.DataSet.FieldByName('sex_type').AsString = '0' then
    DBCtrlGrid.Color := $00F9DAFE
  Else //IF DBCtrlGrid.DataSource.DataSet.FieldByName('sex_type').AsString = '1' then
    DBCtrlGrid.Color := $00FBE6D0;

  //Else
    //DBCtrlGrid.ParentColor := $00B5FFFF;
  }
end;

procedure TFrmDPDCI.Pat_NameClick(Sender: TObject);
var
  SQLs:TStrings;
  tmpSql,FeeNo:string;
begin
  inherited;
  if (ADORegQ.Active) and (ADORegQ.FieldByName('CHR_NO').AsString <> '') then
  begin
    SQLs:=TStringList.Create;
    tmpSql:=getInsertSql(19);

    SetParamter(tmpSql,'$OPD_KIND$',ADORegQ.FieldByName('opd_kind').AsString);
    SetParamter(tmpSql,'$OPD_DATE$',ADORegQ.FieldByName('opd_date').AsString);
    SetParamter(tmpSql,'$DEPT_CODE$',ADORegQ.FieldByName('DEPT_CODE').AsString);
    SetParamter(tmpSql,'$SHIFT_NO$',ADORegQ.FieldByName('SHIFT_NO').AsString);
    SetParamter(tmpSql,'$DEPT_ROOM$',ADORegQ.FieldByName('DEPT_ROOM').AsString);
    SetParamter(tmpSql,'$DOC_CODE$',ADORegQ.FieldByName('DOC_CODE').AsString);
    SetParamter(tmpSql,'$SEQ_NO$',ADORegQ.FieldByName('REG_SEQ_NO').AsString);
    SetParamter(tmpSql,'$FEE_NO$',ADORegQ.FieldByName('FEE_NO').AsString);
    SetParamter(tmpSql,'$CHKIN_TIME$',ROCTime(now,''));
    SQLs.Text:=tmpSql;

    DM.ExecSQL(SQLs);
    SQLs.Free;
    Addparams(Sender);
  end;
end;

end.
