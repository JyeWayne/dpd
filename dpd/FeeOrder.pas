unit FeeOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, ExtCtrls, ComCtrls, StdCtrls, Grids, ADODB, XPMan;

type
  TFrmFeeOrder = class(TFrmMain)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SGFee: TStringGrid;
    Panel4: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    SGFeeAdd: TStringGrid;
    Panel9: TPanel;
    procedure Panel5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SGFeeDblClick(Sender: TObject);
    procedure SGFeeAddDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel9Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure SetOpdStatusPnl;
  public
    { Public declarations }
  end;

var
  FrmFeeOrder: TFrmFeeOrder;

implementation

uses DBDM, SqlCenter, Commfunc, Global;

{$R *.dfm}

procedure TFrmFeeOrder.SetOpdStatusPnl;
begin
  Panel5.Caption:='補牙';
  Panel5.Font.Color:=ClBlack;
  Panel5.BorderStyle:=bsNone;
  Panel6.Caption:='牙髓病';
  Panel6.Font.Color:=ClBlack;
  Panel6.BorderStyle:=bsNone;
  Panel7.Caption:='牙周病';
  Panel7.Font.Color:=ClBlack;
  Panel7.BorderStyle:=bsNone;
  Panel8.Caption:='口腔外科';
  Panel8.Font.Color:=ClBlack;
  Panel8.BorderStyle:=bsNone;
  Panel9.Caption:='常用項';
  Panel9.Font.Color:=ClBlack;
  Panel9.BorderStyle:=bsNone;
end;

procedure TFrmFeeOrder.Panel5Click(Sender: TObject);
var
  tmpSql :String;
  SQLs :TStrings;
begin
  inherited;
  SetOpdStatusPnl;
  SQLs:=TStringList.Create;
  tmpSql:=getPreOrderSql(9);
  SetParamter(tmpSql,'$FEE_CODE1$',ReturnId(TPanel(Sender).Hint));
  SetParamter(tmpSql,'$FEE_CODE2$',ReturnName(TPanel(Sender).Hint));
  SQLs.Text:=tmpSql;
  //SQLs.SaveToFile('s6.sql');
  DM.OpenSQL(SQLs,SGFee);

  TPanel(Sender).Caption:='*'+TPanel(Sender).Caption+'*';
  TPanel(Sender).Font.Color:=ClRed;
  TPanel(Sender).BorderStyle:=bsSingle;
  SQLs.Free;
end;

procedure TFrmFeeOrder.Button2Click(Sender: TObject);
begin
  inherited;  
  Self.Close;
end;

procedure TFrmFeeOrder.SGFeeDblClick(Sender: TObject);
begin
  inherited;
  SGFeeAdd.Cells[0,SGFeeAdd.RowCount -1]:=SGFee.Cells[0,SGFee.Row];
  SGFeeAdd.Cells[1,SGFeeAdd.RowCount -1]:=SGFee.Cells[1,SGFee.Row];

  SGFeeAdd.RowCount:=SGFeeAdd.RowCount+1;
end;

procedure TFrmFeeOrder.SGFeeAddDblClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if TStringGrid(Sender).RowCount = 1 then
    TStringGrid(Sender).RowCount := TStringGrid(Sender).RowCount +1;
  if TStringGrid(Sender).row >= 0 then
  begin
    for i := TStringGrid(Sender).row to TStringGrid(Sender).RowCount - 1 do
      TStringGrid(Sender).Rows[i] := TStringGrid(Sender).Rows[i+1];
    TStringGrid(Sender).RowCount := TStringGrid(Sender).RowCount - 1;
    if TStringGrid(Sender).Cells[0,TStringGrid(Sender).RowCount-1] <>'' then
      TStringGrid(Sender).RowCount := TStringGrid(Sender).RowCount + 1;
  end;
end;

procedure TFrmFeeOrder.Button1Click(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i:=0 to SGFeeAdd.RowCount - 1 do
  begin
    if SGFeeAdd.Cells[0,i] <> '' then
      OutList.Add(SGFeeAdd.Cells[0,i]);
  end;

  Self.Close;
end;

procedure TFrmFeeOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i:integer;
begin
  inherited;
  for i := SGFeeAdd.FixedRows to SGFeeAdd.RowCount -1 do
    SGFeeAdd.Rows[i].Clear;
  SGFeeAdd.RowCount:=1;
  for i := SGFee.FixedRows to SGFee.RowCount -1 do
    SGFee.Rows[i].Clear;
  SGFee.RowCount:=2;
  SetOpdStatusPnl;
  Action := Cafree;
  
end;

procedure TFrmFeeOrder.Panel9Click(Sender: TObject);
var
  tmpSql :String;
  SQLs :TStrings;
  ItemFee:string;
begin
  inherited;
  SetOpdStatusPnl;
  SQLs:=TStringList.Create;
  tmpSql:=getPreOrderSql(10);
  SQLs.Text:=tmpSql;
  DM.OpenSQL(SQLs,SGFee);

  TPanel(Sender).Caption:='*'+TPanel(Sender).Caption+'*';
  TPanel(Sender).Font.Color:=ClRed;
  TPanel(Sender).BorderStyle:=bsSingle;
  SQLs.Free;
end;

procedure TFrmFeeOrder.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmFeeOrder := nil;
end;

end.
