unit BarCodePrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, QuickRpt, QRCtrls, ExtCtrls, ComCtrls, Registry, Printers,
  XPMan;

type
  TFrmBarCodePrint = class(TFrmMain)
    QuickRep2: TQuickRep;
    TitleBand1: TQRBand;
    QRLStickbracode: TQRLabel;
    QRLChrnoName: TQRLabel;
    QRLbIDNO: TQRLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure PrepareSQL;
  end;

var
  FrmBarCodePrint: TFrmBarCodePrint;

implementation

uses Commfunc, Global;

{$R *.dfm}

{ TFrmMain1 }

procedure TFrmBarCodePrint.PrepareSQL;
var
  reg : TRegistry;
  DefPrint : String;
  i: integer;
  checkprint: string;
begin
  checkprint := 'N';
  //§ì¦Lªí¾÷
  if SetSys.ReadString('SYSTEM','BARCODEPRINTNAME','') <> '' then
  begin
    reg := TRegistry.Create;
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Microsoft\Windows NT\CurrentVersion\Windows\', true) then
    begin
      defPrint := reg.ReadString('Device');
      for i := 0 to printer.Printers.Count -1 do
      begin
        if UpperCase(printer.Printers.Strings[i]) = UpperCase(SetSys.ReadString('SYSTEM','BARCODEPRINTNAME','')) then
        begin
          reg.DeleteKey('Device');
          reg.WriteString('Device',printer.Printers.Strings[i]+',winspool,Ne02:');
          checkprint := 'Y';
        end;
      end;
    end;

    if checkprint = 'Y' then
    begin
      QuickRep2.Print;
      reg.DeleteKey('Device');
      reg.WriteString('Device',DefPrint);
    end;
    
    reg.CloseKey;
    reg.Free;
  end;

  Self.Close;
end;

procedure TFrmBarCodePrint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
end;

procedure TFrmBarCodePrint.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmBarCodePrint := nil;
end;

end.
