unit OftenIcd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, XPMan, ExtCtrls, ComCtrls, StdCtrls, Grids, ADODB,
  DBCtrls, dbcgrids, DB;

type
  TFrmOftenIcd = class(TFrmMain)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SGICD: TStringGrid;
    Shape1: TShape;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    TabSheet3: TTabSheet;
    DBCtrlGrid1: TDBCtrlGrid;
    Shape2: TShape;
    Shape3: TShape;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DtSICD10: TDataSource;
    ADOQuery1: TADOQuery;
    Shape4: TShape;
    DBText4: TDBText;
    DtSICD10SHE1: TDataSource;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    DtSICD10SHE2: TDataSource;
    DtSICD10SHE3: TDataSource;
    ADOQuery4: TADOQuery;
    ADOQuery5: TADOQuery;
    DtSICD10SHE4: TDataSource;
    ADOQuery6: TADOQuery;
    DtSICD10SHE5: TDataSource;
    ScrollBox1: TScrollBox;
    DBCtrlGrid2: TDBCtrlGrid;
    DBMemo1: TDBMemo;
    DBCtrlGrid4: TDBCtrlGrid;
    DBCtrlGrid5: TDBCtrlGrid;
    DBCtrlGrid3: TDBCtrlGrid;
    DBMemo2: TDBMemo;
    DBCtrlGrid6: TDBCtrlGrid;
    DBMemo5: TDBMemo;
    DBCtrlGrid7: TDBCtrlGrid;
    DBMemo6: TDBMemo;
    DBCtrlGrid8: TDBCtrlGrid;
    DBMemo7: TDBMemo;
    DBCtrlGrid9: TDBCtrlGrid;
    DBMemo8: TDBMemo;
    DBCtrlGrid10: TDBCtrlGrid;
    DBMemo9: TDBMemo;
    DtSICD10SHE6: TDataSource;
    ADOQuery7: TADOQuery;
    DtSICD10SHE7: TDataSource;
    ADOQuery8: TADOQuery;
    DtSICD10SHE8: TDataSource;
    ADOQuery9: TADOQuery;
    DtSICD10SHE9: TDataSource;
    ADOQuery10: TADOQuery;
    DBMemo4: TDBMemo;
    DBMemo3: TDBMemo;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SGICDDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBText1Click(Sender: TObject);
    procedure DBMemo1Click(Sender: TObject);
    procedure DBCtrlGrid2PaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure CheckBox2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
    procedure datactlclear(level:integer);
    procedure showmedata;
  public
    { Public declarations }
  end;

var
  FrmOftenIcd: TFrmOftenIcd;

implementation

uses DBDM, SqlCenter, Global, Order;

{$R *.dfm}



procedure TFrmOftenIcd.Button1Click(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmOftenIcd.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
  begin
    CheckBox2.Checked := False;
    showmedata;
  end;
end;

procedure TFrmOftenIcd.CheckBox2Click(Sender: TObject);
begin
  inherited;
  if CheckBox2.Checked then
  begin
    CheckBox1.Checked := False;
    showmedata;
  end;
end;

procedure TFrmOftenIcd.showmedata;
var
  tmpSql :String;
  SQLs :TStrings;
begin
  inherited;
  SQLs:=TStringList.Create;
  try
    case pagecontrol1.ActivePageIndex of
      0:  //ICD9常用項
        begin
          tmpSql:=getChkSqlStr(67);
          SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
          SetParamter(tmpSql,'$ITEM_NO$','6');
          if CheckBox1.Checked then
          begin
            SetParamter(tmpSql,'$DOC_CODE$','DPD');
            SQLs.Text:=tmpSql;
            DM.OpenSQL(SQLs,SGICD);
          end
          else if CheckBox2.Checked then
          begin
            SetParamter(tmpSql,'$DOC_CODE$',getDocCode1);
            SQLs.Text:=tmpSql;
            DM.OpenSQL(SQLs,SGICD);
          end;
        end;
      1:  //icd10常用項
        begin
          if CheckBox1.Checked then
          begin
            tmpSql:=sqlstr(33);
            SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
            CheckBox2.Checked:=false;
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text:=tmpSql;
            ADOQuery1.Open;
          end
          else if CheckBox2.Checked then
          begin
            tmpSql:=sqlstr(32);
            SetParamter(tmpSql,'$DOC_CODE$',getDocCode1);
            CheckBox1.Checked:=false;
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text:=tmpSql;
            ADOQuery1.Open;
          end;
        end;
      2:
        begin
          tmpSql:=sqlstr(35);
          SetParamter(tmpSql,'$DOC_CODE$',getDocCode1);
          ADOQuery2.Close;
          ADOQuery2.SQL.Clear;
          ADOQuery2.SQL.Text:=tmpSql;
          ADOQuery2.Open;
          IF ADOQuery2.IsEmpty THEN
            DBCtrlGrid2.Visible := False
          ELSE
            DBCtrlGrid2.Visible := True;
        end;
    end;
  finally

  end;
end;

procedure TFrmOftenIcd.SGICDDblClick(Sender: TObject);
begin
  inherited;
  FrmOrder.InsertIcd(SGICD.Cells[0,SGICD.Row]);
end;

procedure TFrmOftenIcd.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := 0;
  DBCtrlGrid10.Visible := False;
  DBCtrlGrid9.Visible := False;
  DBCtrlGrid8.Visible := False;
  DBCtrlGrid7.Visible := False;
  DBCtrlGrid6.Visible := False;
  DBCtrlGrid5.Visible := False;
  DBCtrlGrid4.Visible := False;
  DBCtrlGrid3.Visible := False;
  DBCtrlGrid2.Visible := False;
  DBMemo9.Top  := 3;
  DBMemo9.Left := 3;
  DBMemo8.Top  := 3;
  DBMemo8.Left := 3;
  DBMemo7.Top  := 3;
  DBMemo7.Left := 3;
  DBMemo6.Top  := 3;
  DBMemo6.Left := 3;
  DBMemo5.Top  := 3;
  DBMemo5.Left := 3;
  DBMemo4.Top  := 3;
  DBMemo4.Left := 3;
  DBMemo3.Top  := 3;
  DBMemo3.Left := 3;
  DBMemo2.Top  := 3;
  DBMemo2.Left := 3;
  DBMemo1.Top  := 3;
  DBMemo1.Left := 3;
end;

procedure TFrmOftenIcd.DBText1Click(Sender: TObject);
begin
  inherited;
  if ADOQuery1.RecordCount > 0 then
    FrmOrder.InsertIcd10(trim(ADOQuery1.fieldbyname('ICD_CODE').AsString));
end;

procedure TFrmOftenIcd.DBMemo1Click(Sender: TObject);
VAR
  tmpsql: string;
begin
  inherited;
  IF Sender = DBMemo1 THEN
  BEGIN
    datactlclear(1);
    tmpSql:=sqlstr(36);
    SetParamter(tmpSql,'$ICD_GROUP$',ADOQuery2.FIELDBYNAME('icd_group').AsString);
    ADOQuery3.Close;
    ADOQuery3.SQL.Clear;
    ADOQuery3.SQL.Text:=tmpSql;
    ADOQuery3.Open;
    if (ADOQuery3.IsEmpty) OR (trim(ADOQuery3.fieldbyname('icd_group').AsString) = '') then
    begin
      DBCtrlGrid3.Visible := false;
      IF MessageDlg('已查詢到 "'+trim(ADOQuery2.fieldbyname('icd_group').AsString)+trim(ADOQuery2.fieldbyname('eng_name').AsString)+'帶入資料?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        if Length(trim(ADOQuery2.fieldbyname('icd_group').AsString))>= 4 then
          FrmOrder.InsertIcd10(copy(trim(ADOQuery2.fieldbyname('icd_group').AsString),1,3)+'.'+copy(trim(ADOQuery2.fieldbyname('icd_group').AsString),4,Length(trim(ADOQuery2.fieldbyname('icd_group').AsString))-3))
        else
          FrmOrder.InsertIcd10((trim(ADOQuery2.fieldbyname('icd_group').AsString)));
    end
    else
      DBCtrlGrid3.Visible := True;
  END
  else if Sender = DBMemo2 THEN
  begin
    datactlclear(2);
    tmpSql:=sqlstr(37);
    SetParamter(tmpSql,'$ICD_GROUP$',ADOQuery3.FIELDBYNAME('icd_group').AsString);
    ADOQuery4.Close;
    ADOQuery4.SQL.Clear;
    ADOQuery4.SQL.Text:=tmpSql;
    ADOQuery4.Open;
    if (ADOQuery4.IsEmpty) OR (trim(ADOQuery4.fieldbyname('icd_group').AsString) = '') then
    begin
      DBCtrlGrid4.Visible := false;
      IF MessageDlg('已查詢到 "'+trim(ADOQuery3.fieldbyname('icd_group').AsString)+trim(ADOQuery3.fieldbyname('eng_name').AsString)+'帶入資料?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        if Length(trim(ADOQuery3.fieldbyname('icd_group').AsString))>= 4 then
          FrmOrder.InsertIcd10(copy(trim(ADOQuery3.fieldbyname('icd_group').AsString),1,3)+'.'+copy(trim(ADOQuery3.fieldbyname('icd_group').AsString),4,Length(trim(ADOQuery3.fieldbyname('icd_group').AsString))-3))
        else
          FrmOrder.InsertIcd10((trim(ADOQuery3.fieldbyname('icd_group').AsString)));
    end
    else
      DBCtrlGrid4.Visible := True;
  end
  else if Sender = DBMemo3 THEN
  begin
    datactlclear(3);
    tmpSql:=sqlstr(38);
    SetParamter(tmpSql,'$ICD_GROUP$',ADOQuery4.FIELDBYNAME('icd_group').AsString);
    ADOQuery5.Close;
    ADOQuery5.SQL.Clear;
    ADOQuery5.SQL.Text:=tmpSql;
    ADOQuery5.Open;
    if (ADOQuery5.IsEmpty) OR (trim(ADOQuery5.fieldbyname('icd_group').AsString) = '') then
    begin
      DBCtrlGrid5.Visible := false;
      IF MessageDlg('已查詢到 "'+trim(ADOQuery4.fieldbyname('icd_group').AsString)+trim(ADOQuery4.fieldbyname('eng_name').AsString)+'帶入資料?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        if Length(trim(ADOQuery4.fieldbyname('icd_group').AsString))>= 4 then
          FrmOrder.InsertIcd10(copy(trim(ADOQuery4.fieldbyname('icd_group').AsString),1,3)+'.'+copy(trim(ADOQuery4.fieldbyname('icd_group').AsString),4,Length(trim(ADOQuery4.fieldbyname('icd_group').AsString))-3))
        else
          FrmOrder.InsertIcd10((trim(ADOQuery4.fieldbyname('icd_group').AsString)));
    end
    else
      DBCtrlGrid5.Visible := True;
  end
  else if Sender = DBMemo4 THEN
  begin
    datactlclear(4);
    tmpSql:=sqlstr(39);
    SetParamter(tmpSql,'$ICD_GROUP$',ADOQuery5.FIELDBYNAME('icd_group').AsString);
    ADOQuery6.Close;
    ADOQuery6.SQL.Clear;
    ADOQuery6.SQL.Text:=tmpSql;
    ADOQuery6.Open;
    if (ADOQuery6.IsEmpty) OR (trim(ADOQuery6.fieldbyname('icd_group').AsString) = '') then
    begin
      DBCtrlGrid6.Visible := false;
      IF MessageDlg('已查詢到 "'+trim(ADOQuery5.fieldbyname('icd_group').AsString)+trim(ADOQuery5.fieldbyname('eng_name').AsString)+'帶入資料?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        if Length(trim(ADOQuery5.fieldbyname('icd_group').AsString))>= 4 then
          FrmOrder.InsertIcd10(copy(trim(ADOQuery5.fieldbyname('icd_group').AsString),1,3)+'.'+copy(trim(ADOQuery5.fieldbyname('icd_group').AsString),4,Length(trim(ADOQuery5.fieldbyname('icd_group').AsString))-3))
        else
          FrmOrder.InsertIcd10((trim(ADOQuery5.fieldbyname('icd_group').AsString)));
    end
    else
      DBCtrlGrid6.Visible := True;
  end
  else if Sender = DBMemo5 THEN
  begin
    datactlclear(5);
    tmpSql:=sqlstr(40);
    SetParamter(tmpSql,'$ICD_GROUP$',ADOQuery6.FIELDBYNAME('icd_group').AsString);
    ADOQuery7.Close;
    ADOQuery7.SQL.Clear;
    ADOQuery7.SQL.Text:=tmpSql;
    ADOQuery7.Open;
    if (ADOQuery7.IsEmpty) OR (trim(ADOQuery7.fieldbyname('icd_group').AsString) = '') then
    begin
      DBCtrlGrid7.Visible := false;
      IF MessageDlg('已查詢到 "'+trim(ADOQuery6.fieldbyname('icd_group').AsString)+trim(ADOQuery6.fieldbyname('eng_name').AsString)+'帶入資料?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        if Length(trim(ADOQuery6.fieldbyname('icd_group').AsString))>= 4 then
          FrmOrder.InsertIcd10(copy(trim(ADOQuery6.fieldbyname('icd_group').AsString),1,3)+'.'+copy(trim(ADOQuery6.fieldbyname('icd_group').AsString),4,Length(trim(ADOQuery6.fieldbyname('icd_group').AsString))-3))
        else
          FrmOrder.InsertIcd10((trim(ADOQuery6.fieldbyname('icd_group').AsString)));
    end
    else
    begin
      DBCtrlGrid7.Visible := True;
      DBCtrlGrid7.SetFocus;
    end;
  end
  else if Sender = DBMemo6 THEN
  begin
    datactlclear(6);
    tmpSql:=sqlstr(41);
    SetParamter(tmpSql,'$ICD_GROUP$',ADOQuery7.FIELDBYNAME('icd_group').AsString);
    ADOQuery8.Close;
    ADOQuery8.SQL.Clear;
    ADOQuery8.SQL.Text:=tmpSql;
    ADOQuery8.Open;
    if (ADOQuery8.IsEmpty) OR (trim(ADOQuery8.fieldbyname('icd_group').AsString) = '') then
    begin
      DBCtrlGrid8.Visible := false;
      IF MessageDlg('已查詢到 "'+trim(ADOQuery7.fieldbyname('icd_group').AsString)+trim(ADOQuery7.fieldbyname('eng_name').AsString)+'帶入資料?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        if Length(trim(ADOQuery7.fieldbyname('icd_group').AsString))>= 4 then
          FrmOrder.InsertIcd10(copy(trim(ADOQuery7.fieldbyname('icd_group').AsString),1,3)+'.'+copy(trim(ADOQuery7.fieldbyname('icd_group').AsString),4,Length(trim(ADOQuery7.fieldbyname('icd_group').AsString))-3))
        else
          FrmOrder.InsertIcd10((trim(ADOQuery7.fieldbyname('icd_group').AsString)));
    end
    else
    begin
      DBCtrlGrid8.Visible := True;
      DBCtrlGrid8.SetFocus;
    end;
  end
  else if Sender = DBMemo7 THEN
  begin
    datactlclear(7);
    tmpSql:=sqlstr(42);
    SetParamter(tmpSql,'$ICD_GROUP$',ADOQuery8.FIELDBYNAME('icd_group').AsString);
    ADOQuery9.Close;
    ADOQuery9.SQL.Clear;
    ADOQuery9.SQL.Text:=tmpSql;
    ADOQuery9.Open;
    if (ADOQuery9.IsEmpty) OR (trim(ADOQuery9.fieldbyname('icd_group').AsString) = '') then
    begin
      DBCtrlGrid9.Visible := false;
      IF MessageDlg('已查詢到 "'+trim(ADOQuery8.fieldbyname('icd_group').AsString)+trim(ADOQuery8.fieldbyname('eng_name').AsString)+'帶入資料?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        if Length(trim(ADOQuery8.fieldbyname('icd_group').AsString))>= 4 then
          FrmOrder.InsertIcd10(copy(trim(ADOQuery8.fieldbyname('icd_group').AsString),1,3)+'.'+copy(trim(ADOQuery8.fieldbyname('icd_group').AsString),4,Length(trim(ADOQuery8.fieldbyname('icd_group').AsString))-3))
        else
          FrmOrder.InsertIcd10((trim(ADOQuery8.fieldbyname('icd_group').AsString)));
    end
    else
    begin
      DBCtrlGrid9.Visible := True;
      DBCtrlGrid9.SetFocus;
    end;
  end
  else if Sender = DBMemo8 THEN
  begin
    datactlclear(8);
    tmpSql:=sqlstr(43);
    SetParamter(tmpSql,'$ICD_GROUP$',ADOQuery9.FIELDBYNAME('icd_group').AsString);
    ADOQuery10.Close;
    ADOQuery10.SQL.Clear;
    ADOQuery10.SQL.Text:=tmpSql;
    ADOQuery10.Open;
    if (ADOQuery10.IsEmpty) OR (trim(ADOQuery10.fieldbyname('icd_group').AsString) = '') then
    begin
      DBCtrlGrid10.Visible := false;
      IF MessageDlg('已查詢到 "'+trim(ADOQuery9.fieldbyname('icd_group').AsString)+trim(ADOQuery9.fieldbyname('eng_name').AsString)+'帶入資料?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        if Length(trim(ADOQuery9.fieldbyname('icd_group').AsString))>= 4 then
          FrmOrder.InsertIcd10(copy(trim(ADOQuery9.fieldbyname('icd_group').AsString),1,3)+'.'+copy(trim(ADOQuery9.fieldbyname('icd_group').AsString),4,Length(trim(ADOQuery9.fieldbyname('icd_group').AsString))-3))
        else
          FrmOrder.InsertIcd10((trim(ADOQuery9.fieldbyname('icd_group').AsString)));
    end
    else
    begin
      DBCtrlGrid10.Visible := True;
      DBCtrlGrid10.SetFocus;
    end;
  end
  ELSE if Sender = DBMemo9 THEN
  begin
    IF ADOQuery10.RecordCount > 0 THEN
      IF MessageDlg('已查詢到 "'+trim(ADOQuery10.fieldbyname('icd_group').AsString)+trim(ADOQuery10.fieldbyname('eng_name').AsString)+'帶入資料?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        if Length(trim(ADOQuery10.fieldbyname('icd_group').AsString))>= 4 then
          FrmOrder.InsertIcd10(copy(trim(ADOQuery10.fieldbyname('icd_group').AsString),1,3)+'.'+copy(trim(ADOQuery10.fieldbyname('icd_group').AsString),4,Length(trim(ADOQuery10.fieldbyname('icd_group').AsString))-3))
        else
          FrmOrder.InsertIcd10((trim(ADOQuery10.fieldbyname('icd_group').AsString)));
  END;
end;

procedure TFrmOftenIcd.DBCtrlGrid2PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  inherited;
  DBCtrlGrid.SelectedColor := clRed;
end;

procedure TFrmOftenIcd.datactlclear(level:integer);
begin
  case level of
    1:
      begin
        ADOQuery10.Close;
        ADOQuery9.Close;
        ADOQuery8.Close;
        ADOQuery7.Close;
        ADOQuery6.Close;
        ADOQuery5.Close;
        ADOQuery4.Close;
        ADOQuery3.Close;
        DBCtrlGrid10.Visible := False;
        DBCtrlGrid9.Visible := False;
        DBCtrlGrid8.Visible := False;
        DBCtrlGrid7.Visible := False;
        DBCtrlGrid6.Visible := False;
        DBCtrlGrid5.Visible := False;
        DBCtrlGrid4.Visible := False;
        DBCtrlGrid3.Visible := False;
      end;
    2:
      begin
        ADOQuery10.Close;
        ADOQuery9.Close;
        ADOQuery8.Close;
        ADOQuery7.Close;
        ADOQuery6.Close;
        ADOQuery5.Close;
        ADOQuery4.Close;
        DBCtrlGrid10.Visible := False;
        DBCtrlGrid9.Visible := False;
        DBCtrlGrid8.Visible := False;
        DBCtrlGrid7.Visible := False;
        DBCtrlGrid6.Visible := False;
        DBCtrlGrid5.Visible := False;
        DBCtrlGrid4.Visible := False;
      end;
    3:
      begin
        ADOQuery10.Close;
        ADOQuery9.Close;
        ADOQuery8.Close;
        ADOQuery7.Close;
        ADOQuery6.Close;
        ADOQuery5.Close;
        DBCtrlGrid10.Visible := False;
        DBCtrlGrid9.Visible := False;
        DBCtrlGrid8.Visible := False;
        DBCtrlGrid7.Visible := False;
        DBCtrlGrid6.Visible := False;
        DBCtrlGrid5.Visible := False;
      end;
    4:
      begin
        ADOQuery10.Close;
        ADOQuery9.Close;
        ADOQuery8.Close;
        ADOQuery7.Close;
        ADOQuery6.Close;
        DBCtrlGrid10.Visible := False;
        DBCtrlGrid9.Visible := False;
        DBCtrlGrid8.Visible := False;
        DBCtrlGrid7.Visible := False;
        DBCtrlGrid6.Visible := False;
      end;
    5:
      begin
        ADOQuery10.Close;
        ADOQuery9.Close;
        ADOQuery8.Close;
        ADOQuery7.Close;
        DBCtrlGrid10.Visible := False;
        DBCtrlGrid9.Visible := False;
        DBCtrlGrid8.Visible := False;
        DBCtrlGrid7.Visible := False;
      end;
    6:
      begin
        ADOQuery10.Close;
        ADOQuery9.Close;
        ADOQuery8.Close;
        DBCtrlGrid10.Visible := False;
        DBCtrlGrid9.Visible := False;
        DBCtrlGrid8.Visible := False;
      end;
    7:
      begin
        ADOQuery10.Close;
        ADOQuery9.Close;
        DBCtrlGrid10.Visible := False;
        DBCtrlGrid9.Visible := False;
      end;
    8:
      begin
        ADOQuery10.Close;
        DBCtrlGrid10.Visible := False;
      end;
  end;
end;

procedure TFrmOftenIcd.PageControl1Change(Sender: TObject);
begin
  inherited;
   showmedata;
end;

end.
