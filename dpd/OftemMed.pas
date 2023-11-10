unit OftemMed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, ExtCtrls, ComCtrls, Grids, DBGrids, StdCtrls, ADODB, XPMan;

type
  TFrmOftemMed = class(TFrmMain)
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    SGMed: TStringGrid;
    Button1: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure SGMedDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    mouse_x,mouse_y:integer;
    mouse_flag:boolean;
    procedure FrmTransparent(Handle,Flag:integer);
    procedure move_form(x,y:integer);
  public
    { Public declarations }
  end;

var
  FrmOftemMed: TFrmOftemMed;

implementation

uses SqlCenter, Global, DBDM, Order;

{$R *.dfm}

procedure TFrmOftemMed.FrmTransparent(Handle,Flag:integer);
var
    l:integer;
begin
    if flag=0 then
    begin
        l:=getWindowLong(Handle, GWL_EXSTYLE);
        l:= l Or WS_EX_LAYERED;
        SetWindowLong (Handle, GWL_EXSTYLE, l);
        SetLayeredWindowAttributes(Handle, 0, 180, LWA_ALPHA);
    end
    else
    begin
        l:=getWindowLong(Handle, GWL_EXSTYLE);
        l:= l Or WS_EX_LAYERED;
        SetWindowLong (Handle, GWL_EXSTYLE, l);
        SetLayeredWindowAttributes(Handle, 0, 255, LWA_ALPHA);
    end;
end;

procedure TFrmOftemMed.move_form(x,y:integer);
begin
    self.Top := self.Top + y;
    self.Left := self.Left + X;
end;

procedure TFrmOftemMed.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  mouse_x:=X;
  mouse_y:=Y;
  mouse_flag:=true;
end;

procedure TFrmOftemMed.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
  if mouse_flag then
  begin
    FrmTransparent(Handle,0);
    move_form(X-mouse_x,Y-mouse_y);
  end;
end;

procedure TFrmOftemMed.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  mouse_flag:=false;
  FrmTransparent(Handle,1);
end;

procedure TFrmOftemMed.CheckBox1Click(Sender: TObject);
var
  Qrys :TADOQuery;
  tmpSql :String;
  SQLs :TStrings;
begin
  inherited;
  SQLs:=TStringList.Create;
  if TCheckBox(Sender).Checked then
  begin
    tmpSql:=getChkSqlStr(13);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$ITEM_NO$','1');
    if TCheckBox(Sender).Name = 'CheckBox1' then
    begin
      SetParamter(tmpSql,'$DOC_CODE$','DPD');
      CheckBox2.Checked:=false;
    end
    else if TCheckBox(Sender).Name = 'CheckBox2' then
    begin
      SetParamter(tmpSql,'$DOC_CODE$',getDocCode1);
      CheckBox1.Checked:=false;
    end;
    SQLs.Text:=tmpSql;
    DM.OpenSQL(SQLs,SGMed);
  end;
end;  

procedure TFrmOftemMed.FormShow(Sender: TObject);
begin
  inherited;
  SGMed.ColWidths[0]:=-1;
end;

procedure TFrmOftemMed.SGMedDblClick(Sender: TObject);
begin
  inherited;
  if FrmOrder.InsertMed(SGMed.Cells[1,SGMed.Row],SGMed.Cells[5,SGMed.Row],SGMed.Cells[4,SGMed.Row],'',SGMed.Cells[7,SGMed.Row],SGMed.Cells[3,SGMed.Row],SGMed.Cells[6,SGMed.Row],'',-1) then
  begin
    FrmOrder.SGMed.RowCount := FrmOrder.SGMed.RowCount +1;
    FrmOrder.SGMed.Row := FrmOrder.SGMed.Row+1;
  end;
end;

procedure TFrmOftemMed.Button1Click(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

end.
