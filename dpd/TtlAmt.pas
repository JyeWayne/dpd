unit TtlAmt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, ExtCtrls, XPMan, ComCtrls, Grids;

type
  TFrmTtlAmt = class(TFrmMain)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    SGMed: TStringGrid;
    SGFee: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTtlAmt: TFrmTtlAmt;

implementation

uses SqlCenter, Global, DBDM;

{$R *.dfm}

procedure TFrmTtlAmt.Button1Click(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmTtlAmt.FormShow(Sender: TObject);
var
  i:integer;
  tmpSql :String;
  SQLs :TStrings;
begin
  inherited;
  for i:=0 to SGMed.RowCount -1 do
    SGMed.Rows[i].Clear;
  for i:=0 to SGFee.RowCount -1 do
    SGFee.Rows[i].Clear;

  SGMed.RowCount:=2;
  SGFee.RowCount:=2;

  SQLs:=TStringList.Create;

  tmpSql:=getChkSqlStr(61);
  SetParamter(tmpSql,'$OPERATOR$','in');
  SetParamter(tmpSql,'$FEE_NO$',getFeeNo);
  SQLs.Text:=tmpSql;

  if DM.OpenSQL(SQLs,SGMed) then
  begin
    SGMed.RowCount:=SGMed.RowCount+1;
    SGMed.Cells[6,SGMed.RowCount -1]:='0';
    SGMed.Cells[8,SGMed.RowCount -1]:='0';
    for i:=1 to SGMed.RowCount -2 do
    begin
      SGMed.Cells[6,SGMed.RowCount -1]:= FloatToStr(StrToFloat(SGMed.Cells[6,SGMed.RowCount -1])+ StrToFloat(SGMed.Cells[6,i]));
      SGMed.Cells[8,SGMed.RowCount -1]:= FloatToStr(StrToFloat(SGMed.Cells[8,SGMed.RowCount -1])+ StrToFloat(SGMed.Cells[8,i]));
    end;
    SGMed.Cells[5,SGMed.RowCount -1]:='自費小計';
    SGMed.Cells[7,SGMed.RowCount -1]:='健保小計';
  end;

  tmpSql:=getChkSqlStr(61);
  SetParamter(tmpSql,'$OPERATOR$','not in');
  SetParamter(tmpSql,'$FEE_NO$',getFeeNo);
  SQLs.Text:=tmpSql;

  if DM.OpenSQL(SQLs,SGFee) then
  begin
    SGFee.RowCount:=SGFee.RowCount+1;
    SGFee.Cells[6,SGFee.RowCount -1]:='0';
    SGFee.Cells[8,SGFee.RowCount -1]:='0';
    for i:=1 to SGFee.RowCount -2 do
    begin
      SGFee.Cells[6,SGFee.RowCount -1]:= FloatToStr(StrToFloat(SGFee.Cells[6,SGFee.RowCount -1])+ StrToFloat(SGFee.Cells[6,i]));
      SGFee.Cells[8,SGFee.RowCount -1]:= FloatToStr(StrToFloat(SGFee.Cells[8,SGFee.RowCount -1])+ StrToFloat(SGFee.Cells[8,i]));
    end;
    SGFee.Cells[5,SGFee.RowCount -1]:='自費小計';
    SGFee.Cells[7,SGFee.RowCount -1]:='健保小計';
  end;
  SQLs.Free;
end;

end.
