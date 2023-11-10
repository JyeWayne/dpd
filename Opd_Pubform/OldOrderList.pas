unit OldOrderList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB,
  Buttons, XPMan;

type
  TFrmOldOrderList = class(TFrmMain)
    Panel1: TPanel;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    QryOE: TADOQuery;
    QryI: TADOQuery;
    QryID: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    GroupBox3: TGroupBox;
    DBGrid4: TDBGrid;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    DataSource4: TDataSource;
    QryMed: TADOQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Chr_no : String;

    _DB :  TADOConnection;
  end;

var
  FrmOldOrderList: TFrmOldOrderList;

implementation

uses Commfunc, Global, SqlCenter;

{$R *.dfm}

procedure TFrmOldOrderList.RadioGroup1Click(Sender: TObject);
var
  tmpSql:string;
  Column: TColumn;
begin
  inherited;
  case RadioGroup1.ItemIndex of
    0,1 :
    begin
      tmpSql:=getOldMedList(1);
      if RadioGroup1.ItemIndex = 0 then
        SetParamter(tmpSql,'$OPD_KIND$','O')
      else
        SetParamter(tmpSql,'$OPD_KIND$','E');
      SetParamter(tmpSql,'$CHR_NO$',chr_no);
      with QryOE do
      begin
        Close;
        SQL.Clear;
        SQL.Text:=tmpSql;
        open;
      end;
      Panel4.Align := alClient;
      Panel4.Visible := True;
      Panel5.Visible := False;
      if QryOE.RecordCount > 0 then
        DBGrid1CellClick(Column);
    end;
    2 :
    begin
      tmpSql:=getOldMedList(2);
      SetParamter(tmpSql,'$CHR_NO$',chr_no);
      With QryI do
      begin
        Close;
        SQL.Clear;
        SQL.Text:=tmpSql;
        open;
      end;
      Panel5.Align := alClient;
      Panel5.Visible := True;
      Panel4.Visible := False;
      if QryI.RecordCount > 0 then
        DBGrid3CellClick(Column);
    end;
    else
    begin
      Panel4.Visible := False;
      Panel5.Visible := False;
    end;
  end;
end;

procedure TFrmOldOrderList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  action := Cafree;
end;

procedure TFrmOldOrderList.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmOldOrderList := nil;
end;

procedure TFrmOldOrderList.FormShow(Sender: TObject);
begin
  inherited;
  QryOE.Connection := _dB;
  QryI.Connection := _dB;
  QryID.Connection := _dB;
  QryMed.Connection := _dB;
  With StringGrid1 do
  begin
    Cells[0,0] := '院內代碼';
    Cells[1,0] := '藥品名稱';
    Cells[2,0] := '劑量';
    Cells[3,0] := '頻率';
    Cells[4,0] := '單位';
    Cells[5,0] := '健保';
    Cells[6,0] := '途徑';
  end;
end;

procedure TFrmOldOrderList.DBGrid1CellClick(Column: TColumn);
var
  tmpSql:string;
begin
  inherited;
  QryMed.Close;
  if QryOE.RecordCount = 0 then
    exit;
  tmpSql:=getOldMedList(3);
  SetParamter(tmpSql,'$OPD_DATE$',QryOE.FieldByName('thedate').Asstring);
  SetParamter(tmpSql,'$CHR_NO$',chr_no);
  SetParamter(tmpSql,'$FEE_NO$',QryOE.FieldByName('Fee_no').Asstring);
  with QryMed do
  begin
    Close;
    SQL.Clear;
    SQL.Text:=tmpSql;
    open;
  end;
end;

procedure TFrmOldOrderList.DBGrid2CellClick(Column: TColumn);
var
  tmpSql:string;
begin
  inherited;
  if QryID.RecordCount = 0 then
    exit;
  tmpSql:=getOldMedList(4);
  SetParamter(tmpSql,'$BEGIN_DATE$',QryID.FieldByName('begin_date').Asstring);
  SetParamter(tmpSql,'$CHR_NO$',chr_no);
  with QryMed do
  begin
    SQL.Clear;
    SQL.Text:=tmpSql;
    Open;
  end;
end;

procedure TFrmOldOrderList.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if QryMed.RecordCount > 0 then
  begin
    QryMed.First;
    While not QryMed.Eof do
    begin
      StringGrid1.Cells[0,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('med_Code').AsString);
      StringGrid1.Cells[1,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('thedesc').AsString);
      StringGrid1.Cells[2,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('theqty').AsString);
      StringGrid1.Cells[3,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('thecir').AsString);
      StringGrid1.Cells[4,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('theunit').AsString);
      StringGrid1.Cells[5,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('pay_flag').AsString);
      StringGrid1.Cells[6,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('path_code').AsString);
      StringGrid1.RowCount := StringGrid1.RowCount+1;
      QryMed.Next;
    end;
  end;
end;

procedure TFrmOldOrderList.BitBtn2Click(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  For i := 1 to StringGrid1.RowCount -1 do
    StringGrid1.Rows[i].Clear;
  StringGrid1.RowCount := 2;
end;

procedure TFrmOldOrderList.StringGrid1DblClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  if StringGrid1.RowCount = 2 then
    StringGrid1.Rows[1].Clear
  else if StringGrid1.Row = StringGrid1.RowCount -1 then
    StringGrid1.Rows[StringGrid1.Row].Clear
  else
  begin
    for i := StringGrid1.Row to StringGrid1.RowCount -2 do
      StringGrid1.Rows[i] := StringGrid1.Rows[i+1];
    StringGrid1.RowCount := StringGrid1.RowCount -1;
  end;
end;

procedure TFrmOldOrderList.BitBtn3Click(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  for i := 1 to StringGrid1.RowCount-2 do
    OutList.Add(StringGrid1.Cells[0,i]+'_'+StringGrid1.Cells[2,i]+'_'+StringGrid1.Cells[3,i]+'_'+StringGrid1.Cells[5,i]+'_'+StringGrid1.Cells[6,i]);
  Close;

end;

procedure TFrmOldOrderList.DBGrid4DblClick(Sender: TObject);
begin
  inherited;
    StringGrid1.Cells[0,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('med_Code').AsString);
    StringGrid1.Cells[1,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('thedesc').AsString);
    StringGrid1.Cells[2,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('theqty').AsString);
    StringGrid1.Cells[3,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('thecir').AsString);
    StringGrid1.Cells[4,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('theunit').AsString);
    StringGrid1.Cells[5,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('pay_flag').AsString);
    StringGrid1.Cells[6,StringGrid1.RowCount -1 ]:= Trim(QryMed.fieldByName('Path_code').AsString);
    StringGrid1.RowCount := StringGrid1.RowCount+1;
end;

procedure TFrmOldOrderList.DBGrid3CellClick(Column: TColumn);
var
  tmpSql:string;
begin
  inherited;
  tmpSql:=getOldMedList(5);
  SetParamter(tmpSql,'$FEE_NO$',QryI.FieldByName('Fee_no').Asstring);
  SetParamter(tmpSql,'$IPD_DATE$',QryI.fieldByName('thedate').asString);
  With QryID do
  begin
    Close;
    SQL.Clear;
    SQL.Text:=tmpSql;
    open;
  end;
  if QryID.RecordCount > 0 then
    DBGrid2CellClick(Column);
end;

procedure TFrmOldOrderList.BitBtn4Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmOldOrderList.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
  DBGrid2CellClick(DBGrid2.Columns[0]);
end;

procedure TFrmOldOrderList.DBGrid1DblClick(Sender: TObject);
var
  tmpSql:string;
begin
  inherited;
  QryMed.Close;
  if QryOE.RecordCount = 0 then
    exit;
  tmpSql:=getOldMedList(3);
  SetParamter(tmpSql,'$OPD_DATE$',QryOE.FieldByName('thedate').Asstring);
  SetParamter(tmpSql,'$CHR_NO$',chr_no);
  SetParamter(tmpSql,'$FEE_NO$',QryOE.FieldByName('Fee_no').Asstring);
  with QryMed do
  begin
    Close;
    SQL.Clear;
    SQL.Text:=tmpSql;
    open;
  end;

end;

procedure TFrmOldOrderList.DBGrid3DblClick(Sender: TObject);
var
  tmpSql:string;
begin
  inherited;
  tmpSql:=getOldMedList(5);
  SetParamter(tmpSql,'$FEE_NO$',QryI.FieldByName('Fee_no').Asstring);
  SetParamter(tmpSql,'$IPD_DATE$',QryI.fieldByName('thedate').asString);
  With QryID do
  begin
    Close;
    SQL.Clear;
    SQL.Text:=tmpSql;
    open;

  end;
  if QryID.RecordCount > 0 then
    DBGrid2CellClick(DBGrid2.Columns[0]);

end;

end.
