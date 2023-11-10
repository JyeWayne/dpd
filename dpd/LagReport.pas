unit LagReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, XPMan, ExtCtrls, ComCtrls, StdCtrls, Grids;

type
  TFrmLagReport = class(TFrmMain)
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    EdtChrNo: TEdit;
    EdtPatName: TEdit;
    Panel3: TPanel;
    SGOpd: TStringGrid;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ClearItem(Sender : TObject);
  public
    { Public declarations }
  end;

var
  FrmLagReport: TFrmLagReport;

implementation

uses DBDM, SqlCenter;

{$R *.dfm}

procedure TFrmLagReport.ClearItem(Sender : TObject);
var
  i,iIndex : Integer;
  thecontrol : Twincontrol;
begin
  for iIndex := 0 to TForm(Sender).ComponentCount -1 do
  begin
    theControl := TWinControl(TForm(Sender).Components[iIndex]);
    if (theControl is TEdit) and (TEdit(theControl).Tag <> 999) then
      TEdit(theControl).Text := ''
    else if theControl is TStringGrid then
    begin
      //例外不清除的
      if TStringGrid(TheControl).Tag =777 then
        Continue;
      for i := TStringGrid(TheControl).FixedRows to TStringGrid(TheControl).RowCount -1 do
        TStringGrid(TheControl).Rows[i].Clear;
      if TStringGrid(TheControl).Tag <> 999 then
        TStringGrid(TheControl).RowCount := TStringGrid(TheControl).FixedRows+1;
    end
    else if theControl is TRichEdit then
      TRichEdit(Thecontrol).Lines.Text := ''
    else if theControl is TMemo then
      TMemo(Thecontrol).Lines.Text := ''
    else if theControl is TCheckBox then
      TCheckBox(Thecontrol).Checked := false;

  end;
end;

procedure TFrmLagReport.Button2Click(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmLagReport.FormShow(Sender: TObject);
var
  tmpSql :String;
  SQLs :TStrings;
begin
  inherited;
  ClearItem(FrmLagReport);
  SQLs:=TStringList.Create;
  SGOpd.ColWidths[3]:=-1;
  tmpSql:=getChkSqlStr(64);
  SetParamter(tmpSql,'$CHR_NO$',EdtChrNo.Text);
  SQLs.Text:=tmpSql;
  DM.OpenSQL(SQLs,SGOpd,true);
  SQLs.Free;
end;

end.
