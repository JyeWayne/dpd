unit MyMsgs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ImgList, ExtCtrls,Math, XPMan;
const
  MsError = 0;
  MsInfor = 1;
  MsComf  = 2;
  MsWarn  = 3;

type
  TEvenMessage = class(TForm)
    Image1: TImage;
    ImageList1: TImageList;
    MsgMemo: TRichEdit;
    procedure BitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    outResult : Integer;
    // ['錯誤訊息','提示訊息','確認訊息','警示訊息'];
  public
    { Public declarations }
  end;

var
  EvenMessage: TEvenMessage;
function ShowMessage_( Msg:string;btns : array Of String;MsgType : Integer):Integer;// Export;
function ShowMessage2_(Msg:string;btns : array Of String;MsgType : Integer):Integer;// Export;
implementation



{$R *.DFM}

procedure TEvenMessage.BitBtnClick(Sender: TObject);
begin
  OutResult := TBitBtn(Sender).tag;
  Close;
end;
function showMessage_( Msg:string;btns : array Of String ; MsgType:Integer):Integer;
var
  i , MaxLeng,themid,BeginLeft: Integer;
  MyBtn : TBitBtn;
  Bmp : TBITMAP;
  MsCaption : array[0..3] of String;
  myString : TStringlist;
begin
  myString := TStringlist.Create;
  myString.Text := msg;
  MsCaption[0]:='錯誤訊息';MsCaption[1]:='提示訊息';MsCaption[2]:='確認訊息';MsCaption[3]:='警示訊息';
  //Application.Handle   :=   AHandle;
  EvenMessage:=TEvenMessage.CreateParented(Application.Handle);// Create(Application);
  MaxLeng := 250;
  BeginLeft := 8;
  With EvenMessage do
  begin
    outResult := -1;
    ImageList1.GetIcon(MsgType,EvenMessage.Icon);
    // := ImageList1.
    EvenMessage.Caption := ExtractFileName(Application.ExeName)+': '+ MsCaption[MsgType];
    Case MsgType of
      0: MsgMemo.Font.Color := Clred;
      1: MsgMemo.Font.Color := Clblue;
      else MsgMemo.Font.Color := ClWindowText;
    end;

    MsgMemo.Lines.Clear;
    //Msg := StringReplace(Msg,#10,'',[rfReplaceAll]);

    if MsgMemo.lines.Count = 1 then
      MsgMemo.lines.Insert(0,'');
    MsgMemo.Height := 17 * (myString.Count +1);
    if MsgMemo.Height < 48 then
      MsgMemo.Height := 48;
    Bmp := TBITMAP.Create;
    ImageList1.GetBitmap(MsgType,Bmp);
    Image1.Picture.Bitmap := Bmp;
    FreeandNil(Bmp);

    for i := 0 to High(Btns)  do
    begin
      MyBtn :=  TBitBtn.Create(EvenMessage);
      MyBtn.Parent := EvenMessage;
      MyBtn.Caption := Btns[i];
      MyBtn.Tag := i;
      MyBtn.Name := 'Btn'+IntToStr(i);
      MyBtn.OnClick := BitBtnClick;
      MyBtn.Left := BeginLeft;
      MyBtn.TabOrder := i +1;
      if Length(Btns[i]) > 10 then
        MyBtn.Width := Length(Btns[i]) * 7;
      BeginLeft :=BeginLeft+MyBtn.Width+4;
      MyBtn.Top := MsgMemo.Top + MsgMemo.Height + 16 ;
      MaxLeng := MyBtn.Left + 75;
    end;
    for i := 0 to myString.Count -1 do
      if MaxLeng < (Length(myString.Strings[i])*10) then
        MaxLeng := Length(myString.Strings[i])*10;
    MsgMemo.Width := MaxLeng;
    EvenMessage.Width := MaxLeng+MsgMemo.Left+30;
    EvenMessage.Height := MsgMemo.Top + MsgMemo.Height + 8 + 75;
    MsgMemo.Text := myString.Text;
    //MsgMemo.ScrollBars:= SSNONE;
    //調整按鍵位置
    themid := EvenMessage.Width div 2;
    beginLeft := 8;
    for i := 0 to High(Btns) do
    begin

      MyBtn:=TBitBtn(EvenMessage.FindComponent('Btn'+IntToStr(i)));
      MyBtn.Left := beginLeft;
      beginLeft := beginLeft+MyBtn.Width + 4;
      MyBtn.TabOrder := i;
    end;
    TBitBtn(EvenMessage.FindComponent('Btn0')).tabOrder := 0;
  end;
  try
    EvenMessage.ShowModal;
    showMessage_ :=EvenMessage.outResult;
  except
    showMessage_:= 0;
  end;
  myString.Free;
  myString := nil;
  //EvenMessage.Free;
  //EvenMessage := nil;


end;
function Showmessage2_( Msg:string;btns : array Of String;MsgType : Integer):Integer; Export;
var
  i , MaxLeng,themid,BeginLeft,beginTop: Integer;
  MyBtn : TBitBtn;
  Bmp : TBITMAP;
  MsCaption : array[0..3] of String;
  myString : TStringlist;
begin
  myString := TStringlist.Create;
  myString.Text := msg;
  MsCaption[0]:='錯誤訊息';MsCaption[1]:='提示訊息';MsCaption[2]:='確認訊息';MsCaption[3]:='警示訊息';
  //Application.Handle   :=   AHandle; 
  EvenMessage:=TEvenMessage.CreateParented(Application.Handle) ;//.Create(Application);

  MaxLeng := 250;
  BeginLeft := 8;
  beginTop := 8;
  With EvenMessage do
  begin
    outResult := -1;
    ImageList1.GetIcon(MsgType,EvenMessage.Icon);
    EvenMessage.Caption := ExtractFileName(Application.ExeName)+': '+ MsCaption[MsgType];
    Case MsgType of
      0: MsgMemo.Font.Color := Clred;
      1: MsgMemo.Font.Color := Clblue;
      else MsgMemo.Font.Color := ClWindowText;
    end;
    MsgMemo.Lines.Clear;
    if MsgMemo.lines.Count = 1 then
      MsgMemo.lines.Insert(0,'');
    MsgMemo.Height := 17 * (myString.Count +1);
    if MsgMemo.Height < 48 then
      MsgMemo.Height := 48;
    Bmp := TBITMAP.Create;
    ImageList1.GetBitmap(MsgType,Bmp);
    Image1.Picture.Bitmap := Bmp;
    FreeandNil(Bmp);
    for i := 0 to myString.Count -1 do
      if MaxLeng < (Length(myString.Strings[i])*10) then
        MaxLeng := Length(myString.Strings[i])*10;
    MsgMemo.Width := MaxLeng;
    EvenMessage.Width := MaxLeng+MsgMemo.Left+30;
    if EvenMessage.Width > 1024 then
      EvenMessage.Width := 1024;
    EvenMessage.Height := MsgMemo.Top + MsgMemo.Height + 146;
    MsgMemo.Text := myString.Text;
    beginTop :=  MsgMemo.Top + MsgMemo.Height + 4;
    for i := 0 to High(Btns)  do
    begin
      MyBtn :=  TBitBtn.Create(EvenMessage);
      MyBtn.Parent := EvenMessage;
      MyBtn.Caption := Btns[i];
      MyBtn.Tag := i;
      MyBtn.Name := 'Btn'+IntToStr(i);
      MyBtn.OnClick := BitBtnClick;
      MyBtn.Left := BeginLeft;
      MyBtn.TabOrder := i +1;
      //if Length(Btns[i]) > 10 then
      //  MyBtn.Width := Length(Btns[i]) * 7;
      //BeginLeft :=BeginLeft+MyBtn.Width+4;
      MyBtn.Width := EvenMessage.Width -60;
      MyBtn.Top := beginTop;
      BeginTop := BeginTop + MyBtn.Height + 4;
      //MaxLeng := MyBtn.Left + 75;
    end;
    TBitBtn(EvenMessage.FindComponent('Btn0')).tabOrder := 0;
  end;
  try
    EvenMessage.ShowModal;
    showMessage2_ :=EvenMessage.outResult;

  except
    showMessage2_:= 0;
  end;
  Application.RemoveComponent(EvenMessage);
  FreeAndnil(EvenMessage);
  myString.Free;
  myString := nil;
  //EvenMessage.Free;
  //if EvenMessage <> nil then
  //  EvenMessage := nil;
end;
procedure TEvenMessage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Action := cafree;
end;

procedure TEvenMessage.FormDestroy(Sender: TObject);
begin
  //EvenMessage := nil;
  //PostMessage(Application.Handle ,WM_USER+101,0,0);
end;

procedure TEvenMessage.FormCreate(Sender: TObject);
begin
  DefFontData.Name := '細明體';
end;

end.
