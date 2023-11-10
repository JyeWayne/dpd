unit DittoDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, Mask, Grids, ExtCtrls, XPMan, ComCtrls;

type
  TFrmDittoDate = class(TFrmMain)
    Panel1: TPanel;
    SGOpd: TStringGrid;
    Button1: TButton;
    CheckBox1: TCheckBox;
    mask_begday: TMaskEdit;
    mask_endday: TMaskEdit;
    Label1: TLabel;
    Button2: TButton;
    SGIPD: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure SGOpdDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGOpdClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bringStr,chr_no,dept_code:string;
    isSelect:Boolean;
    fcheck,fnocheck:tbitmap;
  end;

var
  FrmDittoDate: TFrmDittoDate;

implementation

uses SqlCenter, DBDM;

{$R *.dfm}

procedure TFrmDittoDate.FormCreate(Sender: TObject);
var
  i:SmallInt;
  bmp:TBitmap;
begin
  inherited;
  bringStr:='';
  FCheck:= TBitmap.Create;
  FNoCheck:= TBitmap.Create;
  bmp:= TBitmap.create;

  try
    bmp.Handle := LoadBitmap(0, PChar(OBM_CHECKBOXES ));
    With FNoCheck Do Begin
      width := bmp.width div 4;
      height := bmp.height div 3;
      canvas.copyrect( canvas.cliprect, bmp.canvas, canvas.cliprect );
    End;
    With FCheck Do Begin
      width := bmp.width div 4;
      height := bmp.height div 3;
      canvas.copyrect(canvas.cliprect, bmp.canvas, rect( width, 0, 2*width, height ));
    End;
  finally
    bmp.free
  end;
end;

procedure TFrmDittoDate.SGOpdDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if not (gdFixed in State) and (ACol < 1) then
    with TStringGrid(Sender).Canvas do
    begin
      brush.Color:=clWindow;
      FillRect(Rect);
      if TStringGrid(Sender).Cells[ACol,ARow]='V' then
        Draw( (rect.right + rect.left - FCheck.width) div 2, (rect.bottom + rect.top - FCheck.height) div 2, FCheck )
      else
        Draw( (rect.right + rect.left - FCheck.width) div 2, (rect.bottom + rect.top - FCheck.height) div 2, FNoCheck );
    end;
end;

procedure TFrmDittoDate.SGOpdClick(Sender: TObject);
begin
  inherited;
  if (TStringGrid(Sender).col < 1) and (TStringGrid(Sender).row < (TStringGrid(Sender).RowCount )) then
    if TStringGrid(Sender).Cells[TStringGrid(Sender).col,TStringGrid(Sender).row]='V' then
      TStringGrid(Sender).Cells[TStringGrid(Sender).col,TStringGrid(Sender).row]:=''
    else
      TStringGrid(Sender).Cells[TStringGrid(Sender).col,TStringGrid(Sender).row]:='V';      
end;

procedure TFrmDittoDate.Button1Click(Sender: TObject);
var
  i:integer;
begin
  inherited;
  bringStr:='於';
  isSelect:=false;
  for i:=SGOpd.RowCount downto 0 do
  begin
    if SGOpd.Cells[0,i] = 'V' then
    begin
      isSelect:=true;
      bringStr:=bringStr+copy(SGOpd.Cells[1,i],1,3)+'年'+copy(SGOpd.Cells[1,i],4,2)+'月'+copy(SGOpd.Cells[1,i],6,2)+'日，';
    end;
  end;
  bringStr:=copy(bringStr,1,length(bringStr)-2);
  bringStr:=bringStr+'至門診就診，';
  if not isSelect then
    bringStr:='';

  for i:=SGIpd.RowCount downto 0 do
  begin
    if SGIpd.Cells[0,i] = 'V' then
    begin
      isSelect:=true;
      bringStr:=bringStr+'於';
      bringStr:=bringStr+copy(SGIpd.Cells[1,i],1,3)+'年'+copy(SGIpd.Cells[1,i],4,2)+'月'+copy(SGIpd.Cells[1,i],6,2)+'日入院，';
      bringStr:=bringStr+'至';
      bringStr:=bringStr+copy(SGIpd.Cells[2,i],1,3)+'年'+copy(SGIpd.Cells[2,i],4,2)+'月'+copy(SGIpd.Cells[2,i],6,2)+'日出院，';
    end;
  end;
  //bringStr:=copy(bringStr,1,length(bringStr)-2);


  Self.Close;
end;

procedure TFrmDittoDate.CheckBox1Click(Sender: TObject);
var
  tmpSql :String;
  SQLs :TStrings;
begin
  inherited;
  SQLs:=TStringList.Create;
  tmpSql:=getDittoSql(9);
  SetParamter(tmpSql,'$CHR_NO$',chr_no);
  SetParamter(tmpSql,'$OPD_DATE1$',mask_begday.Text);
  SetParamter(tmpSql,'$OPD_DATE2$',mask_endday.Text);
  if CheckBox1.Checked then
    SetParamter(tmpSql,'$DEPT_CODE$',dept_code)
  else
    SetParamter(tmpSql,'$DEPT_CODE$','%');
  SQLs.Text:=tmpSql;
  DM.OpenSQL(SQLs,SGOpd);
  tmpSql:=getDittoSql(10);
  SetParamter(tmpSql,'$CHR_NO$',chr_no);
  SetParamter(tmpSql,'$IPD_DATE1$',mask_begday.Text);
  SetParamter(tmpSql,'$IPD_DATE2$',mask_endday.Text);
  SQLs.Text:=tmpSql;
  DM.OpenSQL(SQLs,SGIpd);
  SQLs.Free;
end;

procedure TFrmDittoDate.Button2Click(Sender: TObject);
begin
  inherited;
  CheckBox1Click(CheckBox1);
end;

end.
