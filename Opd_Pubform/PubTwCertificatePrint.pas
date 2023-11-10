unit PubTwCertificatePrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, QRCtrls, QuickRpt, ExtCtrls, ComCtrls, XPMan;

type
  TFrmPubTwCertificatePrint = class(TFrmMain)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape13: TQRShape;
    procedure QRLabel33Print(sender: TObject; var Value: String);
    procedure QRLabel32Print(sender: TObject; var Value: String);
    procedure QRLabel41Print(sender: TObject; var Value: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPubTwCertificatePrint: TFrmPubTwCertificatePrint;

implementation

uses Global;

{$R *.dfm}

procedure TFrmPubTwCertificatePrint.QRLabel33Print(sender: TObject; var Value: String);
begin
  inherited;
  Value := '院址 : '+SetSys.ReadString('SYSTEM','HOSPTAILADDR','');
end;

procedure TFrmPubTwCertificatePrint.QRLabel32Print(sender: TObject; var Value: String);
begin
  inherited;
  Value := SetSys.ReadString('SYSTEM','FULLHOSPAILNAME','');
end;

procedure TFrmPubTwCertificatePrint.QRLabel41Print(sender: TObject; var Value: String);
begin
  inherited;
  //臺北醫學大學 ˙ 市立萬芳醫院
  value := SetSys.ReadString('SYSTEM','HOSPTAILNAME','')+'    備註：無身分證字號或本院院章者無效';
end;

procedure TFrmPubTwCertificatePrint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
end;

procedure TFrmPubTwCertificatePrint.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmPubTwCertificatePrint := nil;
end;

end.
