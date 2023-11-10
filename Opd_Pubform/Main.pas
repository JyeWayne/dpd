unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls,ActnMan, ActnCtrls, XPMan, ExtCtrls,Grids,
  jpeg, DBCGrids;
Const
  //DPD_Ver ='TMUDPD V3.0.1.0';
  //DPD_Ver ='TMUDPD V3.0.0.8-1';
  //DPD_Ver ='TMUDPDV3.0.0.8.1100119.01';   //線上版序
  //DPD_Ver ='TMUDPDV3.0.0.8.1100119.02';   //線上版序
  //DPD_Ver ='TMUDPDV3.0.0.8.1110503.03';   //正式版序
  //DPD_Ver ='TMUDPDV3.0.0.8.1110503.08';   //正式版序
  //DPD_Ver ='TMUDPDV3.0.0.8.1110503.09';   //正式版序
  DPD_Ver ='TMUDPDV3.0.0.8.1110503.10';   //正式版序


  FeePartFileName = 'DPDFeePart.INI';

type
  TFrmMain = class(TForm)
    MySBar: TStatusBar;
    Timer2: TTimer;
    XPManifest1: TXPManifest;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    
  private
    { Private declarations }
    nScreenWidth,nScreenHeight:integer;
  public
    { Public declarations }

  end;


var
  FrmMain: TFrmMain;

implementation

uses Commfunc, Global, DBDM;

{$R *.dfm}

procedure TFrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#10,#13] then
  begin
    if ActiveControl is Tmemo then
      Exit;
    if ActiveControl is TRichEdit then
      Exit;
    if Sender is TComboBox then
      Setcbbitem(TcomboBox(Sender),TcomboBox(Sender).Text);

    if ActiveControl is TStringGrid then
      Exit;
    Key := #0;
    SelectNext(ActiveControl,True,True);
  end;
  if (Key = #08) and (Sender is TStringGrid) and (TStringGrid(Sender).Tag = 6666) then
  begin
    if TStringGrid(Sender).Col < (TStringGrid(Sender).ColCount -1) then
      TStringGrid(Sender).Col := TStringGrid(Sender).Col +1
    else
    begin
      if TStringGrid(Sender).Row < (TStringGrid(Sender).RowCount -1) then
        TStringGrid(Sender).Row := TStringGrid(Sender).Row + 1;
    end
  end;

  if (ActiveControl is TEdit) and (Tedit(ActiveControl).Tag =8888) then
    key := #0;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  MySBar.Panels[2].Text := 'IP : '+MyIp;
  TForm(Sender).Caption := TForm(Sender).Caption + '--' + DPD_Ver;
end;

procedure TFrmMain.FormPaint(Sender: TObject);
begin
  MySBar.Panels[1].Text := getDocName;
  Application.Title:='DPD - ' + getDocName;
  nScreenWidth := GetSystemMetrics(SM_CXSCREEN);
  nScreenHeight := GetSystemMetrics(SM_CYSCREEN);
end;



procedure TFrmMain.FormShow(Sender: TObject);
begin
  if Tform(Sender).Tag <> 9999 then
    if Setsys.ReadString('SYSTEM','AlClient','False') = 'True'  then
      Tform(Sender).Align := AlClient;
end;

procedure TFrmMain.Timer2Timer(Sender: TObject);
var
  i : Integer;
begin

  MySBar.Panels[3].Width := (nScreenWidth - 1024) + 550;
  MySBar.Panels[3].Text := '醫令可用時間 :'+ IntToStr(GetUseTime div 60)+'分'+IntToStr(GetUseTime mod 60)+'秒';
  If GetUseTime() <= 1 Then
  Begin
    for i :=SCreen.FormCount -1 downto 0 do
    begin
      if not (SCreen.Forms[i].Name  = 'FrmLogin') then
        SCreen.Forms[i].Close;
      SetUseTime(0);

    end;
    //DM.ADOLink.Connected := False;
    ClearPat();
    ClearReg();
    //winexec(PChar(ExtractFileDir(Application.ExeName)+ '\GetFile.exe IPD IPD '+ getUserid()),SW_Normal);
    Close;
  end;

end;

end.
