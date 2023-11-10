unit XRayOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, Grids, ExtCtrls, XPMan, ComCtrls, CheckLst,
  Buttons, ADODB;
type TTempCheck=class(TChecklistbox);
type
  TFrmXRayOrder = class(TFrmMain)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    SgPreOrder: TStringGrid;
    Panel4: TPanel;
    Label1: TLabel;
    EdtFeeCode: TEdit;
    Label2: TLabel;
    EdtFeeName: TEdit;
    CheckBox1: TCheckBox;
    SGOrder: TStringGrid;
    GroupBox3: TGroupBox;
    CBXPath: TCheckListBox;
    CheckBox2: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure EdtFeeCodeChange(Sender: TObject);
    procedure EdtFeeNameChange(Sender: TObject);
    procedure SGOrderDblClick(Sender: TObject);
    procedure SgPreOrderDblClick(Sender: TObject);
    procedure CBXPathMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdtFeeCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtFeeNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    MySQL : TStringList;
    SortSQL : TStringList;
    SelectSQL : TStringList;
  public
    { Public declarations }
  end;

var
  FrmXRayOrder: TFrmXRayOrder;

implementation

uses Commfunc, DBDM, Global, SqlCenter;

{$R *.dfm}

procedure TFrmXRayOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
end;

procedure TFrmXRayOrder.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmXRayOrder := nil;
end;

procedure TFrmXRayOrder.FormShow(Sender: TObject);
var
  Qrys :TADOQuery;
  tmpSql :String;
  SQLs :TStrings;
begin
  inherited;
  RadioGroup1.Items.Clear;
  SQLs:=TStringList.Create;
  tmpSql:=getPreOrderSql(5);
  SQLs.Text:=tmpSql;

  if DM.OpenSQL(SQLs,Qrys) then
  begin
    while not Qrys.Eof do
    begin
      RadioGroup1.Items.Add(Trim(Qrys.FieldByName('Code_one').AsString)+'_'+Trim(Qrys.FieldByName('code_onename').AsString));
      Qrys.Next;
    end;
  end;
  MySQL := TStringList.Create;
  SortSQL:=TStringList.Create;
  SelectSQL:=TStringList.Create;
  SortSQL.Text := getPreOrderSql(7);
  SelectSQL.Text := getPreOrderSql(6);
  with SGPreOrder do
  begin
    Cells[0,0] := 'Order_type';
    Cells[1,0] := '類型';
    Cells[2,0] := '院內代碼';
    Cells[3,0] := '項目名稱';
    Cells[4,0] := '部位';
    Cells[5,0] := 'Sender';
    Cells[6,0] := '流水號';
    ColWidths[0] := 0;
    ColWidths[1] := 0;
    ColWidths[2] := 0;
    ColWidths[4] := 0;
    ColWidths[5] := 0;
    ColWidths[6] := 0;
    RowCount := 2;
  end;
  With SGOrder do
  begin
    ColWidths[0] := 0;
    ColWidths[4] := 0;
    ColWidths[6] := 0;
  end;
  if RadioGroup1.Items.Count > 0 then
    RadioGroup1.ItemIndex := 0;
  SQLs.Free;
end;

procedure TFrmXRayOrder.RadioGroup1Click(Sender: TObject);
var
  Qrys :TADOQuery;
  tmpSql :String;
  SQLs :TStrings;
begin
  inherited;
  SQLs:=TStringList.Create;
  tmpSql:=getPreOrderSql(8);
  SetParamter(tmpSql,'$CODE_TWO$',ReturnId(RadioGroup1.Items.Strings[RadioGroup1.ItemIndex]) );
  SQLs.Text:=tmpSql;
  if DM.OpenSQL(SQLs,Qrys) then
  begin
    While not Qrys.Eof do
    begin
      CBXPath.Items.Add(Trim(Qrys.FieldByName('CODE_ONE').AsString)+'_'+Trim(Qrys.FieldByName('CODE_ONENAME').AsString));
      Qrys.Next;
    end;
  end;
  mySQL.Text := SelectSQL.Text;
  mySQL.Add(' and Order_type='+Qt(ReturnId(RadioGroup1.Items.Strings[RadioGroup1.ItemIndex]))) ;
  mySQL.AddStrings(SortSQL);
  dm.OpenSQL(MYSQL,SGOrder);
end;

procedure TFrmXRayOrder.EdtFeeCodeChange(Sender: TObject);
var
  Temps : TStringList;
begin
  inherited;

  Temps := TStringList.Create;
  if Trim(TEdit(Sender).Text) <>'' then
  begin
    Temps := TStringList.Create;
    Temps.Text := SelectSQL.Text;
    if CheckBox1.Checked  then
      Temps.Add(' And Order_type ='+Qt(ReturnId(RadioGroup1.Items.Strings[RadioGroup1.ItemIndex])));
    Temps.Add(' AND FEE_CODE LIKE '+Qt(TEdit(sender).Text+'%')) ;
    Temps.AddStrings(SortSQL);
    DM.OpenSQL(Temps,sgOrder);
  end;
end;

procedure TFrmXRayOrder.EdtFeeNameChange(Sender: TObject);
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
  if Trim(TEdit(Sender).Text) <> '' then
  begin
    Temps := TStringList.Create;
    MyKeyWord := TstringList.Create;
    Temps.Text := SelectSQL.Text;
    if CheckBox1.Checked then
      Temps.Add(' And ORDER_TYPE = '+Qt(ReturnId(RadioGroup1.Items.Strings[RadioGroup1.ItemIndex])));
    if CheckBox2.Checked  and (CBXPath.ItemIndex >= 0) then
      Temps.Add(' And trim(Send_CD_1) = '+Qt(ReturnId(CBXPath.Items.Strings[CBXPath.ItemIndex])));
    myKeyWord := StrToList(TEdit(sender).Text);
    for i := 0 to myKeyWord.Count -1 do
      Temps.Add(' AND UPPER(FEE_NAME) LIKE '+Qt('%'+UPPERCASE(myKeyWord.Strings[i])+'%'));
    Temps.AddStrings(SortSQL);
    DM.OpenSQL(Temps,SGOrder);
  end;
end;

procedure TFrmXRayOrder.SGOrderDblClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  i := SGPreOrder.RowCount-1;
  SGPreOrder.Cells[0,i] := SGOrder.Cells[0,SGOrder.Row];
  SGPreOrder.Cells[1,i] := SGOrder.Cells[1,SGOrder.Row];
  SGPreOrder.Cells[2,i] := SGOrder.Cells[2,SGOrder.Row];
  SGPreOrder.Cells[3,i] := SGOrder.Cells[3,SGOrder.Row];
  SGPreOrder.Cells[4,i] := SGOrder.Cells[4,SGOrder.Row];
  SGPreOrder.Cells[5,i] := SGOrder.Cells[5,SGOrder.Row];
  SGPreOrder.Cells[6,i] := SGOrder.Cells[6,SGOrder.Row];
  SGPreOrder.RowCount := SGPreOrder.RowCount+1;
  EdtFeeCode.Text := '';
  EdtFeeName.Text := '';
end;

procedure TFrmXRayOrder.SgPreOrderDblClick(Sender: TObject);
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

procedure TFrmXRayOrder.CBXPathMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i ,j : Integer;
begin
  inherited;
  try
    i:=TCheckListBox(Sender).ItemAtPos(point(x,y),True);
    for j := 0 to TCheckListBox(Sender).Items.Count -1 do
      if i <> j then
        TCheckListBox(Sender).Checked[j] := False;

    if i>=0 then
      if x > TTempCheck(TCheckListBox(Sender)).GetCheckWidth then
        TCheckListBox(Sender).Checked[i] := not TCheckListBox(Sender).Checked[i];

    mySQL.Text := SelectSQL.Text;
    mySQL.Add(' and Order_type='+Qt(ReturnId(RadioGroup1.Items.Strings[RadioGroup1.ItemIndex]))) ;
    if TCheckListBox(Sender).Checked[i] then
      mySQL.Add('And trim(Send_cd_1)='+Qt(ReturnID(CBXpath.Items.Strings[CBXPath.Itemindex])));
    mySQL.AddStrings(SortSQL);
    dm.OpenSQL(MYSQL,SGOrder);
  except
  end;
end;

procedure TFrmXRayOrder.BitBtn2Click(Sender: TObject);
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
      OutList.Add(Str);
    end;
  end;
  Close;
end;

procedure TFrmXRayOrder.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmXRayOrder.EdtFeeCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case key of
    VK_DOWN :
    begin
      if (SGOrder.Row >= 1) and (SGOrder.Row < SGOrder.RowCount -1)  then
        SGOrder.Row := SGOrder.Row + 1 ;
      Key := 0;
    end;
    VK_UP :
    begin
      if (SGOrder.Row > 1) and (SGOrder.Row < SGOrder.RowCount)  then
        SGOrder.Row := SGOrder.Row -1 ;
      Key := 0;
    end;
    VK_RETURN :
    begin
      SGOrderDblClick(SGOrder);
      Key := 0;
    end;
  end;
end;

procedure TFrmXRayOrder.EdtFeeNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case key of
    VK_DOWN :
    begin
      if (SGOrder.Row >= 1) and (SGOrder.Row < SGOrder.RowCount -1)  then
        SGOrder.Row := SGOrder.Row + 1 ;
      Key := 0;
    end;
    VK_UP :
    begin
      if (SGOrder.Row > 1) and (SGOrder.Row < SGOrder.RowCount)  then
        SGOrder.Row := SGOrder.Row -1 ;
      Key := 0;
    end;
    VK_RETURN :
    begin
      SGOrderDblClick(SGOrder);
      Key := 0;
    end;
  end;
end;

end.
