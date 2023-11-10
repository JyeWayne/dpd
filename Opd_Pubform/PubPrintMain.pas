unit PubPrintMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   QRPrntr, StdCtrls, Buttons, ComCtrls, ExtCtrls, QRExport, 
  XPMan, Main,Printers,Registry;

type
  TQREvenPreviewInterface = class(TQRPreviewInterface)
  public
    //HasPrint : Boolean;
    function Show(AQRPrinter : TQRPrinter): TWinControl; override;
    function ShowModal(AQRPrinter : TQRPrinter): TWinControl; override;
  end;
  TFrmPubPrintMain = class(TFrmMain)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    QRPreview1: TQRPreview;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialog1: TPrintDialog;
    SaveDialog1: TSaveDialog;
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fQRPrinter : TQRPrinter;

  public
    { Public declarations }

    procedure ShowPreview(Sender: TObject);
    constructor CreatePreview(AOwner : TComponent; aQRPrinter : TQRPrinter);
    constructor Create(AOwner : TComponent;
                      AQRPrinter : TQRPrinter); virtual;
  end;

var
  FrmPubPrintMain: TFrmPubPrintMain;
  HasPrint : Boolean;
  PrintForm : String;
  ShowPrint : Boolean;
implementation

{$R *.DFM}

procedure TFrmPubPrintMain.BitBtn9Click(Sender: TObject);
begin
  inherited;
//  if PrintDialog1.Execute then
  HasPrint := True;
  if PrintForm='ORDER' then
  begin
    if MessageDlg('是否需要列印 [A4] 醫囑單? '+#13#10+'[Yes] 列印, [No] 不列印', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
      QRPreview1.QRPrinter.Print;
  end
  else
    QRPreview1.QRPrinter.Print;
  close;
end;

procedure TFrmPubPrintMain.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if QRPreview1.PageNumber > 1 then
    QRPreview1.PageNumber:=QRPreview1.PageNumber-1;
end;

procedure TFrmPubPrintMain.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if QRPreview1.PageNumber < fQRPrinter.PageCount  then
    QRPreview1.PageNumber:=QRPreview1.PageNumber+1;
end;

constructor TFrmPubPrintMain.Create(AOwner: TComponent;
  AQRPrinter: TQRPrinter);
begin
inherited Create(AOwner);
  fQRPrinter := AQRPrinter;
  QRPreview1.QRPrinter := AQRPrinter;
end;

constructor TFrmPubPrintMain.CreatePreview(AOwner: TComponent;
  aQRPrinter: TQRPrinter);
begin
  inherited Create(AOwner);
  fQRPrinter := aQRPrinter;
  QRPreview1.QRPrinter := aQRPrinter;
  QRPreview1.ZoomToWidth;
end;

procedure TFrmPubPrintMain.ShowPreview(Sender: TObject);
begin
  FrmPubPrintMain.ShowModal;
  
end;

{ TQREvenPreviewInterface }

function TQREvenPreviewInterface.Show(AQRPrinter: TQRPrinter): TWinControl;
var
  frm : TFrmPubPrintMain;
begin
  frm := TFrmPubPrintMain.Create(Application, AQRPrinter);
  HasPrint := False;
  frm.Show;
  if ShowPrint then
    Frm.BitBtn7Click(Frm.bitbtn7);
  Result := frm;

end;

function TQREvenPreviewInterface.ShowModal(
  AQRPrinter: TQRPrinter): TWinControl;
var
 frm : TFrmPubPrintMain;
begin
  frm := TFrmPubPrintMain.Create(Application, AQRPrinter);
  HasPrint := False;
  frm.ShowModal;
  if ShowPrint then
    Frm.BitBtn7Click(Frm.bitbtn7);
  Result := frm;

end;

procedure TFrmPubPrintMain.BitBtn7Click(Sender: TObject);
var
  reg: TRegistry;
begin
  inherited;
  if PrintDialog1.Execute then
  begin
    fQRPrinter.PrinterIndex  :=  printer.PrinterIndex ;
    reg := TRegistry.Create;
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Microsoft\Windows NT\CurrentVersion\Windows\', true) then
    begin
      reg.DeleteKey('Device');
      reg.WriteString('Device',printer.Printers.Strings[printer.PrinterIndex]+',winspool,Ne02:');
    end;
    Reg.CloseKey;
    Reg.Free;
  end;
  //PrinterSetupDialog1.
end;

procedure TFrmPubPrintMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := Cafree;
end;

procedure TFrmPubPrintMain.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmPubPrintMain := nil;
end;

procedure TFrmPubPrintMain.BitBtn10Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmPubPrintMain.BitBtn2Click(Sender: TObject);
begin
  inherited;
  QRPreview1.ZoomToWidth;
end;

procedure TFrmPubPrintMain.BitBtn1Click(Sender: TObject);
begin
  inherited;
  QRPreview1.ZoomToFit;
end;

procedure TFrmPubPrintMain.BitBtn8Click(Sender: TObject);
begin
  inherited;
  If SaveDialog1.Execute then
  begin
    HasPrint := True;
    if SaveDialog1.FilterIndex = 1 then
      QRPreview1.QRPrinter.ExportToFilter(TQRAsciiExportFilter.Create(SaveDialog1.FileName+'.txt'))
    else
      QRPreview1.QRPrinter.ExportToFilter(TQRCommaSeparatedFilter.Create(SaveDialog1.FileName+'.csv'))
  end;
end;

procedure TFrmPubPrintMain.FormCreate(Sender: TObject);
begin
  inherited;
  HasPrint := False;
end;

end.
