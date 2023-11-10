unit LabOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, CheckLst, ExtCtrls, XPMan, ComCtrls, Grids,
  Buttons;
type TTempCheck=class(TChecklistbox);
type
  TFrmLabOrder = class(TFrmMain)
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    CBLabGroup: TCheckListBox;
    Panel4: TPanel;
    SGLabOrder: TStringGrid;
    SGPreOrder: TStringGrid;
    Panel5: TPanel;
    GroupBox2: TGroupBox;
    CBLabSample: TCheckListBox;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    EdtFeeCode: TEdit;
    EdtFeeName: TEdit;
    GroupBox3: TGroupBox;
    Panel6: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    mymemo: TMemo;
    CheckBox3: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CBLabGroupMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EdtFeeCodeChange(Sender: TObject);
    procedure CBLabGroupClick(Sender: TObject);
    procedure CBLabSampleClick(Sender: TObject);
    procedure EdtFeeNameChange(Sender: TObject);
    procedure SGPreOrderDblClick(Sender: TObject);
    procedure SGLabOrderDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EdtFeeCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox3Click(Sender: TObject);
    procedure SGLabOrderDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    gGroup : String;
    gSample : String;
    MySQL : TStringList;
    EMGSTR : String;
  public
    { Public declarations }
  end;

var
  FrmLabOrder: TFrmLabOrder;

implementation

uses Commfunc, DBDM, Global, SqlCenter;

{$R *.dfm}

procedure TFrmLabOrder.FormShow(Sender: TObject);
begin
  inherited;
  CBLabGroup.Items.Text := GsLabGroup.Text;
  CBLabSample.Items.Text := gsLabSample.Text;
  MySQL := TStringList.Create;
  mySQL.Text := getPreOrderSql(2) + #13 +  getPreOrderSql(3);
  //mySQL.SaveToFile('s7.sql');
  if not DM.OpenSQL( mySQL, SGLabOrder) then
    ShowMessage('沒資料');
  with SGPreOrder do
  begin
    Cells[0,0] := '組別';
    Cells[1,0] := '檢體';
    Cells[2,0] := '院內代碼';
    Cells[3,0] := '項目名稱';
    ColWidths[0] := 0;
    ColWidths[1] := 0;
    ColWidths[2] := 0;
  end;
  DM.OpenSQL(mySQL,SGLabOrder);
end;

procedure TFrmLabOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := Cafree;
end;

procedure TFrmLabOrder.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmLabOrder := nil;
end;

procedure TFrmLabOrder.CBLabGroupMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i : Integer;
begin
  inherited;
  try
  i:=TCheckListBox(Sender).ItemAtPos(point(x,y),True);
  if i>=0 then
    if x > TTempCheck(TCheckListBox(Sender)).GetCheckWidth then
      TCheckListBox(Sender).Checked[i] := not TCheckListBox(Sender).Checked[i];
  except
  end;
end;

procedure TFrmLabOrder.EdtFeeCodeChange(Sender: TObject);
var
  temps : TStringList;
begin
  inherited;
  mySQL.Text := getPreOrderSql(2) + getPreOrderSql(3);
  if Trim(TEdit(Sender).Text) ='' then
  begin
    DM.OpenSQL(mySQL,SGLabOrder)
  end
  else
  begin
    Temps := TStringList.Create;
    Temps.Text := getPreOrderSql(2);
    if CheckBox1.Checked and (gGroup <>'') then
      Temps.Add(' And trim(SEND_CD_1) in ('+Qts(gGroup)+')');
    if CheckBox2.Checked and (gSample <>'') then
      Temps.Add(' And SEND_CD_2 in ('+Qts(gSample)+')');
    Temps.Add(' AND FEE_CODE LIKE '+Qt(TEdit(sender).Text+'%')) ;
    Temps.Add(EMGStr);
    Temps.Add(getPreOrderSql(3));
    DM.OpenSQL(Temps,sgLabOrder);
  end;
end;

procedure TFrmLabOrder.CBLabGroupClick(Sender: TObject);
var
  i : Integer;
  temps : TStringList;
begin
  inherited;
  gGroup := '';
  for i := 0 to CBLabGroup.Items.Count -1 do
  begin
    if CBLabGroup.Checked[i] then
      gGroup := gGroup+ReTurnId(CBLabGroup.Items.Strings[i])+';';
  end;
  gGroup := Copy(gGroup,1,Length(gGroup)-1);
  Temps := TStringList.Create;
  Temps.Text := getPreOrderSql(2);
  if gGroup<>'' then
  begin
    Temps.Add(' And trim(SEND_CD_1) in ('+Qts(gGroup)+')');
  end;
  if gSample<>'' then
  begin
    Temps.Add(' And SEND_CD_2 in ('+Qts(gSample)+')');
  end;
  Temps.Add(EMGStr);
  Temps.Add(getPreOrderSql(3));
  Temps.SaveToFile('s7-1.sql');
  DM.OpenSQL(Temps,sgLabOrder);

end;

procedure TFrmLabOrder.CBLabSampleClick(Sender: TObject);
var
  i : Integer;
  temps : TStringList;
begin
  inherited;
  gSample := '';
  for i := 0 to CBLabSample.Items.Count -1 do
  begin
    if CBLabSample.Checked[i] then
      gSample := gSample+ReTurnId(CBLabSample.Items.Strings[i])+';';
  end;
  gSample := Copy(gSample,1,Length(gSample)-1);
  Temps := TStringList.Create;
  Temps.Text := getPreOrderSql(2);
  if gGroup<>'' then
  begin
    Temps.Add(' And trim(SEND_CD_1) in ('+Qts(gGroup)+')');
  end;
  if gSample<>'' then
  begin
    Temps.Add(' And SEND_CD_2 in ('+Qts(gSample)+')');
  end;
  Temps.Add(EMGStr);
  Temps.Add(getPreOrderSql(3));
  DM.OpenSQL(Temps,sgLabOrder);

end;

procedure TFrmLabOrder.EdtFeeNameChange(Sender: TObject);
function StrToList(str: String): TStringList;
var
  TStr,TSwap : String;
begin
  TStr := StringReplace(Str,' ',';',[rfReplaceAll]);
  Result := TStringList.Create;
  TStr := TStr+';';
  While not (Length(TStr) = 0) do
  begin
    Result.Add(copy(TStr,1,Pos(';',TStr)-1));
    TStr := Copy(TStr,Pos(';',TStr)+1,Length(TStr)-Pos(';',TStr));
  end;
end;
var
  i : Integer;
  temps : TStringList;
  myKeyWord : TStringList;
begin
  inherited;
  mySQL.Text :=getPreOrderSql(2) + getPreOrderSql(3);
  if Trim(TEdit(Sender).Text) ='' then
  begin
    DM.OpenSQL(mySQL,SGLabOrder)
  end
  else
  begin
    Temps := TStringList.Create;
    MyKeyWord := TstringList.Create;
    Temps.Text := getPreOrderSql(2);
    if CheckBox1.Checked and (gGroup <>'') then
      Temps.Add(' And trim(SEND_CD_1) in ('+Qts(gGroup)+')');
    if CheckBox2.Checked and (gSample <>'') then
      Temps.Add(' And SEND_CD_2 in ('+Qts(gSample)+')');
    myKeyWord := StrToList(TEdit(sender).Text);
    for i := 0 to myKeyWord.Count -1 do
      Temps.Add(' AND UPPER(FEE_NAME) LIKE '+Qt('%'+UPPERCASE(myKeyWord.Strings[i])+'%'));
    Temps.Add(EMGStr);
    Temps.Add(getPreOrderSql(3));
    DM.OpenSQL(Temps,SGLabOrder);
  end
end;

procedure TFrmLabOrder.SGPreOrderDblClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  if TStringGrid(Sender).Row = 0 then
    Exit
  else if TStringGrid(Sender).Row = TStringGrid(Sender).RowCount-1  then
    TStringGrid(Sender).Rows[TStringGrid(Sender).Row].Clear
  else
  begin
    for i := TStringGrid(Sender).row to TStringGrid(Sender).RowCount - 1 do
      TStringGrid(Sender).Rows[i] := TStringGrid(Sender).Rows[i+1];
    TStringGrid(Sender).RowCount := TStringGrid(Sender).RowCount - 1;
  end;
end;

procedure TFrmLabOrder.SGLabOrderDblClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  i := SGPreOrder.RowCount-1;
  SGPreOrder.Cells[0,i] := SGLabOrder.Cells[0,SGLabOrder.Row];
  SGPreOrder.Cells[1,i] := SGLabOrder.Cells[1,SGLabOrder.Row];
  SGPreOrder.Cells[2,i] := SGLabOrder.Cells[2,SGLabOrder.Row];
  SGPreOrder.Cells[3,i] := SGLabOrder.Cells[3,SGLabOrder.Row];
  SGPreOrder.Cells[4,i] := SGLabOrder.Cells[4,SGLabOrder.Row];
  SGPreOrder.RowCount := SGPreOrder.RowCount+1;
  EdtFeeCode.Text := '';
  EdtFeeName.Text := '';
end;

procedure TFrmLabOrder.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmLabOrder.BitBtn2Click(Sender: TObject);
var
  i,j : Integer;
  Str : String;
begin
  inherited;
  OutList.Clear;
  for i := 1 to SGPreOrder.RowCount -1 do
  begin
    if SGPreOrder.Cells[0,i] <>'' then
    begin
      str := '';
      for j := 0 to SGPreOrder.ColCount -1 do
        Str := Str+ SGPreOrder.Cells[j,i]+'_';
      Str := Str +mymemo.Lines.Text;
      OutList.Add(Str);
    end;
  end;
  Close;
end;

procedure TFrmLabOrder.EdtFeeCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case key of
    VK_DOWN :
    begin
      if (SGLabOrder.Row >= 1) and (SGLabOrder.Row < SGLabOrder.RowCount -1)  then
        SGLabOrder.Row := SGLabOrder.Row + 1 ;
      Key := 0;
    end;
    VK_UP :
    begin
      if (SGLabOrder.Row > 1) and (SGLabOrder.Row < SGLabOrder.RowCount)  then
        SGLabOrder.Row := SGLabOrder.Row -1 ;
      Key := 0;
    end;
    VK_RETURN :
    begin
      SGLabOrderDblClick(SGLabOrder);
      Key := 0;
    end;
  end;
end;

procedure TFrmLabOrder.CheckBox3Click(Sender: TObject);
begin
  inherited;
  if CheckBox3.Checked then
    EMGSTR := ' And URG_FLAG =''Y'' '
  else
    EMGSTR := '';
  CBLabGroupClick(nil);
end;

procedure TFrmLabOrder.SGLabOrderDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  i : Integer;
begin
  inherited;
  if (ARow > 0) then
  begin
    SGLabOrder.Canvas.FillRect(Rect);
    try
      if SGLabOrder.Cells[Acol,Arow] <>'' then
      Case ACol of
      0 :
        SGLabOrder.Canvas.TextOut(Rect.Left +1, Rect.Top + 1, ReTurnName(GsLabGroup.Strings[SetCbbItem_(GsLabGroup,Trim(SGLabOrder.Cells[Acol,Arow]))]));
      1 :
        SGLabOrder.Canvas.TextOut(Rect.Left +1, Rect.Top + 1, ReTurnName(gsLabSample.Strings[SetCbbItem_(gsLabSample,Trim(SGLabOrder.Cells[Acol,Arow]))]));
      else
        SGLabOrder.Canvas.TextOut(Rect.Left +1 , Rect.Top + 1,SGLabOrder.Cells[ACol,ARow] )
      end;
    except
      SGLabOrder.Canvas.TextOut(Rect.Left +1 , Rect.Top + 1,SGLabOrder.Cells[ACol,ARow] );
    end;
  end;
end;
end.
