unit PrintCeificate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, QRCtrls, QuickRpt, ExtCtrls, ComCtrls, XPMan;

type
  TFrmPrintCericifate = class(TFrmMain)
    QuickRep1: TQuickRep;
    SummaryBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape12: TQRShape;
    QRLName: TQRLabel;
    QRLSex: TQRLabel;
    QRLJob: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape13: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLBirthplace: TQRLabel;
    QrlBirthdate: TQRLabel;
    QrlAge: TQRLabel;
    QRLIdno: TQRLabel;
    QRLAddress: TQRLabel;
    QRLDept: TQRLabel;
    QRLCHR: TQRLabel;
    QRLBDate: TQRLabel;
    QRLEDate: TQRLabel;
    QRLdays: TQRLabel;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QrlRocDate: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLEngDate: TQRLabel;
    procedure QRLabel31Print(sender: TObject; var Value: String);
    procedure QRLabel33Print(sender: TObject; var Value: String);
    procedure QRLabel34Print(sender: TObject; var Value: String);
    procedure QRLabel32Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrintCericifate: TFrmPrintCericifate;

implementation

uses Global;

{$R *.dfm}

procedure TFrmPrintCericifate.QRLabel31Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := SetSys.ReadString('SYSTEM','HOSPTAILNAME','');
end;

procedure TFrmPrintCericifate.QRLabel33Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := SetSys.ReadString('SYSTEM','HOSPTAILADDR','');
end;

procedure TFrmPrintCericifate.QRLabel34Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := SetSys.ReadString('SYSTEM','EHOSPTAILADDR','');
end;

procedure TFrmPrintCericifate.QRLabel32Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := SetSys.ReadString('SYSTEM','EHOSPTAILNAME','');
end;

end.
