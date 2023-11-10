unit Spec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, Grids, StdCtrls, Buttons, ExtCtrls, XPMan, ComCtrls;

type
  TFrmSpec = class(TFrmMain)
    Panel1: TPanel;
    Panel2: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    StringGrid1: TStringGrid;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    kind : string;
    procedure instrdata;
  public
    { Public declarations }
  end;

var
  FrmSpec: TFrmSpec;

implementation

uses Global, MyUser, Commfunc, DBDM, SqlCenter;

{$R *.dfm}

procedure TFrmSpec.BitBtn5Click(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmSpec.FormShow(Sender: TObject);
var
  s_qty : string;
  str : TStrings;
begin
  inherited;
  StringGrid1.Cells[0,0] := '類 別';
  StringGrid1.Cells[1,0] := '類別說明';
  StringGrid1.Cells[2,0] := '說 明';
  StringGrid1.Cells[3,0] := '等 級';
  str := TStringList.Create;
  try
  s_qty := sqlstr(28);
  SetParamter(s_qty,'$chr_no$',getChrNo);
  str.Add(s_qty);
  DM.OpenSQL(str,StringGrid1,False);
  //DM.OpenSQL(str,StringGrid1);
  finally
    FreeAndNil(str);
  end;
end;

procedure TFrmSpec.instrdata;
var
  s_qty : string;
  strlst: TStringList;
  i:integer;
begin
  try
    strlst := TStringList.Create;
    s_qty := Sqlstr(29);
    SetParamter(s_qty,'$chr_no$',getChrNo);
    SetParamter(s_qty,'$kind$',kind);
    SetParamter(s_qty,'$comm_desc$',Trim(Edit1.Text));
    SetParamter(s_qty,'$stage$','1');
    SetParamter(s_qty,'$msg_flag$','1');
    SetParamter(s_qty,'$impl_date$',ROCDate(Now,''));
    SetParamter(s_qty,'$end_date$','');
    SetParamter(s_qty,'$upd_oper$',getDocCode);
    SetParamter(s_qty,'$upd_date$',ROCDate(Now,''));
    SetParamter(s_qty,'$upd_time$',ROCTime(Now,''));
    SetParamter(s_qty,'$source$','DPD');
    strlst.Add(s_qty);
    if not DM.ExecSQL(strlst)  then
      ShowMessage('存檔失敗');

    for i:=1 to StringGrid1.RowCount - 1 do
      StringGrid1.Rows[i].Clear;

    StringGrid1.RowCount:=2;

    strlst.Clear;
    s_qty := sqlstr(28);
    SetParamter(s_qty,'$chr_no$',getChrNo);
    strlst.Add(s_qty);
    DM.OpenSQL(strlst,StringGrid1,false);
  finally
    FreeAndNil(strlst);
  end;

end;

procedure TFrmSpec.BitBtn1Click(Sender: TObject);
begin
  inherited;
  kind := '06';
  instrdata;
end;

procedure TFrmSpec.BitBtn2Click(Sender: TObject);
begin
  inherited;
  kind := '03';
  instrdata;
end;

procedure TFrmSpec.BitBtn3Click(Sender: TObject);
begin
  inherited;
  kind := '11';
  instrdata;
end;

procedure TFrmSpec.BitBtn4Click(Sender: TObject);
begin
  inherited;
  kind := '04';
  instrdata;
end;

end.
