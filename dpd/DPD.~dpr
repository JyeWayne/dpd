program DPD;

uses
  ShareMem,
  Forms,
  MyUser in '..\Opd_Pubform\MyUser.pas',
  Commfunc in '..\Opd_Pubform\Commfunc.pas',
  DBDM in '..\Opd_Pubform\DBDM.pas' {DM: TDataModule},
  Global in '..\Opd_Pubform\Global.pas',
  Main in '..\Opd_Pubform\Main.pas' {FrmMain},
  PatList in 'PatList.pas' {FrmPatList},
  Login in 'Login.pas' {FrmLogin},
  Order in 'Order.pas' {FrmOrder},
  Maintain in 'Maintain.pas' {FrmMaintain},
  SqlCenter in 'SqlCenter.pas',
  frm_calenderUnit1 in 'frm_calenderUnit1.pas' {frm_calendar},
  DPDFunc in 'DPDFunc.pas',
  PKG in 'PKG.pas' {FrmPKG},
  OftemMed in 'OftemMed.pas' {FrmOftemMed},
  UsePkg in 'UsePkg.pas' {FrmUsePkg},
  LabOrder in 'LabOrder.pas' {FrmLabOrder},
  ChkOrder in 'ChkOrder.pas' {FrmChkOrder},
  XRayOrder in 'XRayOrder.pas' {FrmXRayOrder},
  OldOrderList in '..\Opd_Pubform\OldOrderList.pas' {FrmOldOrderList},
  warning in 'warning.pas' {FrmWarning},
  FeeOrder in 'FeeOrder.pas' {FrmFeeOrder},
  Ditto in 'Ditto.pas' {FrmDitto},
  DPDThread in 'DPDThread.pas',
  ICFunction in 'ICFunction.pas',
  ic_information_unit in '..\Opd_Pubform\ic_information_unit.pas' {IC_information_frm},
  Chdate in '..\Opd_Pubform\Chdate.pas',
  PatInf in '..\Opd_Pubform\PatInf.pas' {FrmPatInf},
  DNRList in '..\Opd_Pubform\DNRList.pas' {FrmPubDNRList},
  HosPiceList in '..\Opd_Pubform\HosPiceList.pas' {FrmHosPiceList},
  IPDCertificate in '..\Opd_Pubform\IPDCertificate.pas' {FrmIPDCertificate},
  IPDCertificatePkg in '..\Opd_Pubform\IPDCertificatePkg.pas' {FrmIPDCertificatePkg},
  PubEngCertificatePrint in '..\Opd_Pubform\PubEngCertificatePrint.pas' {FrmPubEngCertificatePrint: TQuickRep},
  PubPrintMain in '..\Opd_Pubform\PubPrintMain.pas' {FrmPubPrintMain},
  PubTwCertificatePrint in '..\Opd_Pubform\PubTwCertificatePrint.pas' {FrmPubTwCertificatePrint},
  ChrEstimate in 'ChrEstimate.pas' {FrmChrEstimate},
  Pain in '..\Opd_Pubform\Pain.pas' {FrmPain},
  Spec in '..\Opd_Pubform\Spec.pas' {FrmSpec},
  TtlAmt in 'TtlAmt.pas' {FrmTtlAmt},
  LagReport in 'LagReport.pas' {FrmLagReport},
  OftenIcd in 'OftenIcd.pas' {FrmOftenIcd},
  PrintCeificate in '..\Opd_Pubform\PrintCeificate.pas' {FrmPrintCericifate},
  FrmIC_Insert_InFo in 'FrmIC_Insert_InFo.pas' {IC_Insert_InFo},
  QR_RegLst in 'QR_RegLst.pas' {FrmQR_RegLst: TQuickRep},
  DittoDate in 'DittoDate.pas' {FrmDittoDate},
  DPDXray in 'DPDXray.pas' {FrmDPDXray},
  NowUsedMed in 'NowUsedMed.pas' {FrmNowUsedMed},
  warningdesc in 'warningdesc.pas' {FrmWarningdesc},
  IPDDupMed in 'IPDDupMed.pas' {FrmIPDDupMed},
  CloudDrug in 'CloudDrug.pas' {FrmCloudDrug},
  BarCodePrint in 'BarCodePrint.pas' {FrmBarCodePrint};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TIC_Insert_InFo, IC_Insert_InFo);
  Application.CreateForm(TFrmWarningdesc, FrmWarningdesc);
  Application.CreateForm(TFrmIPDDupMed, FrmIPDDupMed);
  Application.CreateForm(TFrmBarCodePrint, FrmBarCodePrint);
  Application.Run;
end.
