//2022-05-03 開立四線抗生素時，增加檢查共照醫師，過敏史在Sulfonamide類修改加上COX-2 inhibitor(02021000)
//2022-05-03 連結SDM服務建立完成，帶回批價碼寫入畫面處置。
//2022-06-XX 藥跌註記。
//2022-08-30 F00306C 給付 4, F00315C 給付 431, F00316C 給付 432, F00316C 給付 433,  轉案件類別 為 19 。
//2022-09-14 其他功能->同意書按鈕連結，使用 Chrome。
//2022-09-14 原溝隙封填年紀，由9歲放寬至12歲。
//2022-10-26 藥品的提示。
unit Order;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, ExtCtrls, ComCtrls, StdCtrls, jpeg, ToolWin, Grids, Math,
  HgHGrid, HgGrid, DBCtrls, dbcgrids, Mask, Buttons, DB, ADODB, Contnrs,
  Menus, XPMan, ImgList, ShellAPI, xmldom, XMLIntf, msxmldom,
  XMLDoc, DBGrids;

type
  TFrmOrder = class(TFrmMain)
    Panel1: TPanel;
    Gpb_Base_Data: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label208: TLabel;
    Chr1: TEdit;
    Pat_Name1: TEdit;
    Sex_Type1: TEdit;
    Age1: TEdit;
    Pat_Id1: TComboBox;
    Panel2: TPanel;
    Label22: TLabel;
    Label31: TLabel;
    Label27: TLabel;
    card_no1: TEdit;
    OPD_Date1: TEdit;
    Dept_R1: TEdit;
    Panel3: TPanel;
    Label21: TLabel;
    Label1: TLabel;
    Label28: TLabel;
    DOC_N1: TEdit;
    Doc_N2: TComboBox;
    Doc_N3: TComboBox;
    Panel4: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet1: TTabSheet;
    TabSheet7: TTabSheet;
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton51: TToolButton;
    ToolButton3: TToolButton;
    ToolButton52: TToolButton;
    ToolButton4: TToolButton;
    ToolButton53: TToolButton;
    ToolButton5: TToolButton;
    ToolButton55: TToolButton;
    ToolButton7: TToolButton;
    ToolButton56: TToolButton;
    ToolButton83: TToolButton;
    ToolButton80: TToolButton;
    ToolButton9: TToolButton;
    ToolButton1: TToolButton;
    CoolBar3: TCoolBar;
    ToolBar3: TToolBar;
    ToolButton17: TToolButton;
    ToolButton59: TToolButton;
    ToolButton28: TToolButton;
    ToolButton27: TToolButton;
    ToolButton18: TToolButton;
    ToolButton61: TToolButton;
    ToolButton19: TToolButton;
    ToolButton58: TToolButton;
    ToolButton23: TToolButton;
    CoolBar4: TCoolBar;
    ToolBar4: TToolBar;
    ToolButton20: TToolButton;
    ToolButton66: TToolButton;
    ToolButton21: TToolButton;
    ToolButton65: TToolButton;
    ToolButton22: TToolButton;
    ToolButton67: TToolButton;
    ToolButton24: TToolButton;
    ToolButton69: TToolButton;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    CoolBar5: TCoolBar;
    ToolBar5: TToolBar;
    ToolButton35: TToolButton;
    ToolButton75: TToolButton;
    ToolButton37: TToolButton;
    ToolButton92: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton29: TToolButton;
    ToolButton33: TToolButton;
    ToolButton38: TToolButton;
    ToolButton39: TToolButton;
    TabSheet3: TTabSheet;
    CoolBar6: TCoolBar;
    ToolBar6: TToolBar;
    ToolButton41: TToolButton;
    ToolButton43: TToolButton;
    PanelOrder: TPanel;
    PanelShow: TPanel;
    Pgc_P: TPageControl;
    TabLab: TTabSheet;
    TabXRay: TTabSheet;
    TabMtrl: TTabSheet;
    TabChk: TTabSheet;
    fee_tabst: TTabSheet;
    Pgc_SOA: TPageControl;
    S_Tabst: TTabSheet;
    HisFee_Tabst: TTabSheet;
    Panel29: TPanel;
    Label30: TLabel;
    msk_beg_day: TMaskEdit;
    BegDay: TSpeedButton;
    Label33: TLabel;
    msk_end_day: TMaskEdit;
    EndDay: TSpeedButton;
    btn_OK: TButton;
    DB_CG_Fee_His: TDBCtrlGrid;
    DBT_Date: TDBText;
    Label35: TLabel;
    DBT_Fee_Code: TDBText;
    DBT_Ins_Fee_Code: TDBText;
    DBT_Fee_Desc: TDBText;
    Label41: TLabel;
    DBT_INS_SEQ_NO: TDBText;
    DBE_Position: TDBEdit;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton15: TToolButton;
    BtnFinish: TButton;
    BtnSave: TButton;
    BtnICInfo: TButton;
    BtnBack: TButton;
    BtnIdl: TButton;
    BtnICBack: TButton;
    Panel30: TPanel;
    BtnLabOpen: TButton;
    BtnLabRePrint: TButton;
    BtnLabSign: TButton;
    Panel31: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    BtnXRayOpen: TButton;
    BtnXRayRePrint: TButton;
    BtnXRaySign: TButton;
    Panel9: TPanel;
    Panel34: TPanel;
    Panel11: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    BtnChkOpen: TButton;
    BtnChkRePrint: TButton;
    BtnChkSign: TButton;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    SGLab: TStringGrid;
    SGMtrl: TStringGrid;
    SGChk: TStringGrid;
    SGFee: TStringGrid;
    SGMed: TStringGrid;
    BtnChkNonSign: TButton;
    BtnXRayNonSign: TButton;
    BtnLabNonSign: TButton;
    PanelFeePart: TPanel;
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    PanelLab: TPanel;
    DBCLab: TDBCtrlGrid;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    Panel39: TPanel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    BtnLDel: TBitBtn;
    BtnLCode: TBitBtn;
    BtnLOrder: TBitBtn;
    BtnLDose: TBitBtn;
    BtnLUnit: TBitBtn;
    BtnLCir: TBitBtn;
    BtnLPath: TBitBtn;
    btnLIns: TBitBtn;
    BtnLEMG: TBitBtn;
    BtnLMemo: TBitBtn;
    DSLab: TDataSource;
    BtnRCode: TBitBtn;
    BtnRDel: TBitBtn;
    BtnROrder: TBitBtn;
    BtnRDose: TBitBtn;
    BtnRUnit: TBitBtn;
    BtnRCir: TBitBtn;
    BtnRPath: TBitBtn;
    btnRIns: TBitBtn;
    BtnREMG: TBitBtn;
    BtnRMemo: TBitBtn;
    DSRay: TDataSource;
    PanelRay: TPanel;
    Panel6: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    DBCRay: TDBCtrlGrid;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText18: TDBText;
    PanelRadioCount: TPanel;
    Shape2: TShape;
    Label37: TLabel;
    Shape3: TShape;
    Label38: TLabel;
    Shape6: TShape;
    Shape7: TShape;
    Label39: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    EdtMsv: TEdit;
    EdtRisk: TEdit;
    EdtNewmsv: TEdit;
    EdtnewRisk: TEdit;
    EdtAllmsv: TEdit;
    EdtallRisk: TEdit;
    EdtSumMsv: TEdit;
    EdtSumRisk: TEdit;
    BtnCDel: TBitBtn;
    BtnCCode: TBitBtn;
    BtnCOrder: TBitBtn;
    BtnCDose: TBitBtn;
    BtnCUnit: TBitBtn;
    BtnCCir: TBitBtn;
    BtnCPath: TBitBtn;
    btnCIns: TBitBtn;
    BtnCEMG: TBitBtn;
    BtnCMemo: TBitBtn;
    PanelCHK: TPanel;
    Panel40: TPanel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    DBCCHK: TDBCtrlGrid;
    DBText19: TDBText;
    DBText21: TDBText;
    DBText22: TDBText;
    DBText23: TDBText;
    DBText24: TDBText;
    DSCHK: TDataSource;
    EdtLMemo: TEdit;
    BtnDel: TBitBtn;
    BtnCode: TBitBtn;
    BtnOrder: TBitBtn;
    BtnDose: TBitBtn;
    BtnUnit: TBitBtn;
    BtnCir: TBitBtn;
    BtnPath: TBitBtn;
    BtnIns: TBitBtn;
    BtnMemo: TBitBtn;
    BtnDay: TBitBtn;
    BtnTtl: TBitBtn;
    PanelMed: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBMemo1: TDBMemo;
    DsMed: TDataSource;
    EdtRMemo: TEdit;
    EdtCMemo: TEdit;
    CbbLOrderYN: TComboBox;
    CbbROrderYN: TComboBox;
    CbbCOrderYN: TComboBox;
    EdtOrderEdit: TEdit;
    CbbOrderYN: TComboBox;
    EdtLCir: TEdit;
    LBCir: TListBox;
    LBRCir: TListBox;
    EdtRCir: TEdit;
    LBCCir: TListBox;
    EdtCCir: TEdit;
    EdtCir: TEdit;
    PanelSOHP: TPanel;
    PanelS: TPanel;
    Panel17: TPanel;
    Panel21: TPanel;
    Label4: TLabel;
    MemoS: TMemo;
    Panel18: TPanel;
    Label13: TLabel;
    Label16: TLabel;
    PanelO: TPanel;
    Panel26: TPanel;
    Label17: TLabel;
    Panel27: TPanel;
    Panel28: TPanel;
    Label9: TLabel;
    MemoO: TMemo;
    PanelP: TPanel;
    Panel23: TPanel;
    Label18: TLabel;
    Panel24: TPanel;
    Panel25: TPanel;
    Label8: TLabel;
    MemoP: TMemo;
    PanelH: TPanel;
    Panel19: TPanel;
    Label25: TLabel;
    Panel20: TPanel;
    Panel22: TPanel;
    Label7: TLabel;
    MemoH: TMemo;
    PanelIcd: TPanel;
    pnlIcd: TPanel;
    DBCIcd: TDBCtrlGrid;
    DBText20: TDBText;
    DBText25: TDBText;
    DBText26: TDBText;
    pnlIcdT: TPanel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    PnlPart: TPanel;
    DSIcd: TDataSource;
    DSMtrl: TDataSource;
    DSFee: TDataSource;
    SGIcd: TStringGrid;
    BtnFIns: TBitBtn;
    BtnFQty: TBitBtn;
    BtnFpart: TBitBtn;
    BtnFName: TBitBtn;
    BtnFCode: TBitBtn;
    BtnFDel: TBitBtn;
    BtnFMemo: TBitBtn;
    pnlfee: TPanel;
    pnlFeeT: TPanel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    DBCFee: TDBCtrlGrid;
    DBText27: TDBText;
    DBText28: TDBText;
    DBText29: TDBText;
    DBText30: TDBText;
    DBText31: TDBText;
    CbbFeeYN: TComboBox;
    EdtFMemo: TEdit;
    BtnODel: TBitBtn;
    BtnOCode: TBitBtn;
    BtnOName: TBitBtn;
    BtnOpart: TBitBtn;
    BtnOQty: TBitBtn;
    BtnOIns: TBitBtn;
    BtnOMemo: TBitBtn;
    CBBMtrlYN: TComboBox;
    pnlmtrl: TPanel;
    pnlMtrlT: TPanel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    DBCMtrl: TDBCtrlGrid;
    DBText32: TDBText;
    DBText33: TDBText;
    DBText34: TDBText;
    DBText35: TDBText;
    DBText36: TDBText;
    EdtOMemo: TEdit;
    Grp_Part: TGroupBox;
    Splitter1: TSplitter;
    d11: TImage;
    d12: TImage;
    d41: TImage;
    d44: TImage;
    d42: TImage;
    d43: TImage;
    d48: TImage;
    d46: TImage;
    d45: TImage;
    d18: TImage;
    d17: TImage;
    d16: TImage;
    d15: TImage;
    d14: TImage;
    d51: TImage;
    d52: TImage;
    d53: TImage;
    d54: TImage;
    d55: TImage;
    d85: TImage;
    d84: TImage;
    d82: TImage;
    d83: TImage;
    d81: TImage;
    d22: TImage;
    d21: TImage;
    d31: TImage;
    d32: TImage;
    d33: TImage;
    d23: TImage;
    d24: TImage;
    d34: TImage;
    d35: TImage;
    d25: TImage;
    d36: TImage;
    d26: TImage;
    d27: TImage;
    d37: TImage;
    d38: TImage;
    d28: TImage;
    d71: TImage;
    d72: TImage;
    d74: TImage;
    d73: TImage;
    d75: TImage;
    d61: TImage;
    d62: TImage;
    d64: TImage;
    d63: TImage;
    d65: TImage;
    d13: TImage;
    d47: TImage;
    a11: TImage;
    a12: TImage;
    a13: TImage;
    a14: TImage;
    a15: TImage;
    a16: TImage;
    a17: TImage;
    a18: TImage;
    a51: TImage;
    a52: TImage;
    a53: TImage;
    a54: TImage;
    a55: TImage;
    a21: TImage;
    a22: TImage;
    a23: TImage;
    a24: TImage;
    a25: TImage;
    a26: TImage;
    a27: TImage;
    a28: TImage;
    a61: TImage;
    a62: TImage;
    a63: TImage;
    a64: TImage;
    a65: TImage;
    a31: TImage;
    a32: TImage;
    a33: TImage;
    a34: TImage;
    a35: TImage;
    a36: TImage;
    a37: TImage;
    a38: TImage;
    a71: TImage;
    a72: TImage;
    a73: TImage;
    a74: TImage;
    a75: TImage;
    a41: TImage;
    a42: TImage;
    a43: TImage;
    a44: TImage;
    a45: TImage;
    a46: TImage;
    a47: TImage;
    a48: TImage;
    a81: TImage;
    a82: TImage;
    a83: TImage;
    a84: TImage;
    a85: TImage;
    b_91014C: TButton;
    b_00127C: TButton;
    btn_19: TButton;
    btn_29: TButton;
    btn_39: TButton;
    btn_49: TButton;
    btn_ur: TButton;
    btn_ul: TButton;
    btn_la: TButton;
    btn_lb: TButton;
    btn_ua: TButton;
    btn_ub: TButton;
    btn_fm: TButton;
    btn_ll: TButton;
    btn_lr: TButton;
    btn_99: TButton;
    btn_cls: TButton;
    ToolButton16: TToolButton;
    ToolButton44: TToolButton;
    PupMenuOften: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ToolButton6: TToolButton;
    ToolButton45: TToolButton;
    QryFeeHis: TADOQuery;
    DSFeeHis: TDataSource;
    AutoRWIC: TCheckBox;
    PnlImgInfo: TPanel;
    ImgSex: TImage;
    ImgSkin: TImage;
    ImgTemperature: TImage;
    ImgMed: TImage;
    ImgHRR: TImage;
    ImgDNR: TImage;
    ImageListforPat: TImageList;
    PupMenuReport: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    UniReport1: TMenuItem;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    PupMenuPromulgate: TPopupMenu;
    MenuItem1: TMenuItem;
    PupOtherSys: TPopupMenu;
    N7: TMenuItem;
    Label70: TLabel;
    Label71: TLabel;
    Weight: TEdit;
    Part_Code1: TEdit;
    Case_Type1: TEdit;
    Pay_Type: TEdit;
    PCPLstBox: TListBox;
    DOC_NAME: TDBText;
    Label72: TLabel;
    PnlAmt: TPanel;
    Pup00127: TPopupMenu;
    F01271C: TMenuItem;
    F01272C: TMenuItem;
    F01273C: TMenuItem;
    ToolButton14: TToolButton;
    ToolButton34: TToolButton;
    ToolButton36: TToolButton;
    ToolButton40: TToolButton;
    BtnTtlAmt: TButton;
    LBMed2: TListBox;
    Case_Code: TEdit;
    Label73: TLabel;
    N8: TMenuItem;
    ToolButton46: TToolButton;
    ToolButton47: TToolButton;
    N9: TMenuItem;
    PupMedQ: TPopupMenu;
    N10: TMenuItem;
    BtnCnlIdl: TButton;
    ToolButton48: TToolButton;
    SGXRay: TStringGrid;
    ICSEQ_PB: TProgressBar;
    ICSEQ_Lbl: TLabel;
    BtnICGet: TButton;
    BtnAC95: TButton;
    Timer1: TTimer;
    DBCGMed: TDBCtrlGrid;
    Bevel1: TBevel;
    DBText2: TDBText;
    DBText1: TDBText;
    DBText3: TDBText;
    DBText37: TDBText;
    ToolButton49: TToolButton;
    Label52: TLabel;
    card_no2: TEdit;
    Label75: TLabel;
    cnt: TEdit;
    Label76: TLabel;
    year: TEdit;
    ChkIdl: TCheckBox;
    SpH: TSplitter;
    SpS: TSplitter;
    Splitter2: TSplitter;
    PnlShow: TPanel;
    LblShow: TLabel;
    Shape4: TShape;
    Button4: TButton;
    Timer3: TTimer;
    BtnChangeHospCode: TButton;
    XmlFile: TXMLDocument;
    ToolButton50: TToolButton;
    ToolButton42: TToolButton;
    MICROMEDEX1: TMenuItem;
    Clineguide1: TMenuItem;
    PnlDiag: TPanel;
    Shape1: TShape;
    Button1: TButton;
    DGDiag: TDBGrid;
    DSDiag: TDataSource;
    LblDiag: TLabel;
    ToolButton54: TToolButton;
    ToolButton57: TToolButton;
    TabSheet6: TTabSheet;
    SGPath: TStringGrid;
    Panel5: TPanel;
    BtnpthCode: TBitBtn;
    BtnpthOrder: TBitBtn;
    BtnpthDose: TBitBtn;
    btnpthIns: TBitBtn;
    BtnpthMemo: TBitBtn;
    BtnpthDel: TBitBtn;
    BtnpthSeq: TBitBtn;
    BtnpthModity: TBitBtn;
    BitBtn1: TBitBtn;
    ChBReadCloud: TCheckBox;
    ImgBoold: TImage;
    ImgMDRO: TImage;
    DBImage1: TDBImage;
    DtSImage: TDataSource;
    ToolButton60: TToolButton;
    ToolButton62: TToolButton;
    TabSheet8: TTabSheet;
    SGIcd10: TStringGrid;
    DSICD10: TDataSource;
    PnlICD10: TPanel;
    DBCICD10: TDBCtrlGrid;
    DBText38: TDBText;
    DBText39: TDBText;
    DBText40: TDBText;
    Panel14: TPanel;
    Label69: TLabel;
    Label74: TLabel;
    Label77: TLabel;
    ToolButton63: TToolButton;
    ToolButton64: TToolButton;
    PopCancer: TPopupMenu;
    ToolButton68: TToolButton;
    ToolButton70: TToolButton;
    ImgB01A: TImage;
    ToolButton72: TToolButton;
    ToolButton73: TToolButton;
    ToolButton74: TToolButton;
    ToolButton76: TToolButton;
    ImgMedFall: TImage;
    imgCovidInq: TImage;
    Button3: TButton;
    Button2: TButton;
    ToolButton71: TToolButton;
    ToolButton77: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure SGLabKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Pgc_PChange(Sender: TObject);
    procedure SGLabKeyPress(Sender: TObject; var Key: Char);
    procedure SGLabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGLabSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DBText7Click(Sender: TObject);
    procedure SGXRayKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGXRayKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGXRaySelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DBText13Click(Sender: TObject);
    procedure SGChkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGChkKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGChkSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DBText19Click(Sender: TObject);
    procedure SGMedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGMedKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGMedSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DBText1Click(Sender: TObject);
    procedure BtnLabOpenClick(Sender: TObject);
    procedure Doc_N2Change(Sender: TObject);
    procedure Doc_N3Change(Sender: TObject);
    procedure BtnXRayOpenClick(Sender: TObject);
    procedure BtnChkOpenClick(Sender: TObject);
    procedure CbbLOrderYNExit(Sender: TObject);
    procedure EdtLMemoExit(Sender: TObject);
    procedure SGLabDblClick(Sender: TObject);
    procedure SGLabDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGXRayDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGChkDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGMedDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure LBCirDblClick(Sender: TObject);
    procedure LBRCirDblClick(Sender: TObject);
    procedure LBCCirDblClick(Sender: TObject);
    procedure LBMed2DblClick(Sender: TObject);
    procedure MemoSDblClick(Sender: TObject);
    procedure SGICDEnter(Sender: TObject);
    procedure SGICDDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGICDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGICDKeyPress(Sender: TObject; var Key: Char);
    procedure SGICDKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBText20Click(Sender: TObject);
    procedure SGICDSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGIcdDblClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure SGFeeSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGFeeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGFeeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBText27Click(Sender: TObject);
    procedure CbbFeeYNExit(Sender: TObject);
    procedure EdtFMemoExit(Sender: TObject);
    procedure SGMtrlKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGMtrlKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGMtrlSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DBText32Click(Sender: TObject);
    procedure BtnFinishClick(Sender: TObject);
    procedure SGFeeDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGMtrlDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure d11Click(Sender: TObject);
    procedure btn_fmClick(Sender: TObject);
    procedure b_91014CClick(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ToolButton41Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton45Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton29Click(Sender: TObject);
    procedure BegDayClick(Sender: TObject);
    procedure EndDayClick(Sender: TObject);
    procedure BtnIdlClick(Sender: TObject);
    procedure Pat_Id1Click(Sender: TObject);
    procedure Case_Type1_Click(Sender: TObject);
    procedure Part_Code1_Click(Sender: TObject);
    procedure Doc_N2Click(Sender: TObject);
    procedure Doc_N3Click(Sender: TObject);
    procedure SGFeeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton23Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure ToolButton22Click(Sender: TObject);
    procedure ToolButton24Click(Sender: TObject);
    procedure BtnICInfoClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure SGIcdMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SGIcdDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure SGIcdDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ToolButton44Click(Sender: TObject);
    procedure ToolButton28Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure Part_Code1Click(Sender: TObject);
    procedure PCPLstBoxClick(Sender: TObject);
    procedure Part_Code1KeyPress(Sender: TObject; var Key: Char);
    procedure b_00127CClick(Sender: TObject);
    procedure F01271CClick(Sender: TObject);
    procedure ToolButton34Click(Sender: TObject);
    procedure Part_Code1DblClick(Sender: TObject);
    procedure ToolButton40Click(Sender: TObject);
    procedure BtnTtlAmtClick(Sender: TObject);
    procedure BtnICBackClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure ToolButton47Click(Sender: TObject);
    procedure EdtCirChange(Sender: TObject);
    procedure EdtCirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCirExit(Sender: TObject);
    procedure EdtLCirChange(Sender: TObject);
    procedure EdtLCirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtLCirExit(Sender: TObject);
    procedure EdtRCirChange(Sender: TObject);
    procedure EdtRCirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtRCirExit(Sender: TObject);
    procedure EdtCCirChange(Sender: TObject);
    procedure EdtCCirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCCirExit(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure ToolButton83Click(Sender: TObject);
    procedure ToolButton25Click(Sender: TObject);
    procedure ToolButton35Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnDoseClick(Sender: TObject);
    procedure BtnCirClick(Sender: TObject);
    procedure BtnDayClick(Sender: TObject);
    procedure SGMedMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Pay_TypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGChkEnter(Sender: TObject);
    procedure SGMtrlEnter(Sender: TObject);
    procedure SGXRayEnter(Sender: TObject);
    procedure SGLabEnter(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure BtnCnlIdlClick(Sender: TObject);
    procedure BtnICGetClick(Sender: TObject);
    procedure BtnAC95Click(Sender: TObject);
    procedure ToolButton49Click(Sender: TObject);
    procedure card_no1Change(Sender: TObject);
    procedure SpHCanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure SpSCanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure Splitter2CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure MemoHChange(Sender: TObject);
    procedure MemoSChange(Sender: TObject);
    procedure MemoOChange(Sender: TObject);
    procedure MemoPChange(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SGLabMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure MyItemsForLinkClick(Sender: TObject);
    procedure Case_Type1Change(Sender: TObject);
    procedure DGDiagCellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure DGDiagDblClick(Sender: TObject);
    procedure ToolButton54Click(Sender: TObject);
    procedure SGPathDblClick(Sender: TObject);
    procedure SGPathDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SGIcdExit(Sender: TObject);
    procedure ChBReadCloudClick(Sender: TObject);
    procedure DBText38Click(Sender: TObject);
    procedure DSIcdDataChange(Sender: TObject; Field: TField);
    procedure ToolButton63Click(Sender: TObject);
    procedure MyItemsForSysClick(Sender: TObject);
    procedure BtnChangeHospCodeClick(Sender: TObject);
    procedure ImgB01AClick(Sender: TObject);
    procedure imgCovidInqClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ToolButton71Click(Sender: TObject);//自訂click
  private
    { Private declarations }
    SourceCol, SourceRow: Integer;
    DefaultType, DefaultTextType: string;
    PreOrderType, ins_ctrl: string;
    GetICType: Integer;
    FeeRow, ms, giFscr: Integer;
    isGetExecute, choosesgICD: Boolean;

    procedure SetListWidth1(Sender: TObject; cols: Integer);
    procedure ShowPnlMsg(str: string);
    procedure ShowPnlDiagMsg(str: string);
    procedure PDelay();
    procedure count_s_h_o;

    procedure iniPanelShow;
    procedure LoadOrder(Kind: integer);
    procedure LoadPatInf(Srt, Kind: string);
    procedure ClearItem(Sender: TObject);
    procedure initTextOrderTile;
    procedure SetPanel(Bview: Boolean; Sender: TObject);
    procedure Radionum;
    function isRepeat(fee_code, path, send, send2: string; tmpSG: TStringGrid): Boolean;
    function GetXMl(chk_flag, fee_code, part, cnt: string; row: integer): Boolean;
    function InsertFee(Fee_Code, aParentCode: string): Boolean;
    function InsertXFee(Fee_Code, Qty, Part: string): Boolean;
    function InsertMtrl(Fee_Code, aParentCode: string): Boolean;
    function InsertLab(): Boolean;
    function InsertChk(): Boolean;
    function InsertXRay(): Boolean;
    function SaveOrder(kind: integer; var msgtem:string; Sender: TObject): Boolean;
    function DeathChr(kind: integer; chr_no: string; var msg: string): boolean;
    function ChkIsUrg(fee_code, LabNo: string): boolean;
    function IsICSeqNo(fee_no: string): boolean;
    function ChkQty(tmpSG: TStringGrid; SGitem: string; var msg: string): boolean;
    function ChkLXCOpen(tmpSG: TSTringGrid; kind: integer): boolean;
    procedure insert_ic_treat_temp(baby_kind: string);
    procedure BringChild(fee_code: string);
    procedure CHKCASEPART(SYSType, Code: string);
    procedure BtnLog(BtnText: string);
    procedure chagepat;
    procedure SaveReaction(degree: string; medcode1: string; medcode2: string; kind: string; operno: string);
    procedure SpecMedCheck(Med:String);
    procedure SpecMedbgCheck(Med:String);
    function CheckDupMed: Boolean; //重複用藥
    function MedUseCtrl(i: Integer; var Mes: string): Boolean;//特殊藥品開立權限檢核
    procedure getpathologydata;//病理資料取得
    procedure runclouddrug;//雲端藥歷連結
    function retryclouddrug:Boolean;//雲端藥歷連結再測
    procedure openclouddrug;//雲端藥歷連結開啟
    procedure ICD9_first(icd9code: string);
    //2022-04-07SDM服務傳回值檢查及處理
    function  SelectOrderitemData(sCode: string):string;
    //2022-04-07 檢查SGOrder的Grid中藥物是否有跌倒註記及說明，高跌的分數累計>=6，顯示圖示
    procedure CheckDrugFallScoreOverdose;
    //2022-04-07讀出用藥跌倒分數FALL_SCORE
    function  FallScoreDescription(sCode: string; var sFscr, sRisk: string):boolean;
    //2022-04-07顯示藥跌圖示
    procedure ShowMedicaleFallIcon(i: integer);
    procedure ImgMedFallClick(Sender: TObject);
    //Function  SelectMedFallData(sCode: string; var sExpr: string):integer;
    function  CallStoreProcIPDOPERLOG(sFeno,sChno,sKdno,sClno,sTpno,sCode,sRpmk,sRpxr,sOper,sUpd,sVsdoc,sBedno,sDpno:string;var rtn_msg:string):integer;
  public
    { Public declarations }
    frmshow, sPass : string;
    function InsertMed(Med_code, aCir, aQty, aPath, aTTL, aGri, aDay, aParentCode: string; aRow: integer): Boolean;
    function InsertIcd(Icd_Code: string): Boolean;
    function InsertIcd10(Icd_Code: string): Boolean;
    procedure ComputeAmt(tmpSG: TStringGrid; Pqty, Pcode, Pins: integer);
    procedure fin_get_seq;
    function  SelectIdnoFromChrBasicForChrNo(sChrNo: string):string;
  end;

var
  FrmOrder: TFrmOrder;
  lschangepat : string;
  getChrarea  : string;
  A381, A395, A383, A382, A387, A397, A38A, A38E, A38I, A38M: string;
  UUpddate, UUpdtime : string;

const
  //*****************共    用 *************************//
  modifyType = 0;
  Seq = 1;
  Del = 2;
  //******************藥    品 *************************//
  M_Code = 3;
  M_Order = 4;
  M_Qty = 5;
  M_Unit = 6;
  M_Cir = 7;
  M_path = 8;
  M_day = 9;
  M_Ttl = 10;
  M_INS = 11;
  M_GRI = 12;
  M_Memo = 13;
  M_PackAmt = 14;
  M_Kind = 15;
  M_Order_Seq = 16;
  M_Order_Text = 17;
  M_INS_Flag = 18;
  M_Countflag = 19;
  M_Hint = 20;
  OrderName: array[0..18] of string = ('BtnModity', 'BtnSeq', 'BtnDel', 'BtnCode', 'BtnOrder', 'BtnDose', 'BtnUnit', 'BtnCir', 'BtnPath', 'BtnDay', 'BtnTtl', 'BtnIns', 'BtnGri', 'BtnMemo', 'BtnPackAmt', 'BtnKind', 'BtnOrderSeq', 'BtnOrderText', 'BtnINSFlag');
//******************藥    品 *************************//
//**********************處置
  F_code = 3;
  F_Name = 4;
  F_Part = 5;
  F_Qty = 6;
  F_Ins = 7;
  F_Memo = 8;
  F_Kind = 9;
  F_Order_Seq = 10;
  F_Order_Text = 11;
  F_INS_Flag = 12;
  //F_Hint = 13;
  FOrderName: array[0..12] of string = ('BtnModity', 'BtnSeq', 'BtnFDel', 'BtnFCode', 'BtnFName', 'BtnFpart', 'BtnFQty', 'BtnFIns', 'BtnFMemo', 'BtnFKind', 'BtnFOrderSeq', 'BtnFOrderText', 'BtnFINSFlag');
//***************** 衛材
  O_code = 3;
  O_Name = 4;
  O_Part = 5;
  O_Qty = 6;
  O_Ins = 7;
  O_Memo = 8;
  O_Kind = 9;
  O_Order_Seq = 10;
  O_Order_Text = 11;
  O_INS_Flag = 12;
  OOrderName: array[0..12] of string = ('BtnOModity', 'BtnOSeq', 'BtnODel', 'BtnOCode', 'BtnOName', 'BtnOpart', 'BtnOQty', 'BtnOIns', 'BtnOMemo', 'BtnOKind', 'BtnOOrderSeq', 'BtnOOrderText', 'BtnOINSFlag');
  //****************檢驗檢查放射************************//
  C_Code = 3;
  C_Order = 4;
  C_Qty = 5;
  C_Unit = 6;
  C_Cir = 7;
  C_path = 8; //放射部位 檢驗檢體
  C_INS = 9;
  C_EMG = 10;
  C_MEMO = 11;
  C_NO = 12;
  C_Send = 13; //檢驗組別  檢查室
  C_Kind = 14;
  C_Order_Seq = 15;
  C_2SEnd = 16; //檢驗項目
  C_Order_Status = 17; //簽收
  C_INS_Flag = 18;
  COrderName: array[0..18] of string = ('BtnCModity', 'BtnCSeq', 'BtnCDel', 'BtnCCode', 'BtnCOrder', 'BtnCDose', 'BtnCUnit', 'BtnCCir', 'BtnCPath', 'btnCIns', 'BtnCEMG', 'BtnCMemo', 'BtnCNo', 'BtnCSend', 'BtnCKind', 'BtnCOrderSeq', 'Btn2CSend', 'BtnCOrderStatus', 'BtnCINSFlag');
  LOrderName: array[0..18] of string = ('BtnLModity', 'BtnLSeq', 'BtnLDel', 'BtnLCode', 'BtnLOrder', 'BtnLDose', 'BtnLUnit', 'BtnLCir', 'BtnLPath', 'btnLIns', 'BtnLEMG', 'BtnLMemo', 'BtnLNo', 'BtnLSend', 'BtnLKind', 'BtnLOrderSeq', 'Btn2LSend', 'BtnLOrderStatus', 'BtnLINSFlag');
  ROrderName: array[0..18] of string = ('BtnRModity', 'BtnRSeq', 'BtnRDel', 'BtnRCode', 'BtnROrder', 'BtnRDose', 'BtnRUnit', 'BtnRCir', 'BtnRPath', 'btnRIns', 'BtnREMG', 'BtnRMemo', 'BtnRNo', 'BtnRSend', 'BtnRKind', 'BtnROrderSeq', 'Btn2RSend', 'BtnROrderStatus', 'BtnRINSFlag');
  //**************************病理
  Pth_Code = 3;
  Pth_Order = 4;
  Pth_Qty = 5;
  Pth_item = 6;
  Pth_seqno = 7;
  Pth_seqno2 =8;
  Pth_INS = 9;
  Pth_EMG = 10;
  Pth_MEMO = 11;
  Pth_Kind = 12;
  Pth_CONFSTATUS =13;//回寫的簽收狀態
  pth_no=14;//單號
  pth_seq=15;//醫令對應序號
  pthordername : Array[0..7] of String=('BtnpthModity','BtnpthSeq','BtnpthDel','BtnpthCode','BtnpthOrder','BtnpthDose','btnpthIns','BtnpthMemo');
implementation

uses Global, Commfunc, DBDM, DPDFunc, SqlCenter, PKG, OftemMed, UsePkg,
  LabOrder, ChkOrder, XRayOrder, OldOrderList, warning, FeeOrder, Ditto,
  frm_calenderUnit1, DPDThread, PatInf, DNRList, HosPiceList,
  IPDCertificate, ic_information_unit, ICFunction,
  Pain, Spec, TtlAmt, OftenIcd, FrmIC_Insert_InFo, PatList, DPDXray,
  NowUsedMed, warningdesc, IPDDupMed, CloudDrug, MedFallItem, FallRiskScore;

{$R *.dfm}

procedure TFrmOrder.count_s_h_o;
begin
  if length(MemoH.Lines.Text) >= 1024 then
    MemoH.Font.Color := clRed;
  if length(MemoS.Lines.Text) >= 1024 then
    MemoS.Font.Color := clRed;
  if length(MemoO.Lines.Text) >= 1024 then
    MemoO.Font.Color := clRed;
  if length(MemoP.Lines.Text) >= 1024 then
    MemoP.Font.Color := clRed;
  Label7.Caption := 'History_' + IntToStr(length(MemoH.Lines.Text));
  Label4.Caption := 'Subjective_' + IntToStr(length(MemoS.Lines.Text));
  Label9.Caption := 'Objective_' + IntToStr(length(MemoO.Lines.Text));
  Label8.Caption := Setsys.ReadString('DPD', 'MX', 'MX') + '_' + IntToStr(length(MemoP.Lines.Text));
end;

procedure TFrmOrder.PDelay();
var FirstTickCount: longint;
begin
  FirstTickCount := GetTickCount;
  repeat
    Application.ProcessMessages;
  until ((GetTickCount - FirstTickCount) >= Longint(ms));
end;

procedure TFrmOrder.ShowPnlMsg(str: string);
begin
  LblShow.Caption := str;
  if length(LblShow.Caption) > 15 then
    PnlShow.Width := PnlShow.Constraints.MinWidth + (length(LblShow.Caption) - 15) * 5;
  PnlShow.Top := (Self.Height div 2) - (PnlShow.Height);
  PnlShow.Left := (Self.Width div 2) - (PnlShow.Width div 2);
  PnlShow.Visible := true;
  ms := 10000000;
  PDelay();
end;


procedure TFrmOrder.ShowPnlDiagMsg(str: string);
begin
  LblDiag.Caption := str;
  //if length(LblDiag.Caption) > 15 then
    //PnlShow.Width := PnlShow.Constraints.MinWidth + (length(LblShow.Caption) - 15) * 5;
  //LblDiag.Top := (Self.Height div 2) - (LblDiag.Height);
  //LblDiag.Left := (Self.Width div 2) - (LblDiag.Width div 2);
  LblDiag.Visible := true;
  ms := 10000000;
  PDelay();
end;

procedure TFrmOrder.CHKCASEPART(SYSType, Code: string);
var
  SpName, ExeSPResult: string;
  Paramter, PType, RType, PData: TStrings;
  tmpSql: string;
  SQLs: TStrings;
  Qrys: TADOQuery;
begin
  SQLs := TStringList.Create;
  Paramter := TStringList.Create;
  PType := TStringList.Create;
  RType := TStringList.Create;
  PData := TStringList.Create;
  SpName := '';

  SpName := getSpSql(7, Paramter, PType, RType);
  PData.Add(SYSType);
  PData.Add(trim(Code));
  ExeSPResult := DM.ExecSP(Paramter, PType, RType, PData, SpName);

  if ReturnId(ExeSPResult) <> '' then
  begin
    tmpSql := getChkSqlStr(59);
    SetParamter(tmpSql, '$CODE_NO$', ReturnId(ExeSPResult));
    SQLs.Clear;
    SQLs.Text := tmpSql;
    if DM.OpenSQL(SQLs, Qrys) then
    begin
      Case_Type1.Text := Qrys.FieldByName('code_desc').AsString;
      setCASEDESC(Case_Type1.Text);
    end;
  end;

  if ReturnId(ReturnName(ExeSPResult)) <> '' then
  begin
    tmpSql := getChkSqlStr(58);
    SetParamter(tmpSql, '$CODE_NO$', ReturnId(ReturnName(ExeSPResult)));
    SQLs.Text := tmpSql;
    if DM.OpenSQL(SQLs, Qrys) then
    begin
      Part_Code1.Text := Qrys.FieldByName('code_desc').AsString;
      setPARTDESC(Part_Code1.Text);
    end;
  end;

  if ReturnID(ReturnName(ReturnName(ExeSPResult))) <> '' then
  begin
    ShowPnlMsg(ReturnID(ReturnName(ReturnName(ExeSPResult))));
    use_opd_log('D', ReturnID(ReturnName(ReturnName(ExeSPResult))));
  end;


  Paramter.Free;
  PType.Free;
  RType.Free;
  PData.Free;
  SQLs.Free;

end;

function TFrmOrder.ChkQty(tmpSG: TStringGrid; SGitem: string; var msg: string): boolean;
var
  tmpCol, i: Integer;
begin
  tmpCol := -1;
  msg := '下列項目 "' + SGitem + '" ' + #13;
  Result := true;
  if tmpSG.Name = 'SGMed' then
    tmpCol := M_Ttl
  else if tmpSG.Name = 'SGFee' then
    tmpCol := F_Qty
  else if tmpSG.Name = 'SGMtrl' then
    tmpCol := O_Qty
  else if tmpSG.Name = 'SGChk' then
    tmpCol := C_Qty
  else if tmpSG.Name = 'SGXRay' then
    tmpCol := C_Qty
  else if tmpSG.Name = 'SGLab' then
    tmpCol := C_Qty;
  if tmpCol <> -1 then
  begin
    for i := 0 to tmpSG.RowCount - 1 do
      if (tmpSG.Cells[3, i] <> '') and (tmpSG.Cells[Del, i] <> 'X') then
      begin
        if StrToFloat(tmpSG.Cells[tmpCol, i]) = 0 then
        begin
          Result := false;
          msg := msg + tmpSG.Cells[3, i] + #13;
        end;
        if tmpSG.Name = 'SGMed' then
          if StrToFloat(tmpSG.Cells[M_Day, i]) = 0 then
          begin
            Result := false;
            msg := msg + tmpSG.Cells[3, i] + #13;
          end;
      end;
  end;
  msg := msg + '"天數"或"數量"或"總量"不得為零';
end;

procedure TFrmOrder.BringChild(fee_code: string);
var
  tmpSql: string;
  SQLs: TStrings;
  Qrys: TADOQuery;
begin

  Qrys := TADOQUERY.Create(nil);
  Qrys.Connection := DM.ADOLink;
  tmpSql := getChkSqlStr(69);
  SetParamter(tmpSql, '$FEE_CODE$', fee_code);
  Qrys.SQL.Text := tmpSql;
  Qrys.Open;

  while not Qrys.Eof do
  begin

    if Qrys.FieldByName('child_type').AsString = 'M' then
    begin
      InsertMed(Qrys.FieldByName('tech_code').AsString, '', '', '', '', '', '', fee_code, -1);
      SGMed.RowCount := SGMed.RowCount + 1;
      SGMed.Row := SGMed.Row + 1;
    end
    else if Qrys.FieldByName('child_type').AsString = 'O' then
      InsertMtrl(Qrys.FieldByName('tech_code').AsString, fee_code)
    else if Qrys.FieldByName('child_type').AsString = 'F' then
      InsertFee(Qrys.FieldByName('tech_code').AsString, fee_code);

    Qrys.Next;
  end;

  Qrys.Free;

end;

procedure TFrmOrder.ComputeAmt(tmpSG: TStringGrid; Pqty, Pcode, Pins: integer);
var
  tmpSql: string;
  SQLs: TStrings;
  Qrys: TADOQuery;
  i: integer;
  ttl_amt: Double;
begin
  SQLs := TStringList.Create;
  Qrys := TADOQUERY.Create(nil);
  Qrys.Connection := DM.ADOLink;
  ttl_amt := 0;
  for i := 0 to tmpSG.RowCount - 1 do
  begin
    //111.06.06 shh ITe 11138 modify 處置不計H項
    //if (trim(tmpSG.Cells[Pcode, i]) <> '') and ((tmpSG.Cells[Pins, i] = 'N') or (tmpSG.Cells[Pins, i] = 'H')) then
    if (trim(tmpSG.Cells[Pcode, i]) <> '') and (tmpSG.Cells[Pins, i] = 'N') then
    begin
      SQLs.Clear;

      tmpSql := getChkSqlStr(57);
      SetParamter(tmpSql, '$FEE_CODE$', tmpSG.Cells[Pcode, i]);
      SQLs.Text := tmpSql;
      Qrys.SQL.Text := SQLs.Text;
      Qrys.Open;
      if not Qrys.Eof then
        ttl_amt := ttl_amt + StrToFloat(Qrys.FieldByName('item_amt').AsString) * StrToFloat(tmpSG.Cells[Pqty, i])
      else
        ttl_amt := ttl_amt + 0;
    end;
  end;
  PnlAmt.Caption := '';
  case (Pgc_P.ActivePageIndex) of
    0:
      PnlAmt.Caption := PnlAmt.Caption + '檢驗費：' + FloatToStr(ttl_amt);
    1:
      PnlAmt.Caption := PnlAmt.Caption + '放射費：' + FloatToStr(ttl_amt);
    2:
      PnlAmt.Caption := PnlAmt.Caption + '衛材費：' + FloatToStr(ttl_amt);
    3:
      PnlAmt.Caption := PnlAmt.Caption + '檢查費：' + FloatToStr(ttl_amt);
    4:
      begin
        PnlAmt.Font.Size := 10;
        PnlAmt.Caption := PnlAmt.Caption + '處置費:' + FloatToStr(ttl_amt);
        ttl_amt := 0;
        for i := 0 to SGMed.RowCount - 1 do
        begin
          if (trim(SGMed.Cells[M_Code, i]) <> '') and ((SGMed.Cells[M_Ins, i] = 'N') or (SGMed.Cells[M_Ins, i] = 'H')) then
          begin
            SQLs.Clear;

            tmpSql := getChkSqlStr(57);
            SetParamter(tmpSql, '$FEE_CODE$', SGMed.Cells[M_Code, i]);
            SQLs.Text := tmpSql;
            Qrys.SQL.Text := SQLs.Text;
            Qrys.Open;
            if not Qrys.Eof then
              ttl_amt := ttl_amt + StrToFloat(Qrys.FieldByName('item_amt').AsString) * StrToFloat(SGMed.Cells[M_Ttl, i])
            else
              ttl_amt := ttl_amt + 0.0;
          end;
        end;
        PnlAmt.Caption := PnlAmt.Caption + '藥費:' + FloatToStr(ttl_amt);
      end;
  end;


  SQLs.Free;
  Qrys.Free;
end;

procedure TFrmOrder.insert_ic_treat_temp(baby_kind: string);
var
  A23, ttl_amt: string;
  tmpSql: string;
  SQLs: TStrings;
begin
  SQLs := TStringList.Create;
  tmpSql := getInsertSql(18);

  SetParamter(tmpSql, '$sour_type$', getOpdKind);
  SetParamter(tmpSql, '$fee_no$', getFeeNo);
  SetParamter(tmpSql, '$chr_no$', getChrNo);

  if (Copy(Card_No1.Text, 1, 1) <> 'A') and (Copy(Card_No1.Text, 1, 1) <> 'B') and (Copy(Card_No1.Text, 1, 1) <> 'Z') and (Copy(Card_No1.Text, 1, 2) <> 'IC') then
  begin
    SetParamter(tmpSql, '$ic_date$', Copy(icfunction.opd_Date, 1, 7));
    SetParamter(tmpSql, '$ic_time$', Copy(icfunction.opd_Date, 8, 6));
    SetParamter(tmpSql, '$upd_date$', ROCDate(now, ''));
    SetParamter(tmpSql, '$upd_time$', ROCTime(now, ''));
    SetParamter(tmpSql, '$ic_seq_no$', ADSpace(card_no1.Text, 4));
    SetParamter(tmpSql, '$signature01$', ADSpace(Copy(icfunction.safe_sign, 1, 128), 128));
    SetParamter(tmpSql, '$signature02$', ADSpace(Copy(icfunction.safe_sign, 129, 128), 128));
    SetParamter(tmpSql, '$error_flag$', 'N');
    SetParamter(tmpSql, '$error_code$', 'N');
    SetParamter(tmpSql, '$id_no$', ADSpace(icfunction.id_no, 10));
    SetParamter(tmpSql, '$birthday$', ADSpace(icfunction.birth_date, 7));
    SetParamter(tmpSql, '$card_no$', ADSpace(icfunction.card_no, 12));
    SetParamter(tmpSql, '$sam_code$', ADSpace(icfunction.sam_id, 12));
  end
  else
  begin
    SetParamter(tmpSql, '$ic_date$', ROCDate(now, ''));
    SetParamter(tmpSql, '$ic_time$', ROCTime(now, ''));
    SetParamter(tmpSql, '$upd_date$', ROCDate(now, ''));
    SetParamter(tmpSql, '$upd_time$', ROCTime(now, ''));
    SetParamter(tmpSql, '$ic_seq_no$', ADSpace(card_no1.Text, 4));
    SetParamter(tmpSql, '$signature01$', ADSpace(getFeeNo, 128));
    SetParamter(tmpSql, '$signature02$', '');
    SetParamter(tmpSql, '$error_flag$', 'Y');
    SetParamter(tmpSql, '$error_code$', card_no1.Text);
    SetParamter(tmpSql, '$id_no$', ADSpace(getIdNo, 10));
    if Length(Trim(getBirthDate)) = 6 then
      SetParamter(tmpSql, '$birthday$', ADSpace('0' + Trim(getBirthDate), 7))
    else
      SetParamter(tmpSql, '$birthday$', ADSpace(Trim(getBirthDate), 7));
    SetParamter(tmpSql, '$card_no$', ADSpace(getFeeNo, 9));
    SetParamter(tmpSql, '$sam_code$', '');
  end;

  SetParamter(tmpSql, '$del_flag$', 'N');
  SetParamter(tmpSql, '$card_comp$', '1');

  A23 := '02';
  if ReturnName(getPARTDESC) = '006' then
    A23 := 'AD'
  else if GetICType = 2 then
    A23 := 'AB'
  else if GetICType = 3 then
    A23 := 'AC';

  SetParamter(tmpSql, '$treatitem$', A23);
  SetParamter(tmpSql, '$sche_flag$', '0');
  SetParamter(tmpSql, '$err_flow_code$', '0002');
  SetParamter(tmpSql, '$upload_flag$', 'T');
  SetParamter(tmpSql, '$ok_flag$', 'T');
  SetParamter(tmpSql, '$upload_datetime$', '');
  SetParamter(tmpSql, '$parent_chr_no$', '');
  ttl_amt := '0';
  SetParamter(tmpSql, '$ttl_amt$', ttl_amt);
  SetParamter(tmpSql, '$part_amt$', '0');
  SetParamter(tmpSql, '$part_amt1$', '0');
  SetParamter(tmpSql, '$upd_oper$', getDocCode1);
  SetParamter(tmpSql, '$outer_flag$', '');
  SetParamter(tmpSql, '$outer_flag$', '');

  if Trim(baby_kind) <> '' then
  begin
    SetParamter(tmpSql, '$babytreat$', 'Y');
    SetParamter(tmpSql, '$babyseq$', ADSpace(IntToStr(icfunction.ic_bc), 1));

    if Length(Trim(getBirthDate)) = 6 then
      SetParamter(tmpSql, '$baby_birth$', '0' + getBirthDate)
    else
      SetParamter(tmpSql, '$baby_birth$', getBirthDate);
    SetParamter(tmpSql, '$baby_birth_num$', ADSpace(icfunction.new_born_flag, 1));
  end
  else
  begin
    SetParamter(tmpSql, '$babytreat$', 'N');
    SetParamter(tmpSql, '$babyseq$', '');
    SetParamter(tmpSql, '$baby_birth$', '');
    SetParamter(tmpSql, '$baby_birth_num$', '');
  end;
  SetParamter(tmpSql, '$cncl_flag$', 'N');
  SetParamter(tmpSql, '$diag_seq$', 'N');
  SQLs.Text := tmpSql;

  DM.ExecSQL(SQLs);

  SQLs.Free;

end;

procedure TFrmOrder.fin_get_seq();
var
  ComRet, DC_V, HPC_V, IC_V, ILL_Ret: Integer;
  err_msg: string;
  seq: Integer;
  card_kind: string;
  baby_kind: string;
  i: Integer;
  no_card_kind, A23: string;
  wt1: Integer;
  Qrys: TADOQuery;
  tmpSql: string;
  SQLs: TStrings;
begin
  seq := 0;
  ICSEQ_Lbl.Visible := True;
  ICSEQ_Lbl.Caption := '';
  ICSEQ_PB.Position := 0;
  csCloseCom();
  ComRet := csOpenCom(0);
  if ComRet = -1 then
  begin
    csCloseCom();
    setIcSeqNo('IC');
    card_no1.Text := getIcSeqNo;
    MessageDlg('開啟健保IC卡失敗，本次已先以異常碼帶入!!!!請聯絡資訊室', mtWarning, [mbOk], 0);
    Timer3.Enabled := false;
    ICSEQ_PB.Position := 0;
    Exit;
  end;

  err_msg := '';
  try
    DC_V := IDC_CONNECT();
    if (DC_V > 2) then
    begin
      MessageDlg('驗證卡機失敗，請重新插拔卡機電源', mtWarning, [mbOk], 0);
      setIcSeqNo('IC');
      card_no1.Text := getIcSeqNo;
    end
    else
    begin

      IC_V := IC_CHECK();

      if (IC_V > 2) then
      begin
        setIcSeqNo('IC');
        card_no1.Text := getIcSeqNo;
        if (IC_V = 4013) then
        begin
          no_card_kind := '4';
          if InputQuery('未置IC卡-身分別', '(1.未帶卡,2.自費,3.其他,4重新插卡)', no_card_kind) = true then
          begin
            if (no_card_kind <> '1') and (no_card_kind <> '2') and (no_card_kind <> '3') and (no_card_kind <> '4') then
            begin
              ShowMessage('請輸入正確的值！');
              Exit;
            end
            else
            begin
              if (no_card_kind = '1') then
              begin
                setIcSeqNo('IC');
                card_no1.Text := getIcSeqNo;
                Pat_Id1.Text := '自費';
              end;
              if (no_card_kind = '2') then
              begin
                setIcSeqNo('IC');
                card_no1.Text := getIcSeqNo;
                Pat_Id1.Text := '自費';
              end;
              if (no_card_kind = '3') then
              begin
                setIcSeqNo('IC');
                card_no1.Text := getIcSeqNo;
                Pat_Id1.Text := '健保';
              end;
              if (no_card_kind = '4') then
              begin
                card_no1.Text := '';
                setIcSeqNo('IC');
                fin_get_seq;
                Exit;
              end;
            end;
          end
          else
          begin
            Card_No1.Text := '';
            Exit;
          end;
        end
        else
        begin
          ic_error_count := ic_error_count + 1;
          if IC_V = 9999 then
          begin
            MessageDlg('此IC卡與病患資料不符無法讀取卡序' + #13 + '請重新確認卡片', mtWarning, [mbOk], 0);
            Timer3.Enabled := false;
            ICSEQ_PB.Position := 0;
            //20140829學承加 ******
            BtnFinish.Enabled := true;
            if getOpdStatus = '1' then
              BtnSave.Enabled := true;
            //*********
            Exit;
          end;

          if ic_error_count > 5 then
          begin
            MessageDlg('IC卡片寫入有誤，該病人將以異常碼帶入', mtWarning, [mbOk], 0);
            setIcSeqNo('IC');
            card_no1.Text := getIcSeqNo;
            Timer3.Enabled := false;
            ICSEQ_PB.Position := 0;
            Exit;
          end;
          fin_get_seq;
        end;
      end
      else
      begin
        baby_kind := '';

        ICSEQ_Lbl.Caption := '卡片資料寫入開始';
        ICSEQ_Lbl.Refresh;
        ICSEQ_PB.Position := 5;
        ICSEQ_PB.Refresh;

        if (card_no1.Text = '') or (trim(card_no1.Text) = 'IC') then
        begin
          A23 := '02';//一般牙科
          if ReturnName(getPARTDESC) = '006' then //職業病or職業傷害
            A23 := 'AD'
          else if GetICType = 2 then //同一療程
            A23 := 'AB'
          else if GetICType = 3 then //預防保健
            A23 := 'AC';

          ICSEQ_Lbl.Caption := '取卡序中......';
          ICSEQ_Lbl.Refresh;
          ICSEQ_PB.Position := 10;
          ICSEQ_PB.Refresh;
          //get_seq(treatIte(),
          //        ac_code(預防保健檢查項目代碼),
          //        baby_kind(A:1胎 B:2胎以上),
          //        card_kind(保健服務項目註記))

          seq := get_seq(pchar(A23), '', '', '1');

          if (seq = 0) then
          begin
            ic_error_count := 0;
            setIcSeqNo(icfunction.seq);
            card_no1.Text := getIcSeqNo;

            ICSEQ_Lbl.Caption := '完成取得卡序:'+getIcSeqNo;
            ICSEQ_Lbl.Refresh;
            ICSEQ_PB.Position := 10;
            ICSEQ_PB.Refresh;

            if High(icfunction.ic_med_record) > 0 then
            begin
              ICSEQ_Lbl.Caption := '寫入藥品資訊...';
              ICSEQ_Lbl.Refresh;
              ICSEQ_PB.Position := 15;
              ICSEQ_PB.Refresh;
              insert_card_med();
              ICSEQ_Lbl.Caption := '寫入藥品資訊完成';
              ICSEQ_Lbl.Refresh;
              ICSEQ_PB.Position := 30;
              ICSEQ_PB.Refresh;
            end;
            if High(icfunction.ic_fee_record) > 0 then
            begin
              ICSEQ_Lbl.Caption := '寫入處置資訊...';
              ICSEQ_Lbl.Refresh;
              ICSEQ_PB.Position := 45;
              ICSEQ_PB.Refresh;
              insert_card_fee();
              ICSEQ_Lbl.Caption := '寫入處置資訊完成';
              ICSEQ_Lbl.Refresh;
              ICSEQ_PB.Position := 65;
              ICSEQ_PB.Refresh;
            end;

            ICSEQ_Lbl.Caption := '寫入就診紀錄';
            ICSEQ_Lbl.Refresh;
            ICSEQ_PB.Position := 70;
            ICSEQ_PB.Refresh;
            if A23 = 'AC' then
            begin
              //20140829學承MARK
              //if (trim(Case_code.Text) = '81') or (trim(Case_code.Text) = '87') then
              ICSEQ_Lbl.Caption := '寫入就診紀錄預防保健資訊..';
              ICSEQ_Lbl.Refresh;
              ICSEQ_PB.Position := 80;
              ICSEQ_PB.Refresh;
              if (trim(Case_Code.Text) = '97') OR (trim(Case_Code.Text) = '95') then
                wt1 := Write_HealthInsurance('08', trim(Case_Code.Text))
              else
                wt1 := Write_HealthInsurance('05', trim(Case_Code.Text));
            end;
            ICSEQ_Lbl.Caption := '寫入就診紀錄預防保健資訊完成';
            ICSEQ_Lbl.Refresh;
            ICSEQ_PB.Position := 90;
            ICSEQ_PB.Refresh;

            ICSEQ_Lbl.Caption := '寫入就診紀錄ICD10資訊..';
            ICSEQ_Lbl.Refresh;
            if (icdchange<>'N') then
              wt1 := Write_TreatmentCode_10() //寫入就診紀錄ICD10
            else
              wt1 := Write_TreatmentCode(); //寫入就診紀錄ICD9



            ICSEQ_Lbl.Caption := '寫入完成';
            ICSEQ_Lbl.Refresh;
            ICSEQ_PB.Position := 100;
            ICSEQ_PB.Refresh;
            ICSEQ_Lbl.Caption := '';
            ICSEQ_Lbl.Refresh;

          end
          else
          begin
            err_msg := error_list(1, seq);
            ShowPnlMsg(err_msg);
            if Trim(err_msg) = 'ZZZZ' then
            begin
              if MessageDlg('此病人顯示未在保，請確定是否有補費單' + #13 + '確定未在保並以自費看診，請按 YES ，' + #13 + '持有補費單已健保看診，請按 NO ！', mtWarning, [mbYes, mbNo], 0) = mrNo then
              begin
                setIcSeqNo('Z000');
                card_no1.Text := getIcSeqNo;
                Timer3.Enabled := false;
                ICSEQ_PB.Position := 0;
              end
              else
              begin
                setIcSeqNo('IC');
                card_no1.Text := getIcSeqNo;
                Pat_Id1.Text := '自費';
                Timer3.Enabled := false;
                ICSEQ_PB.Position := 0;
              end;
            end
            else
            begin
              ic_error_count := ic_error_count + 1;
              if ic_error_count > 5 then
              begin
                MessageDlg('IC卡片寫入有誤，該病人將以異常碼帶入', mtWarning, [mbOk], 0);
                setIcSeqNo('IC');
                card_no1.Text := getIcSeqNo;
                Timer3.Enabled := false;
                ICSEQ_PB.Position := 0;
                ic_error_count := 0;
                Exit;
              end;
              fin_get_seq;
            end;
            csCloseCom();

          end;
        end;
      end;
    end;
  except
    csCloseCom();
    ShowMessage(ICSEQ_Lbl.Caption+' 例外處理');
  end;
  csCloseCom();

  if (Length(Card_No1.Text) = 4) and (((Copy(Trim(Card_No1.Text), 1, 1) < 'A') or (Copy(Trim(Card_No1.Text), 1, 2) = 'IC'))) then
  begin
    ICSEQ_Lbl.Caption :='insert_ic_treat_temp';
    SQLs := TStringList.Create;
    tmpSql := getChkSqlStr(25);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SQLs.Text := tmpSql;
    if not DM.OpenSQL(SQLs) then
    begin
      insert_ic_treat_temp(baby_kind);
      ICSEQ_Lbl.Caption :='insert_ic_treat_temp1';
    end;
    SQLs.Free;
  end;
  isGetExecute := true;
  ICSEQ_PB.Position := 0;
  ICSEQ_Lbl.Caption :='';
end;

function TFrmOrder.IsICSeqNo(fee_no: string): boolean;
var
  tmpSql: string;
  SQLs: TStrings;
  Qrys: TADOQuery;
begin
  SQLs := TStringList.Create;
  tmpSql := getChkSqlStr(25);
  SetParamter(tmpSql, '$FEE_NO$', fee_no);
  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs) then
  begin
    ShowPnlMsg('此病患已取卡，完診後會更新卡序');
    Result := true;
  end
  else
    Result := false;
  SQLs.Free;
end;

function TFrmOrder.ChkIsUrg(fee_code, LabNo: string): boolean;
var
  tmpSql: string;
  SQLs: TStrings;
  Qrys: TADOQuery;
begin
  SQLs := TStringList.Create;
  tmpSql := getChkSqlStr(30);
  SetParamter(tmpSql, '$FEE_CODE$', fee_code);
  SetParamter(tmpSql, '$SEND_CD_3$', LabNo);
  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs, Qrys) then
    if Qrys.FieldByName('cnt').AsInteger = 0 then
      Result := false
    else
      Result := true
  else
    Result := false;
  SQLs.Free;
end;

function TFrmOrder.isRepeat(fee_code, path, send, send2: string; tmpSG: TStringGrid): Boolean;
var
  i: integer;
  isRe, isRe1, isRe2, isRe3, isRe4: boolean;
begin
  isRe := false;
  for i := 0 to tmpSG.RowCount - 1 do
  begin
    if tmpSG.Cells[3, i] <> '' then
    begin
      if fee_code <> '' then
        if fee_code <> tmpSG.Cells[3, i] then
          isRe1 := false
        else
          isRe1 := true;

      if path <> '' then
        if path <> tmpSG.Cells[8, i] then
          isRe2 := false
        else
          isRe2 := true;

      if send <> '' then
        if send <> tmpSG.Cells[13, i] then
          isRe3 := false
        else
          isRe3 := true;

      if send2 <> '' then
        if send2 <> tmpSG.Cells[16, i] then
          isRe4 := false
        else
          isRe4 := true;

      if isRe1 and isRe2 and isRe3 and isRe4 then
      begin
        isRe := false;
        break;
      end;
    end;
  end;

  Result := isRe;
end;

function TFrmOrder.InsertXRay: Boolean;
var
  i: Integer;
  Qrys: TADOQuery;
  tmpSql, part: string;
  SQLs: TStrings;
begin
  if OutList.Count > 0 then
  begin
    for i := 0 to OutList.Count - 1 do
    begin
      SQLs := TStringList.Create;
      tmpSql := getPreOrderSql(1);
      SetParamter(tmpSql, '$FEE_CODE$', ReturnId(ReturnName(ReTurnName(OutList.Strings[i]))));
      SetParamter(tmpSql, '$ORDER_TYPE$', ReTurnID(OutList.Strings[i]));
      if copy(ReTurnID(OutList.Strings[i]), 1, 1) = 'T' then
        tmpSql := tmpSql + #13 + ' And trim(Send_cd_1)=' + Qt(ReTurnId(ReTurnName(ReTurnName(ReTurnName(ReturnName(OutList.Strings[i]))))))
      else
        tmpSql := tmpSql + #13 + ' And Send_cd_1=' + Qt(ReTurnId(ReTurnName(ReTurnName(ReTurnName(ReturnName(OutList.Strings[i]))))));
      if ReTurnId(ReTurnName(ReTurnName(ReTurnName(ReTurnName(ReTurnName(ReturnName(OutList.Strings[i]))))))) = '' then
        tmpSql := tmpSql + #13 + ' And nvl(Send_CD_2,''nil'')=''nil'' '
      else
        tmpSql := tmpSql + #13 + ' And Send_CD_2=' + Qt(ReTurnId(ReTurnName(ReTurnName(ReTurnName(ReTurnName(ReTurnName(ReturnName(OutList.Strings[i]))))))));

      SQLs.Text := tmpSql;
      if DM.OpenSQL(SQls, Qrys) then
      begin
        if isRepeat(ReturnId(ReturnName(ReTurnName(OutList.Strings[i]))), ReTurnId(ReTurnName(ReTurnName(ReTurnName(ReturnName(OutList.Strings[i]))))), ReTurnId(ReTurnName(ReTurnName(ReTurnName(ReTurnName(ReTurnName(ReturnName(OutList.Strings[i]))))))), '', SGXRay) then
        begin
          MessageDlg('此' + ReturnId(ReturnName(ReTurnName(OutList.Strings[i]))) + '放射品項已重複開立！', mtWarning, [mbOk], 0);
          exit;
        end;
        part := '';
        if copy(ReTurnID(OutList.Strings[i]), 1, 1) = 'T' then
          part := ReTurnId(ReTurnName(ReTurnName(ReTurnName(ReTurnName(ReTurnName(ReTurnName(ReturnName(OutList.Strings[i]))))))));

        SGXRay.Cells[modifyType, SGXRay.Rowcount - 1] := 'N';
        SGXRay.Cells[Seq, SGXRay.Rowcount - 1] := '';
        SGXRay.Cells[Del, SGXRay.Rowcount - 1] := '';

        SGXRay.Cells[C_Code, SGXRay.Rowcount - 1] := ReturnId(ReturnName(ReTurnName(OutList.Strings[i])));
        SGXRay.Cells[C_Order, SGXRay.Rowcount - 1] := Trim(Qrys.FieldByName('FEE_NAME').AsString);
        if part <> '' then
        begin
          SGXRay.Cells[C_Qty, SGXRay.Rowcount - 1] := Trim(Qrys.FieldByName('UNIT_QTY').AsString);
          if ReTurnID(OutList.Strings[i]) = 'XT3' then
            SGXRay.Cells[C_Unit, SGXRay.Rowcount - 1] := Trim(Qrys.FieldByName('UNIT_O').AsString)
          else
            SGXRay.Cells[C_Unit, SGXRay.Rowcount - 1] := part;
        end
        else
        begin
          SGXRay.Cells[C_Qty, SGXRay.Rowcount - 1] := Trim(Qrys.FieldByName('UNIT_QTY').AsString);
          SGXRay.Cells[C_Unit, SGXRay.Rowcount - 1] := Trim(Qrys.FieldByName('UNIT_O').AsString);
        end;
        SGXRay.Cells[C_Cir, SGXRay.Rowcount - 1] := Trim(Qrys.FieldByName('CIR_CODE_O').AsString);
        SGXRay.Cells[C_path, SGXRay.Rowcount - 1] := ReTurnId(ReTurnName(ReTurnName(ReTurnName(ReturnName(OutList.Strings[i])))));
        if copy(ReTurnID(OutList.Strings[i]), 1, 1) = 'T' then
          SGXRay.Cells[C_INS, SGXRay.Rowcount - 1] := 'H'
        else
          SGXRay.Cells[C_INS, SGXRay.Rowcount - 1] := Trim(Qrys.FieldByName('INS_FLAG').AsString);
        SGXRay.Cells[C_EMG, SGXRay.Rowcount - 1] := 'N';
        SGXRay.Cells[C_MEMO, SGXRay.Rowcount - 1] := '';
        SGXRay.Cells[C_Send, SGXRay.Rowcount - 1] := ReTurnId(ReTurnName(ReTurnName(ReTurnName(ReTurnName(ReTurnName(ReturnName(OutList.Strings[i])))))));
        SGXRay.Cells[C_Kind, SGXRay.Rowcount - 1] := ReTurnID(OutList.Strings[i]);
        SGXRay.Cells[C_INS_Flag, SGXRay.Rowcount - 1] := Trim(Qrys.FieldByName('INS_FLAG').AsString);
        SGXRay.RowCount := SGXRay.RowCount + 1;
        ComputeAmt(SGXRay, C_Qty, C_Code, C_Ins);
        TabXRay.Caption := '放射[' + IntToStr(SGXRay.RowCount - 1) + ']';
        if copy(ReTurnID(OutList.Strings[i]), 1, 1) = 'T' then
          if ReTurnID(OutList.Strings[i]) = 'XT3' then
            InsertXFee(ReturnId(ReturnName(ReTurnName(OutList.Strings[i]))), Trim(Qrys.FieldByName('UNIT_QTY').AsString), Trim(Qrys.FieldByName('UNIT_O').AsString))
          else
            InsertXFee(ReturnId(ReturnName(ReTurnName(OutList.Strings[i]))), Trim(Qrys.FieldByName('UNIT_QTY').AsString), part);
      end;
      SQLs.Free;
    end;
  end;
end;

function TFrmOrder.InsertChk: Boolean;
var
  i: Integer;
  Qrys: TADOQuery;
  tmpSql: string;
  SQLs: TStrings;
begin
  if OutList.Count > 0 then
  begin
    SQLs := TStringList.Create;
    for i := 0 to OutList.Count - 1 do
    begin
      SQLs.Clear;
      tmpSql := getPreOrderSql(1);
      SetParamter(tmpSql, '$FEE_CODE$', ReturnId(ReturnName(OutList.Strings[i])));
      SetParamter(tmpSql, '$ORDER_TYPE$', 'E');
      if ReturnId(ReturnName(ReturnName(OutList.Strings[i]))) = '' then
        tmpSql := tmpSql + #13 + '  And nvl(Send_cd_1,''nil'')=''nil'' '
      else
        tmpSql := tmpSql + #13 + ' And Send_cd_1=' + Qt(ReturnId(ReturnName(ReturnName(OutList.Strings[i]))));

      SQLs.Text := tmpSql;
      if DM.OpenSQL(SQls, Qrys) then
      begin
        if isRepeat(ReturnId(ReturnName(OutList.Strings[i])), Trim(Qrys.FieldByName('Send_cd_1').AsString), Trim(Qrys.FieldByName('Send_cd_2').AsString), Trim(Qrys.FieldByName('Send_cd_3').AsString), SGChk) then
        begin
          MessageDlg('此' + ReturnId(ReturnName(OutList.Strings[i])) + '檢查品項已重複開立！', mtWarning, [mbOk], 0);
          exit;
        end;

        SGChk.Cells[modifyType, SGChk.Rowcount - 1] := 'N';
        SGChk.Cells[Seq, SGChk.Rowcount - 1] := '';
        SGChk.Cells[Del, SGChk.Rowcount - 1] := '';
        SGChk.Cells[C_Code, SGChk.Rowcount - 1] := ReturnId(ReturnName(OutList.Strings[i]));
        SGChk.Cells[C_Order, SGChk.Rowcount - 1] := ReTurnId(OutList.Strings[i]);
        SGChk.Cells[C_Qty, SGChk.Rowcount - 1] := Trim(Qrys.FieldByName('UNIT_QTY').AsString);
        SGChk.Cells[C_Unit, SGChk.Rowcount - 1] := Trim(Qrys.FieldByName('UNIT_O').AsString);
        SGChk.Cells[C_Cir, SGChk.Rowcount - 1] := Trim(Qrys.FieldByName('CIR_CODE_O').AsString);
        SGChk.Cells[C_path, SGChk.Rowcount - 1] := Trim(Qrys.FieldByName('Send_cd_1').AsString);
        SGChk.Cells[C_INS, SGChk.Rowcount - 1] := Trim(Qrys.FieldByName('INS_FLAG').AsString);
        SGChk.Cells[C_EMG, SGChk.Rowcount - 1] := 'N';
        SGChk.Cells[C_MEMO, SGChk.Rowcount - 1] := RETurnID(ReTurnName(ReTurnName(ReturnName(OutList.Strings[i]))));
        SGChk.Cells[C_Send, SGChk.Rowcount - 1] := Trim(Qrys.FieldByName('Send_cd_2').AsString);
        SGChk.Cells[C_Kind, SGChk.Rowcount - 1] := 'C';
        SGChk.Cells[C_2Send, SGChk.Rowcount - 1] := Trim(Qrys.FieldByName('Send_cd_3').AsString);
        SGChk.Cells[C_INS_Flag, SGChk.Rowcount - 1] := Trim(Qrys.FieldByName('INS_FLAG').AsString);
        SGChk.RowCount := SGChk.RowCount + 1;
        ComputeAmt(SGChk, C_Qty, C_Code, C_Ins);
        TabChk.Caption := '檢查[' + IntToStr(SGChk.RowCount - 1) + ']';
      end;
    end;
    SQLs.Free;
  end;
end;

function TFrmOrder.InsertLab: Boolean;
var
  i: Integer;
  Qrys: TADOQuery;
  tmpSql: string;
  SQLs: TStrings;
begin
  if OutList.Count > 0 then
  begin
    SQLs := TStringList.Create;
    for i := 0 to OutList.Count - 1 do
    begin
      SQLs.Clear;
      tmpSql := getPreOrderSql(1);
      SetParamter(tmpSql, '$FEE_CODE$', ReturnId(ReturnName(ReturnName(OutList.Strings[i]))));
      SetParamter(tmpSql, '$ORDER_TYPE$', 'L');
      if ReturnId(OutList.Strings[i]) = '' then
        tmpSql := tmpSql + #13 + ' And nvl(Send_cd_1,'' '')='' '' '
      else
        tmpSql := tmpSql + #13 + ' And Send_cd_1=' + Qt(ReturnId(OutList.Strings[i]));

      if ReturnId(ReturnName(OutList.Strings[i])) = '' then
        tmpSql := tmpSql + #13 + ' And nvl(Send_CD_2,'' '')='' '' '
      else
        tmpSql := tmpSql + #13 + ' And Send_Cd_2=' + Qt(ReturnId(ReturnName(OutList.Strings[i])));

      SQLs.Text := tmpSql;
      if DM.OpenSQL(SQls, Qrys) then
      begin
        if isRepeat(ReturnId(ReturnName(ReturnName(OutList.Strings[i]))), ReturnId(ReturnName(OutList.Strings[i])), ReturnId(OutList.Strings[i]), ReTurnID(ReturnName(ReturnName(ReturnName(ReturnName(OutList.Strings[i]))))), SGLab) then
        begin
          MessageDlg('此' + ReturnId(ReturnName(ReturnName(OutList.Strings[i]))) + '檢驗品項已重複開立！', mtWarning, [mbOk], 0);
          exit;
        end;

        SGLab.Cells[modifyType, SGLab.Rowcount - 1] := 'N';
        SGLab.Cells[Seq, SGLab.Rowcount - 1] := '';
        SGLab.Cells[Del, SGLab.Rowcount - 1] := '';

        SGLab.Cells[C_Code, SGLab.Rowcount - 1] := ReturnId(ReturnName(ReturnName(OutList.Strings[i])));
        SGLab.Cells[C_Order, SGLab.Rowcount - 1] := ReturnId(ReturnName(ReturnName(ReturnName(OutList.Strings[i]))));
        SGLab.Cells[C_Qty, SGLab.Rowcount - 1] := Trim(Qrys.FieldByName('UNIT_QTY').AsString);
        SGLab.Cells[C_Unit, SGLab.Rowcount - 1] := Trim(Qrys.FieldByName('UNIT').AsString);
        SGLab.Cells[C_Cir, SGLab.Rowcount - 1] := Trim(Qrys.FieldByName('CIR_CODE').AsString);
        SGLab.Cells[C_path, SGLab.Rowcount - 1] := ReturnId(ReturnName(OutList.Strings[i]));
        SGLab.Cells[C_INS, SGLab.Rowcount - 1] := Trim(Qrys.FieldByName('INS_FLAG').AsString);
        SGLab.Cells[C_EMG, SGLab.Rowcount - 1] := Trim(Qrys.FieldByName('URG_FLAG').AsString);
        SGLab.Cells[C_MEMO, SGLab.Rowcount - 1] := ReTurnID(ReTurnName(ReturnName(ReturnName(ReturnName(ReturnName(OutList.Strings[i]))))));
        SGLab.Cells[C_Send, SGLab.Rowcount - 1] := ReturnId(OutList.Strings[i]);
        SGLab.Cells[C_Kind, SGLab.Rowcount - 1] := 'L';
        SGLab.Cells[C_2Send, SGLab.Rowcount - 1] := ReTurnID(ReturnName(ReturnName(ReturnName(ReturnName(OutList.Strings[i])))));
        SGLab.Cells[C_INS_Flag, SGLab.Rowcount - 1] := Trim(Qrys.FieldByName('INS_FLAG').AsString);
        SGLab.RowCount := SGLab.RowCount + 1;
        ComputeAmt(SGLab, C_Qty, C_Code, C_Ins);
        TabLab.Caption := '檢驗[' + IntToStr(SGLab.RowCount - 1) + ']';
      end
      else
        MessageDlg('此項目' + ReturnId(ReturnName(ReturnName(OutList.Strings[i]))) + '已被刪除！', mtWarning, [mbOk], 0);
    end;
    SQLs.Free;
  end;
end;

function TFrmOrder.InsertIcd(Icd_Code: string): Boolean;
var
  i,j: integer;
  q_str: string;
  Qrys: TADOQuery;
  SQLs: TStrings;
begin
  if icd_code <> '' then
  begin
    for i := 0 to 9 do
    begin
      if (SGIcd.Cells[0, i] <> Icd_Code) then
      begin
        if (SGIcd.Cells[0, i] = '') then
        begin
          SQLs := TStringList.Create;
          q_str := sqlstr(4);
          q_str := q_str + ' AND ICD9_CODE = ' + Qt(UPPERCASE(Icd_Code));
          SQLs.Text := q_str;
          if DM.OpenSQL(SQLs, Qrys) then
          begin
            SGIcd.Cells[0, i] := Qrys.FieldByName('ICD9_CODE').AsString;
            SGIcd.Cells[2, i] := Qrys.FieldByName('ENG_SIMP_DESC').AsString;
            SGIcd.Cells[1, i] := Qrys.FieldByName('CHN_SIMP_DESC').AsString;
            SGIcd.Cells[3, i] := Qrys.FieldByName('slow_flag').AsString;
            SGIcd.Cells[4, i] := Qrys.FieldByName('first_flag').AsString;
            if SGIcd.Row < (SGIcd.RowCount - 1) then
            begin
              SGIcd.Row := SGIcd.Row + 1;
            end;

            //icd10
            q_str := sqlstr(1);
            SetParamter(q_str, '$IDC9_CODE$', trim(UPPERCASE(Icd_Code)));
            SetParamter(q_str, '$DEPT_CODE$', '');
            DM.QrySubSearch.Close;
            DM.QrySubSearch.SQL.Clear;
            DM.QrySubSearch.SQL.Text := q_str;
            DM.QrySubSearch.Open;
            if NOT DM.QrySubSearch.IsEmpty then
            begin
              //指定到空的row
              for j := 0 to 10 do
              begin
                if ((trim(SGIcd10.Cells[0, j]) = '') or (trim(SGIcd10.Cells[1, j]) = '')) then
                begin
                  SGIcd10.Row := j;
                  Break;
                end;
              end;
              SGIcd10.Cells[0, SGIcd10.Row] := DM.QrySubSearch.FieldByName('ICD9_CODE').AsString;
              SGIcd10.Cells[2, SGIcd10.Row] := DM.QrySubSearch.FieldByName('ENG_SIMP_DESC').AsString;
              SGIcd10.Cells[1, SGIcd10.Row] := DM.QrySubSearch.FieldByName('CHN_SIMP_DESC').AsString;
              SGIcd10.Cells[3, SGIcd10.Row] := DM.QrySubSearch.FieldByName('slow_flag').AsString;
              SGIcd10.Cells[4, SGIcd10.Row] := DM.QrySubSearch.FieldByName('first_flag').AsString;
              SGIcd10.Cells[5, SGIcd10.Row] := DM.QrySubSearch.FieldByName('CHN_FULL_DESC').AsString;
              SGIcd10.Cells[6, SGIcd10.Row] := DM.QrySubSearch.FieldByName('ENG_FULL_DESC').AsString;
              SGIcd10.Cells[7, SGIcd10.Row] := trim(DM.QrySubSearch.FieldByName('icd9toicd10').AsString);
              SGIcd10.Cells[8, SGIcd10.Row] := DM.QrySubSearch.FieldByName('choose_flag').AsString;
              if SGIcd10.Row < (SGIcd10.RowCount - 1) then
              begin
                SGIcd10.Row := SGIcd10.Row + 1;
              end;
              DM.QrySubSearch.Close;
            end;
          end;
          break;
        end;
      end
      else
      begin
        MessageDlg('此' + Icd_Code + '診斷碼已重複開立！', mtWarning, [mbOk], 0);
        result := false;
        break;
      end;
    end;
  end;
end;

function TFrmOrder.InsertIcd10(Icd_Code: string): Boolean;
var
  i,j: integer;
  q_str: string;
  Qrys: TADOQuery;
  SQLs: TStrings;
begin
  if icd_code <> '' then
  begin
    for i := 0 to 9 do
    begin
      if (SGIcd10.Cells[0, i] <> Icd_Code) then
      begin
        if (SGIcd10.Cells[0, i] = '') then
        begin
          SQLs := TStringList.Create;
          q_str := sqlstr(34);
          SetParamter(q_str, '$IDC_CODE$', trim(UPPERCASE(Icd_Code)));
          SQLs.Text := q_str;
          if DM.OpenSQL(SQLs, Qrys) then
          begin
            //指定到空的row
            for j := 0 to 10 do
            begin
              if ((trim(SGIcd10.Cells[0, j]) = '') or (trim(SGIcd10.Cells[1, j]) = '')) then
              begin
                SGIcd10.Row := j;
                Break;
              end;
            end;

            if SGIcd10.Row = 0 then
            if ((UpperCase(copy(Qrys.FieldByName('ICD9_CODE').AsString,1,1)) = 'V') or
                (UpperCase(copy(Qrys.FieldByName('ICD9_CODE').AsString,1,1)) = 'W') or
                (UpperCase(copy(Qrys.FieldByName('ICD9_CODE').AsString,1,1)) = 'X') or
                (UpperCase(copy(Qrys.FieldByName('ICD9_CODE').AsString,1,1)) = 'Y')) then
            begin
              ShowMessage('此碼為外因碼不能為主診斷!');
              SGIcd10.Rows[SGIcd10.Row].Clear;
              exit;
            end;

            SGIcd10.Cells[0, SGIcd10.Row] := Qrys.FieldByName('ICD9_CODE').AsString;
            SGIcd10.Cells[2, SGIcd10.Row] := Qrys.FieldByName('ENG_SIMP_DESC').AsString;
            SGIcd10.Cells[1, SGIcd10.Row] := Qrys.FieldByName('CHN_SIMP_DESC').AsString;
            SGIcd10.Cells[3, SGIcd10.Row] := Qrys.FieldByName('slow_flag').AsString;
            SGIcd10.Cells[4, SGIcd10.Row] := Qrys.FieldByName('first_flag').AsString;
            SGIcd10.Cells[5, SGIcd10.Row] := Qrys.FieldByName('CHN_FULL_DESC').AsString;
            SGIcd10.Cells[6, SGIcd10.Row] := Qrys.FieldByName('ENG_FULL_DESC').AsString;
            SGIcd10.Cells[7, SGIcd10.Row] := trim(Qrys.FieldByName('icd9toicd10').AsString);
            SGIcd10.Cells[8, SGIcd10.Row] := Qrys.FieldByName('choose_flag').AsString;
            if SGIcd10.Row < (SGIcd10.RowCount - 1) then
            begin
              SGIcd10.Row := SGIcd10.Row + 1;
            end;
            //showt傳染病通報=======================SELECT count(*) FROM icd9_basic WHERE icd9_code = :data AND inf_flag <> 'N'
            if Qrys.FieldByName('inf_flag').AsString <> 'N' then
              If MessageDlg('傳染病第1類~5類疾病碼 是否通報?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                ToolButton28Click(ToolButton28);
              end;
          end;
          break;
        end;
      end
      else
      begin
        MessageDlg('此' + Icd_Code + '診斷碼已重複開立！', mtWarning, [mbOk], 0);
        result := false;
        break;
      end;
    end;
  end;
end;

function TFrmOrder.InsertMtrl(Fee_Code, aParentCode: string): Boolean;
var
  q_str: string;
  Qrys: TADOQuery;
  SQLs: TStrings;
begin
  SQLs := TStringList.Create;
  q_str := sqlstr(6);
  q_str := q_str + ' AND Fee_CODE = ' + Qt(UPPERCASE(Fee_Code));
  SQLs.Add(q_str);

  if DM.OpenSQL(SQLs, Qrys) then
  begin
    SGMtrl.Cells[modifyType, SGMtrl.Rowcount - 1] := 'N';
    SGMtrl.Cells[Seq, SGMtrl.Rowcount - 1] := '';
    SGMtrl.Cells[Del, SGMtrl.Rowcount - 1] := '';
    SGMtrl.Cells[O_Code, SGMtrl.Rowcount - 1] := Qrys.FieldByName('fee_code').AsString;
    SGMtrl.Cells[O_Name, SGMtrl.Rowcount - 1] := Qrys.FieldByName('fee_name').AsString;
    SGMtrl.Cells[O_Part, SGMtrl.Rowcount - 1] := '';
    SGMtrl.Cells[O_Qty, SGMtrl.Rowcount - 1] := Qrys.FieldByName('unit_qty').AsString;
    SGMtrl.Cells[O_Ins, SGMtrl.Rowcount - 1] := Qrys.FieldByName('ins_flag').AsString;
    SGMtrl.Cells[O_Memo, SGMtrl.Rowcount - 1] := '';
    SGMtrl.Cells[O_Kind, SGMtrl.Rowcount - 1] := 'O';
    SGMtrl.Cells[O_Order_Seq, SGMtrl.Rowcount - 1] := '';
    SGMtrl.Cells[O_Order_Text, SGMtrl.Rowcount - 1] := aParentCode;
    SGMtrl.Cells[O_INS_Flag, SGMtrl.Rowcount - 1] := Qrys.FieldByName('ins_flag').AsString;
    SGMtrl.RowCount := SGMtrl.RowCount + 1;
    SGMtrl.Row := SGMtrl.RowCount - 1;
    result := true;
    ComputeAmt(SGMtrl, O_Qty, O_Code, O_Ins);
    TabMtrl.Caption := '衛材[' + IntToStr(SGMtrl.RowCount - 1) + ']';
  end
  else
    result := false;
end;

function TFrmOrder.InsertXFee(Fee_Code, Qty, Part: string): Boolean;
var
  q_str: string;
  Qrys: TADOQuery;
  SQLs: TStrings;
begin
  SQLs := TStringList.Create;
  q_str := sqlstr(5);
  q_str := q_str + ' AND Fee_CODE = ' + Qt(UPPERCASE(Fee_Code));
  SQLs.Add(q_str);

  if DM.OpenSQL(SQLs, Qrys) then
  begin
    SGFee.Cells[modifyType, SGFee.Rowcount - 1] := 'N';
    SGFee.Cells[Seq, SGFee.Rowcount - 1] := '';
    SGFee.Cells[Del, SGFee.Rowcount - 1] := '';
    SGFee.Cells[F_Code, SGFee.Rowcount - 1] := Qrys.FieldByName('fee_code').AsString;
    SGFee.Cells[F_Name, SGFee.Rowcount - 1] := Qrys.FieldByName('fee_name').AsString;
    SGFee.Cells[F_Part, SGFee.Rowcount - 1] := Part;
    SGFee.Cells[F_Qty, SGFee.Rowcount - 1] := Qty;
    SGFee.Cells[F_Ins, SGFee.Rowcount - 1] := Qrys.FieldByName('ins_flag').AsString;
    SGFee.Cells[F_Memo, SGFee.Rowcount - 1] := '';
    SGFee.Cells[F_Kind, SGFee.Rowcount - 1] := 'F';
    SGFee.Cells[F_Order_Seq, SGFee.Rowcount - 1] := '';
    SGFee.Cells[F_Order_Text, SGFee.Rowcount - 1] := '';
    SGFee.Cells[F_INS_Flag, SGFee.Rowcount - 1] := Qrys.FieldByName('ins_flag').AsString;
    FeeRow := SGFee.Rowcount - 1;
    SGFee.RowCount := SGFee.RowCount + 1;
    SGFee.Row := SGFee.RowCount - 1;
    result := true;
    ComputeAmt(SGFee, F_Qty, F_Code, F_Ins);
    fee_tabst.Caption := '處置[' + IntToStr(SGFee.RowCount - 1) + ']' + ' ' + '用藥[' + IntToStr(SGMed.RowCount - 1) + ']';
  end
  else
    result := false;
end;

function TFrmOrder.InsertFee(Fee_Code, aParentCode: string): Boolean;
var
  q_str: string;
  Qrys: TADOQuery;
  SQLs: TStrings;
begin
  SQLs := TStringList.Create;
  q_str := sqlstr(5);
  q_str := q_str + ' AND Fee_CODE = ' + Qt(UPPERCASE(Fee_Code));
  SQLs.Add(q_str);

  if DM.OpenSQL(SQLs, Qrys) then
  begin
    SGFee.Cells[modifyType, SGFee.Rowcount - 1] := 'N';
    SGFee.Cells[Seq, SGFee.Rowcount - 1] := '';
    SGFee.Cells[Del, SGFee.Rowcount - 1] := '';
    SGFee.Cells[F_Code, SGFee.Rowcount - 1] := Qrys.FieldByName('fee_code').AsString;
    SGFee.Cells[F_Name, SGFee.Rowcount - 1] := Qrys.FieldByName('fee_name').AsString;
    SGFee.Cells[F_Part, SGFee.Rowcount - 1] := '';
    SGFee.Cells[F_Qty, SGFee.Rowcount - 1] := Qrys.FieldByName('unit_qty').AsString;
    SGFee.Cells[F_Ins, SGFee.Rowcount - 1] := Qrys.FieldByName('ins_flag').AsString;
    SGFee.Cells[F_Memo, SGFee.Rowcount - 1] := '';
    SGFee.Cells[F_Kind, SGFee.Rowcount - 1] := 'F';
    SGFee.Cells[F_Order_Seq, SGFee.Rowcount - 1] := '';
    SGFee.Cells[F_Order_Text, SGFee.Rowcount - 1] := aParentCode;
    SGFee.Cells[F_INS_Flag, SGFee.Rowcount - 1] := Qrys.FieldByName('ins_flag').AsString;
    FeeRow := SGFee.Rowcount - 1;
    SGFee.RowCount := SGFee.RowCount + 1;
    SGFee.Row := SGFee.RowCount - 1;
    result := true;
    ComputeAmt(SGFee, F_Qty, F_Code, F_Ins);
    fee_tabst.Caption := '處置[' + IntToStr(SGFee.RowCount - 1) + ']' + ' ' + '用藥[' + IntToStr(SGMed.RowCount - 1) + ']';
  end
  else
    result := false;
end;

procedure TFrmOrder.SetListWidth1(Sender: TObject; cols: Integer);
var
  i: Integer;
  iMaxWidth: Integer;
begin
  iMaxWidth := 40;
  for i := 0 to TListBox(Sender).Items.Count - 1 do
    iMaxWidth := Max(iMaxWidth, Length(TListBox(Sender).Items[i]) * 9);
  TListBox(Sender).Width := iMaxWidth * Cols;
  TListBox(Sender).Columns := Cols;
end;

function TFrmOrder.DeathChr(kind: integer; chr_no: string; var msg: string): boolean;
var
  i: integer;
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql: string;
begin
  try
    SQLs := TStringList.Create;
    tmpSql := getChkSqlStr(4);

    SetParamter(tmpSql, '$CHR_NO$', chr_no);
    SQLs.Text := tmpSql;


    result := false;
    if DM.OpenSQL(SQLs, Qrys) then
    begin
      case kind of
        0:
          begin

            if (SGMed.RowCount > 1) or (SGMtrl.RowCount > 1) then
            begin
              msg := '此個案為死亡病歷，不得開立藥品、衛材！' + #10#13;
              result := true;
              exit;
            end;

            for i := 0 to SGFee.RowCount - 2 do
            begin                            //F019007 ,F119007
              if trim(SGFee.Cells[1, i]) <> 'F00011T' then
              begin
                msg := msg + '此個案為死亡病歷，僅可開立死亡證明書！' + #10#13;
                result := true;
                exit;
              end;
            end;

            if GetPatId(getPPatId) = '健保' then
            begin
              msg := msg + '此個案為死亡病歷，僅可使用自費就診！' + #10#13;
              result := true;
              exit;
            end;

          end;
        4:
          begin
            msg := '此個案為死亡病歷，不得開立檢驗單！';
            result := true;
            exit;
          end;
        5:
          begin
            msg := '此個案為死亡病歷，不得開立放射單！';
            result := true;
            exit;
          end;
        6:
          begin
            msg := '此個案為死亡病歷，不得開立檢查單！';
            result := true;
            exit;
          end;
      end;
    end;
    FreeAndNil(SQLs);

  except
    result := false;
    FreeAndNil(SQLs);
  end;
end;

function TFrmOrder.SaveOrder(kind: integer; var msgtem:string; Sender: TObject): Boolean;
  procedure CleraIcd(sggrid:TStringGrid);
    procedure TransText(var s: string);
    var
      Chr: array[0..255] of char;
    begin
      Windows.LCMapString(
        GetUserDefaultLCID(),
        LCMAP_HALFWIDTH,
        PChar(s),
        Length(s) + 1,
        chr,
        Sizeof(chr)
        );
      s := Chr;
    end;
  var
    iRow, iCol: Integer;
    TextVal: string;
  begin
    for iRow := 0 to sggrid.RowCount - 1 do
    begin
      for iCol := 0 to sggrid.ColCount - 3 do
      begin
        TextVal := sggrid.Cells[iCol, iRow];
        TransText(TextVal);
        if Trim(TextVal) = '' then
        begin
          sggrid.Rows[iRow].Clear;
          Break;
        end;
      end;
    end;
  end;

  function checkicd10(icd10: string):Boolean;
  var
    Qry : TADOQuery;
  begin
    Qry := TADOQuery.Create(nil);
    Qry.Connection := DM.ADOLink;
    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('select * from  icd_code_basic where icd_code='+Qt(icd10));
      Qry.Open;
      if not Qry.IsEmpty then
        Result := True
      else
        Result := False;
    finally
      FreeAndNil(Qry);
    end;
  end;
var
  msg, med_days, med_days_self, Med_No, MedQtyStr, today: string;
  isRePeat, isZore, isChkFee: Boolean;
  Qrys: TADOQuery;
  SQLs, SQLs1: TStrings;
  tmpSql, QuerySql, OrderType, SpName, ExeSPResult: string;
  Paramter, PType, RType, PData: TStrings;
  i, seq_no, sheet_no, seq: integer;
  tmpSG: TStringGrid;
  SQLo: TObjectList;
  mystr, myParamter: string;
begin
  try
    //清除不正確的ICD9
    CleraIcd(SGIcd);

    //清除錯誤的ICD10 20160217 terry Add
    for i := 0 to 10 do
    begin
      if trim(SGIcd10.Cells[0,i]) <> '' then
        if not checkicd10(SGIcd10.Cells[0,i]) then
        begin
          msg := msg + '※ 診斷碼:'+trim(SGIcd10.Cells[0,i])+' 為無效的icd code'+#10#13;
          //SGIcd10.Rows[i].Clear;
        end;
    end;
    if msg <> '' then
    begin
      ShowMessage(msg);
      Abort;
    end;

    //use_opd_log(DPD_Ver, '開始判斷是否可繼續');
    SQLs1 := TStringList.Create;
    SQLo := TObjectList.Create;
    Paramter := TStringList.Create;
    PType := TStringList.Create;
    RType := TStringList.Create;
    PData := TStringList.Create;
    SpName := '';
    Result := false;
    if (getDocCode2 = '') or (getDocCode3 = '') then
    begin
      ShowPnlMsg('請先選擇申報醫師或業績醫師');
      Abort;
    end;

    if (ReturnName(getCASEDESC) = 'A3') and ((trim(Case_Code.Text) = '') or (length(trim(Case_Code.Text)) = 1)) then
    begin
      ShowPnlMsg('案件分類為"預防保健-A3"' + #13 + '必須填寫預防保健的代碼11~19');
      Abort;
    end
    else if (ReturnName(getCASEDESC) = 'A3') and (trim(Case_Code.Text) <> '') then
    begin
      setIcSeqNo('AC' + trim(Case_Code.Text));
    end;

    //20160203取系統時間
    SQLs1.Text := ' Select * from "SYSDATE" ';
    if DM.OpenSQL(SQLs1, Qrys) then
      today := Qrys.FieldByName('date').AsString
    else
      today := ROCDate(now, '');
    
    if UpperCase(SetSys.ReadString('DPD', 'SERVERDATE', '')) <> 'TURE' then
      today := trim(ROCDate(now, ''));
    //if MyIP <> '10.15.2.97' then
      if (getOpdDate < today) then // ( or (trim(ROCTime(now,'')) > '2400')) or (StrToInt(getOpdStatus) in [4,5])
      begin
        ShowPnlMsg('病人已批價，且非看診當日不得修改！');
        Abort;
      end;
    
    if ((trim(MemoS.Text) = '') or (trim(MemoO.Text) = '') or (trim(MemoP.Text) = '') or (trim(MemoH.Text) = '')) and (kind = 0) then
    begin
      ShowPnlMsg('文字醫囑的' + #13 + 'History' + #13 + 'Subjective' + #13 + 'Objective' + #13 + 'MX' + #13 + '內容不得為空白，請重新填寫！');
      Abort;
    end;

    //判斷同月是否就診超過九次 2016/01/27
    tmpSql := getChkSqlStr(84);
    SetParamter(tmpSql, '$NOWFEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$DEPT_CODE$', '40');
    SetParamter(tmpSql, '$YM$', copy(getOpdDate,1,5));
    SetParamter(tmpSql, '$CHR_NO$', getChrNo);
    SQLs1.Text := tmpSql;
    if DM.OpenSQL(SQLs1, Qrys) then
    begin
      if Qrys.FieldByName('times').AsInteger >= 9 then
        msgtem := msgtem + '請注意!! 本月看診次數已超過9次，健保不給付!!';
    end;

    if (icdchange<>'N') then
    begin
      if (trim(SGIcd10.Cells[0, 0]) = '') and (kind = 0) then
      begin
        ShowPnlMsg('ICD10主診斷不得為空，請重新填寫！');
        Abort;
      end;
    end
    else
    begin
      if (trim(SGIcd.Cells[0, 0]) = '') and (kind = 0) then
      begin
        ShowPnlMsg('主診斷不得為空，請重新填寫！');
        Abort;
      end;
    end;

    if DeathChr(kind, getChrNo, msg) then
    begin
      ShowPnlMsg(msg);
      Abort;
    end;

    //20140115
    if (SGMed.Cells[M_Code,0]<> '') and (SGMed.RowCount>1) then
    begin
      //重複用藥pk_drug_warning.p_med_dup_message_opd
      IF UpperCase(Setsys.ReadString('SYSTEM','MED_DUP',''))='TRUE' THEN
        if not CheckDupMed then
        begin
          Result := False;
          Abort;
        end;
    end;

    for i := 0 to SGMed.RowCount - 1 do
    begin
      //20140116特殊藥品開立權限檢核
      if (SGMed.Cells[modifyType, i] = 'N') and (SGMed.Cells[M_Code,i]<> '') and (SGMed.Cells[Del,i]<> 'X') then
        IF UpperCase(SetSys.ReadString('SYSTEM','MED_USE_CTRL','')) = 'TRUE' THEN
          if MedUseCtrl(i, msg) = False then
          begin
            ShowMessage(msg);
            Abort;
          end;

      if (SGMed.Cells[modifyType, i] = 'N') and (SGMed.Cells[M_Code, i] <> '') then
      begin //事審用藥檢核
        MedQtyStr := ChkMedQty(getChrNo, SGMed.Cells[M_Code, i], getFeeNo, getOpdDate, SGMed.Cells[M_INS, i], NullStrTo(SGMed.Cells[M_Qty, i], '0'));
        if Pre_Return_cut_word(MedQtyStr, ';') = 'Y' then
        begin
          ShowPnlMsg(Aft_Return_cut_word(MedQtyStr, ';'));
        end;
        if (Pre_Return_cut_word(MedQtyStr, ';') <> 'O') and (Pre_Return_cut_word(MedQtyStr, ';') <> 'Y') then
        begin
          ShowPnlMsg(Aft_Return_cut_word(MedQtyStr, ';'));
          Abort;
        end;
      end;
    end;


    for i := 0 to SGFee.RowCount - 1 do
    begin
      if (SGFee.Cells[modifyType, i] = 'N') and (SGFee.Cells[F_Code, i] <> '') and (SGFee.Cells[F_Ins, i] = 'Y') then
      begin
        isChkFee := getxml('0', SGFee.Cells[F_Code, i], SGFee.Cells[F_Part, i], SGFee.Cells[F_Qty, i], i);
        if isChkFee then
          Abort;

        //109.11.03 shh ITe 11138 add 抗凝血手術處置檢核
        SQLs1.Text := 'SELECT COUNT(*) cnt FROM B01a_Op_Fee t WHERE t.Cncl_Flag = ''N'' AND t.Fee_Code = ''' + SGFee.Cells[F_Code, i] + '''';
        if DM.OpenSQL(SQLs1, Qrys) then
        begin
          if Qrys.FieldByName('cnt').AsInteger > 0 then
          //有手術處置
          begin
            SQLs1.Text := 'SELECT f_Chk_B01AREPORT(''' + getFeeNo + ''') request, f_Chk_Med_B01a(''' + getFeeNo + ''') B01A FROM dual';
            if DM.OpenSQL(SQLs1, Qrys) then
            begin
              if (Qrys.FieldByName('request').AsString = 'N') and (Qrys.FieldByName('B01A').AsInteger > 0) then
              //有抗凝血藥沒有抗凝血劑停頓計畫
              begin
                ShowPnlMsg('需完成抗凝血劑停頓計畫表格。');

                //開啟ADV程式  //手術排程 (跑檢核)  //抗凝血劑停頓計畫  (直接開啟)
                myStr := Setsys.ReadString('WEB', '抗凝血劑停頓計畫', '');
                myParamter := Setsys.ReadString('PARAMTER', '抗凝血劑停頓計畫', '');
                comStrRep(mystr);
                comstrRep(myParamter);

                if myStr = '' then
                begin
                  Exit;
                end;
                try
                  if winexec(PChar(PChar(myStr) + ' ' + PChar(myParamter)), SW_SHOWNORMAL) < 31 then
                  ShellExecute(Handle, 'open', PChar(myStr), PChar(myParamter), nil, SW_SHOWNORMAL);
                except
                end;
                
                //關閉ADV
                //中斷完診流程
                Abort;
              end;
            end;
          end;
        end;
        //END 109.11.03 shh ITe 11138 add 抗凝血手術處置檢核

      end;
    end;
    //20140212增加給付類別為431..做檢核
    if ReturnName(Pay_Type.Text)='431' then
    begin
      isChkFee := getxml('0', 'F01271C', '', '1', SGFee.RowCount - 1);
      if isChkFee then
        Abort;
    end;

    if ReturnName(Pay_Type.Text)='432' then
    begin
      getxml('0', 'F01272C', '', '1', SGFee.RowCount - 1);
      if isChkFee then
        Abort;
    end;

    if ReturnName(Pay_Type.Text)='433' then
    begin
      getxml('0', 'F01273C', '', '1', SGFee.RowCount - 1);
      if isChkFee then
        Abort;
    end;

    if kind = 0 then
    begin //判斷是否有新增資料未存
      if not ChkLXCOpen(SGLab, 4) then
        Abort;

      if not ChkLXCOpen(SGXray, 5) then
        Abort;

      if not ChkLXCOpen(SGChk, 6) then
        Abort;
    end;

    case (kind) of
      4:
        isRePeat := RePeatOpen(SGLab, '檢驗', msg);
      5:
        isRePeat := RePeatOpen(SGXRay, '放射', msg);
      6:
        isRePeat := RePeatOpen(SGChk, '檢查', msg);
    end;

    if isRePeat then
      if MessageDlg(msg, mtWarning, [mbYes, mbNo], 0) = mrNo then
        Abort;

    isZore := true;
    case (kind) of
      4:
        isZore := ChkQty(SGLab, '檢驗', msg);
      5:
        isZore := ChkQty(SGXRay, '放射', msg);
      6:
        isZore := ChkQty(SGChk, '檢查', msg);
    end;

    if not isZore then
    begin
      ShowPnlMsg(msg);
      Abort;
    end;
    if kind = 0 then
    begin
      isZore := true;
      isZore := ChkQty(SGMed, '用藥', msg);
      if not isZore then
      begin
        ShowPnlMsg(msg);
        Abort;
      end;
      isZore := true;
      isZore := ChkQty(SGFee, '處置', msg);
      if not isZore then
      begin
        ShowPnlMsg(msg);
        Abort;
      end;
      isZore := true;
      isZore := ChkQty(SGMtrl, '衛材', msg);
      if not isZore then
      begin
        ShowPnlMsg(msg);
        Abort;
      end;
    end;



    if getFeeNo = '' then
    begin
      //ShowPnlMsg('無法取得批價序號');
      msgtem := msgtem + '無法取得批價序號';
      BtnLabOpen.Enabled := true;
      Exit;
    end;
    if getOpdDate = '' then
    begin
      //ShowPnlMsg('無法取得就醫日期');
      msgtem := msgtem + '無法取得就醫日期';
      BtnLabOpen.Enabled := true;
      Exit;
    end;
    //use_opd_log(DPD_Ver, '完成判斷是否可繼續');

    MemoS.Text := StringReplace(MemoS.Text, '"', ' ', [rfReplaceAll]);
    MemoO.Text := StringReplace(MemoO.Text, '"', ' ', [rfReplaceAll]);
    MemoP.Text := StringReplace(MemoP.Text, '"', ' ', [rfReplaceAll]);
    MemoH.Text := StringReplace(MemoH.Text, '"', ' ', [rfReplaceAll]);

    //use_opd_log(DPD_Ver, '確認OPD_BASIC1');
    //Qrys.FreeOnRelease;//2015.09.18學承
    if ((getIcSeqNo = '') or (getIcSeqNo = 'IC')) and (getPPatId = '1') then
    begin
      tmpSql := getChkSqlStr(25);
      SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
      SQLs1.Text := tmpSql;
      if DM.OpenSQL(SQLs1, Qrys) then
        setIcSeqNo(trim(Qrys.FieldByName('ic_seq_no').AsString));
    end;

    tmpSql := getChkSqlStr(3);
    SetParamter(tmpSql, '$OPD_KIND$', getOpdKind);
    SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
    SetParamter(tmpSql, '$DEPT_CODE$', getDeptCode);
    SetParamter(tmpSql, '$SHIFT_NO$', getShiftNo);
    SetParamter(tmpSql, '$DEPT_ROOM$', getDeptRoom);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$SEQ_NO$', getSeqNo);
    SetParamter(tmpSql, '$CHR_NO$', getChrNo);
    SQLs1.Text := tmpSql;
    DM.OpenSQL(SQLs1, Qrys);

    tmpSql := '';
    Med_Days := '0';
    med_days_self := '0';
    for i := 0 to SGMed.RowCount - 2 do
    begin
      if (StrToInt(SGMed.Cells[M_Day, i]) > StrToInt(Med_Days)) and ((SGMed.Cells[M_Ins, i] = 'Y') or (SGMed.Cells[M_Ins, i] = 'G')) then
        Med_Days := SGMed.Cells[9, i]
      else if (StrToInt(SGMed.Cells[M_Day, i]) > StrToInt(med_days_self)) and ((SGMed.Cells[M_Ins, i] = 'N') or (SGMed.Cells[M_Ins, i] = 'H')) then
        med_days_self := SGMed.Cells[9, i];
    end;
    if (Med_Days = '0') and (med_days_self <> '0') then
      Med_Days := med_days_self;

    if Qrys.FieldByName('num').AsInteger > 0 then
    begin
      tmpSql := getUpdSql(1);
      SetParamter(tmpSql, '$MED_TYPE$', '1');
      SetParamter(tmpSql, '$CASE_TYPE$', ReturnName(getCASEDESC));
      SetParamter(tmpSql, '$PART_CODE$', ReturnName(getPARTDESC));
      SetParamter(tmpSql, '$PAY_TYPE$', ReturnName(getPAYDESC));
      SetParamter(tmpSql, '$MED_DAYS$', Med_Days);
      //20160105楊學承
      //if kind = 0 then
      //  SetParamter(tmpSql, '$ICD9_CODE1$', SGICD.Cells[0, 0])
      //else
      if trim(SGICD.Cells[0, 0]) = '' then
        SetParamter(tmpSql, '$ICD9_CODE1$', ' ')
      else
        SetParamter(tmpSql, '$ICD9_CODE1$', SGICD.Cells[0, 0]);
      SetParamter(tmpSql, '$ICD9_CODE2$', SGICD.Cells[0, 1]);
      SetParamter(tmpSql, '$ICD9_CODE3$', SGICD.Cells[0, 2]);
      SetParamter(tmpSql, '$ICD9_CODE4$', SGICD.Cells[0, 3]);
      SetParamter(tmpSql, '$ICD9_CODE5$', SGICD.Cells[0, 4]);
      SetParamter(tmpSql, '$ICD9_CODE6$', SGICD.Cells[0, 5]);
      SetParamter(tmpSql, '$ICD9_CODE7$', SGICD.Cells[0, 6]);
      SetParamter(tmpSql, '$ICD9_CODE8$', SGICD.Cells[0, 7]);
      SetParamter(tmpSql, '$ICD9_CODE9$', SGICD.Cells[0, 8]);
      SetParamter(tmpSql, '$ICD9_CODE10$', SGICD.Cells[0, 9]);
      SetParamter(tmpSql, '$ICD10_CODE1$', SGIcd10.Cells[0, 0]);
      SetParamter(tmpSql, '$ICD10_CODE2$', SGIcd10.Cells[0, 1]);
      SetParamter(tmpSql, '$ICD10_CODE3$', SGIcd10.Cells[0, 2]);
      SetParamter(tmpSql, '$ICD10_CODE4$', SGIcd10.Cells[0, 3]);
      SetParamter(tmpSql, '$ICD10_CODE5$', SGIcd10.Cells[0, 4]);
      //if kind = 0 then
      //  SetParamter(tmpSql, '$ICD9_DESC1$', SGICD.Cells[2, 0])
      //else
      if trim(SGICD.Cells[2, 0]) = '' then
        SetParamter(tmpSql, '$ICD9_DESC1$', ' ')
      else
        SetParamter(tmpSql, '$ICD9_DESC1$', SGICD.Cells[2, 0]);
      SetParamter(tmpSql, '$ICD9_DESC2$', SGICD.Cells[2, 1]);
      SetParamter(tmpSql, '$ICD9_DESC3$', SGICD.Cells[2, 2]);
      SetParamter(tmpSql, '$ICD9_DESC4$', SGICD.Cells[2, 3]);
      SetParamter(tmpSql, '$ICD9_DESC5$', SGICD.Cells[2, 4]);
      SetParamter(tmpSql, '$ICD9_DESC6$', SGICD.Cells[2, 5]);
      SetParamter(tmpSql, '$ICD9_DESC7$', SGICD.Cells[2, 6]);
      SetParamter(tmpSql, '$ICD9_DESC8$', SGICD.Cells[2, 7]);
      SetParamter(tmpSql, '$ICD9_DESC9$', SGICD.Cells[2, 8]);
      SetParamter(tmpSql, '$ICD9_DESC10$', SGICD.Cells[2, 9]);
      SetParamter(tmpSql, '$NOTE1$', MemoS.Text);
      SetParamter(tmpSql, '$NOTE2$', MemoO.Text);
      SetParamter(tmpSql, '$H$', MemoH.Text);
      SetParamter(tmpSql, '$FEE_CONTEN$', MemoP.Text);
      SetParamter(tmpSql, '$PAIN_SCORE$', getPainScore);
      SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
      SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
      SetParamter(tmpSql, '$UPD_TIME$', ROCTime(now, ''));
      SetParamter(tmpSql, '$ORDER_FLAG$', ' ');
      SetParamter(tmpSql, '$INS_DOC$', getDocCode2);
      SetParamter(tmpSql, '$FEAT_DOC$', getDocCode3);
      SetParamter(tmpSql, '$PAT_ID$', getPPatId);
      if (ReturnName(getPARTDESC) = '009') or (getPPatId = '2') then
        SetParamter(tmpSql, '$VOTE_TYPE$', 'A')
      else
        SetParamter(tmpSql, '$VOTE_TYPE$', ' ');
      {
      if (ReturnName(getPARTDESC) = '009') or (ChkIdl.Checked) then
        SetParamter(tmpSql, '$DIAG_FLAG$', 'Y')
      else
        SetParamter(tmpSql, '$DIAG_FLAG$', 'N');
      }

      if ((ReturnName(getPARTDESC) = '009') and (ChkIdl.Checked)) or (ChkIdl.Checked) then
        SetParamter(tmpSql, '$DIAG_FLAG$', 'Y')
      else
        SetParamter(tmpSql, '$DIAG_FLAG$', 'N');


      if getIcSeqNo = '' then
        SetParamter(tmpSql, '$INS_SEQ_NO$', 'IC')
      else
        SetParamter(tmpSql, '$INS_SEQ_NO$', getIcSeqNo);
      SetParamter(tmpSql, '$MED_NO$', IntToStr(seq));
      SetParamter(tmpSql, '$FIRST_DATE$', getFirstDate);
      SetParamter(tmpSql, '$FIRST_INS_SEQ_NO$', getFirstInsSeqNo);
      SetParamter(tmpSql, '$HOSP_IN$', NullStrTo(Referral,' '));
      SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
      SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    end
    else
    begin
      tmpSql := getInsertSql(1);
      SetParamter(tmpSql, '$OPD_KIND$', getOpdKind);
      SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
      SetParamter(tmpSql, '$DEPT_CODE$', getDeptCode);
      SetParamter(tmpSql, '$SHIFT_NO$', getShiftNo);
      SetParamter(tmpSql, '$DEPT_ROOM$', getDeptRooM);
      SetParamter(tmpSql, '$DOC_CODE$', getDocCode);
      SetParamter(tmpSql, '$SEQ_NO$', getSeqNo);
      SetParamter(tmpSql, '$CHR_NO$', getChrNo);
      SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
      SetParamter(tmpSql, '$PAT_ID$', getPPatId);
      if getIcSeqNo = '' then
        SetParamter(tmpSql, '$INS_SEQ_NO$', 'IC')
      else
        SetParamter(tmpSql, '$INS_SEQ_NO$', getIcSeqNo);
      SetParamter(tmpSql, '$PROG_FLAG$', 'N');
      if trim(SGICD.Cells[0, 0]) = '' then
        SetParamter(tmpSql, '$ICD9_CODE1$', ' ')
      else
        SetParamter(tmpSql, '$ICD9_CODE1$', SGICD.Cells[0, 0]);
      SetParamter(tmpSql, '$ICD9_CODE2$', SGICD.Cells[0, 1]);
      SetParamter(tmpSql, '$ICD9_CODE3$', SGICD.Cells[0, 2]);
      SetParamter(tmpSql, '$ICD9_CODE4$', SGICD.Cells[0, 3]);
      SetParamter(tmpSql, '$ICD9_CODE5$', SGICD.Cells[0, 4]);
      SetParamter(tmpSql, '$ICD9_CODE6$', SGICD.Cells[0, 5]);
      SetParamter(tmpSql, '$ICD9_CODE7$', SGICD.Cells[0, 6]);
      SetParamter(tmpSql, '$ICD9_CODE8$', SGICD.Cells[0, 7]);
      SetParamter(tmpSql, '$ICD9_CODE9$', SGICD.Cells[0, 8]);
      SetParamter(tmpSql, '$ICD9_CODE10$', SGICD.Cells[0, 9]);
      SetParamter(tmpSql, '$ICD9_DESC1$', SGICD.Cells[2, 0]);
      SetParamter(tmpSql, '$ICD9_DESC2$', SGICD.Cells[2, 1]);
      SetParamter(tmpSql, '$ICD9_DESC3$', SGICD.Cells[2, 2]);
      SetParamter(tmpSql, '$ICD9_DESC4$', SGICD.Cells[2, 3]);
      SetParamter(tmpSql, '$ICD9_DESC5$', SGICD.Cells[2, 4]);
      SetParamter(tmpSql, '$ICD9_DESC6$', SGICD.Cells[2, 5]);
      SetParamter(tmpSql, '$ICD9_DESC7$', SGICD.Cells[2, 6]);
      SetParamter(tmpSql, '$ICD9_DESC8$', SGICD.Cells[2, 7]);
      SetParamter(tmpSql, '$ICD9_DESC9$', SGICD.Cells[2, 8]);
      SetParamter(tmpSql, '$ICD9_DESC10$', SGICD.Cells[2, 9]);
      SetParamter(tmpSql, '$ICD10_CODE1$', SGIcd10.Cells[0, 0]);
      SetParamter(tmpSql, '$ICD10_CODE2$', SGIcd10.Cells[0, 1]);
      SetParamter(tmpSql, '$ICD10_CODE3$', SGIcd10.Cells[0, 2]);
      SetParamter(tmpSql, '$ICD10_CODE4$', SGIcd10.Cells[0, 3]);
      SetParamter(tmpSql, '$ICD10_CODE5$', SGIcd10.Cells[0, 4]);
      if (ReturnName(getPARTDESC) = '009') or (ChkIdl.Checked) then
        SetParamter(tmpSql, '$DIAG_FLAG$', 'Y')
      else
        SetParamter(tmpSql, '$DIAG_FLAG$', 'N');
      SetParamter(tmpSql, '$PAT_NAME$', getPatName);
      SetParamter(tmpSql, '$DISC_CODE$', getDiscCode);
      SetParamter(tmpSql, '$MED_TYPE$', '1');
      SetParamter(tmpSql, '$CASE_TYPE$', ReturnName(getCASEDESC));
      SetParamter(tmpSql, '$PART_CODE$', ReturnName(getPARTDESC));
      SetParamter(tmpSql, '$PAY_TYPE$', ReturnName(getPAYDESC));
      SetParamter(tmpSql, '$MED_DAYS$', Med_Days);
      SetParamter(tmpSql, '$NOTE1$', MemoS.Text);
      SetParamter(tmpSql, '$NOTE2$', MemoO.Text);
      SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
      SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
      SetParamter(tmpSql, '$UPD_TIME$', ROCTime(now, ''));
      SetParamter(tmpSql, '$ORDER_FLAG$', ' ');
      SetParamter(tmpSql, '$MED_NO$', '1');
      SetParamter(tmpSql, '$PRINT_FLAG$', '1');
      SetParamter(tmpSql, '$UPD_IP$', MyIp);
      SetParamter(tmpSql, '$EXE_DOC$', getDocCode1);
      SetParamter(tmpSql, '$INS_DOC$', getDocCode2);
      SetParamter(tmpSql, '$FEAT_DOC$', getDocCode3);
      if (ReturnName(getPARTDESC) = '009') or (getPPatId = '2') then
        SetParamter(tmpSql, '$VOTE_TYPE$', 'A')
      else
        SetParamter(tmpSql, '$VOTE_TYPE$', ' ');
      SetParamter(tmpSql, '$PAIN_SCORE$', getPainScore);
      SetParamter(tmpSql, '$H$', MemoH.Text);
      SetParamter(tmpSql, '$FEE_CONTEN$', MemoP.Text);
      SetParamter(tmpSql, '$FIRST_DATE$', getFirstDate);
      SetParamter(tmpSql, '$FIRST_INS_SEQ_NO$', getFirstInsSeqNo);
      SetParamter(tmpSql, '$HOSP_IN$', NullStrTo(Referral,' '));
      SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
      SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    end;
    SQLs := TStringList.Create;
    SQLs.Add(tmpSql);
    SQLo.Add(SQLs);
    //use_opd_log(DPD_Ver, '確認OPD_BASIC1完畢');

    //刪除ICD10
    tmpSql := sqlstr(31);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
    SQLs := TStringList.Create;
    SQLs.Add(tmpSql);
    SQLo.Add(SQLs);
    //寫入ICD10
    for i := 0 to SGIcd10.RowCount -1 do
    begin
      if SGIcd10.Cells[0,i]<> '' then
      begin
        tmpSql := sqlstr(2);
        SetParamter(tmpSql, '$ORDER_KIND$', 'DPD');
        SetParamter(tmpSql, '$ORDER_TYPE$', 'N');
        SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
        SetParamter(tmpSql, '$SEQ_NO$', IntToStr(i+1));
        SetParamter(tmpSql, '$ICD_CODE$', trim(SGIcd10.Cells[0,i]) );
        SetParamter(tmpSql, '$ICD_SYSTEM$', 'CM');
        SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
        SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
        SetParamter(tmpSql, '$UPD_TIME$', ROCTime(now, ''));
        SetParamter(tmpSql, '$ICD_TRANS_CODE$', trim(SGIcd10.Cells[7,i]) );
        SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
        SQLs := TStringList.Create;
        SQLs.Add(tmpSql);
        SQLo.Add(SQLs);
      end;
    end;

    QuerySql := '';
    SQLs1.Clear;
    QuerySql := getChkSqlStr(6);
    SetParamter(QuerySql, '$FEE_NO$', getFeeNo);
    SetParamter(QuerySql, '$OPD_DATE$', getOpdDate);

    SQLs1.Text := QuerySql;

    //use_opd_log(DPD_Ver, '開始寫入DPD_ALL_ORDER');
    Qrys.FreeOnRelease;
    if DM.OpenSQL(SQLs1, Qrys) then
    begin
      seq_no := Qrys.FieldByName('max_seq_no').AsInteger;
      seq := Qrys.FieldByName('max_seq').AsInteger + 1;
      sheet_no := Qrys.FieldByName('max_sheet_no').AsInteger;
    end;

    QuerySql := '';
    SQLs1.Clear;
    QuerySql := getChkSqlStr(71);
    SetParamter(QuerySql, '$FEE_NO$', getFeeNo);
    SQLs1.Text := QuerySql;
    tmpSql := '';
    tmpSql := getInsertSql(6);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    if DM.OpenSQL(SQLs1, Qrys) then
      SetParamter(tmpSql, '$SEQ_NO$', IntToStr(Qrys.FieldByName('seq').AsInteger + 1))
    else
      SetParamter(tmpSql, '$SEQ_NO$', '1');
    SetParamter(tmpSql, '$S$', MemoS.Text);
    SetParamter(tmpSql, '$O$', MemoO.Text);
    SetParamter(tmpSql, '$P$', MemoP.Text);
    SetParamter(tmpSql, '$H$', MemoH.Text);
    SQLs := TStringList.Create;
    SQLs.Add(tmpSql);
    SQLo.Add(SQLs);


    if kind in [4, 5, 6] then
    begin
      tmpSql := '';
      tmpSql := getUpdSql(2);
      SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
      SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
      SetParamter(tmpSql, '$DC_DATE$', ROCDate(now, ''));
      SetParamter(tmpSql, '$DC_TIME$', ROCTime(now, ''));
      SetParamter(tmpSql, '$DC_OPER$', getDocCode1);
      OrderType := '';
      case kind of
        4:
          begin
            tmpSG := SGLab;
            OrderType := 'L';
          end;
        5:
          begin
            tmpSG := SGXRay;
            OrderType := 'X';
          end;
        6:
          begin
            tmpSG := SGChk;
            OrderType := 'C';
          end;
      end;
      SetParamter(tmpSql, '$SO_FLAG$', OrderType);
      SQLs := TStringList.Create;
      SQLs.Add(tmpSql);
      SQLo.Add(SQLs);

      if OrderType = 'X' then//DC前次order
      begin
        tmpSql := getUpdSql(2);
        SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
        SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
        SetParamter(tmpSql, '$DC_DATE$', ROCDate(now, ''));
        SetParamter(tmpSql, '$DC_TIME$', ROCTime(now, ''));
        SetParamter(tmpSql, '$DC_OPER$', getDocCode1);
        SetParamter(tmpSql, '$SO_FLAG$', 'T');
        SQLs := TStringList.Create;
        SQLs.Add(tmpSql);
        SQLo.Add(SQLs);
      end;
      //牙科放射單Tooth_Opd_Xray經由PK_OPD_ALL_order寫入
      for i := 0 to tmpSG.RowCount - 1 do
      begin
        if tmpSG.Cells[C_Code, i] <> '' then
        begin
          SQLs := TStringList.Create;
          tmpSql := '';
          Inc(sheet_no);
          Inc(seq_no);
          tmpSql := getInsertSql(2);
          SetParamter(tmpSql, '$SHEET_NO$', IntToStr(sheet_no));
          SetParamter(tmpSql, '$ORDER_TEXT$', '');
          SetParamter(tmpSql, '$SEQ$', IntToStr(seq));
          SetParamter(tmpSql, '$SEQ_NO$', IntToStr(seq_no));
          SetParamter(tmpSql, '$SEQ_NO_OLD$', tmpSG.Cells[1, i]);
          SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
          SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
          SetParamter(tmpSql, '$ORDER_TIME$', ROCTimes(now, ''));
          if copy(trim(tmpSG.Cells[C_Kind, i]), 1, 1) = 'T' then
            SetParamter(tmpSql, '$SO_FLAG$', 'T')
          else
            SetParamter(tmpSql, '$SO_FLAG$', OrderType);
          SetParamter(tmpSql, '$FEE_CODE$', tmpSG.Cells[C_Code, i]);
          SetParamter(tmpSql, '$FEE_NAME$', tmpSG.Cells[C_Order, i]);
          SetParamter(tmpSql, '$ORDER_DOC$', getDocCode1);
          SetParamter(tmpSql, '$EXEC_DOC$', getDocCode1);
          SetParamter(tmpSql, '$ORDER_TYPE$', tmpSG.Cells[C_Kind, i]);
          SetParamter(tmpSql, '$ORDER_DAYS$', '');
          SetParamter(tmpSql, '$QTY_NUM$', tmpSG.Cells[C_Qty, i]);
          SetParamter(tmpSql, '$UNIT_DESC$', tmpSG.Cells[C_Unit, i]);
          SetParamter(tmpSql, '$CIR_CODE$', tmpSG.Cells[C_Cir, i]);
          SetParamter(tmpSql, '$PATH_CODE$', tmpSG.Cells[C_path, i]);
          SetParamter(tmpSql, '$SELF_PAY_FLAG$', tmpSG.Cells[C_INS, i]);
          SetParamter(tmpSql, '$URG_FLAG$', tmpSG.Cells[C_EMG, i]);
          SetParamter(tmpSql, '$DC_FLAG$', 'N');
          SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
          SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
          SetParamter(tmpSql, '$UPD_TIME$', ROCTimes(now, ''));
          SetParamter(tmpSql, '$LAB_NO$', tmpSG.Cells[C_NO, i]); //Leo Check
          SetParamter(tmpSql, '$MEMO_DESC$', tmpSG.Cells[C_MEMO, i]);
          SetParamter(tmpSql, '$PROG_FLAG$', 'N');
          SetParamter(tmpSql, '$PRINT_FLAG$', 'Y');
          if kind = 6 then
            SetParamter(tmpSql, '$ARRG_FLAG$', 'Y')
          else
            SetParamter(tmpSql, '$ARRG_FLAG$', 'N');
          SetParamter(tmpSql, '$DEL_FLAG$', 'N');
          SetParamter(tmpSql, '$Exper_type$', tmpSG.Cells[C_Send, i]);
          SetParamter(tmpSql, '$Exper_class$', tmpSG.Cells[C_2Send, i]);
          if copy(trim(tmpSG.Cells[C_Kind, i]), 1, 1) = 'T' then
            SetParamter(tmpSql, '$Part_code$', trim(tmpSG.Cells[C_Unit, i]))
          else
            SetParamter(tmpSql, '$Part_code$', '');
          SetParamter(tmpSql, '$GRIND_FLAG$', 'N');
          SetParamter(tmpSql, '$PAY_FLAG$', tmpSG.Cells[C_INS, i]);
          SetParamter(tmpSql, '$TTL_QTY$', tmpSG.Cells[C_Qty, i]);
          SetParamter(tmpSql, '$ORDER_SEQ$', tmpSG.Cells[C_Order_Seq, i]);

          SQLs.Add(tmpSql);
          SQLo.Add(SQLs);
          if tmpSG.Cells[Del, i] = 'X' then //刪除update 狀態
          begin
            SQLs := TStringList.Create;
            tmpSql := '';
            tmpSql := getUpdSql(3);
            SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
            SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
            SetParamter(tmpSql, '$DC_DATE$', ROCDate(now, ''));
            SetParamter(tmpSql, '$DC_TIME$', ROCTime(now, ''));
            SetParamter(tmpSql, '$DC_OPER$', getDocCode1);
            if copy(trim(tmpSG.Cells[C_Kind, i]), 1, 1) = 'T' then
              SetParamter(tmpSql, '$SO_FLAG$', 'T')
            else
              SetParamter(tmpSql, '$SO_FLAG$', OrderType);
            //已寫在SQL內
            //SetParamter(tmpSql, '$DEL_FLAG$', 'Y');
            SetParamter(tmpSql, '$FEE_CODE$', tmpSG.Cells[C_Code, i]);
            SetParamter(tmpSql, '$SEQ_NO$', IntToStr(seq_no));
            SQLs.Add(tmpSql);
            SQLo.Add(SQLs);
          end
        end;
      end;
    end
    else
    begin
      tmpSql := '';
      tmpSql := getUpdSql(2);
      SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
      SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
      SetParamter(tmpSql, '$DC_DATE$', ROCDate(now, ''));
      SetParamter(tmpSql, '$DC_TIME$', ROCTime(now, ''));
      SetParamter(tmpSql, '$DC_OPER$', getDocCode1);
      SetParamter(tmpSql, '$SO_FLAG$', 'M');
      SQLs := TStringList.Create;
      SQLs.Add(tmpSql);
      SQLo.Add(SQLs);

      for i := 0 to SGMed.RowCount - 1 do
      begin
        if SGMed.Cells[M_Code, i] <> '' then
        begin
          SQLs := TStringList.Create;
          tmpSql := '';
          Inc(sheet_no);
          Inc(seq_no);
          tmpSql := getInsertSql(2);
          if Kind = 0 then
            SetParamter(tmpSql, '$SHEET_NO$', IntToStr(sheet_no))
          else
            SetParamter(tmpSql, '$SHEET_NO$', getFeeNo);
          SetParamter(tmpSql, '$ORDER_TEXT$', SGMed.Cells[M_Order_Text, i]);
          SetParamter(tmpSql, '$SEQ$', IntToStr(seq));
          SetParamter(tmpSql, '$SEQ_NO$', IntToStr(seq_no));
          SetParamter(tmpSql, '$SEQ_NO_OLD$', SGMed.Cells[1, i]);
          SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
          SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
          SetParamter(tmpSql, '$ORDER_TIME$', ROCTimes(now, ''));
          SetParamter(tmpSql, '$SO_FLAG$', SGMed.Cells[M_Kind, i]);
          SetParamter(tmpSql, '$FEE_CODE$', SGMed.Cells[M_Code, i]);
          SetParamter(tmpSql, '$FEE_NAME$', SGMed.Cells[M_Order, i]);
          SetParamter(tmpSql, '$ORDER_DOC$', getDocCode1);
          SetParamter(tmpSql, '$EXEC_DOC$', getDocCode1);
          SetParamter(tmpSql, '$ORDER_TYPE$', SGMed.Cells[M_Kind, i]);
          SetParamter(tmpSql, '$ORDER_DAYS$', SGMed.Cells[M_day, i]);
          SetParamter(tmpSql, '$QTY_NUM$', SGMed.Cells[M_Qty, i]);
          SetParamter(tmpSql, '$UNIT_DESC$', SGMed.Cells[M_Unit, i]);
          SetParamter(tmpSql, '$CIR_CODE$', SGMed.Cells[M_Cir, i]);
          SetParamter(tmpSql, '$PATH_CODE$', SGMed.Cells[M_path, i]);
          SetParamter(tmpSql, '$SELF_PAY_FLAG$', UpperCase(trim(SGMed.Cells[M_INS, i])));
          SetParamter(tmpSql, '$URG_FLAG$', 'N');
          SetParamter(tmpSql, '$DC_FLAG$', 'N');
          SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
          SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
          SetParamter(tmpSql, '$UPD_TIME$', ROCTimes(now, ''));
          SetParamter(tmpSql, '$LAB_NO$', ''); //Leo Check
          SetParamter(tmpSql, '$MEMO_DESC$', SGMed.Cells[M_MEMO, i]);
          SetParamter(tmpSql, '$PROG_FLAG$', 'N');
          SetParamter(tmpSql, '$PRINT_FLAG$', 'Y');
          if kind = 6 then
            SetParamter(tmpSql, '$ARRG_FLAG$', 'Y')
          else
            SetParamter(tmpSql, '$ARRG_FLAG$', 'N');
          SetParamter(tmpSql, '$DEL_FLAG$', 'N');
          SetParamter(tmpSql, '$DEL_FLAG$', 'N');
          SetParamter(tmpSql, '$Exper_type$', '');
          SetParamter(tmpSql, '$Exper_class$', '');
          SetParamter(tmpSql, '$Part_code$', '');
          SetParamter(tmpSql, '$GRIND_FLAG$', SGMed.Cells[M_GRI, i]);
          SetParamter(tmpSql, '$PAY_FLAG$', UpperCase(trim(SGMed.Cells[M_INS, i])));
          SetParamter(tmpSql, '$TTL_QTY$', SGMed.Cells[M_Ttl, i]);
          SetParamter(tmpSql, '$ORDER_SEQ$', SGMed.Cells[M_Order_Seq, i]);

          SQLs.Add(tmpSql);
          SQLo.Add(SQLs);
          if SGMed.Cells[Del, i] = 'X' then
          begin
            SQLs := TStringList.Create;
            tmpSql := '';
            tmpSql := getUpdSql(3);
            SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
            SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
            SetParamter(tmpSql, '$DC_DATE$', ROCDate(now, ''));
            SetParamter(tmpSql, '$DC_TIME$', ROCTime(now, ''));
            SetParamter(tmpSql, '$DC_OPER$', getDocCode1);
            SetParamter(tmpSql, '$SO_FLAG$', 'M');
            SetParamter(tmpSql, '$FEE_CODE$', SGMed.Cells[M_Code, i]);
            SetParamter(tmpSql, '$SEQ_NO$', IntToStr(seq_no));
            SQLs.Add(tmpSql);
            SQLo.Add(SQLs);
          end;
        end;
      end;

      //新增病理20140211
      tmpSql := getUpdSql(2);
      SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
      SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
      SetParamter(tmpSql, '$DC_DATE$', ROCDate(now, ''));
      SetParamter(tmpSql, '$DC_TIME$', ROCTime(now, ''));
      SetParamter(tmpSql, '$DC_OPER$', getDocCode1);
      SetParamter(tmpSql, '$SO_FLAG$', 'F');
      SQLs := TStringList.Create;
      SQLs.Add(tmpSql);
      SQLo.Add(SQLs);
      for i := 0 to SGPath.RowCount - 1 do
      begin
        if SGPath.Cells[F_Code, i] <> '' then
        begin
          SQLs := TStringList.Create;
          tmpSql := '';
          Inc(sheet_no);
          Inc(seq_no);
          tmpSql := getInsertSql(2);
          if Kind = 0 then
            SetParamter(tmpSql, '$SHEET_NO$', IntToStr(sheet_no))
          else
            SetParamter(tmpSql, '$SHEET_NO$', getFeeNo);
          SetParamter(tmpSql, '$ORDER_TEXT$', SGPath.Cells[F_Order_Text, i]);
          SetParamter(tmpSql, '$SEQ$', IntToStr(seq));
          SetParamter(tmpSql, '$SEQ_NO$', IntToStr(seq_no));
          SetParamter(tmpSql, '$SEQ_NO_OLD$', SGPath.Cells[1, i]);
          SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
          SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
          SetParamter(tmpSql, '$ORDER_TIME$', ROCTimes(now, ''));
          SetParamter(tmpSql, '$SO_FLAG$', 'F');
          SetParamter(tmpSql, '$FEE_CODE$', trim(SGPath.Cells[Pth_code,i]));
          SetParamter(tmpSql, '$FEE_NAME$', SGPath.Cells[Pth_order, i]);
          SetParamter(tmpSql, '$ORDER_DOC$', getDocCode1);
          SetParamter(tmpSql, '$EXEC_DOC$', getDocCode1);
          SetParamter(tmpSql, '$ORDER_TYPE$', 'PA');
          SetParamter(tmpSql, '$ORDER_DAYS$', '0');
          SetParamter(tmpSql, '$QTY_NUM$', SGPath.Cells[Pth_Qty, i]);
          SetParamter(tmpSql, '$UNIT_DESC$', '');
          SetParamter(tmpSql, '$CIR_CODE$', '');
          SetParamter(tmpSql, '$PATH_CODE$', '');
          SetParamter(tmpSql, '$SELF_PAY_FLAG$', SGPath.Cells[Pth_Ins, i]);
          SetParamter(tmpSql, '$URG_FLAG$', 'N');
          if SGPath.Cells[Del, i] = 'X' then
          begin
            SetParamter(tmpSql, '$DC_FLAG$', 'Y');
            SetParamter(tmpSql, '$DEL_FLAG$', 'Y');
          end
          else
          begin
            SetParamter(tmpSql, '$DC_FLAG$', 'N');
            SetParamter(tmpSql, '$DEL_FLAG$', 'N');
          end;
          SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
          SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
          SetParamter(tmpSql, '$UPD_TIME$', ROCTimes(now, ''));
          SetParamter(tmpSql, '$LAB_NO$', '');
          SetParamter(tmpSql, '$MEMO_DESC$', '');
          SetParamter(tmpSql, '$PROG_FLAG$', 'N');
          SetParamter(tmpSql, '$PRINT_FLAG$', 'Y');
          if kind = 6 then
            SetParamter(tmpSql, '$ARRG_FLAG$', 'Y')
          else
            SetParamter(tmpSql, '$ARRG_FLAG$', 'N');
          SetParamter(tmpSql, '$Exper_type$', '');
          SetParamter(tmpSql, '$Exper_class$', '');
          SetParamter(tmpSql, '$Part_code$', '');
          SetParamter(tmpSql, '$GRIND_FLAG$', 'N');
          SetParamter(tmpSql, '$PAY_FLAG$', SGPath.Cells[pth_Ins, i]);
          SetParamter(tmpSql, '$TTL_QTY$', SGPath.Cells[Pth_Qty, i]);
          SetParamter(tmpSql, '$ORDER_SEQ$', SGPath.Cells[Pth_seqno2, i]);

          SQLs.Add(tmpSql);
          SQLo.Add(SQLs);
          if SGPath.Cells[Del, i] = 'X' then
          begin
            SQLs := TStringList.Create;
            tmpSql := '';
            tmpSql := getUpdSql(3);
            SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
            SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
            SetParamter(tmpSql, '$DC_DATE$', ROCDate(now, ''));
            SetParamter(tmpSql, '$DC_TIME$', ROCTime(now, ''));
            SetParamter(tmpSql, '$DC_OPER$', getDocCode1);
            SetParamter(tmpSql, '$SO_FLAG$', 'F');
            SetParamter(tmpSql, '$FEE_CODE$', SGPath.Cells[F_Code, i]);
            SetParamter(tmpSql, '$SEQ_NO$', IntToStr(seq_no));
            SQLs.Add(tmpSql);
            SQLo.Add(SQLs);
          end;
          //update opd_path seq_no2
          if (SGPath.Cells[Del,i]<>'X') then
            tmpSql := 'update opd_path set SHEET_NO='+Qt(IntToStr(sheet_no))+
                   ' ,SEQ='+qt(IntToStr(seq_no))+' where fee_no='+qt(getFeeNo)+' and path_no='+qt(trim(SGPath.Cells[pth_no,i]))+' and seq_no='+qt(trim(SGPath.Cells[Pth_seqno,i]))
          else
            tmpSql := 'update opd_path set dc_sheet_no='+Qt(IntToStr(sheet_no))+
                   ' ,SEQ='+qt(IntToStr(seq_no))+' where fee_no='+qt(getFeeNo)+' and path_no='+qt(trim(SGPath.Cells[pth_no,i]))+' and seq_no='+qt(trim(SGPath.Cells[Pth_seqno,i]));
          SQLs := TStringList.Create;
          SQLs.Add(tmpSql);
          SQLo.Add(SQLs);
        end;
      end;


      for i := 0 to SGFee.RowCount - 1 do
      begin
        if SGFee.Cells[F_Code, i] <> '' then
        begin
          SQLs := TStringList.Create;
          tmpSql := '';
          Inc(sheet_no);
          Inc(seq_no);
          tmpSql := getInsertSql(2);
          if Kind = 0 then
            SetParamter(tmpSql, '$SHEET_NO$', IntToStr(sheet_no))
          else
            SetParamter(tmpSql, '$SHEET_NO$', getFeeNo);
          SetParamter(tmpSql, '$ORDER_TEXT$', SGFee.Cells[F_Order_Text, i]);
          SetParamter(tmpSql, '$SEQ$', IntToStr(seq));
          SetParamter(tmpSql, '$SEQ_NO$', IntToStr(seq_no));
          SetParamter(tmpSql, '$SEQ_NO_OLD$', SGFee.Cells[1, i]);
          SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
          SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
          SetParamter(tmpSql, '$ORDER_TIME$', ROCTimes(now, ''));
          SetParamter(tmpSql, '$SO_FLAG$', SGFee.Cells[F_Kind, i]);
          SetParamter(tmpSql, '$FEE_CODE$', SGFee.Cells[F_Code, i]);
          SetParamter(tmpSql, '$FEE_NAME$', SGFee.Cells[F_Name, i]);
          SetParamter(tmpSql, '$ORDER_DOC$', getDocCode1);
          SetParamter(tmpSql, '$EXEC_DOC$', getDocCode1);
          SetParamter(tmpSql, '$ORDER_TYPE$', SGFee.Cells[F_Kind, i]);
          SetParamter(tmpSql, '$ORDER_DAYS$', '');
          SetParamter(tmpSql, '$QTY_NUM$', SGFee.Cells[F_Qty, i]);
          SetParamter(tmpSql, '$UNIT_DESC$', '');
          SetParamter(tmpSql, '$CIR_CODE$', '');
          SetParamter(tmpSql, '$PATH_CODE$', '');
          SetParamter(tmpSql, '$SELF_PAY_FLAG$', SGFee.Cells[F_INS, i]);
          SetParamter(tmpSql, '$URG_FLAG$', '');
          SetParamter(tmpSql, '$DC_FLAG$', 'N');
          SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
          SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
          SetParamter(tmpSql, '$UPD_TIME$', ROCTimes(now, ''));
          SetParamter(tmpSql, '$LAB_NO$', '');
          SetParamter(tmpSql, '$MEMO_DESC$', SGFee.Cells[F_MEMO, i]);
          SetParamter(tmpSql, '$PROG_FLAG$', 'N');
          SetParamter(tmpSql, '$PRINT_FLAG$', 'Y');
          if kind = 6 then
            SetParamter(tmpSql, '$ARRG_FLAG$', 'Y')
          else
            SetParamter(tmpSql, '$ARRG_FLAG$', 'N');
          SetParamter(tmpSql, '$DEL_FLAG$', 'N');
          SetParamter(tmpSql, '$Exper_type$', '');
          SetParamter(tmpSql, '$Exper_class$', '');
          SetParamter(tmpSql, '$Part_code$', SGFee.Cells[F_Part, i]);
          SetParamter(tmpSql, '$GRIND_FLAG$', 'N');
          SetParamter(tmpSql, '$PAY_FLAG$', SGFee.Cells[F_INS, i]);
          SetParamter(tmpSql, '$TTL_QTY$', SGFee.Cells[F_Qty, i]);
          SetParamter(tmpSql, '$ORDER_SEQ$', SGFee.Cells[F_Order_Seq, i]);

          SQLs.Add(tmpSql);
          SQLo.Add(SQLs);
          if SGFee.Cells[Del, i] = 'X' then
          begin
            SQLs := TStringList.Create;
            tmpSql := '';
            tmpSql := getUpdSql(3);
            SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
            SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
            SetParamter(tmpSql, '$DC_DATE$', ROCDate(now, ''));
            SetParamter(tmpSql, '$DC_TIME$', ROCTime(now, ''));
            SetParamter(tmpSql, '$DC_OPER$', getDocCode1);
            SetParamter(tmpSql, '$SO_FLAG$', 'F');
            SetParamter(tmpSql, '$FEE_CODE$', SGFee.Cells[F_Code, i]);
            SetParamter(tmpSql, '$SEQ_NO$', IntToStr(seq_no));
            SQLs.Add(tmpSql);
            SQLo.Add(SQLs);
          end
        end;
      end;

      tmpSql := getUpdSql(2);
      SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
      SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
      SetParamter(tmpSql, '$DC_DATE$', ROCDate(now, ''));
      SetParamter(tmpSql, '$DC_TIME$', ROCTime(now, ''));
      SetParamter(tmpSql, '$DC_OPER$', getDocCode1);
      SetParamter(tmpSql, '$SO_FLAG$', 'O');
      SQLs := TStringList.Create;
      SQLs.Add(tmpSql);
      SQLo.Add(SQLs);
      for i := 0 to SGMtrl.RowCount - 1 do
      begin
        if SGMtrl.Cells[O_Code, i] <> '' then
        begin
          SQLs := TStringList.Create;
          tmpSql := '';

          Inc(sheet_no);
          Inc(seq_no);
          tmpSql := getInsertSql(2);
          if Kind = 0 then
            SetParamter(tmpSql, '$SHEET_NO$', IntToStr(sheet_no))
          else
            SetParamter(tmpSql, '$SHEET_NO$', getFeeNo);
          SetParamter(tmpSql, '$ORDER_TEXT$', SGMtrl.Cells[O_Order_Text, i]);
          SetParamter(tmpSql, '$SEQ$', IntToStr(seq));
          SetParamter(tmpSql, '$SEQ_NO$', IntToStr(seq_no));
          SetParamter(tmpSql, '$SEQ_NO_OLD$', SGMtrl.Cells[1, i]);
          SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
          SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
          SetParamter(tmpSql, '$ORDER_TIME$', ROCTimes(now, ''));
          SetParamter(tmpSql, '$SO_FLAG$', SGMtrl.Cells[O_Kind, i]);
          SetParamter(tmpSql, '$FEE_CODE$', SGMtrl.Cells[O_Code, i]);
          SetParamter(tmpSql, '$FEE_NAME$', SGMtrl.Cells[O_Name, i]);
          SetParamter(tmpSql, '$ORDER_DOC$', getDocCode1);
          SetParamter(tmpSql, '$EXEC_DOC$', getDocCode1);
          SetParamter(tmpSql, '$ORDER_TYPE$', SGMtrl.Cells[O_Kind, i]);
          SetParamter(tmpSql, '$ORDER_DAYS$', '');
          SetParamter(tmpSql, '$QTY_NUM$', SGMtrl.Cells[O_Qty, i]);
          SetParamter(tmpSql, '$UNIT_DESC$', '');
          SetParamter(tmpSql, '$CIR_CODE$', '');
          SetParamter(tmpSql, '$PATH_CODE$', '');
          SetParamter(tmpSql, '$SELF_PAY_FLAG$', SGMtrl.Cells[O_INS, i]);
          SetParamter(tmpSql, '$URG_FLAG$', '');
          SetParamter(tmpSql, '$DC_FLAG$', 'N');
          SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
          SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
          SetParamter(tmpSql, '$UPD_TIME$', ROCTimes(now, ''));
          SetParamter(tmpSql, '$LAB_NO$', '');
          SetParamter(tmpSql, '$MEMO_DESC$', SGMtrl.Cells[O_MEMO, i]);
          SetParamter(tmpSql, '$PROG_FLAG$', 'N');
          SetParamter(tmpSql, '$PRINT_FLAG$', 'Y');
          if kind = 6 then
            SetParamter(tmpSql, '$ARRG_FLAG$', 'Y')
          else
            SetParamter(tmpSql, '$ARRG_FLAG$', 'N');
          SetParamter(tmpSql, '$DEL_FLAG$', 'N');
          SetParamter(tmpSql, '$DEL_FLAG$', 'N');
          SetParamter(tmpSql, '$Exper_type$', '');
          SetParamter(tmpSql, '$Exper_class$', '');
          SetParamter(tmpSql, '$Part_code$', SGMtrl.Cells[O_Part, i]);
          SetParamter(tmpSql, '$GRIND_FLAG$', 'N');
          SetParamter(tmpSql, '$PAY_FLAG$', SGMtrl.Cells[O_INS, i]);
          SetParamter(tmpSql, '$TTL_QTY$', SGMtrl.Cells[O_Qty, i]);
          SetParamter(tmpSql, '$ORDER_SEQ$', SGMtrl.Cells[O_Order_Seq, i]);

          SQLs.Add(tmpSql);
          SQLo.Add(SQLs);
          if SGMtrl.Cells[Del, i] = 'X' then
          begin
            SQLs := TStringList.Create;
            tmpSql := '';
            tmpSql := getUpdSql(3);
            SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
            SetParamter(tmpSql, '$ORDER_DATE$', getOpdDate);
            SetParamter(tmpSql, '$DC_DATE$', ROCDate(now, ''));
            SetParamter(tmpSql, '$DC_TIME$', ROCTime(now, ''));
            SetParamter(tmpSql, '$DC_OPER$', getDocCode1);
            SetParamter(tmpSql, '$SO_FLAG$', 'O');
            SetParamter(tmpSql, '$FEE_CODE$', SGMtrl.Cells[O_Code, i]);
            SetParamter(tmpSql, '$SEQ_NO$', IntToStr(seq_no));
            SQLs.Add(tmpSql);
            SQLo.Add(SQLs);
          end
        end;
      end;
    end;
    if not DM.ExecSQL(SQLo) then
      Abort;

    //use_opd_log(DPD_Ver, '寫入DPD_ALL_ORDER完畢');

    //use_opd_log(DPD_Ver, '開始轉檔');
    if kind <> 1 then
    begin
      Paramter.Clear;
      PType.Clear;
      RType.Clear;
      PData.Clear;
      SpName := getSpSql(4, Paramter, PType, RType);
      PData.Add(getFeeNo);
      PData.Add(IntToStr(seq));
      PData.Add('D');
      ExeSPResult := DM.ExecSP(Paramter, PType, RType, PData, SpName);

      if ReturnID(ExeSPResult) = 'N' then
      begin
        //ShowPnlMsg(ReturnName(ExeSPResult));
        msgtem := msgtem +'※PK_opd_all_Order:'+ ReturnName(ExeSPResult);
        use_opd_log(DPD_Ver, ReturnName(ExeSPResult));
      end;
    end;
    //use_opd_log(DPD_Ver, '轉檔成功');

    try
      //update opd_basic pain_score
      SQLo.Clear;
      tmpSql := 'update opd_basic set pain_score='+Qt(gspainscore)+' where fee_no='+qt(getFeeNo);
      SQLs := TStringList.Create;
      SQLs.Add(tmpSql);
      SQLo.Add(SQLs);
      if not DM.ExecSQL(SQLo) then
        use_opd_log(DPD_Ver, 'opd_basic.pain_score update false');
    except

    end;

    //use_opd_log(DPD_Ver, '開始修改Reg_Basic');
    Paramter.Clear;
    PType.Clear;
    RType.Clear;
    PData.Clear;
    SpName := getSpSql(5, Paramter, PType, RType);
    PData.Add(getOpdDate);
    PData.Add(getChrNo);
    PData.Add(getDeptCode);
    PData.Add(getDocCode);
    PData.Add(getShiftNo);
    PData.Add(getFeeNo);
    PData.Add(getpPatId);
    if kind = 0 then
      PData.Add('3')
    else
      PData.Add(getOpdStatus);
    if Kind = 1 then
      PData.Add('1')
    else
      PData.Add('0');
    PData.Add(getDocCode1);
    PData.Add(getDeptRoom);
    PData.Add(getSeqNo);
    ExeSPResult := DM.ExecSP(Paramter, PType, RType, PData, SpName);

    if ReturnID(ExeSPResult) = 'N' then
    begin
      //ShowPnlMsg(ReturnName(ExeSPResult));
      msgtem := msgtem +'※sp_modify_reg:'+ ReturnName(ExeSPResult);
      use_opd_log(DPD_Ver, ReturnName(ExeSPResult));
    end;
    //use_opd_log(DPD_Ver, '完成修改Reg_Basic');

    if kind in [4, 5, 6] then
      LoadOrder(1);


    Result := true;
    SQLo.Free;
    SQLs1.Free;
    Paramter.Free;
    PType.Free;
    RType.Free;
    PData.Free;
  except
    Result := false;
  end;


end;

function TFrmOrder.InsertMed(Med_code, aCir, aQty, aPath, aTTL, aGri, aDay, aParentCode: string; aRow: integer): Boolean;
var
  QtyStr, QtyStrs, CirStr, StartDateStr: string;
  sIns_Days, TempStr, preOrderType, ReplaceMedType: string;
  TempQ, TempQ2, TempQ3: TADOQuery;
  ArrKey, Mes: string;
  i: Integer;
  PreOrderCheck: string;
  myProgram, myParamter: string;
  MedQtyStr, TmpStr, TmpStr1: string;
  Row: integer;
  m_atccode,warntype,medstr : string;
  QryMedstr, QryMedstr1, sFscr, sRisk: string;
  haveFall : boolean;
begin
  if Trim(Med_code) = '' then
  begin
    Result := False;
    Exit;
  end;

  if aRow >= 0 then
    Row := aRow
  else
    Row := SGMed.RowCount - 1;


  for i := SGMed.FixedRows to SGMed.RowCount - 2 do
  begin
    if SGMed.Cells[del, i] = 'X' then
      continue
    else
    begin

      if Trim(SGMed.Cells[M_CODE, i]) = Trim(Med_code) then
      begin
        if MessageDlg('此藥品已重複開立' + #13 + '是否繼續?', mtWarning, [mbYes, mbNo], 0) = mrNo then
        begin
          Result := False;
          Exit;
        end
        else
          Break;
      end;

    end;
  end;

  TempQ := TADOQuery.Create(self);
  TempQ.Connection := DM.ADOLink;
  TempQ2 := TADOQuery.Create(self);
  TempQ2.Connection := DM.ADOLink;
  TempQ3 := TADOQuery.Create(self);
  TempQ3.Connection := DM.ADOLink;
  warntype := '';
  medstr   := '';
  with TempQ do
  begin
    // 過敏藥物
    QryMedstr := '';
    QryMedstr1 := '';
    with TempQ3 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select med_type,atc_code from orderitem_basic where FEE_CODE=' + Qt(Trim(Med_CODE)));
      Open;

      m_atccode := Trim(FieldbyName('atc_code').AsString);
      //if Copy(Trim(FieldbyName('med_type').AsString), 1, 5) = '02020' then
      if (Copy(Trim(FieldbyName('med_type').AsString), 1, 5) = '02020') and (Trim(FieldbyName('med_type').AsString)<>'02020100') and (Trim(FieldbyName('med_type').AsString)<>'02020600')  and (Trim(FieldbyName('med_type').AsString)<>'02021000') then
        QryMedstr := ' and DRUG_INTER1=''Y'' '
      else if Copy(Trim(FieldbyName('med_type').AsString), 1, 6) = '100101' then
        QryMedstr := ' and DRUG_INTER2=''Y'' '
      else if Copy(Trim(FieldbyName('med_type').AsString), 1, 6) = '100102' then
        QryMedstr := ' and DRUG_INTER3=''Y'' '
      else if Copy(Trim(FieldbyName('med_type').AsString), 1, 8) = '10010700' then
        QryMedstr := ' and DRUG_INTER4=''Y'' '
      else if (Copy(Trim(FieldbyName('med_type').AsString), 1, 8) = '10010900') or (Copy(Trim(FieldbyName('med_type').AsString), 1, 8) = '02021000') then
        QryMedstr := ' and DRUG_INTER5=''Y'' '
      //else if Copy(Trim(FieldbyName('med_type').AsString), 1, 5) = '01070' then
      else if (Copy(Trim(FieldbyName('atc_code').AsString), 1, 4) = 'N03A') and (Copy(Trim(FieldbyName('atc_code').AsString), 1, 5) <> 'N03AG') and (Copy(Trim(FieldbyName('atc_code').AsString), 1, 5) <> 'N03AX')  then
        QryMedstr := ' and DRUG_INTER6=''Y'' '
      else
        QryMedstr := '';

      if QryMedstr <> '' then
        QryMedstr1 := ' union ' +
          ' select A.* from OPD_WARNING2 A join  OPD_WARNING3 B ON a.upd_oper=b.upd_oper and a.upd_date=b.upd_date and a.UPD_TIME=b.UPD_TIME ' +
          ' where A.chr_no=' + Qt(getChrno) + QryMedstr;

    end;
    // 過敏藥物
    Close;
    SQL.Clear;
    //SQL.Add('select * from OPD_WARNING2 where chr_no='+Qt(getChrno)+' and MED_CODE='+Qt(Trim(Med_CODE)));
    
    SQL.Add('SELECT DISTINCT case when B.ATC_CODE =' + Qt(trim(m_atccode)) +  ' and B.STOP_FLAG=''Y'' then ''1'' '  );
    SQL.Add('                     when B.ATC_CODE =' + Qt(trim(m_atccode)) +  ' and B.STOP_FLAG=''N'' then ''2'' '  );
    SQL.Add('                     when B.ATC_CODE<>' + Qt(trim(m_atccode)) +  ' and B.STOP_FLAG=''Y'' then ''3'' '  );
    SQL.Add('                     when B.ATC_CODE<>' + Qt(trim(m_atccode)) +  ' and B.STOP_FLAG=''N'' then ''4'' '  );
    SQL.Add('                     end as flag , ');
    SQL.Add('       MED_CODE,MED_TYPE,ATC_CODE,STOP_FLAG FROM ( ');
    SQL.Add('select A.* from OPD_WARNING2 A join  ORDERITEM_BASIC B ON A.ATC_CODE=B.ATC_CODE where chr_no=' + Qt(getChrno) + ' and FEE_CODE=' + Qt(Trim(Med_CODE)));
    SQL.Add(QryMedstr1);
    SQL.Add(' ) B  order by flag ');
    open;

    while not Eof do
    begin
      if warntype='' then
      begin
        if Trim(FieldByName('FLAG').AsString) = '1' then
          warntype :='1'
        else if Trim(FieldByName('FLAG').AsString) = '2' then
          warntype :='2'
        else if Trim(FieldByName('FLAG').AsString) = '3' then
          warntype :='3'
        else
          warntype :='4';
      end;

      medstr := medstr + ';' + trim(FieldbyName('MED_CODE').AsString) ;
      Next;
    end;

    medstr := Copy(medstr, 2, Length(medstr));


    if trim(warntype) <> '' then
    begin
      UUpddate := '';
      UUpdtime := '';

      UUpddate := DBDate(RocDate(now, ''));
      UUpdtime := DBDate(RocTime(now, '')); //取得現在時間

      if trim(warntype) = '1' then
      begin
        //Showmessage('病人對此藥物有過敏記錄,且被設定為[不可使用],請改用其他藥物');
        if Showmessage('病人對此藥物有嚴重不良反應紀錄，經藥物不良反應工作小組評定為[不可使用]，請改用其他藥物', ['詳細資料', '確定'], msComf) = 0 then
        begin
          if not Assigned(FrmWarningdesc) then
            FrmWarningdesc := TFrmWarningdesc.Create(self);
          //FrmWarningdesc.medcode := FieldbyName('MED_CODE').AsString;
          FrmWarningdesc.medcode := Trim(Med_CODE);
          FrmWarningdesc.medstr := StringReplace(medstr, ';', ' '','' ', [rfReplaceAll]);
          FrmWarningdesc.Panel1.Visible := False;
          FrmWarningdesc.BtnOK.Visible := False;
          FrmWarningdesc.ShowModal;
          if FrmWarningdesc <> nil then
            FrmWarningdesc := nil;
        end
        else
        begin
        end;

        SaveReaction('0', Trim(Med_code), Trim(Med_code), '05', '3'); //05:過敏史 ;1:回去修改,2:繼續,3:阻斷
        Result := False;
        Close;
        FreeAndNil(TempQ);
        Exit;

      end
      else if trim(warntype) = '2' then
      begin
        if ShowMessage('病人對此藥物曾有過敏反應紀錄，是否要繼續開立？' + #13 + '如要開立必須填寫開立理由！', ['開立', '取消'], msComf) = 1 then
        begin
          SaveReaction('0', Trim(Med_code), Trim(Med_code), '05', '1'); //05:過敏史 ;1:回去修改,2:繼續,3:阻斷
          Result := False;
          Close;
          FreeAndNil(TempQ);
          Exit;
        end
        else
        begin
          if not Assigned(FrmWarningdesc) then
            FrmWarningdesc := TFrmWarningdesc.Create(self);
          //FrmWarningdesc.medcode := FieldbyName('MED_CODE').AsString;
          //FrmWarningdesc.atccode := FieldbyName('ATC_CODE').AsString;
          FrmWarningdesc.medcode := Trim(Med_CODE);
          FrmWarningdesc.medstr  := StringReplace(medstr, ';', ',', [rfReplaceAll]);
          FrmWarningdesc.atccode := trim(m_atccode);
          FrmWarningdesc.Upddate := UUpddate;
          FrmWarningdesc.Updtime := UUpdtime;
          FrmWarningdesc.Panel1.Visible := True;
          FrmWarningdesc.BtnOK.Visible := True;
          FrmWarningdesc.ShowModal;

          if FrmWarningdesc.WarningFlag = 0 then
          begin
            SaveReaction('0', Trim(Med_code), Trim(Med_code), '05', '1'); //05:過敏史 ;1:回去修改,2:繼續,3:阻斷
            Result := False;
            Close;
            FreeAndNil(TempQ);
            Exit;
          end
          else
          begin
            SaveReaction('0', Trim(Med_code), Trim(Med_code), '05', '2'); //05:過敏史 ;1:回去修改,2:繼續,3:阻斷
          end;
          if FrmWarningdesc <> nil then
            FrmWarningdesc := nil;
        end;
      end
      else if trim(warntype) = '3' then
      begin
        if ShowMessage('請注意，病人對此類藥物曾有過敏/不良反應紀錄，且經藥物不良反應工作小組評定為[不可使用]，是否要繼續開立？' + #13 + '如要開立必須填寫開立理由！', ['開立', '取消'], msComf) = 1 then
        begin
          SaveReaction('0', Trim(Med_code), Trim(Med_code), '05', '1'); //05:過敏史 ;1:回去修改,2:繼續,3:阻斷
          Result := False;
          Close;
          FreeAndNil(TempQ);
          Exit;
        end
        else
        begin
          if not Assigned(FrmWarningdesc) then
            FrmWarningdesc := TFrmWarningdesc.Create(self);
          //FrmWarningdesc.medcode := FieldbyName('MED_CODE').AsString;
          //FrmWarningdesc.atccode := FieldbyName('ATC_CODE').AsString;
          FrmWarningdesc.medcode := Trim(Med_CODE);
          FrmWarningdesc.medstr  := StringReplace(medstr, ';', ',', [rfReplaceAll]);
          FrmWarningdesc.atccode := trim(m_atccode);
          FrmWarningdesc.Upddate := UUpddate;
          FrmWarningdesc.Updtime := UUpdtime;
          FrmWarningdesc.Panel1.Visible := True;
          FrmWarningdesc.BtnOK.Visible := True;
          FrmWarningdesc.ShowModal;

          if FrmWarningdesc.WarningFlag = 0 then
          begin
            SaveReaction('0', Trim(Med_code), Trim(Med_code), '05', '1'); //05:過敏史 ;1:回去修改,2:繼續,3:阻斷
            Result := False;
            Close;
            FreeAndNil(TempQ);
            Exit;
          end
          else
          begin
            SaveReaction('0', Trim(Med_code), Trim(Med_code), '05', '2'); //05:過敏史 ;1:回去修改,2:繼續,3:阻斷
          end;
          if FrmWarningdesc <> nil then
            FrmWarningdesc := nil;
        end;
      end
      else
      begin
        if Showmessage('請注意,病人對此類藥物曾有過敏/不良反應紀錄!!', ['詳細資料', '確定'], msComf) = 0 then
        begin
          if not Assigned(FrmWarningdesc) then
            FrmWarningdesc := TFrmWarningdesc.Create(self);
          FrmWarningdesc.medcode := Trim(Med_CODE);
          FrmWarningdesc.medstr := StringReplace(medstr, ';', ',', [rfReplaceAll]);
          FrmWarningdesc.Panel1.Visible := False;
          FrmWarningdesc.BtnOK.Visible := False;
          FrmWarningdesc.ShowModal;
          if FrmWarningdesc <> nil then
            FrmWarningdesc := nil;
        end
        else
        begin
        end;

        SaveReaction('0', Trim(Med_code), Trim(Med_code), '05', '2'); //05:過敏史 ;1:回去修改,2:繼續,3:阻斷
      end;

  end;
  {with TempQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from OPD_WARNING2 where chr_no=' + Qt(getChrno) + ' and MED_CODE=' + Qt(Trim(Med_CODE)));
    open;
    if not Eof then
    begin
      if Trim(FieldByName('STOP_FLAG').AsString) = 'Y' then
      begin
        MessageDlg('病人對此藥物有過敏記錄,且被設定為[不可使用],請改用其他藥物', mtWarning, [mbOk], 0);
        Result := False;
        Close;
        FreeAndNil(TempQ);
        Exit;
      end
      else
      begin
        if MessageDlg('病人對此藥物曾被登錄有過敏反應' + #13 + '是否要繼續開立?', mtWarning, [mbYes, mbNo], 0) = mrNo then
        begin
          Result := False;
          Close;
          FreeAndNil(TempQ);
          Exit;
        end;
      end;
    end;
    }
    Close;
    SQL.Clear;
    SQL.Add('Select a.*,(select trim(batch_no) from vaccines_drugs where vaccines_drugs.med_code=a.fee_code and switch=''Y'' and Rownum = 1) as batch_no ');
    SQL.Add('from orderItem_basic a where a.fee_code='+Qt(Trim(Med_code)));
    //SQL.Add('Select * from orderItem_basic where fee_code=' + Qt(Trim(Med_code)));
    open;
    if Eof then
    begin
      Result := False;
      Close;
      FreeAndNil(TempQ);
      Exit;
    end;
    if Trim(FieldByName('USE_STATUS_O').AsString) <> '1' then
    begin
      TempStr := '';
      if FieldByName('USE_STATUS_O').AsString = '2' then
        TempStr := ' 暫時缺藥' + #13#10 + '請改開其他藥品'
      else
        TempStr := ' 已取消' + #13#10 + '請改開其他藥品';
      if (Trim(FieldByName('REPLACE_CODE1').AsString) <> '') or (Trim(FieldByName('REPLACE_CODE2').AsString) <> '') or (Trim(FieldByName('REPLACE_CODE3').AsString) <> '') then
      begin
        ReplaceMedType := inputbox('請改開其他藥品', FieldByName('Fee_Desc').AsString + #13 + TempStr + #13 + '1.' + FieldByName('REPLACE_CODE1').AsString + #13 + '2.' + FieldByName('REPLACE_CODE2').AsString + #13 + '3.' + FieldByName('REPLACE_CODE3').AsString, '');
        if (ReplaceMedType = '1') and (trim(FieldByName('REPLACE_CODE1').AsString) <> '') then
          result := InsertMed(Trim(FieldByName('REPLACE_CODE1').AsString), '', '', '', '', '', '', '', Row)
        else if (ReplaceMedType = '2') and (trim(FieldByName('REPLACE_CODE2').AsString) <> '') then
          result := InsertMed(Trim(FieldByName('REPLACE_CODE2').AsString), '', '', '', '', '', '', '', Row)
        else if (ReplaceMedType = '3') and (trim(FieldByName('REPLACE_CODE3').AsString) <> '') then
          result := InsertMed(Trim(FieldByName('REPLACE_CODE3').AsString), '', '', '', '', '', '', '', Row)
        else
        begin
          result := False;
          Close;
          FreeAndNil(TempQ);
          exit;
        end;
        Close;
        FreeAndNil(TempQ);
        Exit;
      end
      else
      begin
        ShowMessage(FieldByName('Fee_name').AsString + TempStr);
        Close;
        result := False;
        FreeAndNil(TempQ);
        exit;
      end;
    end
    else
    begin

      sIns_Days := NullStrTo(Trim(FieldByName('MED_DAYS').AsString), '0');
      SGMed.Cells[modifyType, Row] := 'N';
      SGMed.Cells[Seq, Row] := '';
      SGMed.Cells[Del, Row] := '';
      SGMed.Cells[M_code, Row] := Trim(Med_code);
      SGMed.Cells[M_order, Row] := Trim(FieldByName('Fee_name').AsString);
      SGMed.Cells[M_Qty, Row] := NullStrTo(aQty, Trim(FieldByName('UNIT_QTY').AsString));
      SGMed.Cells[M_Unit, Row] := Trim(FieldByName('UNIT_O').AsString);
      SGMed.Cells[M_Cir, Row] := NullStrTo(aCir, Trim(FieldByName('CIR_CODE_O').AsString));
      SGMed.Cells[M_Path, Row] := NullStrTo(aPath, Trim(FieldByName('PATH_CODE_O').AsString));
      SGMed.Cells[M_INS, Row] := Trim(FieldByName('INS_FLAG').AsString);
      SGMed.Cells[M_Day, Row] := NullStrTo(aDay, Trim(FieldByName('med_days').AsString));
      SGMed.Cells[M_PackAmt, Row] := FieldByName('Fee_PACK_O').AsString;
      SGMed.Cells[M_Ttl, Row] := NullStrTo(aTTL, CalMedTtl(SGMed.Cells[M_Cir, Row], FieldByName('Accu_flag').AsString, StrToInt(SGMed.Cells[M_PackAmt, Row]), StrToInt(SGMed.Cells[M_Day, Row]), StrToFloat(SGMed.Cells[M_Qty, Row])));
      SGMed.Cells[M_GRI, Row] := NullStrTo(aGri, Trim(FieldByName('POWDER_FLAG').AsString));
      SGMed.Cells[M_MEMO, Row] := Trim(FieldByName('batch_no').AsString);
      SGMed.Cells[M_Kind, Row] := 'M';
      SGMed.Cells[M_Order_Seq, Row] := '';
      SGMed.Cells[M_Order_Text, Row] := aParentCode;
      SGMed.Cells[M_INS_Flag, Row] := Trim(FieldByName('INS_FLAG').AsString);
      SGMed.Cells[M_Countflag, Row] := Trim(FieldByName('Accu_flag').AsString);
      CHKCASEPART('D', FieldByName('Fee_CODE').AsString);

      SGMed.Cells[M_Hint, Row] := Trim(fieldByName('Fee_Desc').AsString) + #13 +
                                  '抗生素等級 : '  + fieldByName('ANTICONTROL_TYPE').AsString + #13 +
                                  '懷孕用藥分級 :' + fieldByName('PREG_CATE').AsString + #13 +
                                  '腎功能調整 :'  + fieldByName('CKD_DESC').AsString   + #13 +
                                  '肝功能調整 :'  + fieldByName('LIVER_DESC').AsString + #13 +
                                  '老人用藥提示:' + TRIM(fieldByName('ELDERLY_MED').AsString) + #13 +
                                  '藥品跌倒注意事項:';
      haveFall := FallScoreDescription(Trim(MED_CODE), sFscr, sRisk);
      if haveFall then begin
         if Trim(sRisk) <> '' then begin
            SGMed.Cells[M_Hint, Row] := SGMed.Cells[M_Hint, Row] + sRisk;
         end;
      end;
    end;
    Close;
  end;
  Result := True;
  FreeAndNil(TempQ);
  FreeAndNil(TempQ2);
  ComputeAmt(SGFee, F_Qty, F_Code, F_Ins);
end;

procedure TFrmOrder.Radionum;
var
  i: Integer;
  myRisk, MyRad: Double;
begin
  if UpperCase(setSys.ReadString('SYSTEM', '輻射劑量', 'FALSE')) <> 'TRUE' then
    Exit;
  myRisk := 0;
  MyRad := 0;
  for i := 0 to SGXRay.RowCount - 1 do
  begin
    if (nullStrTo(SGXRay.Cells[modifytype, i], 'N') = 'N') and (Trim(SGXRay.Cells[C_Code, i]) <> '') then
    begin
      with DM.QryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT  X.X_AVG_RADIATION, X.X_RISK ');
        SQL.Add('FROM X_RAY_RADIATION X, ORDERITEM_BASIC O ');
        SQL.Add('WHERE O.ORDER_TYPE LIKE ''X%'' ');
        SQL.Add('  AND X.KIND_NO = SUBSTR(O.ORDER_TYPE,2,1)');
        SQL.Add('  AND X.CODE_NO = O.SEND_CD_1 ');
        SQL.Add('  AND X.ITEM_NO = O.SEND_CD_2 ');
        SQL.Add('  AND O.SEND_CD_2=' + Qt(SGXRay.Cells[C_Send, i]));
        SQL.Add('  AND O.SEND_CD_1=' + Qt(SGXRay.Cells[C_Path, i]));
        SQL.Add('  AND O.FEE_CODE=' + Qt(SGXRay.Cells[C_Code, i]));
        Open;
        if not Eof then
        begin
          myRisk := myRisk + FieldByName('X_RISK').AsFloat;
          MyRad := MyRad + FieldByName('X_AVG_RADIATION').AsFloat;
        end;
        Close;
      end;
    end;
  end;
  EdtAllmsv.Text := FloatToStr(MyRad);
  EdtAllRisk.Text := FloatToStr(myRisk);
end;

procedure TFrmOrder.initTextOrderTile;
var
  i: Integer;
  Qrys: TADOQuery;
  tmpSql: string;
  SQLs: TStrings;
  Bmp: TBitmap;
begin

  BtnLOrder.Width := BtnLOrder.Tag + (SGLab.Width - 454);
  BtnLDose.Left := BtnLOrder.Left + BtnLOrder.Width;
  BtnLUnit.Left := BtnLDose.Left + BtnLDose.Width;
  BtnLCir.Left := BtnLUnit.Left + BtnLUnit.Width;
  BtnLPath.Left := BtnLCir.Left + BtnLCir.Width;
  BtnLIns.Left := BtnLPath.Left + BtnLPath.Width;
  BtnLEMG.Left := BtnLIns.Left + BtnLIns.Width;
  BtnLMemo.Left := BtnLEMG.Left + BtnLEMG.Width;
  for i := 0 to SGLab.ColCount - 1 do
  begin
    if High(LOrderName) < i then
      SGLab.ColWidths[i] := -1
    else
    begin
      if FrmOrder.FindComponent(LOrderName[i]) <> nil then
        SGLab.ColWidths[i] := TBitBtn(FrmOrder.FindComponent(LOrderName[i])).Width - 1
      else
        SGLab.ColWidths[i] := -1;
    end;
  end;

  BtnROrder.Width := BtnROrder.Tag + (SGXRay.Width - 454);
  BtnRDose.Left := BtnROrder.Left + BtnROrder.Width;
  BtnRUnit.Left := BtnRDose.Left + BtnRDose.Width;
  BtnRCir.Left := BtnRUnit.Left + BtnRUnit.Width;
  BtnRPath.Left := BtnRCir.Left + BtnRCir.Width;
  BtnRIns.Left := BtnRPath.Left + BtnRPath.Width;
  BtnREMG.Left := BtnRIns.Left + BtnRIns.Width;
  BtnRMemo.Left := BtnREMG.Left + BtnREMG.Width;
  for i := 0 to SGXRay.ColCount - 1 do
  begin
    if High(ROrderName) < i then
      SGXRay.ColWidths[i] := -1
    else
    begin
      if FrmOrder.FindComponent(LOrderName[i]) <> nil then
        SGXRay.ColWidths[i] := TBitBtn(FrmOrder.FindComponent(ROrderName[i])).Width - 1
      else
        SGXRay.ColWidths[i] := -1;
    end;
  end;

  BtnCOrder.Width := BtnCOrder.Tag + (SGChk.Width - 454);
  BtnCDose.Left := BtnCOrder.Left + BtnCOrder.Width;
  BtnCUnit.Left := BtnCDose.Left + BtnCDose.Width;
  BtnCCir.Left := BtnCUnit.Left + BtnCUnit.Width;
  BtnCPath.Left := BtnCCir.Left + BtnCCir.Width;
  BtnCIns.Left := BtnCPath.Left + BtnCPath.Width;
  BtnCEMG.Left := BtnCIns.Left + BtnCIns.Width;
  BtnCMemo.Left := BtnCEMG.Left + BtnCEMG.Width;
  for i := 0 to SGChk.ColCount - 1 do
  begin
    if High(COrderName) < i then
      SGChk.ColWidths[i] := -1
    else
    begin
      if FrmOrder.FindComponent(COrderName[i]) <> nil then
        SGChk.ColWidths[i] := TBitBtn(FrmOrder.FindComponent(COrderName[i])).Width - 1
      else
        SGChk.ColWidths[i] := -1;
    end;
  end;

  BtnOrder.Width := BtnOrder.Tag + (SGMed.Width - 518);
  BtnDose.Left := BtnOrder.Left + BtnOrder.Width;
  BtnUnit.Left := BtnDose.Left + BtnDose.Width;
  BtnCir.Left := BtnUnit.Left + BtnUnit.Width;
  BtnPath.Left := BtnCir.Left + BtnCir.Width;
  BtnDay.Left := BtnPath.Left + BtnPath.Width;
  BtnTtl.Left := BtnDay.Left + BtnDay.Width;
  BtnIns.Left := BtnTtl.Left + BtnTtl.Width;
  BtnMemo.Left := BtnIns.Left + BtnIns.Width;
  for i := 0 to SGMed.ColCount - 1 do
  begin
    if High(OrderName) < i then
      SGMed.ColWidths[i] := -1
    else
    begin
      if FrmOrder.FindComponent(OrderName[i]) <> nil then
        SGMed.ColWidths[i] := TBitBtn(FrmOrder.FindComponent(OrderName[i])).Width - 1
      else
        SGMed.ColWidths[i] := -1;
    end;
  end;

  BtnFName.Width := BtnFName.Tag + (SGMed.Width - 518);
  BtnFpart.Left := BtnFName.Left + BtnFName.Width;
  BtnFQty.Left := BtnFpart.Left + BtnFpart.Width;
  BtnFIns.Left := BtnFQty.Left + BtnFQty.Width;
  BtnFMemo.Left := BtnFIns.Left + BtnFIns.Width;
  for i := 0 to SGFee.ColCount - 1 do
  begin
    if High(FOrderName) < i then
      SGFee.ColWidths[i] := -1
    else
    begin
      if FrmOrder.FindComponent(FOrderName[i]) <> nil then
        SGFee.ColWidths[i] := TBitBtn(FrmOrder.FindComponent(FOrderName[i])).Width - 1
      else
        SGFee.ColWidths[i] := -1;
    end;
  end;

  BtnOName.Width := BtnOName.Tag + (SGMtrl.Width - 518);
  BtnOpart.Left := BtnOName.Left + BtnOName.Width;
  BtnOQty.Left := BtnOpart.Left + BtnOpart.Width;
  BtnOIns.Left := BtnOQty.Left + BtnOQty.Width;
  BtnOMemo.Left := BtnOIns.Left + BtnOIns.Width;
  for i := 0 to SGMtrl.ColCount - 1 do
  begin
    if High(OOrderName) < i then
      SGMtrl.ColWidths[i] := -1
    else
    begin
      if FrmOrder.FindComponent(OOrderName[i]) <> nil then
        SGMtrl.ColWidths[i] := TBitBtn(FrmOrder.FindComponent(OOrderName[i])).Width - 1
      else
        SGMtrl.ColWidths[i] := -1;
    end;
  end;

  for i := 0 to SGPath.ColCount -1 do
  begin
    if i <= High(pthordername) then
      SGPath.ColWidths[i] := TBitBtn(FrmOrder.FindComponent(pthordername[i])).Width-1
    else
      SGPath.ColWidths[i] := -1;
  end;

  //病人圖示
  PnlImgInfo.Left := self.Width - PnlImgInfo.Width;
  SQLs := TStringList.Create;
  bmp := TBitmap.Create;
  bmp.FreeImage();
  tmpSql := getChkSqlStr(26);
  SetParamter(tmpSql, '$CHR_NO$', getChrNo);
  SQLs.Clear;
  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs) then
  begin
    ImageListforPat.GetBitmap(7, bmp);
    ImgDNR.Picture.Assign(bmp);
    ImgDNR.Hint := '安寧病人';
    ImgDNR.ShowHint := True;
  end
  else
  begin
    tmpSql := getChkSqlStr(27);
    SetParamter(tmpSql, '$CHR_NO$', getChrNo);
    SQLs.Clear;
    SQLs.Text := tmpSql;
    if DM.OpenSQL(SQLs) then
    begin
      ImageListforPat.GetBitmap(6, bmp);
      ImgDNR.Picture.Assign(bmp);
      ImgDNR.Hint := '[DNR病人]';
      ImgDNR.ShowHint := True;
    end
    else
    begin
      ImgDNR.Picture.Assign(nil);
      ImgDNR.Picture := nil;
      ImgDNR.ShowHint := False;
    end;
  end;
  SQLs.Free;
  SQLs := nil;
  Bmp.Free;

  //109.09.28 shh ITe 11138 add 抗凝血用藥註記 mark
  //抗凝血
  PnlImgInfo.Left := self.Width - PnlImgInfo.Width;
  SQLs := TStringList.Create;
  bmp := TBitmap.Create;
  bmp.FreeImage();

  ImgB01A.Picture.Assign(nil);
  ImgB01A.Picture := nil;
  ImgB01A.Hint := '';
  ImgB01A.ShowHint := False;
  SQLs.Clear;
  tmpSql :=' select f_Chk_Med_B01a('+ Qt(GetFeeNo) + ') B01A_FLAG from dual ';
  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs, Qrys) then
  begin
    IF trim(Qrys.FieldByName('B01A_FLAG').AsString) = '1' then
    begin
      ImageListforPat.GetBitmap(11, bmp);   //抗凝血藥品圖
      ImgB01A.Picture.Assign(bmp);
      ImgB01A.Hint := '[病人有使用抗凝血用藥]';
      ImgB01A.ShowHint := True;
    END;
  end;
  
  SQLs.Free;
  SQLs := nil;
  Bmp.Free;
  //END 109.09.28 shh ITe 11138 add 抗凝血用藥註記 mark

end;

procedure TFrmOrder.ClearItem(Sender: TObject);
var
  i, iIndex: Integer;
  thecontrol: Twincontrol;
begin
  FeeRow := -1;
  for iIndex := 0 to TForm(Sender).ComponentCount - 1 do
  begin
    theControl := TWinControl(TForm(Sender).Components[iIndex]);
    if theControl is TEdit then
      TEdit(theControl).Text := ''
    else if theControl is TStringGrid then
    begin
      //例外不清除的
      if TStringGrid(TheControl).Tag = 777 then
        Continue;
      for i := TStringGrid(TheControl).FixedRows to TStringGrid(TheControl).RowCount - 1 do
        TStringGrid(TheControl).Rows[i].Clear;
      if TStringGrid(TheControl).Tag <> 999 then
        TStringGrid(TheControl).RowCount := TStringGrid(TheControl).FixedRows + 1;
    end
    else if theControl is TPanel then
      TPanel(theControl).Caption := ''
    else if theControl is TRichEdit then
      TRichEdit(Thecontrol).Lines.Text := ''
    else if theControl is TMemo then
      TMemo(Thecontrol).Lines.Text := ''
    else if theControl is TDateTimePicker then
      TDateTimePicker(Thecontrol).DateTime := now
    else if theControl is TMonthCalendar then
      TMonthCalendar(Thecontrol).Date := date;
  end;

end;

procedure TFrmOrder.LoadPatInf(Srt, Kind: string);
var
  tmpSql: string;
  Qrys: TADOQuery;
begin
  OPD_Date1.Text := getOpdDate;
  Dept_R1.Text := getROOMDESC;
  DOC_N1.Text := getDocName1 + '_' + getDocCode1;


  ToolButton49.Visible := isDXray;
  if (getDecFlag = '1') and (getDocCode2 = '') and (getDocCode3 = '') then
  begin
    Doc_N2.Text := getDocName1 + '_' + getDocCode1;
    setDocCode2(getDocCode1);
    setDocName2(getDocName1);
    Doc_N3.Text := getDocName1 + '_' + getDocCode1;
    setDocCode3(getDocCode1);
    setDocName3(getDocName1);
  end
  else if (getDocCode2 <> '') and (getDocCode3 <> '') then ;
  begin
    Doc_N2.Text := getDocName2 + '_' + getDocCode2;
    Doc_N3.Text := getDocName3 + '_' + getDocCode3;
  end;
  Doc_N2Change(Doc_N2);
  Doc_N2.Enabled := isInsDoc;
  Doc_N3.Enabled := isFatDoc;


  Chr1.Text := getChrNo;
  Pat_Name1.Text := getPatName;
  Age1.Text := getPAge + '歲' + getMAge + '月';
  Sex_Type1.Text := GetSex(getPSex);
  Pat_Id1.Text := GetPatId(getPPATID);
  Weight.Text := getBodyWeight;
  if isReadOnly then
  begin
    BtnIdl.Enabled := false;
    BtnSave.Enabled := false;
    BtnFinish.Enabled := false;
    BtnLabOpen.Enabled := false;
    BtnXRayOpen.Enabled := false;
    BtnChkOpen.Enabled := false;
    BtnIdl.Enabled := false;
    BtnICBack.Enabled := false;
    BtnCnlIdl.Enabled := false;
    BtnICGet.Enabled := false;
    BtnAC95.Enabled := false;
  end
  else
  begin
    if StrToInt(getOpdStatus) in [3, 4, 5] then
    begin
      BtnSave.Enabled := false;
    end
    else
    begin
      if StrToInt(getOpdStatus) in [1, 2] then
      begin
        BtnSave.Enabled := true;
      end
      else
      begin
        if getOrderStatus = '1' then
          BtnSave.Enabled := true
        else
          BtnSave.Enabled := false;
      end;
    end;
    BtnFinish.Enabled := true;
    BtnIdl.Enabled := true;
    BtnLabOpen.Enabled := true;
    BtnXRayOpen.Enabled := true;
    BtnChkOpen.Enabled := true;
    BtnIdl.Enabled := true;
    BtnICBack.Enabled := true;
    BtnICGet.Enabled := true;
    BtnAC95.Enabled := true;
  end;

  if getIdlDate <> '' then
    Card_No1.Text := '同療:' + getIdlCardNo
  else if getIcSeqNo <> '' then
    Card_No1.Text := getIcSeqNo
  else
    Card_No1.Text := '';

  if getDiagFlag <> '' then
    if getDiagFlag = 'N' then
      ChkIdl.Checked := false
    else
      ChkIdl.Checked := true
  else
    ChkIdl.Checked := true;

  Qrys := TADOQUERY.Create(nil);
  Qrys.Connection := DM.ADOLink;
  if getCASEDESC <> '' then
    Case_Type1.Text := getCASEDESC
  else
  begin
    tmpSql := getChkSqlStr(59);
    SetParamter(tmpSql, '$CODE_NO$', CASETYPE);
    Qrys.Close;
    Qrys.SQL.Clear;
    Qrys.SQL.Text := tmpSql;
    Qrys.Open;
    if not Qrys.Eof then
    begin
      Case_Type1.Text := Qrys.FieldByName('code_desc').AsString;
      setCASEDESC(Case_Type1.Text);
    end;
  end;

  if getPARTDESC <> '' then
    Part_Code1.Text := getPARTDESC
  else
  begin
    tmpSql := getChkSqlStr(58);
    if getIdlDate <> '' then
      SetParamter(tmpSql, '$CODE_NO$', '009')
    else
      SetParamter(tmpSql, '$CODE_NO$', PARTTYPE);
    Qrys.Close;
    Qrys.SQL.Clear;
    Qrys.SQL.Text := tmpSql;
    Qrys.Open;
    if not Qrys.Eof then
    begin
      Part_Code1.Text := Qrys.FieldByName('code_desc').AsString;
      setPARTDESC(Part_Code1.Text);
    end;
  end;

  if getPAYDESC <> '' then
    Pay_Type.Text := getPAYDESC
  else
  begin
    tmpSql := getChkSqlStr(60);
    SetParamter(tmpSql, '$CODE_NO$', PAYTYPE);
    Qrys.Close;
    Qrys.SQL.Clear;
    Qrys.SQL.Text := tmpSql;
    Qrys.Open;
    if not Qrys.Eof then
    begin
      Pay_Type.Text := Qrys.FieldByName('code_desc').AsString;
      setPAYDESC(Pay_Type.Text);
    end;
  end;

  tmpSql := getChkSqlStr(28);
  SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
  Qrys.Close;
  Qrys.SQL.Clear;
  Qrys.SQL.Text := tmpSql;
  Qrys.Open;

  if Qrys.Eof then
  begin
    if not assigned(FrmPain) then
      Application.CreateForm(TFrmPain, FrmPain);
    FrmPain.opd_date := getOpdDate;
    FrmPain.chr_no := getChrNo;
    FrmPain.fee_no := getFeeNo;
    FrmPain.doc_Code := getDocCode;
    FrmPain._DB := DM.ADOLink;
    FrmPain.m_age := getMAge;
    FrmPain.dept_code := getDeptCode;
    FrmPain.age := getPAge;
    FrmPain.ShowModal;
  end;



  try
    tmpSql := sqlstr(30);
    SetParamter(tmpSql, '$chr_no$', getChrNo);
    Qrys.Close;
    Qrys.SQL.Clear;
    Qrys.SQL.Text := tmpSql;
    Qrys.Open;
    if not Qrys.Eof then
    begin
      tmpSql := '';
      while not Qrys.Eof do
      begin
        if Qrys.FieldByName('Msg_flag').AsString = '1' then
          tmpSql := 'Y';
        Qrys.Next;
      end;
      if tmpSql = 'Y' then
      begin
        FrmSpec := TFrmSpec.Create(Self);
        FrmSpec.ShowModal;
        FreeAndNil(FrmSpec);
      end;
    end;
  finally
    DM.QrySearch.Close;
  end;
  MySBar.Panels[0].Text := getFeeNo;
  Qrys.Free;
end;

procedure TFrmOrder.LoadOrder(Kind: integer);
var
  tmpSql, icd9_code1, icd9_code2, icd9_code3: string;
  SQLs: TStrings;
  haveOrder: Boolean;
  Qrys: TADOQuery;
  Paramter, PType, RType, PData: TStrings;
  SpName, ExeSPResult: string;
begin
  SQLs := TstringList.Create;

  if Kind in [0, 1] then
  begin
    SQLs.Clear;
    tmpSql := getLoadOrder(1);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$SO_FLAG$', 'L');
    SQLs.Text := tmpSql;
    DM.OpenSQL(SQLs, SGLab, True);
    TabLab.Caption := '檢驗[' + IntToStr(SGLab.RowCount - 1) + ']';
    SQLs.Clear;
    tmpSql := getLoadOrder(1);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$SO_FLAG$', 'X');
    SQLs.Text := tmpSql;
    DM.OpenSQL(SQLs, SGXRay, True);
    SQLs.Clear;
    tmpSql := getLoadOrder(1);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$SO_FLAG$', 'T');
    SQLs.Text := tmpSql;
    DM.OpenSQL(SQLs, SGXRay, false);
    TabXRay.Caption := '放射[' + IntToStr(SGXRay.RowCount - 1) + ']';
    SQLs.Clear;
    tmpSql := getLoadOrder(1);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$SO_FLAG$', 'C');
    SQLs.Text := tmpSql;
    DM.OpenSQL(SQLs, SGChk, True);
    TabChk.Caption := '檢查[' + IntToStr(SGChk.RowCount - 1) + ']';
  end;

  if getIdlFeeNo <> '' then
  begin
    SQLs.Clear;
    tmpSql := getChkSqlStr(77);
    SetParamter(tmpSql, '$FEE_NO$', getIdlFeeNo);
    SQLs.Text := tmpSql;
    if DM.OpenSQL(SQLs, Qrys) then
    begin
      year.Text   := Qrys.FieldByName('INS_SEQ_NO2').AsString;
      gspainscore := Qrys.FieldByName('pain_score').AsString;
    end;
    SQLs.Clear;
    tmpSql := getChkSqlStr(76);
    SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
    SetParamter(tmpSql, '$CHR_NO$', getChrNo);
    SetParamter(tmpSql, '$INS_SEQ_NO$', getFirstInsSeqNo);
    SetParamter(tmpSql, '$INS_SEQ_NO2$', year.Text);
    SQLs.Text := tmpSql;
    if DM.OpenSQL(SQLs, Qrys) then
      cnt.Text := Qrys.FieldByName('cnt').AsString;
  end;

  if kind in [0] then
  begin
    SQLs.Clear;
    tmpSql := getLoadOrder(3);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$SO_FLAG$', 'M');
    SQLs.Text := tmpSql;
    DM.OpenSQL(SQLs, SGMed, True);
    //2022-04-21 藥跌
    if SGMed.RowCount > 0 then begin
       CheckDrugFallScoreOverdose;
    end;
    SQLs.Clear;
    //20140214病理取資料
    if SetSys.ReadString('SYSTEM','PATHOLOGY','') <> '' then
      getpathologydata;
    tmpSql := getLoadOrder(4);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$SO_FLAG$', 'F');
    SQLs.Text := tmpSql;
    DM.OpenSQL(SQLs, SGFee, True);
    fee_tabst.Caption := '處置[' + IntToStr(SGFee.RowCount - 1) + ']' + ' ' + '用藥[' + IntToStr(SGMed.RowCount - 1) + ']';
    SQLs.Clear;
    tmpSql := getLoadOrder(4);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$SO_FLAG$', 'O');
    SQLs.Text := tmpSql;
    DM.OpenSQL(SQLs, SGMtrl, True);
    TabMtrl.Caption := '衛材[' + IntToStr(SGMtrl.RowCount - 1) + ']';

    //icd9
    SQLs.Clear;
    tmpSql := getLoadOrder(5);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
    SQLs.Text := tmpSql;
    DM.OpenSQL(SQLs, SGIcd, True);
    SGIcd.RowCount := 10;
    //icd10
    SQLs.Clear;
    tmpSql := sqlstr(3);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
    SQLs.Text := tmpSql;
    DM.OpenSQL(SQLs, SGIcd10, True);
    SGIcd10.RowCount := 10;

    SQLs.Clear;
    tmpSql := getLoadOrder(2);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
    SQLs.Text := tmpSql;

    if DM.OpenSQL(SQLs, Qrys) then
    begin
      MemoS.Text := Qrys.FieldByName('NOTE1').AsString;
      MemoO.Text := Qrys.FieldByName('NOTE2').AsString;
      MemoP.Text := Qrys.FieldByName('FEE_CONTEN').AsString;
      MemoH.Text := Qrys.FieldByName('H').AsString;
    end
    else if isSOAP then
    begin
      SQLs.Clear;
      tmpSql := getLoadOrder(8);
      SetParamter(tmpSql, '$DEPT_CODE$', getDeptCode);
      SetParamter(tmpSql, '$CHR_NO$', getChrNo);
      SQLs.Text := tmpSql;
      if DM.OpenSQL(SQLs, Qrys) then
      begin
        MemoS.Text := StringReplace(Qrys.FieldByName('sub_desc2').AsString, '"', ' ', [rfReplaceAll]);
        MemoO.Text := StringReplace(Qrys.FieldByName('obj_desc').AsString, '"', ' ', [rfReplaceAll]);
        MemoP.Text := StringReplace(Qrys.FieldByName('plan_desc').AsString, '"', ' ', [rfReplaceAll]);
        MemoH.Text := StringReplace(Qrys.FieldByName('sub_desc').AsString, '"', ' ', [rfReplaceAll]);
        icd9_code1 := Qrys.FieldByName('icd9_code1').AsString;
        icd9_code2 := Qrys.FieldByName('icd9_code2').AsString;
        icd9_code3 := Qrys.FieldByName('icd9_code3').AsString;
        InsertIcd(icd9_code1);
        InsertIcd(icd9_code2);
        InsertIcd(icd9_code3);
      end;
    end;
    tmpSql := getChkSqlStr(3);
    SetParamter(tmpSql, '$OPD_KIND$', getOpdKind);
    SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
    SetParamter(tmpSql, '$DEPT_CODE$', getDeptCode);
    SetParamter(tmpSql, '$SHIFT_NO$', getShiftNo);
    SetParamter(tmpSql, '$DEPT_ROOM$', getDeptRoom);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SetParamter(tmpSql, '$SEQ_NO$', getSeqNo);
    SetParamter(tmpSql, '$CHR_NO$', getChrNo);
    SQLs.Clear;
    SQLs.Text := tmpSql;
    DM.OpenSQL(SQLs, Qrys);

    if Qrys.FieldByName('num').AsInteger = 0 then
    begin
      if isReadOnly <> True then
      begin
        tmpSql := getInsertSql(1);
        SetParamter(tmpSql, '$OPD_KIND$', getOpdKind);
        SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
        SetParamter(tmpSql, '$DEPT_CODE$', getDeptCode);
        SetParamter(tmpSql, '$SHIFT_NO$', getShiftNo);
        SetParamter(tmpSql, '$DEPT_ROOM$', getDeptRooM);
        SetParamter(tmpSql, '$DOC_CODE$', getDocCode);
        SetParamter(tmpSql, '$SEQ_NO$', getSeqNo);
        SetParamter(tmpSql, '$CHR_NO$', getChrNo);
        SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
        SetParamter(tmpSql, '$PAT_ID$', getPPatId);
        SetParamter(tmpSql, '$INS_SEQ_NO$', getIcSeqNo);
        SetParamter(tmpSql, '$PROG_FLAG$', 'N');
        SetParamter(tmpSql, '$ICD9_CODE1$', ' ');
        SetParamter(tmpSql, '$ICD9_CODE2$', SGICD.Cells[0, 1]);
        SetParamter(tmpSql, '$ICD9_CODE3$', SGICD.Cells[0, 2]);
        SetParamter(tmpSql, '$ICD9_CODE4$', SGICD.Cells[0, 3]);
        SetParamter(tmpSql, '$ICD9_CODE5$', SGICD.Cells[0, 4]);
        SetParamter(tmpSql, '$ICD9_CODE6$', SGICD.Cells[0, 5]);
        SetParamter(tmpSql, '$ICD9_CODE7$', SGICD.Cells[0, 6]);
        SetParamter(tmpSql, '$ICD9_CODE8$', SGICD.Cells[0, 7]);
        SetParamter(tmpSql, '$ICD9_CODE9$', SGICD.Cells[0, 8]);
        SetParamter(tmpSql, '$ICD9_CODE10$', SGICD.Cells[0, 9]);
        SetParamter(tmpSql, '$ICD10_CODE1$', SGIcd10.Cells[0, 0]);
        SetParamter(tmpSql, '$ICD10_CODE2$', SGIcd10.Cells[0, 1]);
        SetParamter(tmpSql, '$ICD10_CODE3$', SGIcd10.Cells[0, 2]);
        SetParamter(tmpSql, '$ICD10_CODE4$', SGIcd10.Cells[0, 3]);
        SetParamter(tmpSql, '$ICD10_CODE5$', SGIcd10.Cells[0, 4]);
        SetParamter(tmpSql, '$ICD9_DESC1$', ' ');
        SetParamter(tmpSql, '$ICD9_DESC2$', SGICD.Cells[2, 1]);
        SetParamter(tmpSql, '$ICD9_DESC3$', SGICD.Cells[2, 2]);
        SetParamter(tmpSql, '$ICD9_DESC4$', SGICD.Cells[2, 3]);
        SetParamter(tmpSql, '$ICD9_DESC5$', SGICD.Cells[2, 4]);
        SetParamter(tmpSql, '$ICD9_DESC6$', SGICD.Cells[2, 5]);
        SetParamter(tmpSql, '$ICD9_DESC7$', SGICD.Cells[2, 6]);
        SetParamter(tmpSql, '$ICD9_DESC8$', SGICD.Cells[2, 7]);
        SetParamter(tmpSql, '$ICD9_DESC9$', SGICD.Cells[2, 8]);
        SetParamter(tmpSql, '$ICD9_DESC10$', SGICD.Cells[2, 9]);
        SetParamter(tmpSql, '$DIAG_FLAG$', 'N');
        SetParamter(tmpSql, '$PAT_NAME$', getPatName);
        SetParamter(tmpSql, '$DISC_CODE$', getDiscCode);
        SetParamter(tmpSql, '$MED_TYPE$', '1');
        SetParamter(tmpSql, '$CASE_TYPE$', ReturnName(getCASEDESC));
        SetParamter(tmpSql, '$PART_CODE$', ReturnName(getPARTDESC));
        SetParamter(tmpSql, '$PAY_TYPE$', ReturnName(getPAYDESC));
        SetParamter(tmpSql, '$MED_DAYS$', '0');
        SetParamter(tmpSql, '$NOTE1$', MemoS.Text);
        SetParamter(tmpSql, '$NOTE2$', MemoO.Text);
        SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
        SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
        SetParamter(tmpSql, '$UPD_TIME$', ROCTime(now, ''));
        SetParamter(tmpSql, '$ORDER_FLAG$', ' ');
        SetParamter(tmpSql, '$MED_NO$', '1');
        SetParamter(tmpSql, '$PRINT_FLAG$', '1');
        SetParamter(tmpSql, '$UPD_IP$', MyIp);
        SetParamter(tmpSql, '$EXE_DOC$', getDocCode1);
        SetParamter(tmpSql, '$INS_DOC$', getDocCode2);
        SetParamter(tmpSql, '$FEAT_DOC$', getDocCode3);
        SetParamter(tmpSql, '$VOTE_TYPE$', ' ');
        SetParamter(tmpSql, '$PAIN_SCORE$', getPainScore);
        SetParamter(tmpSql, '$H$', MemoH.Text);
        SetParamter(tmpSql, '$FEE_CONTEN$', MemoP.Text);
        SetParamter(tmpSql, '$FIRST_DATE$', getFirstDate);
        SetParamter(tmpSql, '$FIRST_INS_SEQ_NO$', getFirstInsSeqNo);
        SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
        SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
        SQLs.Clear;
        SQLs.Text := tmpSql;
        DM.ExecSQL(SQLs);

        Paramter := TStringList.Create;
        PType := TStringList.Create;
        RType := TStringList.Create;
        PData := TStringList.Create;
        SpName := '';

        Paramter.Clear;
        PType.Clear;
        RType.Clear;
        PData.Clear;
        SpName := getSpSql(4, Paramter, PType, RType);
        PData.Add(getFeeNo);
        PData.Add('0');
        PData.Add('D');
        ExeSPResult := DM.ExecSP(Paramter, PType, RType, PData, SpName);

        if ReturnID(ExeSPResult) = 'N' then
        begin
          ShowPnlMsg(ReturnName(ExeSPResult));
          use_opd_log(DPD_Ver, ReturnName(ExeSPResult));
        end;
        Paramter.Free;
        PType.Free;
        RType.Free;
        PData.Free;
      end;
    end;
  end;

  SQLs.Free;
end;

procedure TFrmOrder.FormShow(Sender: TObject);
var
  tmpSql, tmpStr: string;
  SQLs: TStrings;
  Qrys: TADOQuery;
  lsNowUsedMed : String;
  whdt: integer;
  SexBMP : TBitmap;
begin
  inherited;
  if getOrderStatus = '' then
    Self.Close;
  PnlICD10.Top := (PanelShow.top-(PnlICD10.Height+5));
  iniPanelShow;
  Panel9.Align := alClient;
  Pgc_SOA.ActivePageIndex := 0;
  PageControl2.ActivePageIndex := 0;
  //
  SexBMP := TBitmap.Create;
  ImageListforPat.GetBitmap(12,SexBMP);
  ImgCovidInq.Picture.Graphic := SexBMp;
  SexBMP.FreeImage;
  freeandnil(SexBMP);

  //PageControl1.ActivePageIndex := 0;
  IF UpperCase(SetSys.ReadString('SYSTEM','ICD10','FALSE'))= 'TRUE' THEN
    PageControl1.ActivePageIndex := 1
  ELSE
    PageControl1.ActivePageIndex := 0;
  //PageControl3.ActivePage := TabSheet5;

  //雲端藥歷
  IC_PatientStatus := False;

  //是否提示初級診斷
  choosesgICD := False;
  //sgICD cells seting        70
  whdt := Ceil(SGIcd.Width/2)-50;
  SGIcd.ColWidths[1] := whdt;
  SGIcd.ColWidths[2] := whdt;
  SGIcd.ColWidths[3] := -1;
  SGIcd.ColWidths[4] := -1;
  SGIcd10.ColWidths[1] := whdt;
  SGIcd10.ColWidths[2] := whdt;
  SGIcd10.ColWidths[3] := -1;
  SGIcd10.ColWidths[4] := -1;
  SGIcd10.ColWidths[5] := -1;
  SGIcd10.ColWidths[6] := -1;
  SGIcd10.ColWidths[7] := -1;
  SGIcd10.ColWidths[8] := -1;
  //if not Assigned(XMLDoc) then
    //XMLDoc := TDOMDocument.Create(self);
  Label8.Caption := Setsys.ReadString('DPD', 'MX', 'MX');
  initTextOrderTile;
  LoadPatInf('', '');
  LoadOrder(0);
  Pgc_P.ActivePageIndex := 4;
  Pgc_PChange(Sender);
  FrmOrder.Refresh;
  SQLs := TStringList.Create;
  SQLs.Clear;
  tmpSql := getChkSqlStr(16);
  SetParamter(tmpSql, '$DEC_DOC$', '1');
  SetParamter(tmpSql, '$OPERATE$', 'like');
  SetParamter(tmpSql, '$DOC_CODE$', '%');
  SQLs.Text := tmpSql;
  //SQLs.SaveToFile('s4.sql');
  tmpStr := Doc_N2.Text;
  if DM.OpenSQL(SQLs, Qrys) then
  begin
    Doc_N2.Items.Clear;
    while not Qrys.Eof do
    begin
      Doc_N2.Items.Add(trim(Qrys.FieldByName('doc_name').AsString) + '_' + trim(Qrys.FieldByName('doc_code').AsString));
      Qrys.Next;
    end;
  end;
  Doc_N2.Text := tmpStr;

  SQLs.Clear;
  tmpSql := getChkSqlStr(19);
  SetParamter(tmpSql, '$OPERATE$', 'like');
  SetParamter(tmpSql, '$DOC_CODE$', '%');
  SetParamter(tmpSql, '$DEPT_CODE$', '%');
  SQLs.Text := tmpSql;
  //SQLs.SaveToFile('s5.sql');
  tmpStr := Doc_N3.Text;
  if DM.OpenSQL(SQLs, Qrys) then
  begin
    Doc_N3.Items.Clear;
    while not Qrys.Eof do
    begin
      Doc_N3.Items.Add(trim(Qrys.FieldByName('doc_name').AsString) + '_' + trim(Qrys.FieldByName('doc_code').AsString));
      Qrys.Next;
    end;
  end;
  Doc_N3.Text := tmpStr;
  //取主治醫師 20140514
  if ReturnName(trim(tmpStr)) <> '' then
  begin
    SQLs.Clear;
    tmpSql := 'select * from oper_basic where oper_id='+Qt(ReturnName(trim(tmpStr)));
    SQLs.Text := tmpSql;
    if DM.OpenSQL(SQLs, Qrys) then
        setvspsw(trim(Qrys.FieldByName('pswd_desc').AsString));
  end;
  if ReturnName(Case_type1.Text) = 'A3' then
    Case_Code.Text := copy(getIcSeqNo, 3, 2);

  //三院隔離註記共識(1040129最終版)
  ImgMDRO.Hint  := '';
  ImgBoold.Hint := '';
  SQLs.Clear;
  tmpSql := 'select * from ICN_DISEASE_basic where icn_code in '+
            '(select icn_code from ICN_DISEASE_MAIN where chr_no='+Qt(getChrNo)+' and nvl(trim(end_date),''0'')=''0'')';
  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs, Qrys) then
  begin
    DtSImage.DataSet := Qrys;
    while not Qrys.Eof do
    begin
      if trim(Qrys.FieldByName('ICON_NAME').AsString) = 'I001' then //血液圖案
      begin
        ImgBoold.Hint := ImgBoold.Hint + trim(Qrys.FieldByName('disease_type').AsString) + '('+trim(Qrys.FieldByName('icn_code').AsString)+') \';
        ImgBoold.Picture.Graphic := nil;
        ImgBoold.Picture.Graphic := DBImage1.Picture.Graphic;
      end;
      if trim(Qrys.FieldByName('ICON_NAME').AsString) = 'I002' then //I002 --人偶圖案
      begin
        ImgMDRO.Hint  := ImgMDRO.Hint + trim(Qrys.FieldByName('disease_type').AsString) + '('+trim(Qrys.FieldByName('icn_code').AsString)+') \';
        ImgMDRO.Picture.Graphic := nil;
        ImgMDRO.Picture.Graphic := DBImage1.Picture.Graphic;
      end;
      Qrys.Next;
    end;
  end;
  if length(trim(ImgBoold.Hint)) > 1 then
    ImgBoold.Hint := copy(trim(ImgBoold.Hint),1,length(trim(ImgBoold.Hint))-1);
  if length(trim(ImgMDRO.Hint)) > 1 then
    ImgMDRO.Hint := copy(trim(ImgMDRO.Hint),1,length(trim(ImgMDRO.Hint))-1);
  DtSImage.DataSet := nil;
  //圖示結束

  SQLs.Free;
  g_HisFeeThread := HisFeeThread.Create(false);

  //目前用藥
  lsNowUsedMed := SetSys.ReadString('DPD','NowUsedMed','');
  if UpperCase(lsNowUsedMed) = 'TRUE' then
  begin
    try
      Application.CreateForm(TFrmNowUsedMed, FrmNowUsedMed);
      if FrmNowUsedMed.setParams(GetChrNo, getFeeNo, getDocCode1, True) then
        FrmNowUsedMed.ShowModal;
    finally
      FreeAndNil(FrmNowUsedMed);
    end;
  end;

  if pos('環境',FrmOrder.Caption) = 0 then
     FrmOrder.Caption := FrmOrder.Caption + DM.gsTitle;
end;

procedure TFrmOrder.iniPanelShow;
begin
  PanelLab.Visible := False;
  PanelLab.Align := alNone;
  PanelFeePart.Visible := True;
  PanelFeePart.Align := alClient;
  PnlPart.Visible := True;
  PnlPart.Align := alClient;
end;

procedure TFrmOrder.SetPanel(Bview: Boolean; Sender: TObject);
begin
  try
    TPanel(sender).Visible := Bview;
    if Bview then
    begin
      if (TPanel(Sender).Name = 'PnlICD10') then
      BEGIN
        PnlPart.Visible := not Bview;
        PnlPart.Align := alNone;
        DBCICD10.Enabled := True;
      END
      ELSE
      BEGIN
        TPanel(sender).Align := alClient;
        if (TPanel(Sender).Name = 'pnlIcd') then
        begin
          PnlPart.Visible := not Bview;
          PnlPart.Align := alNone;
        end
        else
        begin
          PanelFeePart.Visible := not Bview;
          PanelFeePart.Align := alNone;
        end;
      END;
    end
    else
    begin
      if (TPanel(Sender).Name = 'PnlICD10') then
      BEGIN
        PnlPart.Visible := not Bview;
        PnlPart.Align := alNone;
      END
      ELSE
      BEGIN
        TPanel(sender).Align := alNone;
        if (TPanel(Sender).Name = 'pnlIcd') then
        begin
          PnlPart.Visible := not Bview;
          PnlPart.Align := alClient;
        end
        else
        begin
          PanelFeePart.Visible := not Bview;
          PanelFeePart.Align := alClient;
        end;
      END;
    end;
  except
  end;
  if Sender is TPanel then
  begin
    if TPanel(Sender).Name = 'PanelLab' then
    begin
      if Bview = False then
        DsLab.DataSet.Close;
    end
    else if TPanel(Sender).Name = 'PanelRay' then
    begin
      if Bview = False then
        DSRay.DataSet.Close;
    end
    else if TPanel(Sender).Name = 'PanelCHK' then
    begin
      if Bview = False then
        DSCHK.DataSet.Close;
    end
    else if TPanel(Sender).Name = 'PanelMed' then
    begin
      if Bview = False then
        DsMed.DataSet.Close;
    end
    else if TPanel(Sender).Name = 'pnlIcd' then
    begin
      if (Bview = False) and (DSIcd.DataSet <> nil) then
        DSIcd.DataSet.Close;
    end
    else if TPanel(Sender).Name = 'PnlICD10' then
    begin
      if (Bview = False) and (DSICD10.DataSet <> nil) then
        DSIcd10.DataSet.Close;
    end
    else if TPanel(Sender).Name = 'pnlfee' then
    begin
      if Bview = False then
        DSFee.DataSet.Close;
    end;
  end;
end;

procedure TFrmOrder.SGLabKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key in [vk_up, vk_down]) and (PanelLab.Visible) then
    exit;
  if TStringGrid(Sender).Cells[modifytype, TStringGrid(Sender).row] <> '' then
    Exit;
  if TStringGrid(Sender).Col = C_Order then
  begin

    if Trim(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) <> '' then
    begin
      //找檢驗名稱
      with DM.QryOrder do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select OrderItem_basic.*,(select Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=''L1'' and RTrim(Code_one) = RTrim(Send_Cd_1)) "組別",');
        SQL.Add('(select Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=''L2'' and RTrim(Code_one) = RTrim(Send_Cd_2)) "檢體"');
        SQL.Add(' from OrderItem_basic where RTrim(order_type)=''L'' and Use_STATUS_O=''1'' ');
        SQL.Add(' and  INSTR(UPPER(FEE_NAME), ' + Qt(UPPERCASE(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row])) + ') > 0 Order by   USE_STATUS_O,Fee_code,Fee_Desc,Fee_Name');
        open;
      end;
      SetPanel(true, PanelLab);
    end
    else
      SetPanel(False, PanelLab);
  end
  else if SGLab.Col = C_Code then
  begin
    if Trim(SGLab.Cells[SGLab.Col, SGLab.Row]) <> '' then
    begin
      //找檢驗代碼
      with DM.QryOrder do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select OrderItem_basic.*,(select Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=''L1'' and RTrim(Code_one) = RTrim(Send_Cd_1)) "組別",');
        SQL.Add('(select Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=''L2'' and RTrim(Code_one) = RTrim(Send_Cd_2)) "檢體"');
        SQL.Add('from OrderItem_basic where RTRIM(order_type)=''L'' and UPPER(fee_code) like ' + Qt(UPPERCASE(SGLab.Cells[SGLab.Col, SGLab.Row]) + '%') + ' and Use_STATUS_O=''1''  Order by  USE_STATUS_O,Fee_code,Fee_Desc,Fee_Name');
        open;
        First;
      end;
      SetPanel(true, PanelLab);
    end
    else
      SetPanel(False, PanelLab);
  end
  else
    SetPanel(False, PanelLab);
end;

procedure TFrmOrder.Pgc_PChange(Sender: TObject);
begin
  inherited;
  if PnlICD10.Visible then
  begin
    SetPanel(False, PnlICD10);
    SGIcd10.Rows[SGIcd10.Row].Clear;
  end;
  if pnlIcd.Visible then
  begin
    SetPanel(False, pnlIcd);
    SGICD.Rows[SGICD.Row].Clear;
  end;
  if PanelMed.Visible then
  begin
    SetPanel(False, PanelMed);
    SGMed.Rows[SGMed.Row].Clear;
  end;
  if pnlmtrl.Visible then
  begin
    SetPanel(False, pnlmtrl);
    SGMtrl.Rows[SGMtrl.Row].Clear;
  end;
  if PanelCHK.Visible then
  begin
    SetPanel(False, PanelCHK);
    SGChk.Rows[SGChk.Row].Clear;
  end;
  if PanelRay.Visible then
  begin
    SetPanel(False, PanelRay);
    SGXRay.Rows[SGXRay.Row].Clear;
  end;
  if PanelLab.Visible then
  begin
    SetPanel(False, PanelLab);
    SGLab.Rows[SGLab.Row].Clear;
  end;
  if pnlfee.Visible then
  begin
    SetPanel(False, pnlfee);
    SGFee.Rows[SGFee.Row].Clear;
  end;
  DM.QryOrder.Close;
  DM.QrySearch.Close;
  FeeRow := -1;
  resetFeeImg(Grp_Part);
  Grp_Part.Enabled := false;
  DsMed.DataSet := nil;
  DsLab.DataSet := nil;
  DsRay.DataSet := nil;
  DSCHK.DataSet := nil;
  DSICD10.DataSet := nil;
  DSIcd.DataSet := nil;
  DsFee.DataSet := nil;
  DsMtrl.DataSet := nil;
  SGLab.ShowHint := Pgc_P.ActivePageIndex = 0;
  SGXRay.ShowHint := Pgc_P.ActivePageIndex = 1;
  SGMtrl.ShowHint := Pgc_P.ActivePageIndex = 2;
  SGChk.ShowHint := Pgc_P.ActivePageIndex = 3;
  SGFee.ShowHint := Pgc_P.ActivePageIndex = 4;
  SGMed.ShowHint := Pgc_P.ActivePageIndex = 4;



  case Pgc_P.ActivePageIndex of
    0:
      begin
        DsLab.DataSet := DM.QryOrder;
        ComputeAmt(SGLab, C_Qty, C_Code, C_Ins);
      end;
    1:
      begin
        PanelRadioCount.Left := FrmOrder.Width - PanelRadioCount.Width;
        DsRay.DataSet := DM.QryOrder;
        ComputeAmt(SGXRay, C_Qty, C_Code, C_Ins);
      end;
    2:
      begin
        DsMtrl.DataSet := DM.QryOrder;
        ComputeAmt(SGMtrl, O_Qty, O_Code, O_Ins);
      end;
    3:
      begin
        DsCHK.DataSet := DM.QryOrder;
        ComputeAmt(SGChk, C_Qty, C_Code, C_Ins);
      end;
    4:
      begin
        DsMed.DataSet := DM.QryOrder;
        Grp_Part.Enabled := true;
        ComputeAmt(SGFee, F_Qty, F_Code, F_Ins);
      end;
  end;
  initTextOrderTile;
  SourceCol := -1; SourceRow := -1;
end;

procedure TFrmOrder.SGLabKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in [#10, #13, #08, #10]) then
    key := key;
end;

procedure TFrmOrder.SGLabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if PanelLab.Visible then
  begin
    if key in [vk_up, vk_down, vk_return] then
    begin
      if Key = vk_return then
      begin
        DBText7Click(self);
        key := 0;
      end;
      Sendmessage(DBCLab.Handle, WM_KEYDOWN, key, 0);
      key := 0;
    end;
  end;
end;

procedure TFrmOrder.SGLabSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  MyRec: TRect;
  Mypoint: TPoint;
begin
  inherited;
  SGLab.Options := SGLab.Options - [goEditing];
  EdtLmemo.Hide;
  if (not TWinControl(Sender).Focused) or (TStringGrid(Sender).Cells[modifyType, Arow] = 'O') then
    Exit;
  case ACol of
    C_Cir:
      begin
        if NullStrTo(Trim(SGLab.Cells[C_Code, Arow]), Trim(SGLab.Cells[C_order, Arow])) = '' then
          Exit;

        SGLab.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGLab.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        EdtLCir.Tag := C_Cir;
        LBCir.Tag := ARow;
        EdtLCir.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGLab.Top, MyRec.right - MyRec.left, SGLab.DefaultRowHeight);
        EdtLCir.Show;
        EdtLCir.BringTofront;
        EdtLCir.Text := Trim(SGLab.cells[Acol, Arow]);
        LBCir.Items.Text := gsCir.Text;
        LBCir.Columns := 2;
        LBCir.Width := SGLab.Width - BtnLDel.Width;
        if (MyRec.Bottom + EdtLCir.Height) <= (ceil(SGLab.Height / 3) * 2) then
          LBCir.SetBounds(BtnCDel.Width, MyRec.Bottom + EdtLCir.Height + 2, LBCir.Width,
            SGLab.Height - (MyRec.Bottom + EdtLCir.Height))
        else
          LBCir.SetBounds(BtnCDel.Width, 25, LBCir.Width
            , MyRec.Top - 2);
        LBCir.Visible := True;
        try
          LBCir.ItemIndex := LBCir.Items.IndexOf(EdtLCir.Text);
        except
        end;
        EdtLCir.SetFocus;
        SGLab.Options := SGLab.Options - [goEditing];
      end;
    C_Ins, C_EMG:
      begin
        if (NullStrTo(Trim(SGLab.Cells[C_Code, Arow]), Trim(SGLab.Cells[C_order, Arow])) = '') or (SGLab.Cells[modifyType, Arow] <> 'N') or ((Acol = C_EMG) and (not ChkIsUrg(SGLab.Cells[C_Code, Arow], SGLab.Cells[C_2SEnd, Arow]))) then
          Exit;
        SGLab.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGLab.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        if ACol = C_EMG then
          CbbLOrderYN.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGLab.Top, MyRec.right - MyRec.left, SGLab.DefaultRowHeight)
        else
          CbbLOrderYN.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGLab.Top, MyRec.right - MyRec.left + 57, SGLab.DefaultRowHeight);
        CbbLOrderYN.Show;
        CbbLOrderYN.BringTofront;
        CbbLOrderYN.Text := SGLab.cells[Acol, Arow];
        CbbLOrderYN.DroppedDown := True;
        CbbLOrderYN.SetFocus;
        SGLab.Options := SGLab.Options - [goEditing];
      end;
    C_Order, C_Code:
      begin
        if NullStrTo(SGLab.Cells[modifyType, Arow], 'N') <> 'N' then
          exit;
        if (SGLab.Cells[modifyType, Arow] = 'N') and (Trim(SGLab.Cells[C_CODE, Arow]) <> '') then
        begin
          SGLab.Options := SGLab.Options - [goEditing];
          Exit;
        end;
        if (Trim(SGLab.Cells[C_CODE, Arow]) = '') then
        begin
          SetPanel(False, PanelLab);
          SGLab.Rows[Arow].Clear;
        end;
        SGLab.Options := SGLab.Options + [goEditing];
      end;
    C_MEMO:
      begin
        if (NullStrTo(Trim(SGLab.Cells[C_Code, Arow]), Trim(SGLab.Cells[C_order, Arow])) = '') or (SGLab.Cells[modifyType, Arow] <> 'N') then
          Exit;
        SGLab.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGLab.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        EdtLmemo.SetBounds(Mypoint.x, Mypoint.y + 1 + SGLab.Top + 1, MyRec.right - MyRec.left, SGLab.DefaultRowHeight);
        EdtLmemo.Show;
        EdtLmemo.BringTofront;
        EdtLmemo.Text := SGLab.cells[Acol, Arow];
        EdtLmemo.SetFocus;
        SGLab.Options := SGLab.Options - [goEditing];
      end;
  end;
end;

procedure TFrmOrder.DBText7Click(Sender: TObject);
var
  msg: string;
begin
  inherited;
  if RePeatNow(SGLab, DM.QryOrder.fieldByName('Fee_CODE').AsString, '檢驗', C_Code, msg) then
  begin
    if MessageDlg(msg, mtWarning, [mbYes, mbNo], 0) = mrNo then
    begin
      SGLab.Rows[SGLab.Row].Clear;
      SetPanel(False, PanelLab);
      SGLab.SetFocus;
      exit;
    end;
  end;

  if isRepeat(DM.QryOrder.fieldByName('Fee_CODE').AsString, Trim(DM.QryOrder.FieldByName('Send_cd_2').AsString), Trim(DM.QryOrder.FieldByName('Send_cd_1').AsString), Trim(DM.QryOrder.FieldByName('Send_cd_3').AsString), SGLab) then
  begin
    ShowPnlMsg('此' + DM.QryOrder.fieldByName('Fee_CODE').AsString + '檢驗品項已重複開立！');
    SGLab.Rows[SGLab.Row].Clear;
    SetPanel(False, PanelLab);
    SGLab.SetFocus;
    exit;
  end;

  SGLab.Cells[modifyType, SGLab.Rowcount - 1] := 'N';
  SGLab.Cells[Seq, SGLab.Rowcount - 1] := '';
  SGLab.Cells[Del, SGLab.Rowcount - 1] := '';
  SGLab.Cells[C_Code, SGLab.Rowcount - 1] := DM.QryOrder.fieldByName('Fee_CODE').AsString;
  SGLab.Cells[C_Order, SGLab.Rowcount - 1] := DM.QryOrder.fieldByName('Fee_NAME').AsString;
  SGLab.Cells[C_Qty, SGLab.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('UNIT_QTY').AsString);
  SGLab.Cells[C_Unit, SGLab.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('UNIT').AsString);
  SGLab.Cells[C_Cir, SGLab.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('CIR_CODE').AsString);
  SGLab.Cells[C_path, SGLab.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('Send_cd_2').AsString);
  SGLab.Cells[C_INS, SGLab.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('INS_FLAG').AsString);
  SGLab.Cells[C_EMG, SGLab.Rowcount - 1] := trim(DM.QryOrder.FieldByName('URG_FLAG').AsString);
  SGLab.Cells[C_MEMO, SGLab.Rowcount - 1] := '';
  SGLab.Cells[C_Send, SGLab.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('Send_cd_1').AsString);
  SGLab.Cells[C_Kind, SGLab.Rowcount - 1] := 'L';
  SGLab.Cells[C_2Send, SGLab.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('Send_cd_3').AsString);
  SGLab.Cells[C_INS_Flag, SGLab.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('INS_FLAG').AsString);
  CHKCASEPART('D', DM.QryOrder.fieldByName('Fee_CODE').AsString);
  SGLab.RowCount := SGLab.RowCount + 1;
  SGLab.Row := SGLab.Row + 1;
  SetPanel(False, PanelLab);
  SGLab.SetFocus;
  ComputeAmt(SGLab, C_Qty, C_Code, C_Ins);
  TabLab.Caption := '檢驗[' + IntToStr(SGLab.RowCount - 1) + ']';
  SGLab.Options := SGLab.Options + [goEditing];
end;

procedure TFrmOrder.SGXRayKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if PanelRay.Visible then
  begin
    if key in [vk_up, vk_down, vk_return] then
    begin
      if Key = vk_return then
      begin
        DBText13Click(self);
        key := 0;
      end;
      Sendmessage(DBCRay.Handle, WM_KEYDOWN, key, 0);
      key := 0;
    end
    else
    begin
    end;
  end;
end;

procedure TFrmOrder.SGXRayKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key in [vk_up, vk_down]) and (PanelRay.Visible) then
    exit;
  if TStringGrid(Sender).Cells[modifytype, TStringGrid(Sender).row] <> '' then
    Exit;
  if TStringGrid(Sender).Col = C_Order then
  begin
    if Trim(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) <> '' then
    begin


      //找放射名稱
      with DM.QryOrder do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select OrderItem_basic.*,(select Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=''R1'' and RTrim(Code_one) = RTrim(ORDER_TYPE)) "類別",');
        SQL.Add('(select Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=''R2'' and RTrim(Code_one) = RTrim(Send_Cd_1) and RTrim(Code_Two) = RTrim(Order_type) ) "部位"');
        SQL.Add(' from OrderItem_basic where (ORDER_TYPE IN ((SELECT RTrim(CODE_ONE) FROM COMPARE_CODE_BASIC WHERE IPD_RELATED=''R1'')) or (ORDER_TYPE IN (''T1'',''T2'',''T3''))) and  INSTR(UPPER(FEE_NAME),  ' + Qt(UPPERCASE(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row])) + ') > 0 and USE_STATUS_O=''1''  Order by   USE_STATUS_O,Fee_code,Fee_Desc,Fee_Name');
        open;
      end;
      SetPanel(true, PanelRay);
    end
    else
      SetPanel(False, PanelRay);
  end
  else if TStringGrid(Sender).Col = C_Code then
  begin
    if Trim(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) <> '' then
    begin
      //找放射代碼
      with DM.QryOrder do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select OrderItem_basic.*,(select Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=''R1'' and RTrim(Code_one) = RTrim(ORDER_TYPE)) "類別",');
        SQL.Add('(select Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=''R2'' and RTrim(Code_one) = RTrim(Send_Cd_1) and RTrim(Code_Two) = RTrim(Order_type) ) "部位"');
        SQL.Add('from OrderItem_basic where ((RTrim(ORDER_TYPE) IN (SELECT RTrim(CODE_ONE) FROM COMPARE_CODE_BASIC WHERE IPD_RELATED=''R1'')) or (ORDER_TYPE IN (''T1'',''T2'',''T3''))) and UPPER(fee_code) like ' + Qt(UPPERCASE(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) + '%') + ' and USE_STATUS_O=''1'' Order by  USE_STATUS_O,Fee_code,Fee_Desc,Fee_Name');
        open;
        First;
      end;
      SetPanel(true, PanelRay);
    end
    else
      SetPanel(False, PanelRay);
  end
  else
    SetPanel(False, PanelRay);
end;

procedure TFrmOrder.SGXRaySelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  MyRec: TRect;
  Mypoint: TPoint;
begin
  inherited;
  SGXRay.Options := SGXRay.Options - [goEditing];
  case ACol of
    C_Cir:
      begin
        if (NullStrTo(Trim(TStringGrid(Sender).Cells[C_Code, Arow]), Trim(TStringGrid(Sender).Cells[C_order, Arow])) = '') or (TStringGrid(Sender).Cells[modifyType, Arow] <> 'N') then
          Exit;
        SGXRay.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGXRay.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        EdtRCir.Tag := C_Cir;
        LBRCir.Tag := ARow;
        EdtRCir.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGXRay.Top, MyRec.right - MyRec.left, SGXRay.DefaultRowHeight);
        EdtRCir.Show;
        EdtRCir.BringTofront;
        EdtRCir.Text := Trim(SGXRay.cells[Acol, Arow]);
        LBRCir.Items.Text := gsCir.Text;
        LBRCir.Columns := 2;
        LBRCir.Width := SGXRay.Width - BtnRDel.Width;
        if (MyRec.Bottom + EdtRCir.Height) <= (ceil(SGXRay.Height / 3) * 2) then
          LBRCir.SetBounds(BtnRDel.Width, MyRec.Bottom + EdtRCir.Height + 2, LBRCir.Width,
            SGXRay.Height - (MyRec.Bottom + EdtRCir.Height))
        else
          LBRCir.SetBounds(BtnRDel.Width, 25, LBRCir.Width
            , MyRec.Top - 2);
        LBRCir.Visible := True;
        try
          LBRCir.ItemIndex := LBRCir.Items.IndexOf(EdtRCir.Text);
        except
        end;
        EdtRCir.SetFocus;
        SGXRay.Options := SGXRay.Options - [goEditing];
      end;
    C_EMG, C_Ins:
      begin
        if ((NullStrTo(Trim(TStringGrid(Sender).Cells[C_Code, Arow]), Trim(TStringGrid(Sender).Cells[C_order, Arow])) = '') or (TStringGrid(Sender).Cells[modifyType, Arow] <> 'N')) and (copy(SGXRay.Cells[C_Kind, Arow], 1, 1) <> 'TT') then
          Exit;
        TStringGrid(Sender).perform(WM_CANCELMODE, 0, 0);
        MyRec := TStringGrid(Sender).CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        if ACol = C_EMG then
          CbbROrderYN.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + TStringGrid(Sender).Top, MyRec.right - MyRec.left, TStringGrid(Sender).DefaultRowHeight)
        else
          CbbROrderYN.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + TStringGrid(Sender).Top, MyRec.right - MyRec.left + 57, TStringGrid(Sender).DefaultRowHeight);
        CbbROrderYN.Show;
        CbbROrderYN.BringTofront;
        CbbROrderYN.Text := TStringGrid(Sender).cells[Acol, Arow];
        CbbROrderYN.SetFocus;
        TStringGrid(Sender).Options := TStringGrid(Sender).Options - [goEditing];
      end;
    C_Order, C_Code:
      begin
        if NullStrTo(TStringGrid(Sender).Cells[modifyType, Arow], 'N') <> 'N' then
          exit;
        if (TStringGrid(Sender).Cells[modifyType, Arow] = 'N') and (Trim(TStringGrid(Sender).Cells[C_CODE, Arow]) <> '') then
        begin
          TStringGrid(Sender).Options := TStringGrid(Sender).Options - [goEditing];
          Exit;
        end;
        if (Trim(TStringGrid(Sender).Cells[C_CODE, Arow]) = '') and (PanelRay.Visible) then
        begin
          SetPanel(False, PanelRay);
          TStringGrid(Sender).Rows[Arow].Clear;
        end;
        TStringGrid(Sender).Options := TStringGrid(Sender).Options + [goEditing];
      end;
    C_MEMO, C_Unit, C_Qty:
      begin
        if ((C_Unit = ACol) or (C_Qty = ACol)) and (copy(SGXRay.Cells[C_Kind, Arow], 1, 1) <> 'T') then
          Exit;
        if ((NullStrTo(Trim(SGXRay.Cells[C_Code, Arow]), Trim(SGXRay.Cells[C_order, Arow])) = '') or (TStringGrid(Sender).Cells[modifyType, Arow] <> 'N')) and (copy(SGXRay.Cells[C_Kind, Arow], 1, 1) <> 'TT') then
          Exit;
        SGXRay.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGXRay.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        EdtRmemo.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGXRay.Top, MyRec.right - MyRec.left - 5, SGXRay.DefaultRowHeight);
        EdtRmemo.Show;
        EdtRmemo.BringTofront;
        EdtRmemo.Text := SGXRay.cells[Acol, Arow];
        EdtRmemo.SetFocus;
      end;

  end;
end;

procedure TFrmOrder.DBText13Click(Sender: TObject);
var
  msg: string;
begin
  inherited;
  if RePeatNow(SGXRay, DM.QryOrder.fieldByName('Fee_CODE').AsString, '放射', C_Code, msg) then
  begin
    if MessageDlg(msg, mtWarning, [mbYes, mbNo], 0) = mrNo then
    begin
      SGXRay.Rows[SGXRay.Row].Clear;
      SetPanel(False, PanelRay);
      SGXRay.SetFocus;
      exit;
    end;
  end;

  if isRepeat(DM.QryOrder.fieldByName('Fee_CODE').AsString, Trim(DM.QryOrder.FieldByName('Send_cd_1').AsString), Trim(DM.QryOrder.FieldByName('Send_cd_2').AsString), Trim(DM.QryOrder.FieldByName('Send_cd_3').AsString), SGXRay) then
  begin
    ShowPnlMsg('此' + DM.QryOrder.fieldByName('Fee_CODE').AsString + '放射品項已重複開立！');
    SGXRay.Rows[SGXRay.Row].Clear;
    SetPanel(False, PanelRay);
    SGXRay.SetFocus;
    exit;
  end;

  SGXRay.Cells[modifyType, SGXRay.Rowcount - 1] := 'N';
  SGXRay.Cells[Seq, SGXRay.Rowcount - 1] := '';
  SGXRay.Cells[Del, SGXRay.Rowcount - 1] := '';
  SGXRay.Cells[C_Code, SGXRay.Rowcount - 1] := DM.QryOrder.fieldByName('Fee_CODE').AsString;
  SGXRay.Cells[C_Order, SGXRay.Rowcount - 1] := DM.QryOrder.fieldByName('Fee_NAME').AsString;
  SGXRay.Cells[C_Qty, SGXRay.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('UNIT_QTY').AsString);
  if copy(Trim(DM.QryOrder.FieldByName('Order_Type').AsString), 1, 2) = 'XT' then
    SGXRay.Cells[C_Unit, SGXRay.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('path_code_o').AsString)
  else
    SGXRay.Cells[C_Unit, SGXRay.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('UNIT_O').AsString);
  SGXRay.Cells[C_Cir, SGXRay.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('CIR_CODE_O').AsString);
  SGXRay.Cells[C_path, SGXRay.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('Send_cd_1').AsString);
  SGXRay.Cells[C_INS, SGXRay.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('INS_FLAG').AsString);
  SGXRay.Cells[C_EMG, SGXRay.Rowcount - 1] := 'N';
  SGXRay.Cells[C_MEMO, SGXRay.Rowcount - 1] := '';
  SGXRay.Cells[C_Send, SGXRay.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('Send_cd_2').AsString);
  SGXRay.Cells[C_Kind, SGXRay.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('Order_Type').AsString);
  SGXRay.Cells[C_2Send, SGXRay.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('Send_cd_3').AsString);
  SGXRay.Cells[C_INS_Flag, SGXRay.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('INS_FLAG').AsString);
  CHKCASEPART('D', DM.QryOrder.fieldByName('Fee_CODE').AsString);
  SGXRay.RowCount := SGXRay.RowCount + 1;
  SGXRay.Row := SGXRay.Row + 1;
  SetPanel(False, PanelRay);
  SGXRay.SetFocus;
  Radionum;
  ComputeAmt(SGXRay, C_Qty, C_Code, C_Ins);
  TabXRay.Caption := '放射[' + IntToStr(SGXRay.RowCount - 1) + ']';
end;

procedure TFrmOrder.SGChkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if PanelCHK.Visible then
  begin
    if key in [vk_up, vk_down, vk_return] then
    begin
      if Key = vk_return then
      begin
        DBText19Click(self);
        key := 0;
      end;
      Sendmessage(DBCCHK.Handle, WM_KEYDOWN, key, 0);
      key := 0;
    end;
  end;
end;

procedure TFrmOrder.SGChkKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key in [vk_up, vk_down]) and (PanelCHK.Visible) then
    exit;
  if TStringGrid(Sender).Cells[modifytype, TStringGrid(Sender).row] <> '' then
    Exit;
  if TStringGrid(Sender).Col = C_Order then
  begin
    if Trim(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) <> '' then
    begin
      //找檢查名稱
      with DM.QryOrder do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select OrderItem_basic.*,(select Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=''C1'' and RTrim(Code_one) = RTrim(Send_Cd_1)) "檢查室"');
        SQL.Add(' from OrderItem_basic where RTrim(order_type)=''E'' and  UPPER(FEE_NAME) LIKE  ' + Qt('%' + UPPERCASE(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) + '%') + ' and Use_STATUS_O=''1'' Order by  SEND_CD_1,Fee_code,Fee_Desc,Fee_Name');
        open;
      end;
      SetPanel(true, PanelCHK);
    end
    else
      SetPanel(False, PanelCHK);
  end
  else if TStringGrid(Sender).Col = C_Code then
  begin
    if Trim(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) <> '' then
    begin
      //找檢察代碼
      with DM.QryOrder do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select OrderItem_basic.*,(select Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED=''C1'' and RTrim(Code_one) = RTrim(Send_Cd_1)) "檢查室"');
        SQL.Add('from OrderItem_basic where RTRIM(order_type)=''E'' and UPPER(fee_code) like ' + Qt(UPPERCASE(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) + '%') + ' and Use_STATUS_O=''1'' Order by  SEND_CD_1,Fee_code,Fee_Desc,Fee_Name');
        SQL.SaveToFile('OrderItem.sql');
        open;
        First;
      end;
      SetPanel(true, PanelCHK);
    end
    else
      SetPanel(False, PanelCHK);
  end
  else
    SetPanel(False, PanelCHK);
end;

procedure TFrmOrder.SGChkSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  MyRec: TRect;
  Mypoint: TPoint;
begin
  inherited;
  SGChk.Options := SGChk.Options - [goEditing];
  if (not TWinControl(Sender).Focused) or (TStringGrid(Sender).Cells[modifyType, Arow] = 'O') then
    Exit;
  case ACol of
    C_Cir:
      begin
        if (NullStrTo(Trim(SGChk.Cells[C_Code, Arow]), Trim(SGChk.Cells[C_order, Arow])) = '') or (TStringGrid(Sender).Cells[modifyType, Arow] <> 'N') then
          Exit;
        SGChk.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGChk.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        EdtCCir.Tag := C_Cir;
        LBCCir.Tag := ARow;
        EdtCCir.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGChk.Top, MyRec.right - MyRec.left, SGChk.DefaultRowHeight);
        EdtCCir.Show;
        EdtCCir.BringTofront;
        EdtCCir.Text := Trim(SGChk.cells[Acol, Arow]);
        LBCCir.Items.Text := gsCir.Text;
        LBCCir.Columns := 2;
        LBCCir.Width := SGCHK.Width - BtnCDel.Width;
        if (MyRec.Bottom + EdtCCir.Height) <= (ceil(SGChk.Height / 3) * 2) then
          LBCCir.SetBounds(BtnCDel.Width, MyRec.Bottom + EdtCCir.Height + 2, LBCCir.Width,
            SGChk.Height - (MyRec.Bottom + EdtLCir.Height))
        else
          LBCCir.SetBounds(BtnCDel.Width, 25, LBCCir.Width
            , MyRec.Top - 2);
        LBCCir.Visible := True;
        try
          LBCCir.ItemIndex := LBCCir.Items.IndexOf(EdtCCir.Text);
        except
        end;
        EdtCCir.SetFocus;
        SGChk.Options := SGChk.Options - [goEditing];
      end;
    C_Ins, C_EMG:
      begin
        if (NullStrTo(Trim(SGChk.Cells[C_Code, Arow]), Trim(SGChk.Cells[C_order, Arow])) = '') or (TStringGrid(Sender).Cells[modifyType, Arow] <> 'N') then
          Exit;
        SGChk.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGChk.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        if ACol = C_EMG then
          CbbCOrderYN.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGChk.Top, MyRec.right - MyRec.left, SGChk.DefaultRowHeight)
        else
          CbbCOrderYN.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGChk.Top, MyRec.right - MyRec.left + 57, SGChk.DefaultRowHeight);
        CbbCOrderYN.Show;
        CbbCOrderYN.BringTofront;
        CbbCOrderYN.Text := SGChk.cells[Acol, Arow];
        CbbCOrderYN.DroppedDown := true;
        CbbCOrderYN.SetFocus;
        SGChk.Options := SGChk.Options - [goEditing];
      end;
    C_Order, C_Code:
      begin
        if NullStrTo(SGChk.Cells[modifyType, Arow], 'N') <> 'N' then
          exit;
        if (SGChk.Cells[modifyType, Arow] = 'N') and (Trim(SGChk.Cells[C_CODE, Arow]) <> '') then
        begin
          SGChk.Options := SGChk.Options - [goEditing];
          Exit;
        end;
        if (Trim(SGChk.Cells[C_CODE, Arow]) = '') then
        begin
          SetPanel(False, PanelCHK);
          SGChk.Rows[Arow].Clear;
        end;
        SGChk.Options := SGChk.Options + [goEditing];
      end;
    C_MEMO:
      begin
        if (NullStrTo(Trim(SGChk.Cells[C_Code, Arow]), Trim(SGChk.Cells[C_order, Arow])) = '') or (TStringGrid(Sender).Cells[modifyType, Arow] <> 'N') then
          Exit;
        SGChk.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGChk.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        EdtCmemo.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGChk.Top, MyRec.right - MyRec.left - 5, SGChk.DefaultRowHeight);
        EdtCmemo.Show;
        EdtCmemo.BringTofront;
        EdtCmemo.Text := SGChk.cells[Acol, Arow];
        EdtCmemo.SetFocus;
      end;
  end;
end;

procedure TFrmOrder.DBText19Click(Sender: TObject);
var
  msg: string;
begin
  inherited;

  if RePeatNow(SGChk, DM.QryOrder.fieldByName('Fee_CODE').AsString, '檢查', C_Code, msg) then
  begin
    if MessageDlg(msg, mtWarning, [mbYes, mbNo], 0) = mrNo then
    begin
      SGChk.Rows[SGChk.Row].Clear;
      SetPanel(False, PanelCHK);
      SGChk.SetFocus;
      exit;
    end;
  end;

  if isRepeat(DM.QryOrder.fieldByName('Fee_CODE').AsString, Trim(DM.QryOrder.FieldByName('Send_cd_1').AsString), Trim(DM.QryOrder.FieldByName('Send_cd_2').AsString), Trim(DM.QryOrder.FieldByName('Send_cd_3').AsString), SGChk) then
  begin
    ShowPnlMsg('此' + DM.QryOrder.fieldByName('Fee_CODE').AsString + '放射品項已重複開立！');
    SGChk.Rows[SGChk.Row].Clear;
    SetPanel(False, PanelCHK);
    SGChk.SetFocus;
    exit;
  end;

  SGChk.Cells[modifyType, SGChk.Rowcount - 1] := 'N';
  SGChk.Cells[Seq, SGChk.Rowcount - 1] := '';
  SGChk.Cells[Del, SGChk.Rowcount - 1] := '';
  SGChk.Cells[C_Code, SGChk.Rowcount - 1] := DM.QryOrder.fieldByName('Fee_CODE').AsString;
  SGChk.Cells[C_Order, SGChk.Rowcount - 1] := Trim(DM.QryOrder.fieldByName('Fee_NAME').AsString);
  SGChk.Cells[C_Qty, SGChk.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('UNIT_QTY').AsString);
  SGChk.Cells[C_Unit, SGChk.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('UNIT_O').AsString);
  SGChk.Cells[C_Cir, SGChk.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('CIR_CODE_O').AsString);
  SGChk.Cells[C_path, SGChk.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('Send_cd_1').AsString);
  SGChk.Cells[C_INS, SGChk.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('INS_FLAG').AsString);
  SGChk.Cells[C_EMG, SGChk.Rowcount - 1] := 'N';
  SGChk.Cells[C_MEMO, SGChk.Rowcount - 1] := '';
  SGChk.Cells[C_Send, SGChk.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('Send_cd_2').AsString);
  SGChk.Cells[C_Kind, SGChk.Rowcount - 1] := 'C';
  SGChk.Cells[C_2Send, SGChk.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('Send_cd_3').AsString);
  SGChk.Cells[C_INS_Flag, SGChk.Rowcount - 1] := Trim(DM.QryOrder.FieldByName('INS_FLAG').AsString);
  CHKCASEPART('D', DM.QryOrder.fieldByName('Fee_CODE').AsString);
  SGChk.RowCount := SGChk.RowCount + 1;
  SetPanel(False, PanelCHK);
  SGChk.Row := SGChk.Row + 1;
  SGChk.SetFocus;
  TabChk.Caption := '檢查[' + IntToStr(SGChk.RowCount - 1) + ']';
  ComputeAmt(SGChk, C_Qty, C_Code, C_Ins);
  SGChk.Options := SGChk.Options + [goEditing];
end;

procedure TFrmOrder.SGMedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if PanelMed.Visible then
  begin
    if key in [vk_up, vk_down, vk_return] then
    begin
      if Key = vk_return then
      begin
        DBText1Click(self);
        key := 0;
      end;
      Sendmessage(DBCGMed.Handle, WM_KEYDOWN, key, 0);
      key := 0;
    end;
  end;
end;

procedure TFrmOrder.SGMedKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key in [vk_up, vk_down]) and (PanelMed.Visible) then
    exit;
  if SGMed.Cells[modifytype, SGMed.row] <> '' then
    Exit;
  if SGMed.Col = M_Order then
  begin
    if Trim(SGMed.Cells[SGMed.Col, SGMed.Row]) <> '' then
    begin
      //找藥品名稱
      with DM.QryOrder do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select A.*,decode(A.USE_STATUS_O,''1'',''供'',''2'',''缺'',''停'') USE_STATUS_DESC from OrderItem_basic A where Substr(A.fee_code,1,1) <> ''A'' and Trim(A.order_type)=''M'' and ((UPPER(A.Fee_DESC) like ' + Qt(UPPERCASE(SGMed.Cells[SGMed.Col, SGMed.Row]) + '%') + ' ) or (UPPER(A.Fee_Name) like ' + Qt(UPPERCASE(SGMed.Cells[SGMed.Col, SGMed.Row]) + '%') + ' )) Order by   A.USE_STATUS_O,A.Fee_code,A.Fee_Desc,A.Fee_Name');
        open;
      end;
      SetPanel(true, Panelmed);
    end
    else
      SetPanel(False, Panelmed);
  end
  else if SGMed.Col = M_Code then
  begin
    if Trim(SGMed.Cells[SGMed.Col, SGMed.Row]) <> '' then
    begin
      //找藥品代碼
      with DM.QryOrder do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select A.*,decode(A.USE_STATUS_O,''1'',''供'',''2'',''缺'',''停'') USE_STATUS_DESC from OrderItem_basic A where Substr(A.fee_code,1,1) <> ''A'' and TRIM(A.order_type)=''M'' and UPPER(A.fee_code) like ' + Qt(UPPERCASE(SGMed.Cells[SGMed.Col, SGMed.Row]) + '%') + ' Order by  A.USE_STATUS_O,A.Fee_code,A.Fee_Desc,A.Fee_Name');
        open;
        First;
      end;
      SetPanel(true, Panelmed);
    end
    else
      SetPanel(False, Panelmed);
  end
  else
    SetPanel(False, Panelmed);
end;

procedure TFrmOrder.SGMedSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  MyRec: TRect;
  Mypoint: TPoint;
begin
  inherited;
  SGMed.Options := SGMed.Options - [goEditing];
  FeeRow := -1;
  if not TWinControl(Sender).Focused then
    Exit;
  if (NullStrTo(Trim(SGMed.Cells[M_Code, Arow]), Trim(SGMed.Cells[M_order, Arow])) = '') and ((ACol <> M_code) and (ACol <> M_order)) then
    Exit;
  if (Trim(SGMed.Cells[DEL, Arow]) = 'X') then
    Exit;
  if PanelMed.Visible then
  begin
    SGMed.Rows[ARow].Clear;
  end;
  case ACol of
    M_Path:
      begin
        if (SGMed.Cells[modifytype, Arow] = '') or (TStringGrid(Sender).Cells[modifyType, Arow] <> 'N') then
          Exit;
        SGMed.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGMed.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        EdtCir.Tag := M_Path;
        LBmed2.Tag := ARow;
        EdtCir.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGMed.Top, MyRec.right - MyRec.left, SGMed.DefaultRowHeight);
        EdtCir.Show;
        EdtCir.BringTofront;
        EdtCir.Text := Trim(SGMed.cells[Acol, Arow]);
        LBmed2.Items.Text := gsPath.Text;
        SetListWidth1(LBMed2, 2);
        LBMed2.SetBounds(BtnDel.Width + BtnCode.Width, 25, BtnDose.Width + BtnUnit.Width + BtnCir.Width + BtnPath.Width + BtnDay.Width + BtnTtl.Width + BtnIns.Width + BtnMemo.Width + BtnOrder.Width
          , 24 * (ARow mod 3) + SGFee.Height + 23);
        LBMed2.Visible := True;
        try
          LBMed2.ItemIndex := LBMed2.Items.IndexOf(EdtCir.Text);
        except
        end;
        EdtCir.SetFocus;
        SGMed.Options := SGMed.Options - [goEditing];
      end;
    M_Cir:
      begin
        if (SGMed.Cells[modifytype, Arow] = '') or (TStringGrid(Sender).Cells[modifyType, Arow] <> 'N') then
          Exit;

        SGMed.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGMed.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        EdtCir.Tag := M_Cir;
        LBmed2.Tag := ARow;
        EdtCir.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGMed.Top, MyRec.right - MyRec.left, SGMed.DefaultRowHeight);
        EdtCir.Show;
        EdtCir.BringTofront;
        EdtCir.Text := Trim(SGMed.cells[Acol, Arow]);
        LBmed2.Items.Text := gsCir.Text;
        SetListWidth1(LBMed2, 2);
        LBMed2.SetBounds(BtnDel.Width + BtnCode.Width, 25, BtnDose.Width + BtnUnit.Width + BtnCir.Width + BtnPath.Width + BtnDay.Width + BtnTtl.Width + BtnIns.Width + BtnMemo.Width + BtnOrder.Width
          , 24 * (ARow mod 3) + SGFee.Height + 23);
        LBMed2.Visible := True;
        try
          LBMed2.ItemIndex := LBMed2.Items.IndexOf(EdtCir.Text);
        except
        end;
        EdtCir.SetFocus;
        SGMed.Options := SGMed.Options - [goEditing];
      end;
    M_Ins, M_GRI:
      begin
        if (Trim(SGMed.Cells[M_CODE, Arow]) = '') or (Trim(SGMed.Cells[M_ORDER, Arow]) = '') or (TStringGrid(Sender).Cells[modifyType, Arow] <> 'N') then
          Exit;

        //N_自費,Y_健保,G_健(含),H_自(含)1030117
        IF UpperCase(ins_ctrl) = 'TRUE' THEN
          if trim(TStringGrid(Sender).Cells[M_ins_flag,Arow])= 'Y' then
          begin
            CbbOrderYN.Clear;
            CbbOrderYN.Items.Add('Y');
            CbbOrderYN.Items.Add('N');
            CbbOrderYN.Items.Add('G');
            CbbOrderYN.Items.Add('H');
          end
          else
          begin
            CbbOrderYN.Clear;
            CbbOrderYN.Items.Add('N');
            CbbOrderYN.Items.Add('H');
          end;

        SGMed.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGMed.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        CbbOrderYN.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGMed.Top, MyRec.right - MyRec.left, SGMed.DefaultRowHeight);
        CbbOrderYN.Show;
        CbbOrderYN.BringTofront;
        CbbOrderYN.Text := SGMed.cells[Acol, Arow];
        CbbOrderYN.SetFocus;
        SGMed.Options := SGMed.Options - [goEditing];
      end;
    M_Qty, M_day, M_Memo, M_Ttl:
      begin
        if (Trim(SGMed.Cells[M_CODE, Arow]) = '') or (Trim(SGMed.Cells[M_ORDER, Arow]) = '') or (TStringGrid(Sender).Cells[modifyType, Arow] <> 'N') then
          Exit;
        SGMed.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGMed.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        EdtOrderEdit.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGMed.Top, MyRec.right - MyRec.left, SGMed.DefaultRowHeight);
        EdtOrderEdit.Show;
        EdtOrderEdit.BringTofront;
        EdtOrderEdit.Text := SGMed.cells[Acol, Arow];
        EdtOrderEdit.SetFocus;
        SGMed.Options := SGMed.Options - [goEditing];
      end;
    M_Order, M_Code:
      begin
        if NullStrTo(SGMed.Cells[modifyType, Arow], 'N') <> 'N' then
        begin
          SetPanel(False, PanelMed);
          exit;
        end;
        if (SGMed.Cells[modifyType, Arow] = 'N') and (Trim(SGMed.Cells[M_CODE, Arow]) <> '') then
        begin
          SetPanel(False, PanelMed);
          SGMed.Options := SGMed.Options - [goEditing];
          Exit;
        end;
        if (Trim(SGMed.Cells[M_CODE, Arow]) = '') then
        begin
          SetPanel(False, PanelMed);
          SGMed.Rows[Arow].Clear;
        end;
        SGMed.Options := SGMed.Options + [goEditing];
      end;
  end;
end;

procedure TFrmOrder.DBText1Click(Sender: TObject);
begin
  inherited;
  if InsertMed(DM.QryOrder.FieldByName('FEE_code').AsString, '', '', '', '', '', '', '', SGMed.Row) then
  begin
    BringChild(DM.QryOrder.FieldByName('FEE_code').AsString);
    SGMed.RowCount := SGMed.RowCount + 1;
    SGMed.Row := SGMed.Row + 1;
    SGMed.Options := SGMed.Options + [goEditing];
    fee_tabst.Caption := '處置[' + IntToStr(SGFee.RowCount - 1) + ']' + ' ' + '用藥[' + IntToStr(SGMed.RowCount - 1) + ']';
  end
  else
    SGMed.Rows[SGMed.Row].Clear;
  SetPanel(False, PanelMed);
  SGMed.SetFocus;

end;

procedure TFrmOrder.BtnLabOpenClick(Sender: TObject);
var
  OPDADV, msgstr: string;
  AdvParamStr: string;
  i: integer;
  isLabDel: boolean;
begin
  inherited;

  if UpperCase(lschangepat) = 'TRUE' then
    if Pat_Id1.Text <> '健保' then
      chagepat;
      
  BtnLabOpen.Enabled := false;
  isLabDel := false;
  for i := 0 to SGLab.RowCount - 1 do
    if SGLab.Cells[Del, i] = 'X' then
    begin
      isLabDel := true;
      break;
    end;
  if SaveOrder(4, msgstr, SGLab) then
  begin

    BtnLabOpen.Enabled := true;
    OPDADV := SetSys.ReadString('DPD', 'OPDADV', '');
    AdvParamStr := SetSys.ReadString('ADV', 'LPRINT', '');
    if isLabDel then
      comAdvStrRep(AdvParamStr, 'Y')
    else
      comAdvStrRep(AdvParamStr, 'N');

    if OPDADV <> '' then
      ShellExecute(Handle, 'Open', PChar(OPDADV), PChar(AdvParamStr), nil, SW_SHOWNORMAL);

    ShowPnlMsg('檢驗項目完成');
  end
  else
    ShowPnlMsg('檢驗項目失敗' + #13 + '請洽詢資訊室');

  BtnLabOpen.Enabled := true;
end;

procedure TFrmOrder.Doc_N2Change(Sender: TObject);
var
  Qrys: TADOQuery;
  tmpSql: string;
  SQLs: TStrings;
begin
  inherited;
  if length(trim(Doc_N2.Text)) >= 5 then
  begin
    SQLs := TStringList.Create;
    tmpSql := getChkSqlStr(16);
    SetParamter(tmpSql, '$DEC_DOC$', '1');
    SetParamter(tmpSql, '$OPERATE$', '=');
    SetParamter(tmpSql, '$DOC_CODE$', trim(Doc_N2.Text));
    SQLs.Text := tmpSql;

    if not DM.OpenSQL(SQLs, Qrys) then
    begin
      tmpSql := getChkSqlStr(16);
      SetParamter(tmpSql, '$DEC_DOC$', '1');
      SetParamter(tmpSql, '$OPERATE$', '=');
      SetParamter(tmpSql, '$DOC_CODE$', ReturnName(trim(Doc_N2.Text)));
      SQLs.Text := tmpSql;
    end;

    if DM.OpenSQL(SQLs, Qrys) then
    begin
      Doc_N2.Text := trim(Qrys.FieldByName('doc_name').AsString) + '_' + trim(Qrys.FieldByName('doc_code').AsString);
      Doc_N2Click(Sender);
    end
    else if length(trim(Doc_N2.Text)) = 5 then
    begin
      tmpSql := getChkSqlStr(16);
      SetParamter(tmpSql, '$DEC_DOC$', '1');
      SetParamter(tmpSql, '$OPERATE$', 'like');
      SetParamter(tmpSql, '$DOC_CODE$', trim(Doc_N2.Text) + '%');
      SQLs.Clear;
      SQLs.Text := tmpSql;
      if not DM.OpenSQL(SQLs, Qrys) then
        Doc_N2.Text := '';
    end
    else
      Doc_N2.Text := '';

    SQLs.Free;
  end;
end;

procedure TFrmOrder.Doc_N3Change(Sender: TObject);
var
  Qrys: TADOQuery;
  tmpSql: string;
  SQLs: TStrings;
begin
  inherited;
  if length(trim(Doc_N3.Text)) >= 5 then
  begin
    SQLs := TStringList.Create;
    tmpSql := getChkSqlStr(19);
    SetParamter(tmpSql, '$OPERATE$', '=');
    SetParamter(tmpSql, '$DOC_CODE$', trim(Doc_N3.Text));
    SetParamter(tmpSql, '$DEPT_CODE$', '%');
    SQLs.Text := tmpSql;

    if DM.OpenSQL(SQLs, Qrys) then
    begin
      Doc_N3.Text := trim(Qrys.FieldByName('doc_name').AsString) + '_' + trim(Qrys.FieldByName('doc_code').AsString);
      setDocCode3(ReturnName(Doc_N3.Text));
      setDocName3(ReturnId(Doc_N3.Text));
    end
    else if length(trim(Doc_N3.Text)) = 5 then
    begin
      tmpSql := getChkSqlStr(19);
      SetParamter(tmpSql, '$OPERATE$', 'like');
      SetParamter(tmpSql, '$DOC_CODE$', trim(Doc_N3.Text) + '%');
      SetParamter(tmpSql, '$DEPT_CODE$', '%');
      SQLs.Clear;
      SQLs.Text := tmpSql;
      if not DM.OpenSQL(SQLs, Qrys) then
        Doc_N3.Text := '';
    end
    else
      Doc_N3.Text := '';
    //取vspsw 20140514
    SQLs.Clear;
    tmpSql := 'select * from oper_basic where oper_id='+Qt(trim(Doc_N3.Text));
    SQLs.Text := tmpSql;
    if  DM.OpenSQL(SQLs, Qrys) then
        setvspsw(trim(Qrys.FieldByName('pswd_desc').AsString));

    SQLs.Free;
  end;
end;

procedure TFrmOrder.BtnXRayOpenClick(Sender: TObject);
var
  OPDADV,msgstr: string;
  AdvParamStr: string;
begin
  inherited;

  if UpperCase(lschangepat) = 'TRUE' then
    if Pat_Id1.Text <> '健保' then
      chagepat;

  BtnXRayOpen.Enabled := false;
  if SaveOrder(5, msgstr, SGXRay) then
  begin
    BtnXRayOpen.Enabled := true;
    OPDADV := SetSys.ReadString('DPD', 'OPDADV', '');
    AdvParamStr := SetSys.ReadString('ADV', 'RPRINT', '');
    comAdvStrRep(AdvParamStr, '');
    if OPDADV <> '' then
      ShellExecute(Handle, 'Open', PChar(OPDADV), PChar(AdvParamStr), nil, SW_SHOWNORMAL);


    AdvParamStr := SetSys.ReadString('ADV', 'DRPRINT', '');
    comAdvStrRep(AdvParamStr, '');
    if AdvParamStr <> '' then
      ShellExecute(Handle, 'Open', PChar(OPDADV), PChar(AdvParamStr), nil, SW_SHOWNORMAL);
    
    ShowPnlMsg('放射項目完成');
  end
  else
    ShowPnlMsg('放射項目失敗' + #13 + '請洽詢資訊室');

  BtnXRayOpen.Enabled := true;
end;

procedure TFrmOrder.BtnChkOpenClick(Sender: TObject);
var
  OPDADV, msgstr: string;
  AdvParamStr: string;
begin
  inherited;

  if UpperCase(lschangepat) = 'TRUE' then
    if Pat_Id1.Text <> '健保' then
      chagepat;
      
  BtnChkOpen.Enabled := false;
  if SaveOrder(6, msgstr, SGXRay) then
  begin
    BtnChkOpen.Enabled := true;
    OPDADV := SetSys.ReadString('DPD', 'OPDADV', '');
    AdvParamStr := SetSys.ReadString('ADV', 'CPRINT', '');
    comAdvStrRep(AdvParamStr, '');
    if OPDADV <> '' then
      ShellExecute(Handle, 'Open', PChar(OPDADV), PChar(AdvParamStr), nil, SW_SHOWNORMAL);

    ShowPnlMsg('檢查項目完成');
  end
  else
    ShowPnlMsg('檢查項目失敗' + #13 + '請洽詢資訊室');

  BtnChkOpen.Enabled := true;
end;

procedure TFrmOrder.CbbLOrderYNExit(Sender: TObject);
var
  Col, Col1: integer;
begin
  inherited;
  Col1 := 0;
  case (Pgc_P.ActivePageIndex) of
    0, 1, 3:
      begin
        Col := C_INS_Flag;
        Col1 := C_EMG;
      end;
    4:
      Col := M_INS_Flag;
  end;

  try
    if (TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Cells[Col, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row] <> 'N') or (ReturnID(TComBoBox(Sender).Text) = 'C') or (ReturnID(TComBoBox(Sender).Text) = 'H') or (ReturnID(TComBoBox(Sender).Text) = 'N') or (TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Col = Col1) then
    begin
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Cells[TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Col, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row] := ReturnID(TComBoBox(Sender).Text);
      TComBoBox(Sender).Hide;
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Refresh;
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).SetFocus;
      TComBoBox(Sender).Text := '';
      case (Pgc_P.ActivePageIndex) of
        0, 1, 3:
          ComputeAmt(TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)), C_Qty, C_Code, C_Ins);
        4:
          ComputeAmt(SGFee, F_Qty, F_Code, F_Ins);
      end;
    end
    else
    begin
      ShowPnlMsg('此計價項目僅能開立自費');
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Cells[TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Col, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row] := 'N';
      TComBoBox(Sender).Text := 'N';
      TComBoBox(Sender).Hide;
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Refresh;
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).SetFocus;
      TComBoBox(Sender).Text := '';
    end;

  except
  end;
end;

procedure TFrmOrder.EdtLMemoExit(Sender: TObject);
var
  MedQtyStr, TmpStr, TmpStr1: string;
begin
  inherited;
  if (TEdit(Sender).Name = 'EdtRMemo') and (SGXray.Col = C_Unit) then
    if Length(trim(ReturnID(TEdit(Sender).Text))) > 6 then
    begin
      ShowPnlMsg('輸入牙位已超過申報上限3牙位！' + #13 + '請重新修正牙位');
      Exit;
    end;

  try
    TmpStr := TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Cells[TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Col, TStringGrid(FrmOrder.FindComponent(TEdit(Sender).Hint)).Row];
    TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Cells[TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Col, TStringGrid(FrmOrder.FindComponent(TEdit(Sender).Hint)).Row] := ReturnID(TEdit(Sender).Text);
    TEdit(Sender).Hide;
    TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Refresh;
    TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).SetFocus;
    TEdit(Sender).Text := '';
    if ((TEdit(Sender).Name = 'EdtOrderEdit') or (SGMed.Col in [M_Day, M_Qty])) and (SGMed.Col <> M_Ttl) then
    begin
      TmpStr1 := SGMed.Cells[M_Ttl, SGMed.Row];
      SGMed.Cells[M_Ttl, SGMed.Row] := CalMedTtl(SGMed.Cells[M_Cir, SGMed.Row], SGMed.Cells[M_countflag, SGMed.Row], StrToInt(SGMed.Cells[M_PackAmt, SGMed.Row]), StrToInt(SGMed.Cells[M_Day, SGMed.Row]), StrToFloat(SGMed.Cells[M_Qty, SGMed.Row]));
      ComputeAmt(SGFee, F_Qty, F_Code, F_Ins);
    end;
  except
  end;
end;

procedure TFrmOrder.SGLabDblClick(Sender: TObject);
var
  i, J: Integer;
  myDel: TStringGrid;
begin
  inherited;
  case TStringGrid(Sender).Col of
    Del:
      begin
        if NullStrTo(TStringGrid(Sender).Cells[modifyType, TStringGrid(Sender).Row], 'N') = 'N' then
        begin
          if TStringGrid(Sender).RowCount = 1 then
            TStringGrid(Sender).RowCount := TStringGrid(Sender).RowCount + 1;
          if TStringGrid(Sender).row >= 0 then
          begin
            for i := TStringGrid(Sender).row to TStringGrid(Sender).RowCount - 1 do
              TStringGrid(Sender).Rows[i] := TStringGrid(Sender).Rows[i + 1];
            TStringGrid(Sender).RowCount := TStringGrid(Sender).RowCount - 1;
            if TStringGrid(Sender).Cells[modifyType, TStringGrid(Sender).RowCount - 1] <> '' then
              TStringGrid(Sender).RowCount := TStringGrid(Sender).RowCount + 1;
          end;
          TabLab.Caption := '檢驗[' + IntToStr(SGLab.RowCount - 1) + ']';
          TabXRay.Caption := '放射[' + IntToStr(SGXRay.RowCount - 1) + ']';
          TabChk.Caption := '檢查[' + IntToStr(SGChk.RowCount - 1) + ']';
          fee_tabst.Caption := '處置[' + IntToStr(SGFee.RowCount - 1) + ']' + ' ' + '用藥[' + IntToStr(SGMed.RowCount - 1) + ']';
          TabMtrl.Caption := '衛材[' + IntToStr(SGMtrl.RowCount - 1) + ']';
        end
        else
        begin
          if (TStringGrid(Sender).Cells[modifyType, TStringGrid(Sender).Row] = 'O') and (TStringGrid(Sender).Cells[C_Order_Status, TStringGrid(Sender).Row] <> 'Y') then
            if TStringGrid(Sender).Cells[DEL, TStringGrid(Sender).Row] = '' then
              TStringGrid(Sender).Cells[DEL, TStringGrid(Sender).Row] := 'X'
            else
              TStringGrid(Sender).Cells[DEL, TStringGrid(Sender).Row] := '';
        end;
        if TStringGrid(Sender) = SGXRay then
          Radionum;
        TStringGrid(Sender).Refresh;
      end;
  end;
end;

procedure TFrmOrder.SGLabDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if ACol = C_Code then
    TStringGrid(Sender).Canvas.Font.Size := 13
  else
    TStringGrid(Sender).Canvas.Font.Size := 14;
  if TStringGrid(Sender).Cells[modifyType, ARow] = 'O' then
    TStringGrid(Sender).Canvas.Brush.Color := $00E0E0BA
  else
    TStringGrid(Sender).Canvas.Brush.Color := ClWindow;
  if TStringGrid(Sender).Cells[Del, ARow] = 'X' then
    TStringGrid(Sender).Canvas.Font.Color := ClRed
  else
    TStringGrid(Sender).Canvas.Font.Color := Clblack;
  TStringGrid(Sender).Canvas.FillRect(Rect);
  TStringGrid(Sender).Canvas.TextOut(Rect.Left + 1, Rect.Top + 1, Trim(TStringGrid(Sender).Cells[ACol, ARow]));
end;

procedure TFrmOrder.SGXRayDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if ACol = C_Code then
    TStringGrid(Sender).Canvas.Font.Size := 13
  else
    TStringGrid(Sender).Canvas.Font.Size := 14;
  if TStringGrid(Sender).Cells[modifyType, ARow] = 'O' then
    TStringGrid(Sender).Canvas.Brush.Color := $00E0E0BA
  else
    TStringGrid(Sender).Canvas.Brush.Color := ClWindow;
  if TStringGrid(Sender).Cells[Del, ARow] = 'X' then
    TStringGrid(Sender).Canvas.Font.Color := ClRed
  else
    TStringGrid(Sender).Canvas.Font.Color := Clblack;
  TStringGrid(Sender).Canvas.FillRect(Rect);
  TStringGrid(Sender).Canvas.TextOut(Rect.Left + 1, Rect.Top + 1, Trim(TStringGrid(Sender).Cells[ACol, ARow]));
end;

procedure TFrmOrder.SGChkDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if ACol = C_Code then
    TStringGrid(Sender).Canvas.Font.Size := 13
  else
    TStringGrid(Sender).Canvas.Font.Size := 14;
  if TStringGrid(Sender).Cells[modifyType, ARow] = 'O' then
    TStringGrid(Sender).Canvas.Brush.Color := $00E0E0BA
  else
    TStringGrid(Sender).Canvas.Brush.Color := ClWindow;
  if TStringGrid(Sender).Cells[Del, ARow] = 'X' then
    TStringGrid(Sender).Canvas.Font.Color := ClRed
  else
    TStringGrid(Sender).Canvas.Font.Color := Clblack;
  TStringGrid(Sender).Canvas.FillRect(Rect);
  TStringGrid(Sender).Canvas.TextOut(Rect.Left + 1, Rect.Top + 1, Trim(TStringGrid(Sender).Cells[ACol, ARow]));
end;

procedure TFrmOrder.SGMedDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if Trim(SGMed.Cells[M_CODE, ARow]) = '' then
    Exit;
  if ACol = M_Code then
    SGMed.Canvas.Font.Size := 13
  else
    SGMed.Canvas.Font.Size := 14;
  if (UPPERCASE(SGMed.Cells[M_CIR, ARow]) = 'STAT') or (UPPERCASE(SGMed.Cells[M_CIR, ARow]) = 'ST') then
    SGMed.Canvas.Font.Color := clBlue
  else
    SGMed.Canvas.Font.Color := Clblack;

  //20140115高危跌藥品顏色提示
  SpecMedCheck(trim(TStringGrid(Sender).Cells[M_Code,ARow]));
  SpecMedbgCheck(trim(TStringGrid(Sender).Cells[M_Code,ARow]));

  if SGMed.Cells[modifyType, ARow] = 'O' then
    SGMed.Canvas.Brush.Color := $00E0E0BA
  else
    SGMed.Canvas.Brush.Color := ClWindow;
  if SGMed.Cells[Del, ARow] = 'X' then
    SGMed.Canvas.Font.Color := Clred;
  SGMed.Canvas.FillRect(Rect);
  if ACol <> M_INS then
    SGMed.Canvas.TextOut(Rect.Left, Rect.Top + 1, Trim(SGMed.Cells[ACol, ARow]))
  else
  begin
    if (SGMed.Cells[ACol, ARow] = 'Y') or (SGMed.Cells[ACol, ARow] = 'G') then
      SGMed.Canvas.TextOut(Rect.Left, Rect.Top + 1, '健')
    else
      SGMed.Canvas.TextOut(Rect.Left, Rect.Top + 1, '自');
  end;

end;

procedure TFrmOrder.LBCirDblClick(Sender: TObject);
begin
  inherited;
  if LBCIR.ItemIndex <> -1 then
  begin
    EdtLCir.Text := Trim(ReturnID(LBCIR.Items.Strings[LBCIR.itemindex]));
    SGLab.Cells[EdtLCir.Tag, LBCIR.Tag] := EdtLCir.Text;
  end;
  LBCIR.Visible := False;

  EdtLCir.Text := '';
  EdtLCir.Visible := False;
  SGLab.Refresh;
end;

procedure TFrmOrder.LBRCirDblClick(Sender: TObject);
begin
  inherited;
  if LBRCir.ItemIndex <> -1 then
  begin
    EdtRCir.Text := Trim(ReturnID(LBRCir.Items.Strings[LBRCir.itemindex]));
    SGXRay.Cells[EdtRCir.Tag, LBRCir.Tag] := EdtRCir.Text;
  end;
  LBRCir.Visible := False;

  EdtRCir.Text := '';
  EdtRCir.Visible := False;
  SGXRay.Refresh;
end;

procedure TFrmOrder.LBCCirDblClick(Sender: TObject);
begin
  inherited;
  if LBCCir.ItemIndex <> -1 then
  begin
    EdtCCir.Text := Trim(ReturnID(LBCCir.Items.Strings[LBCCir.itemindex]));
    SGChk.Cells[EdtCCir.Tag, LBCCir.Tag] := EdtCCir.Text;
  end;
  LBCCir.Visible := False;

  EdtCCir.Text := '';
  EdtCCir.Visible := False;
  SGChk.Refresh;
end;

procedure TFrmOrder.LBMed2DblClick(Sender: TObject);
begin
  inherited;
  if LBMed2.ItemIndex <> -1 then
  begin
    EdtCir.Text := Trim(ReturnID(LBMed2.Items.Strings[LBMed2.itemindex]));
    SGMed.Cells[EdtCir.Tag, LBMed2.Tag] := EdtCir.Text;
  end;
  LBmed2.Visible := False;
  EdtCir.Text := '';
  EdtCir.Visible := False;
  SGMed.Cells[M_Ttl, SGMed.Row] := CalMedTtl(SGMed.Cells[M_Cir, SGMed.Row], SGMed.Cells[M_countflag, SGMed.Row], StrToInt(SGMed.Cells[M_PackAmt, SGMed.Row]), StrToInt(SGMed.Cells[M_Day, SGMed.Row]), StrToFloat(SGMed.Cells[M_Qty, SGMed.Row]));
end;

procedure TFrmOrder.MemoSDblClick(Sender: TObject);
begin
  inherited;
  if PanelSOHP.Tag = 0 then
  begin
    PanelOrder.Align := alNone;
    PanelShow.Align := alNone;
    PageControl2.Align := alNone;
    Panel1.Align := alNone;
    PanelSOHP.Parent := FrmOrder;
    PanelSOHP.Align := alClient;
    PanelS.Height := 150;
    PanelO.Height := 150;
    PanelH.Height := 80;
    PanelSOHP.Tag := 1;
  end
  else
  begin

    Panel1.Align := alTop;
    PageControl2.Align := alTop;
    PanelOrder.Align := alClient;
    PanelShow.Align := alBottom;
    PanelSOHP.Parent := S_Tabst;
    PanelSOHP.Align := alClient;
    PanelS.Height := PanelS.Tag;
    PanelO.Height := PanelO.Tag;
    PanelH.Height := PanelH.Tag;
    PanelP.Height := PanelP.Constraints.MinHeight;
    PanelSOHP.Tag := 0;
  end;
end;

procedure TFrmOrder.SGICDEnter(Sender: TObject);
begin
  inherited;
  Pgc_PChange(Sender);
  if (TStringGrid(Sender).Name = 'SGIcd') or (TStringGrid(Sender).Name = 'SGIcd10') then
  begin
    if TStringGrid(Sender).Name = 'SGIcd' then
      DSIcd.DataSet := DM.QrySearch;
    if TStringGrid(Sender).Name = 'SGIcd10' then
      DSICD10.DataSet := DM.QrySearch;
    //確認是否要提示初級照護診斷20141202
    if (SGIcd.Col = 0) and (SGIcd.Row = 0) and (TStringGrid(Sender).Name = 'SGIcd') then
       choosesgICD := True;
  end
  else if TStringGrid(Sender).Name = 'SGMed' then
    DsMed.DataSet := DM.QryOrder
  else if TStringGrid(Sender).Name = 'SGFee' then
    DSFee.DataSet := DM.QrySearch;
end;

procedure TFrmOrder.SGICDDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if (TStringGrid(Sender).Name = 'SGIcd') or (TStringGrid(Sender).Name = 'SGIcd10') then
    if TStringGrid(Sender).Cells[3, arow] = 'Y' then
    begin
      TStringGrid(Sender).Canvas.Brush.Color := clRed;
      TStringGrid(Sender).Canvas.Font.Color := clWhite;
    end;

  TStringGrid(Sender).Canvas.FillRect(Rect);
  TStringGrid(Sender).Canvas.TextOut(Rect.Left + 1, Rect.Top + 1, Trim(TStringGrid(Sender).Cells[ACol, ARow]));
end;

procedure TFrmOrder.SGICDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (PnlIcd.Visible) or (PnlICD10.Visible) then
  begin
    if key in [vk_up, vk_down, vk_return] then
    begin
      if Key = vk_return then
      begin
        if PnlIcd.Visible then
          DBText20Click(self);
        if (PnlICD10.Visible) and (Sender = SGIcd10) then
          DBText38Click(self);
        key := 0;
      end;
      if (PnlIcd.Visible) and (Sender = SGIcd) then
        Sendmessage(DBCIcd.Handle, WM_KEYDOWN, key, 0);
      if (PnlICD10.Visible) and (Sender = SGIcd10) then
        Sendmessage(DBCICD10.Handle, WM_KEYDOWN, key, 0);
      key := 0;
    end;
  end;
end;

procedure TFrmOrder.SGICDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in [#10, #13, #08, #10]) then
    key := key;
end;

procedure TFrmOrder.SGICDKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: integer;
  q_str: string;
begin
  inherited;
  if (key in [vk_up, vk_down]) then
    exit;
  if (Sender <> SGIcd) and (Sender <> SGIcd10) then
    if TStringGrid(Sender).Cells[modifytype, TStringGrid(Sender).row] <> '' then
      Exit;
  if TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row] = '' then
  begin
    SetPanel(false, pnlIcd);
    SetPanel(false, pnlIcd10);
    Exit;
  end;
  DM.QrySearch.Close;
  DM.QrySearch.SQL.Clear;
  DSIcd.DataSet := DM.QrySearch;
  if TStringGrid(Sender).Col = 0 then
  begin
    if Trim(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) <> '' then
    begin
      if Sender = SGIcd then
      begin
        q_str := sqlstr(4);
        q_str := q_str + ' AND A_CODE like ' + Qt(UPPERCASE(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) + '%');
        q_str := q_str + ' and rownum <= 70';
        PnlICD10.Top  := (PanelShow.top-(PnlICD10.Height+5));
        PnlICD10.Height := 80;
        PnlICD10.Width := PanelIcd.Width;
        PnlICD10.Left := PanelShow.Left;
        DBCICD10.RowCount := 2;
        DM.QrySearch.SQL.Text := q_str;
        DM.QrySearch.Open;
        IF NOT DM.QrySearch.IsEmpty THEN
          SetPanel(True, pnlIcd);
      end
      else //icd10
      begin
        q_str := sqlstr(0);
        q_str := q_str + ' upper(icd_code) like ' +qt(UPPERCASE(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) + '%');
        q_str := q_str + ' and eff_flag=''Y'' and icd_system = ''C'' and rownum <= 70';
        PnlICD10.Top  := PanelShow.Top ;
        PnlICD10.Height := PanelShow.Height-4;
        PnlICD10.Width := PanelIcd.Width;
        DBCICD10.RowCount := 5;
        PnlICD10.Left := PanelShow.Left;
        DM.QrySearch.SQL.Text := q_str;
        DM.QrySearch.Open;
        IF NOT DM.QrySearch.IsEmpty THEN
          SetPanel(True, PnlICD10);
      end;
    end;
  end
  else if TStringGrid(Sender).Col = 1 then
  begin
    if Trim(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) <> '' then
    begin
      if Sender = SGIcd then
      begin
        q_str := sqlstr(4);
        q_str := q_str + ' And INSTR(CHN_FULL_DESC||upper(ENG_FULL_DESC),' + Qt(UPPERCASE(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row])) + ') > 0  and rownum <= 70';
        PnlICD10.Top  := (PanelShow.top-(PnlICD10.Height+5));
        PnlICD10.Height := 80;
        DBCICD10.RowCount := 2;
        PnlICD10.Width := PanelIcd.Width;
        PnlICD10.Left := PanelShow.Left;
        DM.QrySearch.SQL.Text := q_str;
        DM.QrySearch.Open;
        IF NOT DM.QrySearch.IsEmpty THEN
          SetPanel(True, pnlIcd);
      end
      else //icd10
      begin
        q_str := sqlstr(0);
        q_str := q_str + ' (INSTR(CHN_FULL_DESC||upper(ENG_FULL_DESC),' + Qt(UPPERCASE(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row])) + ') > 0 ';
        q_str := q_str + ' or icd_code in(select icd_code from icd10_diag_desc where INSTR(UPPER(icd_DESC),'+Qt(UPPERCASE(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]))+') > 0))';
        q_str := q_str + ' and eff_flag=''Y'' and icd_system = ''C'' and rownum <= 70';
        PnlICD10.Top  := PanelShow.Top ;
        PnlICD10.Height := PanelShow.Height-4;
        PnlICD10.Width := PanelIcd.Width;
        DBCICD10.RowCount := 5;
        PnlICD10.Left := PanelShow.Left;
        DM.QrySearch.SQL.Text := q_str;
        DM.QrySearch.Open;
        IF NOT DM.QrySearch.IsEmpty THEN
          SetPanel(True, PnlICD10);
      end;
    end;
  end;
end;

procedure TFrmOrder.DBText20Click(Sender: TObject);
var
  i,j: integer;
begin
  inherited;
  if Trim(DBCIcd.DataSource.DataSet.FieldByName('ICD9_CODE').AsString) <> '' then
  begin
    j := 0;
    for i := 0 to SGIcd.RowCount - 1 do
    begin
      if SGIcd.Cells[0, i] <> '' then
        if DBCIcd.DataSource.DataSet.FieldByName('ICD9_CODE').AsString = SGIcd.Cells[0, i] then
        begin
          inc(j);
          if j > 1 then
          begin
            ShowPnlMsg('此' + DBCIcd.DataSource.DataSet.FieldByName('ICD9_CODE').AsString + '診斷碼已重複開立！');
            SetPanel(False, pnlIcd);
            SetPanel(False, pnlIcd10);
            SGIcd.Cells[0, SGIcd.Row] := '';
            SGIcd.SetFocus;
            Exit;
          end;
        end;
    end;
    SGIcd.Cells[0, SGIcd.Row] := DBCIcd.DataSource.DataSet.FieldByName('ICD9_CODE').AsString;
    SGIcd.Cells[2, SGIcd.Row] := DBCIcd.DataSource.DataSet.FieldByName('ENG_SIMP_DESC').AsString;
    SGIcd.Cells[1, SGIcd.Row] := DBCIcd.DataSource.DataSet.FieldByName('CHN_SIMP_DESC').AsString;
    SGIcd.Cells[3, SGIcd.Row] := DBCIcd.DataSource.DataSet.FieldByName('slow_flag').AsString;
    SGIcd.Cells[4, SGIcd.Row] := DBCIcd.DataSource.DataSet.FieldByName('first_flag').AsString;

    if SGIcd.Row < (SGIcd.RowCount - 1) then
    begin
      SGIcd.Row := SGIcd.Row + 1;
    end;

    CHKCASEPART('D', DBCIcd.DataSource.DataSet.FieldByName('ICD9_CODE').AsString);

    //ICD10寫入
    IF PnlICD10.Visible THEN
    BEGIN
      if DSICD10.DataSet.RecordCount > 0 then
      begin
        //移到空位置
        for i := 0 to SGIcd10.RowCount - 1 do
          if trim(SGIcd10.Cells[0, i]) = '' then
          begin
            SGIcd10.Row := i;
            Break;
          end;
        DBText38Click(SGIcd);
      end;
    END;
  end
  else
    SGIcd.Rows[SGIcd.Row].Clear;
  SetPanel(False, pnlIcd);
end;

procedure TFrmOrder.SGICDSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  FeeRow := -1;
  //確認是否要提示初級照護診斷20141202
  if UpperCase(TStringGrid(Sender).Name) = 'SGICD' then
    if (ACol = 0) and (ARow = 0) then
       choosesgICD := True;

  if not TWinControl(Sender).Focused then
    Exit;
  SGMed.Options := SGMed.Options - [goEditing];
end;

procedure TFrmOrder.SGIcdDblClick(Sender: TObject);
var
  i, RowNo: Integer;
  delicd9: string;
begin
  inherited;
  if TStringGrid(Sender).Col = 0 then
  begin
    delicd9 := trim(TStringGrid(Sender).Cells[0,TStringGrid(Sender).Row]);
    TStringGrid(Sender).Rows[TStringGrid(Sender).Row].Clear;
    for i := TStringGrid(Sender).Row to TStringGrid(Sender).RowCount - 2 do
    begin
      TStringGrid(Sender).Rows[i].Assign(TStringGrid(Sender).Rows[i + 1]);
    end;
    TStringGrid(Sender).RowCount := TStringGrid(Sender).RowCount - 1;
    TStringGrid(Sender).RowCount := TStringGrid(Sender).RowCount + 1;

    //連動刪IDC10
    if Sender = SGIcd then
    begin
      try
        SGIcd10.Row := 0;
        RowNo := SGIcd10.Cols[7].IndexOf(delicd9);
        if RowNo = -1 then
          exit
        else
          SGIcd10.Row := RowNo;
      except on e:  Exception do
        //找不到就離開
        if e is EInvalidGridOperation then
         exit;
      end;
      SGIcd10.Rows[SGIcd10.Row].Clear;
      for i := SGIcd10.Row to SGIcd10.RowCount - 2 do
      begin
        SGIcd10.Rows[i].Assign(SGIcd10.Rows[i + 1]);
      end;
      SGIcd10.RowCount := SGIcd10.RowCount - 1;
      SGIcd10.RowCount := SGIcd10.RowCount + 1;
    end;
  end;
end;

procedure TFrmOrder.BtnBackClick(Sender: TObject);
begin
  inherited;
  PatUnUsing(GetFeeNo);
  self.Close;
end;

procedure TFrmOrder.Label16Click(Sender: TObject);
begin
  inherited;
  MemoS.Clear;
end;

procedure TFrmOrder.Label17Click(Sender: TObject);
begin
  inherited;
  MemoO.Clear;
end;

procedure TFrmOrder.Label18Click(Sender: TObject);
begin
  inherited;
  MemoP.Clear;
end;

procedure TFrmOrder.Label25Click(Sender: TObject);
begin
  inherited;
  MemoH.Clear;
end;

procedure TFrmOrder.SGFeeSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  MyRec: TRect;
  Mypoint: TPoint;
begin
  inherited;
  SGFee.Options := SGFee.Options - [goEditing];
  if (not TWinControl(Sender).Focused) or (TStringGrid(Sender).Cells[modifyType, Arow] = 'O') then
    Exit;
  if (NullStrTo(Trim(SGFee.Cells[F_Code, Arow]), Trim(SGFee.Cells[F_Name, Arow])) = '') and ((ACol <> F_Code) and (ACol <> F_Name)) then
    Exit;
  if (Trim(SGFee.Cells[DEL, Arow]) = 'X') then
    Exit;
  if pnlfee.Visible then
  begin
    SGFee.Rows[ARow].Clear;
  end;
  if (TStringGrid(Sender).Cells[modifyType, Arow] = 'N') then
    FeeRow := ARow;
  case ACol of
    F_MEMO, F_Qty, F_Part:
      begin
        if (NullStrTo(Trim(SGFee.Cells[F_Code, Arow]), Trim(SGFee.Cells[F_Name, Arow])) = '') or (TStringGrid(Sender).Cells[modifyType, Arow] <> 'N') then
          Exit;
        SGFee.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGFee.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        EdtFMemo.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGFee.Top, MyRec.right - MyRec.left - 5, SGFee.DefaultRowHeight);
        EdtFMemo.Show;
        EdtFMemo.BringTofront;
        EdtFMemo.Text := SGFee.cells[Acol, Arow];
        EdtFMemo.SetFocus;
      end;
    F_Ins:
      begin
        if SGFee.Cells[F_code, Arow] = '' then
          Exit;
        SGFee.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGFee.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        CbbFeeYN.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGFee.Top, MyRec.right - MyRec.left + 57, SGFee.DefaultRowHeight);
        CbbFeeYN.Show;
        CbbFeeYN.BringTofront;
        CbbFeeYN.Text := SGFee.cells[Acol, Arow];
        CbbFeeYN.SetFocus;
        SGFee.Options := SGFee.Options - [goEditing];
      end;
    F_Code, F_Name:
      begin
        if NullStrTo(SGFee.Cells[modifyType, Arow], 'N') <> 'N' then
        begin
          exit;
        end;
        if (SGFee.Cells[modifyType, Arow] = 'N') and (Trim(SGFee.Cells[F_Code, Arow]) <> '') then
        begin
          SetPanel(False, pnlfee);
          SGFee.Options := SGFee.Options - [goEditing];
          Exit;
        end;
        if (Trim(SGFee.Cells[F_Code, Arow]) = '') then
        begin
          SetPanel(False, pnlfee);
          SGFee.Rows[Arow].Clear;
        end;
        SGFee.Options := SGFee.Options + [goEditing];
      end;
  end;
end;

procedure TFrmOrder.SGFeeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if pnlfee.Visible then
  begin
    if key in [vk_up, vk_down, vk_return] then
    begin
      if Key = vk_return then
      begin
        DBText27Click(self);
        key := 0;
      end;
      Sendmessage(DBCFee.Handle, WM_KEYDOWN, key, 0);
      key := 0;
    end;
  end;
end;

procedure TFrmOrder.SGFeeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  q_str: string;
begin
  inherited;
  if (key in [vk_up, vk_down]) then
    exit;
  if (TStringGrid(Sender).Col = 3) then
  begin
    if (Trim(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) <> '') then
    begin
      q_str := sqlstr(5);
      q_str := q_str + ' AND Fee_CODE like ' + Qt(UPPERCASE(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) + '%') + ' order by INS_FLAG desc, fee_code ';
      dm.QrySearch.SQL.Text := q_str;
      dm.QrySearch.Open;
      DM.QrySearch.First;
      SetPanel(true, pnlfee);
    end
    else
      SetPanel(false, pnlfee);
  end
  else if TStringGrid(Sender).Col = 4 then
  begin
    if (Trim(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) <> '') then
    begin
      q_str := sqlstr(5);
      q_str := q_str + ' And FEE_NAME||FEE_DESC like ' + Qt('%' + ansiuppercase(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) + '%') + ' order by INS_FLAG desc, fee_code ';
      dm.QrySearch.SQL.Text := q_str;
      dm.QrySearch.Open;
      DM.QrySearch.First;
      SetPanel(true, pnlfee);
    end
    else
      SetPanel(false, pnlfee);
  end
  else
    SetPanel(false, pnlfee);
end;

procedure TFrmOrder.DBText27Click(Sender: TObject);
var
  key: word;
begin
  inherited;
  if Trim(DBCFee.DataSource.DataSet.FieldByName('FEE_CODE').AsString) <> '' then
  begin
    SGFee.Cells[modifyType, SGFee.Rowcount - 1] := 'N';
    SGFee.Cells[Seq, SGFee.Rowcount - 1] := '';
    SGFee.Cells[Del, SGFee.Rowcount - 1] := '';
    SGFee.Cells[3, SGFee.Row] := DBCFee.DataSource.DataSet.FieldByName('fee_code').AsString;
    SGFee.Cells[4, SGFee.Row] := DBCFee.DataSource.DataSet.FieldByName('fee_name').AsString;
    SGFee.Cells[5, SGFee.Row] := '';
    SGFee.Cells[6, SGFee.Row] := DBCFee.DataSource.DataSet.FieldByName('unit_qty').AsString;
    SGFee.Cells[7, SGFee.Row] := DBCFee.DataSource.DataSet.FieldByName('ins_flag').AsString;
    SGFee.Cells[F_Memo, SGFee.Row] := '';
    SGFee.Cells[F_Kind, SGFee.Row] := 'F';
    SGFee.Cells[F_INS_Flag, SGFee.Row] := DBCFee.DataSource.DataSet.FieldByName('ins_flag').AsString;
    {// 96001C 轉案件類別 為 15
    if Trim(SGFee.Cells[3, SGFee.Row]) = 'F96001C' then
    begin
      key := VK_RETURN;
      Case_Type1.Text := '15';
      Part_Code1Click(Case_Type1);
      SetCbbitem(PCPLstBox,Case_Type1.Text);
      PCPLstBoxClick(PCPLstBox);
      //Pay_TypeKeyDown(Part_Code1,key,[]);
    end;}
    // F00306C 給付 4, F00315C 給付 431, F00316C 給付 432, F00316C 給付 433,  轉案件類別 為 19
    if (Trim(SGFee.Cells[3, SGFee.Row]) = 'F00306C') or (Trim(SGFee.Cells[3, SGFee.Row]) = 'F00315C')
       or (Trim(SGFee.Cells[3, SGFee.Row]) = 'F00316C')  or (Trim(SGFee.Cells[3, SGFee.Row]) = 'F00317C') then
    begin
       key := VK_RETURN;
       Case_Type1.Text := '19';
       Part_Code1Click(Case_Type1);
       SetCbbitem(PCPLstBox,Case_Type1.Text);
       PCPLstBoxClick(PCPLstBox);
       //
       if (Trim(SGFee.Cells[3, SGFee.Row]) = 'F00306C') then begin
          Pay_Type.Text := '4';
       end
       else begin
          if (Trim(SGFee.Cells[3, SGFee.Row]) = 'F00315C') then begin
             Pay_Type.Text := '431';
          end
          else begin
             if (Trim(SGFee.Cells[3, SGFee.Row]) = 'F00316C') then begin
                Pay_Type.Text := '432';
             end
             else begin
                if (Trim(SGFee.Cells[3, SGFee.Row]) = 'F00317C') then begin
                   Pay_Type.Text := '433';
                end;
             end;
          end;
       end;
       Part_Code1Click(Pay_Type);
       SetCbbitem(PCPLstBox,Pay_Type.Text);
       PCPLstBoxClick(PCPLstBox);
    end;

    FeeRow := SGFee.Row;
    if SGFee.Row = (SGFee.RowCount - 1) then
    begin
      SGFee.RowCount := SGFee.RowCount + 1;
    end;
    SGFee.Row := SGFee.Row + 1;
    BringChild(DBCFee.DataSource.DataSet.FieldByName('fee_code').AsString);
    fee_tabst.Caption := '處置[' + IntToStr(SGFee.RowCount - 1) + ']' + ' ' + '用藥[' + IntToStr(SGMed.RowCount - 1) + ']';
    CHKCASEPART('D', DBCFee.DataSource.DataSet.FieldByName('fee_code').AsString);
  end
  else
    SGFee.Rows[SGFee.Row].Clear;
  SGFee.SetFocus;
  SetPanel(False, pnlfee);
  ComputeAmt(SGFee, F_Qty, F_Code, F_Ins);
  SGFee.Options := SGFee.Options + [goEditing];
end;

procedure TFrmOrder.CbbFeeYNExit(Sender: TObject);
begin
  inherited;
  try
    if (TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Cells[F_INS_Flag, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row] <> 'N') or (ReturnID(TComBoBox(Sender).Text) = 'C') or (ReturnID(TComBoBox(Sender).Text) = 'N') or (ReturnID(TComBoBox(Sender).Text) = 'H') then
    begin
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Cells[TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Col, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row] := ReturnID(TComBoBox(Sender).Text);
      TComBoBox(Sender).Hide;
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Refresh;
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).SetFocus;
      TComBoBox(Sender).Text := '';
      if TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Name = 'SGFee' then
        ComputeAmt(TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)), F_Qty, F_Code, F_Ins)
      else
        ComputeAmt(TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)), O_Qty, O_Code, O_Ins);
    end
    else
    begin
      ShowPnlMsg('此計價項目僅能開立自費');
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Cells[TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Col, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row] := 'N';
      TComBoBox(Sender).Text := 'N';
      TComBoBox(Sender).Hide;
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Refresh;
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).SetFocus;
      TComBoBox(Sender).Text := '';
    end;
  except
  end;
end;

procedure TFrmOrder.EdtFMemoExit(Sender: TObject);
begin
  inherited;
  if Tedit(Sender).Visible then
  begin
    try
      if TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Name = 'SGFee' then
        SGFee.Cells[SGFee.Col, FeeRow] := UpperCase(ReturnID(TComBoBox(Sender).Text))
      else
        TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Cells[TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Col, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row] := ReturnID(TComBoBox(Sender).Text);
      TComBoBox(Sender).Hide;
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Refresh;
      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).SetFocus;
      TComBoBox(Sender).Text := '';
      if TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Name = 'SGFee' then
      begin
        if (SGFee.Col = F_Part) or ((SGFee.Col = F_Qty) and (SGFee.Cells[F_Qty, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row] > '1')) then
        begin
          if (SGFee.Col = F_Part) then
            SGFee.Cells[F_Qty, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row] := IntToStr(length(trim(SGFee.Cells[F_Part, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row])) div 2);
          if (SGFee.Cells[F_Ins, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row] = 'Y') then
            if GetXMl('1',
                      SGFee.Cells[F_Code, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row],
                      SGFee.Cells[F_Part, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row],
                      SGFee.Cells[F_Qty, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row],
                      TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row) then
              SGFee.Cells[SGFee.Col, TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)).Row] := '';
        end;
        ComputeAmt(TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)), F_Qty, F_Code, F_Ins)
      end
      else
        ComputeAmt(TStringGrid(FrmOrder.FindComponent(TComBoBox(Sender).Hint)), O_Qty, O_Code, O_Ins);

    except
    end;
  end;
end;

procedure TFrmOrder.SGMtrlKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if pnlMtrl.Visible then
  begin
    if key in [vk_up, vk_down, vk_return] then
    begin
      if Key = vk_return then
      begin
        DBText32Click(self);
        key := 0;
      end;
      Sendmessage(DBCMtrl.Handle, WM_KEYDOWN, key, 0);
      key := 0;
    end;
  end;
end;

procedure TFrmOrder.SGMtrlKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  q_str: string;
begin
  inherited;
  if (key in [vk_up, vk_down]) then
    exit;
  if (TStringGrid(Sender).Col = 3) then
  begin
    if (Trim(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) <> '') then
    begin
      q_str := sqlstr(6);
      q_str := q_str + ' AND Fee_CODE like ' + Qt(UPPERCASE(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) + '%');
      dm.QryOrder.SQL.Text := q_str;
      dm.QryOrder.Open;
      dm.QryOrder.First;
      SetPanel(True, pnlmtrl);
    end
    else
      SetPanel(False, pnlmtrl);
  end
  else if TStringGrid(Sender).Col = 4 then
  begin
    if (Trim(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) <> '') then
    begin
      q_str := sqlstr(6);
      q_str := q_str + ' And (FEE_NAME||FEE_DESC) like' + Qt('%' + UPPERCASE(TStringGrid(Sender).Cells[TStringGrid(Sender).Col, TStringGrid(Sender).Row]) + '%');
      dm.QryOrder.SQL.Text := q_str;
      dm.QryOrder.Open;
      dm.QryOrder.First;
      SetPanel(True, pnlmtrl);
    end
    else
      SetPanel(False, pnlmtrl);
  end;
end;

procedure TFrmOrder.SGMtrlSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  MyRec: TRect;
  Mypoint: TPoint;
begin
  inherited;
  SGMtrl.Options := SGMtrl.Options - [goEditing];
  if (not TWinControl(Sender).Focused) or (TStringGrid(Sender).Cells[modifyType, Arow] = 'O') then
    Exit;
  if (NullStrTo(Trim(SGMtrl.Cells[O_Code, Arow]), Trim(SGMtrl.Cells[O_Name, Arow])) = '') and ((ACol <> F_Code) and (ACol <> F_Name)) then
    Exit;
  if (Trim(SGMtrl.Cells[DEL, Arow]) = 'X') then
    Exit;
  if pnlmtrl.Visible then
  begin
    SGMtrl.Rows[ARow].Clear;
  end;
  case ACol of
    O_MEMO, O_Part, O_Qty:
      begin
        if (NullStrTo(Trim(SGMtrl.Cells[O_Code, Arow]), Trim(SGMtrl.Cells[O_Name, Arow])) = '') or (TStringGrid(Sender).Cells[modifyType, Arow] <> 'N') then
          Exit;
        SGMtrl.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGMtrl.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        EdtOMemo.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGMtrl.Top, MyRec.right - MyRec.left - 5, SGMtrl.DefaultRowHeight);
        EdtOMemo.Show;
        EdtOMemo.BringTofront;
        EdtOMemo.Text := SGMtrl.cells[Acol, Arow];
        EdtOMemo.SetFocus;
      end;
    O_Ins:
      begin
        if SGMtrl.Cells[O_code, Arow] = '' then
          Exit;
        SGMtrl.perform(WM_CANCELMODE, 0, 0);
        MyRec := SGMtrl.CellRect(Acol, Arow);
        Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
        CBBMtrlYN.SetBounds(Mypoint.x + 1, Mypoint.y + 1 + SGMtrl.Top, MyRec.right - MyRec.left + 57, SGMtrl.DefaultRowHeight);
        CBBMtrlYN.Show;
        CBBMtrlYN.BringTofront;
        CBBMtrlYN.Text := SGMtrl.cells[Acol, Arow];
        CBBMtrlYN.SetFocus;
        SGMtrl.Options := SGMtrl.Options - [goEditing];
      end;
    O_Code, o_Name:
      begin
        if NullStrTo(SGMtrl.Cells[modifyType, Arow], 'N') <> 'N' then
        begin
          SetPanel(False, pnlMtrl);
          exit;
        end;
        if (SGMtrl.Cells[modifyType, Arow] = 'N') and (Trim(SGMtrl.Cells[O_Code, Arow]) <> '') then
        begin
          SetPanel(False, pnlMtrl);
          SGMtrl.Options := SGMtrl.Options - [goEditing];
          Exit;
        end;
        if (Trim(SGMtrl.Cells[O_Code, Arow]) = '') then
        begin
          SetPanel(False, pnlMtrl);
          SGMtrl.Rows[Arow].Clear;
        end;
        SGMtrl.Options := SGMtrl.Options + [goEditing];
      end;
  end;
end;

procedure TFrmOrder.DBText32Click(Sender: TObject);
begin
  inherited;
  if Trim(DBCMtrl.DataSource.DataSet.FieldByName('FEE_CODE').AsString) <> '' then
  begin
    SGMtrl.Cells[modifyType, SGMtrl.Rowcount - 1] := 'N';
    SGMtrl.Cells[Seq, SGMtrl.Rowcount - 1] := '';
    SGMtrl.Cells[Del, SGMtrl.Rowcount - 1] := '';

    SGMtrl.Cells[3, SGMtrl.Row] := DBCMtrl.DataSource.DataSet.FieldByName('fee_code').AsString;
    SGMtrl.Cells[4, SGMtrl.Row] := DBCMtrl.DataSource.DataSet.FieldByName('fee_name').AsString;
    SGMtrl.Cells[5, SGMtrl.Row] := '';
    SGMtrl.Cells[6, SGMtrl.Row] := '1';
    SGMtrl.Cells[o_INS, SGMtrl.Row] := DBCMtrl.DataSource.DataSet.FieldByName('ins_flag').AsString;
    SGMtrl.Cells[O_Memo, SGMtrl.Row] := '';
    SGMtrl.Cells[O_Kind, SGMtrl.Row] := 'O';
    SGMtrl.Cells[O_INS_Flag, SGMtrl.Row] := DBCMtrl.DataSource.DataSet.FieldByName('ins_flag').AsString;
    if SGMtrl.Row = (SGMtrl.RowCount - 1) then
    begin
      SGMtrl.RowCount := SGMtrl.RowCount + 1;
    end;
    SGMtrl.Row := SGMtrl.Row + 1;
    BringChild(DBCMtrl.DataSource.DataSet.FieldByName('fee_code').AsString);
    TabMtrl.Caption := '衛材[' + IntToStr(SGMtrl.RowCount - 1) + ']';
  end
  else
    SGMtrl.Rows[SGMtrl.Row].Clear;
  SetPanel(False, pnlMtrl);
  ComputeAmt(SGMtrl, O_Qty, O_Code, O_Ins);
  SGMtrl.Options := SGMtrl.Options + [goEditing];
end;

function TFrmOrder.ChkLXCOpen(tmpSG: TSTringGrid; kind: integer): boolean;
var
  i: integer;
  isOpen: boolean;
  str: string;
begin
  isOpen := true;
  case (kind) of
    4:
      str := '檢驗';
    5:
      str := '放射';
    6:
      str := '檢查';
  end;
  for i := 0 to tmpSG.RowCount - 1 do
    if (tmpSG.Cells[C_Code, i] <> '') and (tmpSG.Cells[modifyType, i] = 'N') then
    begin
      isOpen := false;
      break;
    end;

  if not isOpen then
    ShowPnlMsg('此病人尚有 "' + str + '" 項目未開單！' + #13 + '請先點選 "開／刪" 或將其項目刪除才能完診');

  Result := isOpen;
end;

procedure TFrmOrder.BtnFinishClick(Sender: TObject);
var
  OPDADV, msgstr: string;
  AdvParamStr: string;
  IC_V, ComRet, i, iFlag : Integer;
  SpName, ExeSPResult, sShwMsg, sMsg, sFscr, sRisk, sRpno : string;
  Paramter, PType, RType, PData: TStrings; bConfirm, haveFall : boolean;
begin
  inherited;

  if UpperCase(lschangepat) = 'TRUE' then
    if Pat_Id1.Text <> '健保' then
      chagepat;
  if Pat_Id1.Text = '健保' then
  begin
    for i := 0 to SGFee.RowCount - 1 do
    begin
      if (SGFee.Cells[DEL, i] <> 'X') then
      begin
        if (SGFee.Cells[F_Code, i] <> '') then
        begin
          {if     ((POS(trim(SGFee.Cells[F_Code, i]), A381) > 0) and (Trim(Case_code.Text)<>'81'))
              or ((POS(trim(SGFee.Cells[F_Code, i]), A395) > 0) and (Trim(Case_code.Text)<>'95'))
              or ((POS(trim(SGFee.Cells[F_Code, i]), A383) > 0) and (Trim(Case_code.Text)<>'83'))
              or ((POS(trim(SGFee.Cells[F_Code, i]), A382) > 0) and (Trim(Case_code.Text)<>'82'))
              or ((POS(trim(SGFee.Cells[F_Code, i]), A387) > 0) and (Trim(Case_code.Text)<>'87'))
              or ((POS(trim(SGFee.Cells[F_Code, i]), A397) > 0) and (Trim(Case_code.Text)<>'97'))then
          begin
            ShowPnlMsg('此病人健保身份執行預防保健醫令' + trim(SGFee.Cells[F_Code, i]) + ',但非預防保健卡序,請更正醫令或點選"預/產"更新卡序');
            Exit;
          end;}

          if     ((POS(trim(SGFee.Cells[F_Code, i]), A381) > 0) and ((Trim(Case_code.Text)<>'81') or (ReturnID(ReturnName(Trim(Case_type1.Text)))<>'A3') ))
              or ((POS(trim(SGFee.Cells[F_Code, i]), A395) > 0) and ((Trim(Case_code.Text)<>'95') or (ReturnID(ReturnName(Trim(Case_type1.Text)))<>'A3') ))
              or ((POS(trim(SGFee.Cells[F_Code, i]), A383) > 0) and ((Trim(Case_code.Text)<>'83') or (ReturnID(ReturnName(Trim(Case_type1.Text)))<>'A3') ))
              or ((POS(trim(SGFee.Cells[F_Code, i]), A382) > 0) and ((Trim(Case_code.Text)<>'82') or (ReturnID(ReturnName(Trim(Case_type1.Text)))<>'A3') ))
              or ((POS(trim(SGFee.Cells[F_Code, i]), A387) > 0) and ((Trim(Case_code.Text)<>'87') or (ReturnID(ReturnName(Trim(Case_type1.Text)))<>'A3') ))
              or ((POS(trim(SGFee.Cells[F_Code, i]), A397) > 0) and ((Trim(Case_code.Text)<>'97') or (ReturnID(ReturnName(Trim(Case_type1.Text)))<>'A3') ))then
          begin
            BtnAC95Click(BtnAC95);
          end;
        end;
      end;
    end;
  end;

  //檢查藥跌的給分是否超過(或等於6)
  giFscr := 0; sRpno := ''; sShwMsg := ''; sMsg := ''; bConfirm := False;
  for i := 0 to SGFee.RowCount - 1 do begin
     if (SGMed.Cells[DEL, i] <> 'X') and (SGMed.Cells[M_Code, i] <> '') then begin
        haveFall := FallScoreDescription(Trim(SGMed.Cells[M_Code, i]), sFscr, sRisk);
        if Trim(sFscr) = '' then sFscr := '0';
        if (haveFall) and (sFscr <> '0') then begin
           giFscr := giFscr + strtoint(sFscr);
           sMsg := sMsg + Trim(SGMed.Cells[M_Code, i]) + '-' + sFscr + ',';
           if (TRIM(SGMed.Cells[modifytype, i]) = 'N') then begin
              bConfirm := True;
           end;
        end;
     end;
  end;
  if (giFscr >= 6) and (bConfirm) then begin
     //MesssageDlg('此病人之藥物相關跌倒風險較高，風險分數>=6，請評估'
     if not assigned(FrmFallRiskScore) then
        FrmFallRiskScore := TFrmFallRiskScore.Create(self);
     sPass := 'N';
     sShwMsg := 'I';  //來自那裡(I住院)，現在被使用其他
     FrmFallRiskScore.ShowModal;
     ////LOG
     sRpno := sPass;  //回覆註記(Y、N)若是多選1,2,3
     iFlag := CallStoreProcIPDOPERLOG(GetFeeNo,GetChrNo,'M','H',sRpno,TRIM(SGMed.Cells[M_code, i]), sShwMsg, sMsg, getDocCode1, '', getDocCode, getDeptRoom, getDeptCode, sMsg);
     ////
     if sPass = 'N' then begin
        //BtnOK.Enabled := true;
        //Btntemp.Enabled := true;
        //BtnIgone.Enabled := true;
        exit;
     end;

     if not (FrmFallRiskScore = nil) then
        FrmFallRiskScore := nil;
  end;
  //BtnFinish.Enabled := false;
  //BtnSave.Enabled := false;
  msgstr := '';
  if SaveOrder(TButton(Sender).Tag, msgstr, SGXRay) then
  begin
    Pgc_P.ActivePageIndex := 4;
    Pgc_PChange(Pgc_P);
    if TButton(Sender).Tag = 0 then
    begin
      OPDADV := SetSys.ReadString('DPD', 'OPDADV', '');
      AdvParamStr := SetSys.ReadString('ADV', 'REPRINT', '');
      comAdvStrRep(AdvParamStr, '');
      if OPDADV <> '' then
        ShellExecute(Handle, 'Open', PChar(OPDADV), PChar(AdvParamStr), nil, SW_SHOWNORMAL);
    end;
    PatUnUsing(GetFeeNo);
    //呼叫自動繳費機用的計價程式 20160215
    IF SetSys.ReadString('DPD', 'AUTOVALUATION', '') = 'TRUE' THEN
    BEGIN
      Paramter := TStringList.Create;
      PType := TStringList.Create;
      RType := TStringList.Create;
      PData := TStringList.Create;
      SpName := '';

      Paramter.Clear;
      PType.Clear;
      RType.Clear;
      PData.Clear;
      SpName := getSpSql(4, Paramter, PType, RType);
      PData.Add(getChrNo);//v_chr_no
      PData.Add(getOpdDate);//v_opd_date
      PData.Add(getFeeNo);//v_fee_no
      PData.Add(ReturnName(Pay_Type.Text));//v_order_type給付類別
      PData.Add(ReturnName(Case_Type1.Text));//v_case_type
      PData.Add(ReturnName(Part_Code1.Text));//v_part_code
      PData.Add(getPPATID);//v_pay_flag
      ExeSPResult := DM.ExecSP(Paramter, PType, RType, PData, SpName);

      if ReturnID(ExeSPResult) = 'N' then
        use_opd_log(DPD_Ver, 'AUTOVALUATION:'+ReturnName(ExeSPResult));


      Paramter.Free;
      PType.Free;
      RType.Free;
      PData.Free;
    END;
    FrmOrder.Close;
  end
  else
  begin
    if trim(msgstr)<> '' then
      ShowMessage(msgstr);
    //ShowPnlMsg('藥品，處置，衛材開立失敗' + #13 + '請洽詢資訊室');
  end;

  BtnFinish.Enabled := true;
  if (getOpdStatus = '1') or (StrToInt(getOpdStatus) in [1, 2]) then
    BtnSave.Enabled := true;

end;

procedure TFrmOrder.SGFeeDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if ACol = F_Code then
    TStringGrid(Sender).Canvas.Font.Size := 12
  else
    TStringGrid(Sender).Canvas.Font.Size := 13;
  if TStringGrid(Sender).Cells[modifyType, ARow] = 'O' then
    TStringGrid(Sender).Canvas.Brush.Color := $00E0E0BA
  else
    TStringGrid(Sender).Canvas.Brush.Color := ClWindow;
  if TStringGrid(Sender).Cells[Del, ARow] = 'X' then
    TStringGrid(Sender).Canvas.Font.Color := ClRed
  else
    TStringGrid(Sender).Canvas.Font.Color := Clblack;
  TStringGrid(Sender).Canvas.FillRect(Rect);
  TStringGrid(Sender).Canvas.TextOut(Rect.Left + 1, Rect.Top + 1, Trim(TStringGrid(Sender).Cells[ACol, ARow]));
end;

procedure TFrmOrder.SGMtrlDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if ACol = O_Code then
    TStringGrid(Sender).Canvas.Font.Size := 11
  else
    TStringGrid(Sender).Canvas.Font.Size := 14;
  if TStringGrid(Sender).Cells[modifyType, ARow] = 'O' then
    TStringGrid(Sender).Canvas.Brush.Color := $00E0E0BA
  else
    TStringGrid(Sender).Canvas.Brush.Color := ClWindow;
  if TStringGrid(Sender).Cells[Del, ARow] = 'X' then
    TStringGrid(Sender).Canvas.Font.Color := ClRed
  else
    TStringGrid(Sender).Canvas.Font.Color := Clblack;
  TStringGrid(Sender).Canvas.FillRect(Rect);
  TStringGrid(Sender).Canvas.TextOut(Rect.Left + 1, Rect.Top + 1, Trim(TStringGrid(Sender).Cells[ACol, ARow]));
end;

procedure TFrmOrder.d11Click(Sender: TObject);
var
  location: integer;
  msg: string;
begin
  inherited;
  EdtFMemo.Visible := False;
  if FeeRow >= 0 then
  begin
    if (copy(TImage(Sender).Name, 2, 1) = '1') or (copy(TImage(Sender).Name, 2, 1) = '5') then
      location := pos('UL', SGFee.Cells[F_Part, FeeRow])
    else if (copy(TImage(Sender).Name, 2, 1) = '2') or (copy(TImage(Sender).Name, 2, 1) = '6') then
      location := pos('UR', SGFee.Cells[F_Part, FeeRow])
    else if (copy(TImage(Sender).Name, 2, 1) = '3') or (copy(TImage(Sender).Name, 2, 1) = '7') then
      location := pos('LR', SGFee.Cells[F_Part, FeeRow])
    else if (copy(TImage(Sender).Name, 2, 1) = '4') or (copy(TImage(Sender).Name, 2, 1) = '8') then
      location := pos('LL', SGFee.Cells[F_Part, FeeRow]);

    if location = 0 then
    begin
      if copy(TImage(Sender).Name, 1, 1) = 'd' then
      begin
        if not checkFeePartLength(F_Part, FeeRow, SGFee, msg) then
        begin
          TImage(Sender).Visible := false;
          if FrmOrder.FindComponent(('a' + copy(TImage(Sender).Name, 2, 2))) <> nil then
            TImage(FrmOrder.FindComponent(('a' + copy(TImage(Sender).Name, 2, 2)))).Visible := true;
          changeFeePart(F_Part, FeeRow, F_Code, F_Qty, copy(TImage(Sender).Name, 2, 2), 0, SGFee);
          if SGFee.Cells[F_Ins, FeeRow] = 'Y' then
            if GetXMl('1', SGFee.Cells[F_Code, FeeRow], SGFee.Cells[F_Part, FeeRow], SGFee.Cells[F_Qty, FeeRow], FeeRow) then
              SGFee.Cells[F_Part, FeeRow] := '';
        end
        else
          ShowPnlMsg(msg);
      end
      else
      begin
        TImage(Sender).Visible := false;
        if FrmOrder.FindComponent(('d' + copy(TImage(Sender).Name, 2, 2))) <> nil then
          TImage(FrmOrder.FindComponent(('d' + copy(TImage(Sender).Name, 2, 2)))).Visible := true;
        changeFeePart(F_Part, FeeRow, F_Code, F_Qty, copy(TImage(Sender).Name, 2, 2), 1, SGFee);
      end;
    end;
  end;
end;

procedure TFrmOrder.btn_fmClick(Sender: TObject);
var
  msg: string;
  type_flag: integer;
begin
  inherited;
  EdtFMemo.Visible := False;
  if FeeRow >= 0 then
  begin
    if TButton(Sender).Tag = 0 then
    begin
      if not checkFeePartLength(F_Part, FeeRow, SGFee, msg) then
      begin
        TButton(Sender).Tag := 1;
        if (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'UB') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'UA') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'LB') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'LA') then
          type_flag := 0
        else if (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'FM') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'UR') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'UL') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'LR') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'LL') then
          type_flag := 2
        else
          type_flag := 0;

        changeFeePart(F_Part, FeeRow, F_Code, F_Qty, UpperCase(copy(TButton(Sender).Name, 5, 2)), type_flag, SGFee);
        if SGFee.Cells[F_Ins, FeeRow] = 'Y' then
          if GetXMl('1', SGFee.Cells[F_Code, FeeRow], SGFee.Cells[F_Part, FeeRow], SGFee.Cells[F_Qty, FeeRow], FeeRow) then
            SGFee.Cells[F_Part, FeeRow] := '';
      end
      else
        ShowPnlMsg(msg);
    end
    else
    begin
      TButton(Sender).Tag := 0;
      if (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'UB') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'UA') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'LB') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'LA') then
        type_flag := 1
      else if (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'FM') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'UR') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'UL') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'LR') or (UpperCase(copy(TButton(Sender).Name, 5, 2)) = 'LL') then
        type_flag := 3
      else
        type_flag := 1;

      changeFeePart(F_Part, FeeRow, F_Code, F_Qty, UpperCase(copy(TButton(Sender).Name, 5, 2)), type_flag, SGFee);
    end;
  end;
end;

procedure TFrmOrder.b_91014CClick(Sender: TObject);
begin
  inherited;
  if InsertFee('F' + copy(TButton(Sender).Name, 3, length(TButton(Sender).Name) - 2), '') then
    ShowPnlMsg('新增' + 'F' + copy(TButton(Sender).Name, 3, length(TButton(Sender).Name) - 2) + '項目成功')
  else
    ShowPnlMsg('新增' + 'F' + copy(TButton(Sender).Name, 3, length(TButton(Sender).Name) - 2) + '項目失敗');
end;

procedure TFrmOrder.ToolButton7Click(Sender: TObject);
var
  i, j, index: integer;
  tmp, icd9_code: string;
  IsRepeat: boolean;
  Qrys: TADOQuery;
  tmpSql: string;
  SQLs: TStrings;
begin
  inherited;
  Pgc_SOA.ActivePageIndex := 0;
  SQLs := TStringList.Create;
  for i := 0 to SGFee.RowCount - 2 do
  begin
    SQLs.Clear;
    tmpSql := getChkSqlStr(14);
    SetParamter(tmpSql, '$DEPT_CODE$', getDocDeptCode);
    SetParamter(tmpSql, '$DOC_CODE$', getDocCode1);
    SetParamter(tmpSql, '$ITEM_NO$', 'D');
    SetParamter(tmpSql, '$FEE_CODE$', SGFee.Cells[F_Code, i]);

    SQLs.Text := tmpSql;
    if not DM.OpenSQL(SQLs, Qrys) then
    begin
      SQLs.Clear;
      tmpSql := getChkSqlStr(14);
      SetParamter(tmpSql, '$DEPT_CODE$', gsDefaultDeptNo);
      SetParamter(tmpSql, '$DOC_CODE$', 'DPD');
      SetParamter(tmpSql, '$ITEM_NO$', 'D');
      SetParamter(tmpSql, '$FEE_CODE$', SGFee.Cells[F_Code, i]);
      SQLs.Text := tmpSql;

    end;

    if DM.OpenSQL(SQLs, Qrys) then
    begin
      while not Qrys.Eof do
      begin
        tmp := StringReplace(Qrys.FieldByName('fee_desc').AsString, '@', SGFee.Cells[F_Part, i], [rfReplaceAll]);
        MemoP.Lines.Append(tmp);
        Qrys.Next;
      end;
    end;

    SQLs.Clear;
    tmpSql := getChkSqlStr(14);
    SetParamter(tmpSql, '$DEPT_CODE$', getDocDeptCode);
    SetParamter(tmpSql, '$DOC_CODE$', getDocCode1);
    SetParamter(tmpSql, '$ITEM_NO$', 'S');
    SetParamter(tmpSql, '$FEE_CODE$', SGFee.Cells[F_Code, i]);

    SQLs.Text := tmpSql;
    if not DM.OpenSQL(SQLs, Qrys) then
    begin
      SQLs.Clear;
      tmpSql := getChkSqlStr(14);
      SetParamter(tmpSql, '$DEPT_CODE$', gsDefaultDeptNo);
      SetParamter(tmpSql, '$DOC_CODE$', 'DPD');
      SetParamter(tmpSql, '$ITEM_NO$', 'S');
      SetParamter(tmpSql, '$FEE_CODE$', SGFee.Cells[F_Code, i]);
      SQLs.Text := tmpSql;

    end;

    if DM.OpenSQL(SQLs, Qrys) then
    begin
      while not Qrys.Eof do
      begin
        tmp := StringReplace(Qrys.FieldByName('fee_desc').AsString, '@', SGFee.Cells[F_Part, i], [rfReplaceAll]);
        MemoS.Lines.Append(tmp);
        Qrys.Next;
      end;
    end;

    SQLs.Clear;
    tmpSql := getChkSqlStr(14);
    SetParamter(tmpSql, '$DEPT_CODE$', getDocDeptCode);
    SetParamter(tmpSql, '$DOC_CODE$', getDocCode1);
    SetParamter(tmpSql, '$ITEM_NO$', 'O');
    SetParamter(tmpSql, '$FEE_CODE$', SGFee.Cells[F_Code, i]);

    SQLs.Text := tmpSql;
    if not DM.OpenSQL(SQLs, Qrys) then
    begin
      SQLs.Clear;
      tmpSql := getChkSqlStr(14);
      SetParamter(tmpSql, '$DEPT_CODE$', gsDefaultDeptNo);
      SetParamter(tmpSql, '$DOC_CODE$', 'DPD');
      SetParamter(tmpSql, '$ITEM_NO$', 'O');
      SetParamter(tmpSql, '$FEE_CODE$', SGFee.Cells[F_Code, i]);
      SQLs.Text := tmpSql;

    end;

    if DM.OpenSQL(SQLs, Qrys) then
    begin
      while not Qrys.Eof do
      begin
        tmp := StringReplace(Qrys.FieldByName('fee_desc').AsString, '@', SGFee.Cells[F_Part, i], [rfReplaceAll]);
        MemoO.Lines.Append(tmp);
        Qrys.Next;
      end;
    end;

    SQLs.Clear;
    tmpSql := getChkSqlStr(14);
    SetParamter(tmpSql, '$DEPT_CODE$', getDocDeptCode);
    SetParamter(tmpSql, '$DOC_CODE$', getDocCode1);
    SetParamter(tmpSql, '$ITEM_NO$', '6');
    SetParamter(tmpSql, '$FEE_CODE$', SGFee.Cells[F_Code, i]);

    SQLs.Text := tmpSql;
    if not DM.OpenSQL(SQLs, Qrys) then
    begin
      SQLs.Clear;
      tmpSql := getChkSqlStr(14);
      SetParamter(tmpSql, '$DEPT_CODE$', gsDefaultDeptNo);
      SetParamter(tmpSql, '$DOC_CODE$', 'DPD');
      SetParamter(tmpSql, '$ITEM_NO$', '6');
      SetParamter(tmpSql, '$FEE_CODE$', SGFee.Cells[F_Code, i]);
      SQLs.Text := tmpSql;

    end;

    if DM.OpenSQL(SQLs, Qrys) then
      InsertIcd(Qrys.FieldByName('fee_desc').AsString);
  end;
  SQLs.Free;
end;

procedure TFrmOrder.ToolButton11Click(Sender: TObject);
begin
  inherited;
  PupMenuOften.Popup(mouse.CursorPos.X, mouse.CursorPos.Y);
end;

procedure TFrmOrder.N1Click(Sender: TObject);
begin
  inherited;
  if not Assigned(FrmOftemMed) then
    FrmOftemMed := TFrmOftemMed.Create(Self);
  FrmOftemMed.ShowModal;
  FreeAndNil(FrmOftemMed);
end;

procedure TFrmOrder.N2Click(Sender: TObject);
begin
  inherited;
  if not Assigned(FrmUsePkg) then
    FrmUsePkg := TFrmUsePkg.Create(Self);
  FrmUsePkg.ShowModal;
end;

procedure TFrmOrder.ToolButton41Click(Sender: TObject);
begin
  inherited;
  DsMed.DataSet := nil;
  DsLab.DataSet := nil;
  DsRay.DataSet := nil;
  DSCHK.DataSet := nil;
  DSIcd.DataSet := nil;
  DsFee.DataSet := nil;
  DsMtrl.DataSet := nil;
  if not Assigned(FrmPKG) then
    FrmPKG := TFrmPKG.Create(Self);
  FrmPKG.doc_code := getDocCode1;
  FrmPKG.doc_name := getDocName1;
  FrmPKG.PageControl1.ActivePageIndex := 1;
  FrmPKG.PageControl2.ActivePageIndex := 0;
  FrmPKG.ShowModal;
end;

procedure TFrmOrder.ToolButton3Click(Sender: TObject);
begin
  inherited;
  OutList.Clear;
  myDate := Date;
  myTime := Time;
  if not assigned(FrmLabOrder) then
    FrmLabOrder := TFrmLabOrder.Create(Self);
  FrmLabOrder.ShowModal;
  InsertLab;
  if OutList.Count > 0 then
  begin
    Pgc_P.ActivePageIndex := 0;
    Pgc_P.OnChange(Sender);
  end;

end;

procedure TFrmOrder.ToolButton4Click(Sender: TObject);
begin
  inherited;
  OutList.Clear;

  if not assigned(FrmChkOrder) then
    FrmChkOrder := TFrmChkOrder.Create(Self);
  FrmChkOrder.ShowModal;
  InsertChk;

  if OutList.Count > 0 then
  begin
    Pgc_P.ActivePageIndex := 3;
    Pgc_P.OnChange(Sender);
  end;
end;

procedure TFrmOrder.ToolButton5Click(Sender: TObject);
begin
  inherited;
  OutList.Clear;
  if not assigned(FrmXRayOrder) then
    FrmXRayOrder := TFrmXRayOrder.Create(Self);
  FrmXRayOrder.ShowModal;
  InsertXRay;
  if OutList.Count > 0 then
  begin
    Pgc_P.ActivePageIndex := 1;
    Pgc_P.OnChange(Sender);
  end;
  Radionum;
end;

procedure TFrmOrder.ToolButton45Click(Sender: TObject);
var
  i: integer;
begin
  inherited;
  OutList.Clear;
  if not assigned(FrmOldOrderList) then
    FrmOldOrderList := TFrmOldOrderList.Create(Self);
  FrmOldOrderList._DB := DM.ADOLink;
  FrmOldOrderList.Chr_no := getChrNo;
  FrmOldOrderList.ShowModal;
  SGMed.Row := SGMed.RowCount - 1;
  for i := 0 to OutList.Count - 1 do
  begin
    if InsertMed(ReturnId(OutList.Strings[i]), ReturnId(ReTurnName(ReturnName(OutList.Strings[i]))), ReturnId(ReturnName(OutList.Strings[i])), ReturnId(ReTurnName(ReTurnName(ReTurnName(ReturnName(OutList.Strings[i]))))), '', '', '', '', SGMed.Row) then
    begin
      SGMed.RowCount := SGMed.RowCount + 1;
      SGMed.Row := SGMed.Row + 1;
    end
    else
      SGMed.Rows[SGMed.Row].Clear;

    Pgc_P.ActivePageIndex := 4;
    Pgc_P.OnChange(Sender);
  end;

end;

procedure TFrmOrder.ToolButton18Click(Sender: TObject);
begin
  inherited;
  if not assigned(FrmWarning) then
    FrmWarning := TFrmWarning.Create(self);
  FrmWarning.ShowModal;
end;

procedure TFrmOrder.ToolButton2Click(Sender: TObject);
var
  i: integer;
begin
  inherited;
  OutList.Clear;
  if not assigned(FrmFeeOrder) then
    FrmFeeOrder := TFrmFeeOrder.Create(self);
  FrmFeeOrder.ShowModal;

  for i := 0 to OutList.Count - 1 do
    InsertFee(OutList[i], '');
  if OutList.Count > 0 then
  begin
    Pgc_P.ActivePageIndex := 4;
    Pgc_P.OnChange(Sender);
  end;
end;

procedure TFrmOrder.ToolButton29Click(Sender: TObject);
var
  i: integer;
  Med_code, aCir, aQty, aPath, aTTL, aGri, aDay: string;
begin
  inherited;
  if not assigned(FrmDitto) then
    FrmDitto := TFrmDitto.Create(self);

  if not assigned(SLMed) then
    SLMed := TStringList.Create;
  if not assigned(SLFee) then
    SLFee := TStringList.Create;
  if not assigned(SLLab) then
    SLLab := TStringList.Create;
  if not assigned(SLMtrl) then
    SLMtrl := TStringList.Create;
  if not assigned(SLXRay) then
    SLXRay := TStringList.Create;
  if not assigned(SLChk) then
    SLChk := TStringList.Create;
  SLMed.Clear;
  SLFee.Clear;
  SLLab.Clear;
  SLMtrl.Clear;
  SLXRay.Clear;
  SLChk.Clear;
  FrmDitto.EdtChrNo.Enabled := true;
  FrmDitto.Button1.Enabled := true;
  FrmDitto.EdtChrNo.Text := getChrNo;
  FrmDitto.EdtPatName.Text := getPatName;
  FrmDitto.ShowModal;

  for i := 0 to SLMed.Count - 1 do
  begin
    Med_code := ReturnID(SLMed[i]);
    aCir := ReturnID(ReturnName(SLMed[i]));
    aQty := ReturnID(ReturnName(ReturnName(SLMed[i])));
    aPath := ReturnID(ReturnName(ReturnName(ReturnName(SLMed[i]))));
    aTTL := ReturnID(ReturnName(ReturnName(ReturnName(ReturnName(SLMed[i])))));
    aGri := ReturnID(ReturnName(ReturnName(ReturnName(ReturnName(ReturnName(SLMed[i]))))));
    aDay := ReturnID(ReturnName(ReturnName(ReturnName(ReturnName(ReturnName(ReturnName(SLMed[i])))))));
    if InsertMed(Med_code, aCir, aQty, aPath, aTTL, aGri, aDay, '', -1) then
    begin
      SGMed.RowCount := SGMed.RowCount + 1;
      SGMed.Row := SGMed.Row + 1;
    end;
  end;

  for i := 0 to SLFee.Count - 1 do
    InsertFee(SLFee[i], '');

  OutList := TStringList(SLLab);
  InsertLab;

  for i := 0 to SLMtrl.Count - 1 do
    InsertMtrl(SLMtrl[i], '');

  OutList := TStringList(SLXRay);
  InsertXRay;

  OutList := TStringList(SLChk);
  InsertChk;
end;

procedure TFrmOrder.BegDayClick(Sender: TObject);
var
  OneDate: string;
begin
  inherited;
  OneDate := '';
  frm_calendar := Tfrm_calendar.Create(nil);
  try
    frm_calendar.type_flag := '2';

    frm_calendar.Top := mouse.CursorPos.Y;
    frm_calendar.Left := mouse.CursorPos.X - frm_calendar.Width;
    frm_calendar.ShowModal;
    OneDate := frm_calendar.OneDate;
  finally
    frm_calendar.Free;
  end;
  if trim(OneDate) <> '' then
    msk_beg_day.Text := AddChar(OneDate, '0', 7);
end;

procedure TFrmOrder.EndDayClick(Sender: TObject);
var
  OneDate: string;
begin
  inherited;
  OneDate := '';
  frm_calendar := Tfrm_calendar.Create(nil);
  try
    frm_calendar.type_flag := '2';

    frm_calendar.Top := mouse.CursorPos.Y;
    frm_calendar.Left := mouse.CursorPos.X - frm_calendar.Width;
    frm_calendar.ShowModal;
    OneDate := frm_calendar.OneDate;
  finally
    frm_calendar.Free;
  end;
  if trim(OneDate) <> '' then
    msk_end_day.Text := AddChar(OneDate, '0', 7);
end;

procedure TFrmOrder.BtnIdlClick(Sender: TObject);
var
  idl_date, idl_fee_code, idl_position, idl_fee_no, idl_ins_seq_no: string;
  opd_date, SDate, STime, tmp: string;
  pos_rep: integer;
  Qrys: TADOQuery;
  tmpSql, case15: string;
  SQLs: TStrings;
begin
  inherited;
  BtnIdl.Enabled := false;
  try
    idl_fee_code := QryFeeHis.FieldByName('fee_code').AsString;
    idl_position := QryFeeHis.FieldByName('position').AsString;
    idl_fee_no := QryFeeHis.FieldByName('fee_no').AsString;
    idl_ins_seq_no := QryFeeHis.FieldByName('INS_SEQ_NO').AsString;
    idl_date := QryFeeHis.FieldByName('opd_date').AsString;
    idl_date := StringReplace(idl_date, '/', '', [rfReplaceAll]);

    SQLs := TStringList.Create;
    SQLs.Clear;
    case15 := Setsys.ReadString('DPD', 'CASE15', '');
    if (trim(idl_fee_code) = ReturnId(case15)) or (trim(idl_fee_code) = ReturnId(ReturnName(case15))) or (trim(idl_fee_code) = ReturnId(ReturnName(ReturnName(case15)))) then
    begin
      tmpSql := getChkSqlStr(59);
      SetParamter(tmpSql, '$CODE_NO$', '15');
      SQLs.Clear;
      SQLs.Text := tmpSql;
      if DM.OpenSQL(SQLs, Qrys) then
      begin
        Case_Type1.Text := Qrys.FieldByName('code_desc').AsString;
        setCASEDESC(Case_Type1.Text);
      end;
    end;

    SQLs := TStringList.Create;
    SQLs.Clear;
    tmpSql := getChkSqlStr(15);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SQLs.Text := tmpSql;

    if DM.OpenSQL(SQLs, Qrys) then
    begin
      if (Application.MessageBox('病患已選擇同療項目是否更新？', '同療作業', MB_YESNO + MB_DEFBUTTON1) = IDYES) then
      begin
        SQLs.Clear;
        tmpSql := getUpdSql(7);
        SetParamter(tmpSql, '$IDL_DATE$', idl_date);
        SetParamter(tmpSql, '$IDL_FEE_CODE$', idl_fee_code);
        SetParamter(tmpSql, '$IDL_POSITION$', idl_position);
        SetParamter(tmpSql, '$INS_SEQ_NO$', idl_ins_seq_no);
        SetParamter(tmpSql, '$IDL_FEE_NO$', idl_fee_no);
        SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
        SQLs.Text := tmpSql;
        DM.ExecSQL(SQLs);

        SQLs.Clear;
        tmpSql := getChkSqlStr(58);
        SetParamter(tmpSql, '$CODE_NO$', '009');
        SQLs.Text := tmpSql;
        if DM.OpenSQL(SQLs, Qrys) then
        begin
          Part_Code1.Text := Qrys.FieldByName('code_desc').AsString;
          setPARTDESC(Part_Code1.Text);
        end;

        setFirstInsSeqNo(idl_ins_seq_no);
        setFirstDate(idl_date);

        SQLs.Clear;
        tmpSql := getChkSqlStr(76);
        SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
        SetParamter(tmpSql, '$CHR_NO$', getChrNo);
        SetParamter(tmpSql, '$INS_SEQ_NO$', QryFeeHis.FieldByName('INS_SEQ_NO').AsString);
        SetParamter(tmpSql, '$INS_SEQ_NO2$', QryFeeHis.FieldByName('INS_SEQ_NO2').AsString);
        SQLs.Text := tmpSql;
        if DM.OpenSQL(SQLs, Qrys) then
        begin
          year.Text := QryFeeHis.FieldByName('INS_SEQ_NO2').AsString;
          cnt.Text := Qrys.FieldByName('cnt').AsString;
        end;
        GetICType := 2;
        BtnICGetClick(Sender);
      end;
    end
    else
    begin
      SQLs.Clear;
      tmpSql := getInsertSql(7);
      SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
      SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
      SetParamter(tmpSql, '$CHR_NO$', getChrNo);
      SetParamter(tmpSql, '$IDL_DATE$', idl_date);
      SetParamter(tmpSql, '$IDL_FEE_CODE$', idl_fee_code);
      SetParamter(tmpSql, '$IDL_POSITION$', idl_position);
      SetParamter(tmpSql, '$INS_SEQ_NO$', idl_ins_seq_no);
      SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
      SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
      SetParamter(tmpSql, '$UPD_TIME$', ROCTime(now, ''));
      SetParamter(tmpSql, '$IDL_FEE_NO$', idl_fee_no);
      SetParamter(tmpSql, '$DEL_FLAG$', 'N');

      SQLs.Text := tmpSql;
      DM.ExecSQL(SQLs);

      SQLs.Clear;
      tmpSql := getChkSqlStr(58);
      SetParamter(tmpSql, '$CODE_NO$', '009');
      SQLs.Text := tmpSql;
      if DM.OpenSQL(SQLs, Qrys) then
      begin
        Part_Code1.Text := Qrys.FieldByName('code_desc').AsString;
        setPARTDESC(Part_Code1.Text);
      end;

      setFirstInsSeqNo(idl_ins_seq_no);
      setFirstDate(idl_date);

      SQLs.Clear;
      tmpSql := getChkSqlStr(76);
      SetParamter(tmpSql, '$OPD_DATE$', getOpdDate);
      SetParamter(tmpSql, '$CHR_NO$', getChrNo);
      SetParamter(tmpSql, '$INS_SEQ_NO$', QryFeeHis.FieldByName('INS_SEQ_NO').AsString);
      SetParamter(tmpSql, '$INS_SEQ_NO2$', QryFeeHis.FieldByName('INS_SEQ_NO2').AsString);
      SQLs.Text := tmpSql;
      if DM.OpenSQL(SQLs, Qrys) then
      begin
        year.Text := QryFeeHis.FieldByName('INS_SEQ_NO2').AsString;
        cnt.Text := Qrys.FieldByName('cnt').AsString;
      end;
      GetICType := 2;
      BtnICGetClick(Sender);
    end;
  finally
    BtnIdl.Enabled := True;
    SQLs.Free;
  end;
end;

procedure TFrmOrder.Pat_Id1Click(Sender: TObject);
begin
  inherited;

  if Pat_Id1.Text = '健保' then
  begin
    setPatId('1');
    if UpperCase(lschangepat) = 'TRUE' then
      chagepat;
  end
  else
  begin
    setPatId('2');
    if UpperCase(lschangepat) = 'TRUE' then
      chagepat;
  end;
end;

procedure TFrmOrder.Case_Type1_Click(Sender: TObject);
begin
  inherited;
  setCASEDESC(Case_type1.Text);
end;

procedure TFrmOrder.Part_Code1_Click(Sender: TObject);
begin
  inherited;
  setCASEDESC(Part_Code1.Text);
end;

procedure TFrmOrder.Doc_N2Click(Sender: TObject);
var
  Qrys: TADOQuery;
  tmpSql: string;
  SQLs: TStrings;
  doc_code, Tran_Treat: string;
  nowInsAmt, setInsAmt1, setInsAmt2: Double;
begin
  inherited;
  if trim(Doc_N2.Text) = '' then
    Exit;

  doc_code := ReturnName(Doc_N2.Text);
  SQLs := TStringList.Create;

  tmpSql := getChkSqlStr(17);
  SetParamter(tmpSql, '$DOC_CODE$', trim(doc_code));
  SQLs.Text := tmpSql;

  if DM.OpenSQL(SQLs, Qrys) then
    nowInsAmt := StrToFloat(Qrys.FieldByName('ins_amt').AsString)
  else
    nowInsAmt := 0;

  tmpSql := getChkSqlStr(16);
  SetParamter(tmpSql, '$DEC_DOC$', '1');
  SetParamter(tmpSql, '$OPERATE$', '=');
  SetParamter(tmpSql, '$DOC_CODE$', trim(doc_code));
  SQLs.Text := tmpSql;

  if DM.OpenSQL(SQLs, Qrys) then
  begin
    setInsAmt1 := StrToFloat(Qrys.FieldByName('ins_amt1').AsString);
    setInsAmt2 := StrToFloat(Qrys.FieldByName('ins_amt2').AsString);
    Tran_Treat := Qrys.FieldByName('tran_treat').AsString;

    if (nowInsAmt >= setInsAmt1) and (nowInsAmt <= setInsAmt2) then
    begin
      MessageDlg('選擇的申報醫師:' + Doc_N2.Text + #13 + ' 所設定申報額度已超過警告額度' + FloatToStr(setInsAmt1) + #13 + '(目前金額為=' + FloatToStr(nowInsAmt) + ')，請醫師注意勿超過每月申報額度', mtWarning, [mbOk], 0);
    end
    else if (nowInsAmt >= setInsAmt2) then
    begin
      MessageDlg('選擇的申報醫師:' + Doc_N2.Text + #13 + ' 所設定申報額度已超過上限額度' + FloatToStr(setInsAmt2) + #13 + '(目前金額為=' + FloatToStr(nowInsAmt) + ')，請醫師選擇其他申報醫師', mtWarning, [mbOk], 0);
      DOC_N2.Text := '';
      setDocCode2('');
      setDocName2('');
    end;
    if CHKTTreat(doc_code, Tran_Treat, SGFee, 2) then
    begin
      setDocCode2(doc_code);
      setDocName2(ReturnID(Doc_N2.Text));
    end
    else
    begin
      ShowPnlMsg(ReturnID(Doc_N2.Text) + '醫師不得申報轉診加成');
      DOC_N2.Text := '';
      setDocCode2('');
      setDocName2('');
    end;
  end
  else
  begin
    ShowPnlMsg('此' + Doc_N2.Text + '醫師不得為申報醫師');
    Doc_N2.Text := '';
  end;
  SQLs.Free;
end;

procedure TFrmOrder.Doc_N3Click(Sender: TObject);
begin
  inherited;
  if trim(Doc_N3.Text) <> '' then
  begin
    setDocCode3(ReturnName(Doc_N3.Text));
    setDocName3(ReturnId(Doc_N3.Text));
  end;
end;

procedure TFrmOrder.SGFeeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  cnt, a_col, a_row: integer;
  rows: integer;
begin
  inherited;
  TStringGrid(Sender).MouseToCell(X, Y, a_col, a_row);
  cnt := a_row;
  rows := TStringGrid(Sender).Row;
  if (cnt <= rows) and (cnt >= 0) then
  begin
    TStringGrid(Sender).Hint := '處置代號：' + TStringGrid(Sender).Cells[F_Code, cnt] + #13 + '處置名稱：' + TStringGrid(Sender).Cells[F_Name, cnt]
      + #13 + '部位：' + TStringGrid(Sender).Cells[F_Part, cnt];
    resetFeeImg(Grp_Part);
    AnalysisFeePart(trim(TStringGrid(Sender).Cells[F_Part, cnt]));
  end
  else
  begin
    TStringGrid(Sender).Hint := '';
  end;
end;

procedure TFrmOrder.ToolButton23Click(Sender: TObject);
var
  tmpSql: string;
  SQLs: TStrings;
  Qrys: TADOQuery;
begin
  inherited;
  if not assigned(FrmPatinf) then
    FrmPatinf := TFrmPatinf.Create(Self);
  FrmPatinf.myChrno := getChrNo;
  FrmPatinf.SOURCE_KIND := 'O';
  FrmPatinf.SOUR_AP := 'DPD';
  FrmPatinf.HaveFever := 'N';
  FrmPatinf.TEMPERATURE := '';
  FrmPatinf.ShowModal;

  SQLs := TStringList.Create;
  SQLs.Clear;
  tmpSql := getChkSqlStr(79);
  SetParamter(tmpSql, '$CHR_NO$', getChrNo);
  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs, Qrys) then
    Weight.Text := Qrys.FieldByName('bt').AsString;

end;

procedure TFrmOrder.ToolButton20Click(Sender: TObject);
var
  Bmp: TBitmap;
  SQLs: TStrings;
begin
  inherited;
  ImgDNR.Picture.Assign(nil);
  ImgDNR.Picture := nil;
  ImgDNR.ShowHint := False;
  if not assigned(FrmPubDNRList) then
    FrmPubDNRList := TFrmPubDNRList.Create(Self);
  FrmPubDNRList._DB := DM.ADOLink;
  FrmPubDNRList.Chr_no := GetChrNo;
  FrmPubDNRList.ModifyKind := '1';
  FrmPubDNRList.ShowModal;

  FrmPubDNRList.Free;
  FrmPubDNRList := nil;
  bmp := TBitmap.Create;
  SQLs := TStringList.Create;

  bmp.FreeImage();
  SQLs.Clear;
  SQLs.Add('Select * from hospice_basic where CHR_NO=' + Qt(GetChrNo) + ' and can_cd=''N'' ');
  if DM.OpenSQL(SQLs) then
  begin
    ImageListforPat.GetBitmap(7, bmp);
    ImgDNR.Picture.Assign(bmp);
    ImgDNR.Hint := '安寧病人';
    ImgDNR.ShowHint := True;
  end
  else
  begin
    SQLs.Clear;
    SQLs.Add('select * from DNR_BASIC where Chr_no=' + qt(GetChrno()));
    SQLs.Add(' and CAN_CD =''N'' ');
    if DM.OpenSQL(SQLs) then
    begin
      ImageListforPat.GetBitmap(6, bmp);
      ImgDNR.Picture.Assign(bmp);
      ImgDNR.Hint := '[DNR病人]';
      ImgDNR.ShowHint := True;
    end
    else
    begin
      ImgDNR.Picture.Assign(nil);
      ImgDNR.Picture := nil;
      ImgDNR.ShowHint := False;
    end;
  end;
  SQLs.Free;
  SQLs := nil;
  Bmp.Free;
end;

procedure TFrmOrder.ToolButton21Click(Sender: TObject);
var
  Bmp: TBitmap;
  SQLs: TStrings;
begin
  inherited;
  ImgDNR.Picture.Assign(nil);
  ImgDNR.Picture := nil;
  ImgDNR.ShowHint := False;
  if not Assigned(FrmHosPiceList) then
    FrmHosPiceList := TFrmHosPiceList.Create(Self);
  FrmHosPiceList.Fee_no := Getfeeno;
  FrmHosPiceList.Chr_no := Getchrno;
  FrmHosPiceList.ModifyKind := '1';
  FrmHosPiceList.oper_id := getDocCode;
  FrmHosPiceList.ShowModal;
  bmp := TBitmap.Create;
  SQLs := TStringList.Create;

  bmp.FreeImage();

  SQLs.Clear;
  SQLs.Add('Select * from hospice_basic where CHR_NO=' + Qt(GetChrNo) + ' and can_cd=''N'' ');
  if DM.OpenSQL(SQLs) then
  begin
    ImageListforPat.GetBitmap(7, bmp);
    ImgDNR.Picture.Assign(bmp);
    ImgDNR.Hint := '安寧病人';
    ImgDNR.ShowHint := True;
  end
  else
  begin
    SQLs.Clear;
    SQLs.Add('select * from DNR_BASIC where Chr_no=' + qt(GetChrno()));
    SQLs.Add(' and CAN_CD =''N'' ');
    if DM.OpenSQL(SQLs) then
    begin
      ImageListforPat.GetBitmap(6, bmp);
      ImgDNR.Picture.Assign(bmp);
      ImgDNR.Hint := '[DNR病人]';
      ImgDNR.ShowHint := True;
    end
    else
    begin
      ImgDNR.Picture.Assign(nil);
      ImgDNR.Picture := nil;
      ImgDNR.ShowHint := False;
    end;
  end;
  SQLs.Free;
  SQLs := nil;
  Bmp.Free;
end;

procedure TFrmOrder.ToolButton22Click(Sender: TObject);
var
  OPDADV, CeiFicateNoTW, CopeOne, CodeTwo: string;
  i: integer;
begin
  inherited;
  if not Assigned(FrmIPDCertificate) then
    FrmIPDCertificate := TFrmIPDCertificate.Create(Self);
  FrmIPDCertificate.ShowKind := 'C';
  FrmIPDCertificate.isOpen := false;
  for i := 0 to 4 do
    if SGIcd.Cells[1, i] <> '' then
      FrmIPDCertificate.Dia.Add(SGIcd.Cells[1, i]);
  FrmIPDCertificate.ShowModal;

  if FrmIPDCertificate.isOpen then
  begin
    CeiFicateNoTW := SetSys.ReadString('DPD', 'CeiFicateNoTW', '');
    CopeOne := ReturnID(CeiFicateNoTW);
    CodeTwo := ReturnName(CeiFicateNoTW);
    if FrmIPDCertificate.Pagecount.Value > 1 then
    begin
      InsertFee(CopeOne, '');
      InsertFee(CodeTwo, '');
      SGFee.Cells[F_Qty, SGFee.RowCount - 2] := IntToStr(FrmIPDCertificate.Pagecount.Value - 1);
    end
    else if FrmIPDCertificate.Pagecount.Value = 1 then
      InsertFee(CopeOne, '');
  end;

  if FrmIPDCertificate <> nil then
    FrmIPDCertificate := nil;
  Pgc_P.ActivePageIndex := 4;
  Pgc_P.OnChange(Sender);
end;

procedure TFrmOrder.ToolButton24Click(Sender: TObject);
var
  i: integer;
  CeiFicateNoEN, CopeOne, CodeTwo: string;
begin
  inherited;

  if not Assigned(FrmIPDCertificate) then
    FrmIPDCertificate := TFrmIPDCertificate.Create(Self);
  FrmIPDCertificate.ShowKind := 'E';
  FrmIPDCertificate.isOpen := false;
  for i := 0 to 4 do
    if SGIcd.Cells[2, i] <> '' then
      FrmIPDCertificate.Dia.Add(SGIcd.Cells[2, i]);
  FrmIPDCertificate.ShowModal;

  if FrmIPDCertificate.isOpen then
  begin
    CeiFicateNoEN := SetSys.ReadString('DPD', 'CeiFicateNoEN', '');
    CopeOne := ReturnID(CeiFicateNoEN);
    CodeTwo := ReturnName(CeiFicateNoEN);
    if FrmIPDCertificate.Pagecount.Value > 1 then
    begin
      InsertFee(CopeOne, '');
      InsertFee(CodeTwo, '');
      SGFee.Cells[F_Qty, SGFee.RowCount - 2] := IntToStr(FrmIPDCertificate.Pagecount.Value - 1);
    end
    else if FrmIPDCertificate.Pagecount.Value = 1 then
      InsertFee(CopeOne, '');
  end;

  if FrmIPDCertificate <> nil then
    FrmIPDCertificate := nil;
  Pgc_P.ActivePageIndex := 4;
  Pgc_P.OnChange(Sender);
end;

procedure TFrmOrder.BtnICInfoClick(Sender: TObject);
var
  ComRet, IC_V: integer;
begin
  inherited;
  csCloseCom();
  ComRet := csOpenCom(0);
  if ComRet = 0 then
  begin
    IC_V := IC_CHECK();
    if IC_V = 9999 then
    begin
      ShowPnlMsg('此IC卡與病患資料不符無法讀取卡片資料' + #13 + '請重新確認卡片');
      Exit;
    end;
  end;

  isExecute := false;
  IC_Insert_InFo.SpeedButton1.Caption := '準備開始讀卡中......';
  IC_Insert_InFo.ProgressBar1.Position := 0;
  IC_Insert_InFo.Show;
  ic_basic_thread := ic_basic.Create(False);
  Timer2.Enabled := true;
end;

procedure TFrmOrder.Timer2Timer(Sender: TObject);
begin
  inherited;
  if isExecute then
  begin
    Timer2.Enabled := false;
    IC_Insert_InFo.Hide;
    if trim(ErrStr) <> '' then
      ShowPnlMsg(ErrStr);

    if not Assigned(IC_information_frm) then
      IC_information_frm := TIC_information_frm.Create(Self);

    IC_information_frm.ShowModal;
  end;
end;

procedure TFrmOrder.SGIcdMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Sender is TStringGrid then
  begin
    TStringGrid(Sender).MouseToCell(X, Y, SourceCol, SourceRow);
    TStringGrid(Sender).BeginDrag(False, 4);
  end;
end;

procedure TFrmOrder.SGIcdDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  oCol, oRow: Integer;
  gid: TGridCoord;
begin
  inherited;
  TStringGrid(Sender).MouseToCell(X, Y, oCol, oRow);
  gid := TStringGrid(Sender).MouseCoord(x, y);
  Accept := (TStringGrid(Sender).Name = TStringGrid(Source).Name);
  self.Cursor := TCurSor(crNo);

end;

procedure TFrmOrder.SGIcdDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  vCol, vRow, sCol, sRow, i: integer;
  myRow: TStrings;
  Key: Word;
  myshift: TShiftState;
begin
  inherited;
  TStringGrid(Sender).MouseToCell(X, Y, vCol, vRow);
  myRow := TStringList.Create;
  myRow.Text := TStringGrid(Sender).Rows[SourceRow].Text;
  TStringGrid(Sender).Rows[SourceRow].Text := TStringGrid(Sender).Rows[vRow].Text;
  TStringGrid(Sender).Rows[vRow].Text := myRow.Text;
  TStringGrid(Sender).Row := vRow;

end;

function TFrmOrder.GetXMl(chk_flag, fee_code, part, cnt: string; row: integer): Boolean;
var //xml檢核_取值
  teeth, day, fee_code_xml, msg, stop, qty, chk_class, fee_status, use_part, nouse_part, chk_kind: string;
  //xmlnode,xmlnodechild,xmlattributenode:IXMLDOMNODE;
  //xmlnodelist:IXMLDOMNODELIST;
  //xmldomele:IXMLDOMElement;
  //xmlattributes:IXMLDOMNamedNodeMap;
  i, index: integer;
  result_flag, stopnopart: boolean;
  //node : IXMLDOMNODE;
  nodeList, nodeListChild, AttirbuteList: ixmlnodelist;
  rootNode, CNode, NNode: IXMLNode;
  function NodeToStr(mynode: ixmlnodelist; key: string): string;
  begin
    if VarIsNull(mynode.FindNode(key).NodeValue) then
      Result := ''
    else
      Result := mynode.FindNode(key).NodeValue;
  end;
begin
  result := False; //有問題回傳True 沒問題則回傳 False
  stopnopart := True;
  XmlFile.XML.Clear;
  XmlFile.LoadFromFile('DPD.xml');
  nodeList := XmlFile.ChildNodes.Nodes[0].ChildNodes;
  NNode := nodeList.FindNode(Trim(fee_code)); //PS 要加回
  //NNode := nodeList.FindNode(fee_code);
  if NNode = nil then
    exit;
  nodeListChild := nodeList.FindNode(Trim(fee_code)).ChildNodes;
  //nodeListChild := nodeList.FindNode(fee_code).ChildNodes;  //PS 要加回
  for i := 0 to nodeListChild.Count - 1 do
  begin
    AttirbuteList := nodeListChild.Nodes[i].AttributeNodes;//抓屬性
    teeth := NodeToStr(AttirbuteList, 'teeth');            //牙齒類型 (0-恆牙,1-乳牙)
    day   := NodeToStr(AttirbuteList, 'day');              //限制天數
    qty   := NodeToStr(AttirbuteList, 'qty');              //限制數量
    chk_class := NodeToStr(AttirbuteList, 'chk_class');    //檢核類型 (0-歷史就診,1-當次就診)
    chk_kind  := NodeToStr(AttirbuteList, 'chk_kind');     //檢核種類 (0-相同部位,1-不同部位)
    fee_code_xml := NodeToStr(AttirbuteList, 'fee_code');  //申報項目
    fee_status   := NodeToStr(AttirbuteList, 'fee_status');//項目狀態 (0-全部包含,1-至少一項,2-全部不包含)
    stop := NodeToStr(AttirbuteList, 'stop');              //訊息阻斷
    msg  := VarToStr(nodeListChild.Nodes[i].NodeValue);    //訊息
    use_part   := NodeToStr(AttirbuteList, 'use_part');    //可用部位
    nouse_part := NodeToStr(AttirbuteList, 'nouse_part');  //不可用部位

    result_flag := false;
    if chk_class = chk_flag then//chk_flag為傳入參數
    begin
      case StrToInt(chk_class) of
        0://歷史就診                   牙齒類型 (0-恆牙,1-乳牙),限制天數,申報項目,限制數量,項目狀態(0-全部包含,1-至少一項,2-全部不包含),可用部位,不可用部位,輸入項目,輸入部位,輸入數量,檢核種類 (0-相同部位,1-不同部位)
          result_flag := chkFee_befoee(teeth, day, fee_code_xml, qty, fee_status, use_part, nouse_part, fee_code, part, cnt, chk_kind);
        1: //當次就診
          result_flag := chkFee_now(teeth, fee_code_xml, qty, fee_status, use_part, nouse_part, fee_code, part, cnt, chk_kind);
      end;
    end;
    if (chk_flag = '0') and (trim(SGFee.Cells[F_Part, row]) = '') and (chk_class = '1') then
      if length(nouse_part) = 200 then
        stopnopart := false;
    if Return_Pos(msg, '@') > 0 then
      msg := Pre_Return_cut_word(msg, '@') + part + Aft_Return_cut_word(msg, '@');
    if (result_flag) and (stop = '0') then
    begin
      MessageDlg('" ' + fee_code + ' "' + msg, mtWarning, [mbOk], 0);
      result := True;
      //result:= result_flag;
      Exit;
    end
    else if result_flag then
      MessageDlg('" ' + fee_code + ' "' + msg, mtWarning, [mbOk], 0);
    //xmlnodechild := xmlnodelist.nextNode;
  end;
  if (chk_flag = '0') and (trim(SGFee.Cells[F_Part, row]) = '') and (stopnopart) then
  begin
    ShowPnlMsg(SGFee.Cells[F_Code, row] + '處置項目部位不能為空值');
    Result := True;
    Abort;
  end;
  //result:=result_flag;
//****************************************************//

  {if XMLDoc.load('DPD.xml') then
  begin
    xmlnode:=xmldoc.documentElement.selectNodes(fee_code).nextNode;
    if xmlnode <> nil then
    begin

      xmlnodelist:=xmlnode.childNodes;
      if xmlnodelist <> nil then
      begin
        stopnopart:=true;
        xmlnodechild := xmlnodelist.nextNode;
        while xmlnodechild <> nil do
        begin
          teeth:='';
          day:='';
          fee_code_xml:='';
          msg:='';
          stop:='';
          qty:='';
          chk_class:='';
          fee_status:='';
          use_part:='';
          nouse_part:='';
          msg := xmlnodechild.text;
          xmlattributes := xmlnodechild.Get_attributes;

          if xmlattributes <> nil then
          begin
            xmlattributenode := xmlattributes.nextNode;
            while xmlattributenode <> nil do
            begin
              if xmlattributenode.nodeName = 'teeth' then
                teeth := xmlattributenode.text
              else if xmlattributenode.nodeName = 'day' then
                day := xmlattributenode.text
              else if xmlattributenode.nodeName = 'fee_code' then
                fee_code_xml := xmlattributenode.text
              else if xmlattributenode.nodeName = 'stop' then
                stop := xmlattributenode.text
              else if xmlattributenode.nodeName = 'qty' then
                qty := xmlattributenode.text
              else if xmlattributenode.nodeName = 'chk_class' then
                chk_class := xmlattributenode.text
              else if xmlattributenode.nodeName = 'fee_status' then
                fee_status := xmlattributenode.text
              else if xmlattributenode.nodeName = 'use_part' then
                use_part := xmlattributenode.text
              else if xmlattributenode.nodeName = 'nouse_part' then
                nouse_part := xmlattributenode.text
              else if xmlattributenode.nodeName = 'chk_kind' then
                chk_kind := xmlattributenode.text;

              xmlattributenode := xmlattributes.nextNode
            end;
          end;

          result_flag:=false;
          if chk_class = chk_flag then
          begin
            case StrToInt(chk_class) of
              0:
              begin
                result_flag:=chkFee_befoee(teeth,day,fee_code_xml,qty,fee_status,use_part,nouse_part,fee_code,part,cnt,chk_kind);
              end;
              1:
              begin
                result_flag:=chkFee_now(teeth,fee_code_xml,qty,fee_status,use_part,nouse_part,fee_code,part,cnt,chk_kind);
              end;
            end;
          end;

          if (chk_flag = '0') and (trim(SGFee.Cells[F_Part,row]) = '') and (chk_class='1') then
          begin
            if length(nouse_part) = 200 then
              stopnopart:=false;
          end;

          if  Return_Pos(msg,'@') > 0 then
            msg:=Pre_Return_cut_word(msg,'@')+part+Aft_Return_cut_word(msg,'@');


          if (result_flag) and (stop = '0') then
          begin
            MessageDlg('" '+fee_code+' "'+msg,mtWarning,[mbOk],0);
            result:=result_flag;
            Exit;
          end
          else if result_flag then
            MessageDlg('" '+fee_code+' "'+msg,mtWarning,[mbOk],0);

          xmlnodechild := xmlnodelist.nextNode;
        end;
        if (chk_flag = '0') and (trim(SGFee.Cells[F_Part,row]) = '') and (stopnopart) then
        begin
          ShowPnlMsg(SGFee.Cells[F_Code,row]+'處置項目部位不能為空直');
          Abort;
        end;
        result:=result_flag;
      end;
    end;
  end;}
end;

procedure TFrmOrder.ToolButton44Click(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i := 0 to SGFee.RowCount - 1 do
    if SGFee.Cells[F_Ins, i] = 'Y' then
      getxml('0', SGFee.Cells[F_Code, i], SGFee.Cells[F_Part, i], SGFee.Cells[F_Qty, i], i);

  //20140212增加給付類別為431..做檢核
  if ReturnName(Pay_Type.Text)='431' then
    getxml('0', 'F01271C', '', '1', SGFee.RowCount - 1);
  if ReturnName(Pay_Type.Text)='432' then
    getxml('0', 'F01272C', '', '1', SGFee.RowCount - 1);
  if ReturnName(Pay_Type.Text)='433' then
    getxml('0', 'F01273C', '', '1', SGFee.RowCount - 1);
end;

procedure TFrmOrder.ToolButton28Click(Sender: TObject);
var
  myStr,myParamter,sPath, sFlag : String;  i: integer;
  TempQ : TADOQuery;
  lsMedName : String;
begin
  inherited;

  if sender is TToolButton then
  begin
    myStr := Setsys.ReadString('WEB', TToolButton(sender).Caption, '');
    myParamter := Setsys.ReadString('PARAMTER', TToolButton(sender).Caption, '');
  end
  else if sender is TMenuItem then
  begin
    myStr := Setsys.ReadString('WEB', TMenuItem(sender).Caption, '');
    myParamter := Setsys.ReadString('PARAMTER', TMenuItem(sender).Caption, '');
  end;

  comStrRep(mystr);
  comstrRep(myParamter);
  if sender is TMenuItem then
  begin
    //藥品
    if (TMenuItem(sender).Caption = 'MICROMEDEX') or  (TMenuItem(sender).Caption = 'Clin-eguide') then
    begin
      TempQ := TADOQuery.Create(self);
      TempQ.Connection := DM.ADOLink;
      lsMedName := '';
      try
        with TempQ do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from med_basic where med_code = ''' + trim(SGMed.Cells[M_Code,SGMed.row]) + '''');
          open;
          if not Eof then
          begin
            lsMedName := trim(FieldByName('alise_desc').AsString);
          end;
        end;
      finally
        TempQ.free;
      end;
      SetParamter(mystr,'$+MEDNAME+$',lsMedName);
      SetParamter(myParamter,'$+MEDNAME+$',lsMedName);
    end;
  end;


  if myStr = '' then
  begin
    showMessage(NullStrTo(gsSysMsg, '此功能不開放使用，如有疑問請洽資訊室詢問。'));
    Exit;
  end;
  try
     if TToolButton(sender).Caption = 'SDM服務' then begin
        //SDM服務必須等待回應
        if WinExecAndWait32(PChar(PChar(myStr) + ' ' + PChar(myParamter)), SW_SHOWNORMAL) = -1 then
           ShellExecute(Handle, 'open', PChar(myStr), PChar(myParamter), nil, SW_SHOW);

        OutList.Clear;
        sPath := ExtractFileDir(Application.ExeName) + '\sdmservice.txt';
        if FileExists(ExtractFileDir(Application.ExeName) + '\sdmservice.txt') then
        begin
           OutList.LoadFromFile(ExtractFileDir(Application.ExeName) + '\sdmservice.txt');
           for i := 0 to OutList.Count - 1 do
           begin
              if Trim(OutList.Strings[i]) <> '' then begin
                 sFlag := SelectOrderitemData(Trim(OutList.Strings[i]));
                 if sFlag = 'N' then begin
                    ShowMessage('此計價代碼[*' + Trim(OutList.Strings[i]) + '*]，不存在!!');
                 end;
              end;
           end;
        end;
        OutList.Clear;
        DELETEFILE(ExtractFileDir(Application.ExeName) + '\sdmservice.txt');
    end
    else
       if winexec(PChar(PChar(myStr) + ' ' + PChar(myParamter)), SW_SHOWNORMAL) < 31 then
          ShellExecute(Handle, 'open', PChar(myStr), PChar(myParamter), nil, SW_SHOWNORMAL);
  except
     on e:exception do begin
        showmessage('錯誤訊息[ToolButton28Click] ' + #13#10 + e.Message);
     end;
  end;

end;

procedure TFrmOrder.ToolButton13Click(Sender: TObject);
begin
  inherited;
  PupMenuReport.Popup(mouse.CursorPos.X, mouse.CursorPos.Y);
end;

procedure TFrmOrder.ToolButton10Click(Sender: TObject);
begin
  inherited;
  PupMenuPromulgate.Popup(mouse.CursorPos.X, mouse.CursorPos.Y);
end;

procedure TFrmOrder.ToolButton15Click(Sender: TObject);
begin
  inherited;
  PupOtherSys.Popup(mouse.CursorPos.X, mouse.CursorPos.Y);
end;

procedure TFrmOrder.ToolButton9Click(Sender: TObject);
begin
  inherited;
  winexec(PChar('DPDAPP.exe ' + getDocCode1 + ' ' + getChrNo), 0);
end;

procedure TFrmOrder.Part_Code1Click(Sender: TObject);
var
  tmpSql, tmpStr: string;
  SQLs: TStrings;
  Qrys: TADOQuery;
  i, cnt: integer;
begin
  inherited;
  PCPLstBox.Visible := false;
  PCPLstBox.Tag := TEdit(Sender).Tag;
  SQLs := TStringList.Create;
  case (TEdit(Sender).Tag) of
    0:
      tmpSql := getChkSqlStr(58);
    1:
      tmpSql := getChkSqlStr(59);
    2:
      tmpSql := getChkSqlStr(60);
  end;
  SetParamter(tmpSql, '$CODE_NO$', '%');
  SQLs.Text := tmpSql;
  PCPLstBox.Left := TEdit(Sender).Left;
  PCPLstBox.Top := TEdit(Sender).Top + TEdit(Sender).Height;
  PCPLstBox.Clear;
  if DM.OpenSQL(SQLs, Qrys) then
  begin
    i := 0;
    cnt := -1;
    tmpStr := TEdit(Sender).Text;
    while not Qrys.Eof do
    begin
      PCPLstBox.Items.Add(Qrys.FieldByName('code_desc').AsString);
      if tmpStr = Qrys.FieldByName('code_desc').AsString then
        cnt := i;
      i := i + 1;
      Qrys.Next;
    end;
    if cnt > -1 then
      PCPLstBox.ItemIndex := cnt;
  end;
  PCPLstBox.Visible := true;
  TEdit(Sender).SelectAll;
  SQLs.Free;
end;

procedure TFrmOrder.PCPLstBoxClick(Sender: TObject);
var
  Str: string;
begin
  inherited;
  PCPLstBox.Visible := false;
  case (TListBox(Sender).Tag) of
    0:
      begin
        Part_Code1.Text := PCPLstBox.Items.Strings[PCPLstBox.itemindex];
        setPARTDESC(Part_Code1.Text);
      end;
    1:
      begin
        Case_Type1.Text := PCPLstBox.Items.Strings[PCPLstBox.itemindex];
        setCASEDESC(Case_Type1.Text);
      end;
    2:
      begin
        Pay_Type.Text := PCPLstBox.Items.Strings[PCPLstBox.itemindex];
        setPAYDESC(Pay_Type.Text);
        CHKCASEPART('D', ReturnName(Pay_Type.Text));
      end;
  end;
end;

procedure TFrmOrder.Part_Code1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key in [#27] then
    PCPLstBox.Visible := false;
end;

procedure TFrmOrder.b_00127CClick(Sender: TObject);
begin
  inherited;
  Pup00127.Popup(mouse.CursorPos.X, mouse.CursorPos.Y);
end;

procedure TFrmOrder.F01271CClick(Sender: TObject);
var
  tmpSql, tmpStr: string;
  SQLs: TStrings;
  Qrys: TADOQuery;
begin
  inherited;
  SQLs := TStringList.Create;
  tmpSql := getChkSqlStr(60);
  SetParamter(tmpSql, '$CODE_NO$', TMenuItem(Sender).Hint);
  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs, Qrys) then
  begin
    Pay_Type.Text := Qrys.FieldByName('code_desc').AsString;
    setPAYDESC(Pay_Type.Text);
    CHKCASEPART('D', ReturnName(Pay_Type.Text));
  end;

end;

procedure TFrmOrder.ToolButton34Click(Sender: TObject);
begin
  inherited;
  if not assigned(FrmPain) then
    Application.CreateForm(TFrmPain, FrmPain);
  FrmPain.opd_date := getOpdDate;
  FrmPain.chr_no := getChrNo;
  FrmPain.fee_no := getFeeNo;
  FrmPain.doc_Code := getDocCode;
  FrmPain._DB := DM.ADOLink;
  FrmPain.m_age := getMAge;
  FrmPain.dept_code := getDeptCode;
  FrmPain.age := getPAge;
  FrmPain.ShowModal;
end;

procedure TFrmOrder.Part_Code1DblClick(Sender: TObject);
begin
  inherited;
  PCPLstBox.Visible := false;
end;

procedure TFrmOrder.ToolButton40Click(Sender: TObject);
begin
  inherited;
  FrmSpec := TFrmSpec.Create(Self);
  FrmSpec.ShowModal;
  FreeAndNil(FrmSpec);
end;

procedure TFrmOrder.BtnTtlAmtClick(Sender: TObject);
begin
  inherited;
  if not Assigned(FrmTtlAmt) then
    FrmTtlAmt := TFrmTtlAmt.Create(Self);

  FrmTtlAmt.ShowModal;
end;

procedure TFrmOrder.BtnICBackClick(Sender: TObject);
var
  tmpSql, ic_dt, SpName, ExeSPResult: string;
  SQLs, Paramter, PType, RType, PData: TStrings;
  Qrys: TADOQUERY;
  ComRet: integer;
begin
  inherited;
  GetICType := 1;
  csCloseCom();
  ComRet := csOpenCom(0);
  if (ComRet = 0) and (IC_check = 0) then
  begin
    SQLs := TStringList.Create;
    SQLs.Clear;
    tmpSql := getChkSqlStr(25);
    SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
    SQLs.Text := tmpSql;
    if DM.OpenSQL(SQLs, Qrys) then
    begin
      ic_dt := Qrys.FieldByName('ic_date').AsString + Qrys.FieldByName('ic_time').AsString;
      if ReturnName(getCASEDESC) = 'A3' then
      begin
        //20140829學承MARK
        //if (trim(Case_Code.Text) = '81') or (trim(Case_Code.Text) = '87') then
        if (trim(Case_Code.Text) = '97') OR (trim(Case_Code.Text) = '95') then
          Write_HealthInsurance('08', 'YH')
        else
          Write_HealthInsurance('05', 'YD');

        tmpSql := getChkSqlStr(81);
        SetParamter(tmpSql, '$FEE_NO$', trim(getFeeNo));
        SQLs.Clear;
        SQLs.Text := tmpSql;
        if DM.OpenSQL(SQLs, Qrys) then
        begin
          tmpSql := getDeleteSql(4);
          SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
          SQLs.Clear;
          SQLs.Text := tmpSql;
          DM.ExecSQL(SQLs);
        end;
      end
      else
        UnGetSeqNum(getFeeNo);
      SQLs.Clear;
      tmpSql := getUpdSql(16);
      SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
      SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
      SetParamter(tmpSql, '$UPD_TIME$', ROCTime(now, ''));
      SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
      SQLs.Text := tmpSql;
      DM.ExecSQL(SQLs);
      SQLs.Clear;
      tmpSql := getUpdSql(17);
      SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
      SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
      SetParamter(tmpSql, '$UPD_TIME$', ROCTime(now, ''));
      SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
      SQLs.Text := tmpSql;
      DM.ExecSQL(SQLs);
      SQLs.Clear;
      tmpSql := getUpdSql(15);
      SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
      SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
      SetParamter(tmpSql, '$UPD_TIME$', ROCTime(now, ''));
      SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
      SQLs.Text := tmpSql;
      DM.ExecSQL(SQLs);
      tmpSql := getUpdSql(19);
      SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
      SQLs.Text := tmpSql;
      DM.ExecSQL(SQLs);
      card_no1.Text := '';
      setIcSeqNo('');
      Case_Code.Text := '';

      SQLs.Clear;
      tmpSql := getChkSqlStr(58);
      SetParamter(tmpSql, '$CODE_NO$', PARTTYPE);
      SQLs.Text := tmpSql;
      if DM.OpenSQL(SQLs, Qrys) then
      begin
        Part_Code1.Text := Qrys.FieldByName('code_desc').AsString;
        setPARTDESC(Part_Code1.Text);
      end;

      SQLs.Clear;
      tmpSql := getChkSqlStr(59);
      SetParamter(tmpSql, '$CODE_NO$', CASETYPE);
      SQLs.Text := tmpSql;
      if DM.OpenSQL(SQLs, Qrys) then
      begin
        Case_Type1.Text := Qrys.FieldByName('code_desc').AsString;
        setCASEDESC(Case_Type1.Text);
      end;

      SQLs.Clear;
      tmpSql := getChkSqlStr(60);
      SetParamter(tmpSql, '$CODE_NO$', PAYTYPE);
      SQLs.Text := tmpSql;
      if DM.OpenSQL(SQLs, Qrys) then
      begin
        Pay_Type.Text := Qrys.FieldByName('code_desc').AsString;
        setPAYDESC(Pay_Type.Text);
      end;

      year.Text := '';
      cnt.Text := '';

      Paramter := TStringList.Create;
      PType := TStringList.Create;
      RType := TStringList.Create;
      PData := TStringList.Create;
      SpName := '';
      SpName := getSpSql(6, Paramter, PType, RType);
      PData.Add(ic_dt);
      PData.Add(getFeeNo);
      ExeSPResult := DM.ExecSP(Paramter, PType, RType, PData, SpName);

      if ReturnID(ExeSPResult) = 'N' then
      begin
        ShowPnlMsg(ReturnName(ExeSPResult));
        use_opd_log(DPD_Ver, ReturnName(ExeSPResult));
      end;

      ShowPnlMsg('退卡已成功');
      SQLs.Free;
      Paramter.Free;
      PType.Free;
      RType.Free;
      PData.Free;
    end
    else
      ShowPnlMsg('此病人' + getPatName + '尚未取IC卡序無法退卡');
  end
  else
    ShowPnlMsg('此IC卡與病人基本資料未符合或無法開起讀卡機Com Port！' + #13 + '請確認卡機與卡片再執行退掛。');
  csCloseCom();
end;

procedure TFrmOrder.N8Click(Sender: TObject);
begin
  inherited;
  if not Assigned(FrmOftenIcd) then
    FrmOftenIcd := TFrmOftenIcd.Create(Self);
  FrmOftenIcd.ShowModal;
  FreeAndNil(FrmOftenIcd);
end;

procedure TFrmOrder.ToolButton47Click(Sender: TObject);
var
  SpName, ExeSPResult: string;
  Paramter, PType, RType, PData: TStrings;
begin
  inherited;
  Paramter := TStringList.Create;
  PType := TStringList.Create;
  RType := TStringList.Create;
  PData := TStringList.Create;
  SpName := '';
  SpName := getSpSql(3, Paramter, PType, RType);
  PData.Add(getFeeNo);
  PData.Add(getChrNo);
  PData.Add(getOpdDate);
  ExeSPResult := DM.ExecSP(Paramter, PType, RType, PData, SpName);
  if ReturnID(ExeSPResult) = 'N' then
  begin
    ShowPnlMsg(ReturnName(ExeSPResult));
    use_opd_log(DPD_Ver, ReturnName(ExeSPResult));
  end
  else
    ShowMessage('調閱病歷成功');

end;

procedure TFrmOrder.EdtCirChange(Sender: TObject);
begin
  inherited;
  with LbMed2 do
    itemindex := Perform(LB_FINDSTRING, ItemIndex, Longint(PChar(Tedit(Sender).Text)));
end;

procedure TFrmOrder.EdtCirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Integer;
begin
  inherited;
  if key in [vk_up, vk_down, vk_return] then
  begin
    if Key = vk_return then
    begin
      i := LBMed2.ItemIndex;
      try
        SetCbbitem(LBMed2, UPPERCASE(EdtCir.Text));
        if LBMed2.ItemIndex = -1 then
          LBMed2.ItemIndex := i;
      except
        LBMed2.ItemIndex := i;
      end;
      LBMed2DblClick(self);
      key := 0;
    end;
    Sendmessage(LBMed2.Handle, WM_KEYDOWN, key, 0);
    key := 0;
  end;
end;

procedure TFrmOrder.EdtCirExit(Sender: TObject);
begin
  inherited;
  if FrmOrder.ActiveControl <> TWincontrol(LBMed2) then
  begin
    LBMed2DblClick(self);
  end;
end;

procedure TFrmOrder.EdtLCirChange(Sender: TObject);
begin
  inherited;
  with LBCir do
    itemindex := Perform(LB_FINDSTRING, ItemIndex, Longint(PChar(Tedit(Sender).Text)));
end;

procedure TFrmOrder.EdtLCirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Integer;
begin
  inherited;
  if key in [vk_up, vk_down, vk_return] then
  begin
    if Key = vk_return then
    begin
      try
        SetCbbitem(LBCir, UPPERCASE(EdtLCir.Text));
        if LBCir.ItemIndex = -1 then
          LBCir.ItemIndex := i;
      except
        LBCir.ItemIndex := i;
      end;
      LBCirDblClick(self);
      key := 0;
    end;
    Sendmessage(LBCir.Handle, WM_KEYDOWN, key, 0);
    key := 0;
  end;
end;

procedure TFrmOrder.EdtLCirExit(Sender: TObject);
begin
  inherited;
  if FrmOrder.ActiveControl <> TWincontrol(LBCir) then
  begin
    LBCirDblClick(self);
  end;
end;

procedure TFrmOrder.EdtRCirChange(Sender: TObject);
begin
  inherited;
  with LBRCir do
    itemindex := Perform(LB_FINDSTRING, ItemIndex, Longint(PChar(Tedit(Sender).Text)));
end;

procedure TFrmOrder.EdtRCirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Integer;
begin
  inherited;
  if key in [vk_up, vk_down, vk_return] then
  begin
    if Key = vk_return then
    begin
      try
        SetCbbitem(LBCCir, UPPERCASE(EdtRCir.Text));
        if LBRCir.ItemIndex = -1 then
          LBRCir.ItemIndex := i;
      except
        LBRCir.ItemIndex := i;
      end;
      LBRCirDblClick(self);
      key := 0;
    end;
    Sendmessage(LBCCir.Handle, WM_KEYDOWN, key, 0);
    key := 0;
  end;
end;

procedure TFrmOrder.EdtRCirExit(Sender: TObject);
begin
  inherited;
  if FrmOrder.ActiveControl <> TWincontrol(LBRCir) then
  begin
    LBRCirDblClick(self);
  end;
end;

procedure TFrmOrder.EdtCCirChange(Sender: TObject);
begin
  inherited;
  with LBCCir do
    itemindex := Perform(LB_FINDSTRING, ItemIndex, Longint(PChar(Tedit(Sender).Text)));
end;

procedure TFrmOrder.EdtCCirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Integer;
begin
  inherited;
  if key in [vk_up, vk_down, vk_return] then
  begin
    if Key = vk_return then
    begin
      try
        SetCbbitem(LBCCir, UPPERCASE(EdtCCir.Text));
        if LBCCir.ItemIndex = -1 then
          LBCCir.ItemIndex := i;
      except
        LBCCir.ItemIndex := i;
      end;
      LBCCirDblClick(self);
      key := 0;
    end;
    Sendmessage(LBCCir.Handle, WM_KEYDOWN, key, 0);
    key := 0;
  end;
end;

procedure TFrmOrder.EdtCCirExit(Sender: TObject);
begin
  inherited;
  if FrmOrder.ActiveControl <> TWincontrol(LBCCir) then
  begin
    LBCCirDblClick(self);
  end;
end;

procedure TFrmOrder.N9Click(Sender: TObject);
var
  OPDADV: string;
  AdvParamStr: string;
begin
  inherited;
  OPDADV := SetSys.ReadString('DPD', 'OPDADV', '');
  AdvParamStr := SetSys.ReadString('ADV', 'REPRINT', '');
  comAdvStrRep(AdvParamStr, '');
  if OPDADV <> '' then
    ShellExecute(Handle, 'Open', PChar(OPDADV), PChar(AdvParamStr), nil, SW_SHOWNORMAL);
end;

procedure TFrmOrder.ToolButton83Click(Sender: TObject);
var
  i: integer;
  Med_code, aCir, aQty, aPath, aTTL, aGri, aDay: string;
begin
  inherited;
  if not assigned(FrmDitto) then
    FrmDitto := TFrmDitto.Create(self);

  if not assigned(SLMed) then
    SLMed := TStringList.Create;
  if not assigned(SLFee) then
    SLFee := TStringList.Create;
  if not assigned(SLLab) then
    SLLab := TStringList.Create;
  if not assigned(SLMtrl) then
    SLMtrl := TStringList.Create;
  if not assigned(SLXRay) then
    SLXRay := TStringList.Create;
  if not assigned(SLChk) then
    SLChk := TStringList.Create;
  SLMed.Clear;
  SLFee.Clear;
  SLLab.Clear;
  SLMtrl.Clear;
  SLXRay.Clear;
  SLChk.Clear;
  FrmDitto.EdtChrNo.Enabled := true;
  FrmDitto.Button1.Enabled := true;
  FrmDitto.EdtChrNo.Text := getChrNo;
  FrmDitto.EdtPatName.Text := getPatName;
  FrmDitto.ShowModal;

  for i := 0 to SLMed.Count - 1 do
  begin
    Med_code := ReturnID(SLMed[i]);
    aCir := ReturnID(ReturnName(SLMed[i]));
    aQty := ReturnID(ReturnName(ReturnName(SLMed[i])));
    aPath := ReturnID(ReturnName(ReturnName(ReturnName(SLMed[i]))));
    aTTL := ReturnID(ReturnName(ReturnName(ReturnName(ReturnName(SLMed[i])))));
    aGri := ReturnID(ReturnName(ReturnName(ReturnName(ReturnName(ReturnName(SLMed[i]))))));
    aDay := ReturnID(ReturnName(ReturnName(ReturnName(ReturnName(ReturnName(ReturnName(SLMed[i])))))));
    if InsertMed(Med_code, aCir, aQty, aPath, aTTL, aGri, aDay, '', -1) then
    begin
      SGMed.RowCount := SGMed.RowCount + 1;
      SGMed.Row := SGMed.Row + 1;
    end;
  end;

  for i := 0 to SLFee.Count - 1 do
    InsertFee(SLFee[i], '');

  OutList := TStringList(SLLab);
  InsertLab;

  for i := 0 to SLMtrl.Count - 1 do
    InsertMtrl(SLMtrl[i], '');

  OutList := TStringList(SLXRay);
  InsertXRay;

  OutList := TStringList(SLChk);
  InsertChk;
end;

procedure TFrmOrder.ToolButton25Click(Sender: TObject);
var
  Handle : THandle;
  weblink, Captions: string;
  myStr,myParamter : String;
  lsWebReg : String;
  OPDADV:String;
  AdvParamStr,Med_Days,med_days_self:String;
  i:integer;
begin
  inherited;
  myStr :=Setsys.ReadString('WEB',TToolButton(sender).Caption,'');
  myParamter := Setsys.ReadString('PARAMTER',TToolButton(sender).Caption,'');
  comStrRep(mystr);
  comstrRep(myParamter);
  comAdvStrRep(myStr,'');
  comAdvStrRep(myParamter,'');
  SetParamter(mystr,'$+MAXMEDDAYS+$',IntToStr(MaxMedDays(SGMed)));
  SetParamter(myParamter,'$+MAXMEDDAYS+$',IntToStr(MaxMedDays(SGMed)));
  if myStr ='' then
  begin
    showMessage(NullStrTo(gsSysMsg,'此功能不開放使用，如有疑問請洽資訊室詢問。'));
    Exit;
  end;
  try
    if winexec(PChar(PChar(myStr) +' '+ PChar(myParamter) ),SW_SHOWNORMAL) < 31 then
      ShellExecute(Handle, 'open',PChar(myStr),PChar(myParamter),nil,SW_SHOWNORMAL);
  except
  end;
end;

procedure TFrmOrder.ToolButton35Click(Sender: TObject);
var
  OPDADV: string;
  AdvParamStr: string;
begin
  inherited;

  OPDADV := SetSys.ReadString('DPD', 'PREIPD','');
  AdvParamStr := SetSys.ReadString('ADV', 'PREIPD', '');
  comAdvStrRep(AdvParamStr, '');
  AdvParamStr := StringReplace(AdvParamStr, '$ICDCODE1$', CharAdd(SGIcd10.Cells[0, 0], ' ', 7), [rfReplaceAll]);
  AdvParamStr := StringReplace(AdvParamStr, '$ICDCODE2$', CharAdd(SGIcd10.Cells[0, 1], ' ', 7), [rfReplaceAll]);
  AdvParamStr := StringReplace(AdvParamStr, '$ICDCODE3$', CharAdd(SGIcd10.Cells[0, 2], ' ', 7), [rfReplaceAll]);
  AdvParamStr := StringReplace(AdvParamStr, '$CASETYPE$', ReturnName(getCASEDESC), [rfReplaceAll]);
  AdvParamStr := StringReplace(AdvParamStr, '$PARTCODE$', ReturnName(getPARTDESC), [rfReplaceAll]);
  if OPDADV <> '' then
    winexec(PChar(OPDADV + ' ' + AdvParamStr), 0);
end;

procedure TFrmOrder.N10Click(Sender: TObject);
var
  weblink: string;
begin
  inherited;
 { WebLink:=SetSys.ReadString('WEB','藥典','');
  WebLink:=StringReplace(WebLink,'&+MEDCODE+&',SGMed.Cells[M_Code,SGMed.Row],[rfReplaceAll]);
  ShellExecute(Handle, 'open', 'iexplore.exe', PChar(WebLink), '', SW_SHOWNORMAL);  }
end;

procedure TFrmOrder.BtnDelClick(Sender: TObject);
var
  i, cnt: integer;
begin
  inherited;
  cnt := 0;
  for i := 0 to SGMed.RowCount - 1 do
    if SGMed.Cells[M_Code, i] <> '' then
      if SGMed.Cells[modifyType, i] = 'O' then
      begin
        SGMed.Cells[Del, i] := 'X';
        cnt := cnt + 1;
      end
      else
        SGMed.Rows[i].Clear;

  SGMed.RowCount := cnt + 1;
end;

procedure TFrmOrder.BtnDoseClick(Sender: TObject);
var
  i: integer;
  qty: string;
begin
  inherited;
  if SGMed.Row >= 0 then
    if SGMed.Cells[M_Qty, SGMed.Row] <> '' then
    begin
      qty := SGMed.Cells[M_Qty, SGMed.Row];
      for i := 0 to SGMed.RowCount - 1 do
        if (SGMed.Cells[M_Code, i] <> '') and (SGMed.Cells[modifyType, i] = 'N') then
        begin
          SGMed.Cells[M_Qty, i] := qty;
          SGMed.Cells[M_Ttl, i] := CalMedTtl(SGMed.Cells[M_Cir, i], SGMed.Cells[M_countflag, i], StrToInt(SGMed.Cells[M_PackAmt, i]), StrToInt(SGMed.Cells[M_Day, i]), StrToFloat(SGMed.Cells[M_Qty, i]));
        end;
    end;
end;

procedure TFrmOrder.BtnCirClick(Sender: TObject);
var
  i: integer;
  Cir: string;
begin
  inherited;
  if SGMed.Row >= 0 then
    if SGMed.Cells[M_Cir, SGMed.Row] <> '' then
    begin
      Cir := SGMed.Cells[M_Cir, SGMed.Row];
      for i := 0 to SGMed.RowCount - 1 do
        if (SGMed.Cells[M_Code, i] <> '') and (SGMed.Cells[modifyType, i] = 'N') then
        begin
          SGMed.Cells[M_Cir, i] := Cir;
          SGMed.Cells[M_Ttl, i] := CalMedTtl(SGMed.Cells[M_Cir, i], SGMed.Cells[M_countflag, i], StrToInt(SGMed.Cells[M_PackAmt, i]), StrToInt(SGMed.Cells[M_Day, i]), StrToFloat(SGMed.Cells[M_Qty, i]));
        end;
    end;
end;

procedure TFrmOrder.BtnDayClick(Sender: TObject);
var
  i: integer;
  Day: string;
begin
  inherited;
  if SGMed.Row >= 0 then
    if SGMed.Cells[M_Day, SGMed.Row] <> '' then
    begin
      Day := SGMed.Cells[M_Day, SGMed.Row];
      for i := 0 to SGMed.RowCount - 1 do
        if (SGMed.Cells[M_Code, i] <> '') and (SGMed.Cells[modifyType, i] = 'N') then
        begin
          SGMed.Cells[M_Day, i] := Day;
          SGMed.Cells[M_Ttl, i] := CalMedTtl(SGMed.Cells[M_Cir, i], SGMed.Cells[M_countflag, i], StrToInt(SGMed.Cells[M_PackAmt, i]), StrToInt(SGMed.Cells[M_Day, i]), StrToFloat(SGMed.Cells[M_Qty, i]));
        end;
    end;
end;

procedure TFrmOrder.SGMedMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  gid: TGridCoord;
begin
  inherited;
  if Button in [mbRight] then
  begin
    gid := TStringGrid(Sender).MouseCoord(x, y);
    TStringGrid(Sender).Row := Gid.Y;
  end;
end;

procedure TFrmOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if FrmOrder <> nil then
  begin
    Pgc_P.ActivePageIndex := 4;
    Pgc_PChange(Pgc_P);

  end;
  ClearItem(FrmOrder);

  DsMed.DataSet := nil;
  DsLab.DataSet := nil;
  DsRay.DataSet := nil;
  DSCHK.DataSet := nil;
  DSIcd.DataSet := nil;
  DsFee.DataSet := nil;
  DsMtrl.DataSet := nil;
  if trim(GetFeeNo)= '' then
    PatUnUsing(trim(MySBar.Panels[0].Text))
  else
    PatUnUsing(GetFeeNo);
  Action := cafree;

end;

procedure TFrmOrder.Pay_TypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: integer;
begin
  inherited;
  if key = vk_return then
  begin
    for i := 0 to PCPLstBox.Items.Count - 1 do
    begin
      if ReturnName(PCPLstBox.Items.Strings[i]) = trim(TEdit(Sender).Text) then
      begin
        case (TListBox(Sender).Tag) of
          0:
            begin
              setPARTDESC(PCPLstBox.Items.Strings[i]);
              TEdit(Sender).Text := PCPLstBox.Items.Strings[i];
            end;
          1:
            begin
              setCASEDESC(PCPLstBox.Items.Strings[i]);
              TEdit(Sender).Text := PCPLstBox.Items.Strings[i];
              if ReturnName(Case_Type1.Text) <> 'A3' then
                Case_Code.Text := '';
            end;
          2:
            begin
              setPAYDESC(PCPLstBox.Items.Strings[i]);
              TEdit(Sender).Text := PCPLstBox.Items.Strings[i];
              CHKCASEPART('D', ReturnName(TEdit(Sender).Text));
            end;
        end;
        PCPLstBox.Visible := false;
      end;
    end;
    Key := VK_CLEAR;
  end;
end;

procedure TFrmOrder.SGChkEnter(Sender: TObject);
begin
  inherited;
  Pgc_PChange(Sender);
end;

procedure TFrmOrder.SGMtrlEnter(Sender: TObject);
begin
  inherited;
  Pgc_PChange(Sender);
end;

procedure TFrmOrder.SGXRayEnter(Sender: TObject);
begin
  inherited;
  Pgc_PChange(Sender);
end;

procedure TFrmOrder.SGLabEnter(Sender: TObject);
begin
  inherited;
  Pgc_PChange(Sender);
end;

procedure TFrmOrder.btn_OKClick(Sender: TObject);
begin
  inherited;
  g_HisFeeThread := HisFeeThread.Create(false);
end;

procedure TFrmOrder.BtnCnlIdlClick(Sender: TObject);
var
  Qrys: TADOQuery;
  tmpSql: string;
  SQLs: TStrings;
begin
  inherited;
  SQLs := TStringList.Create;

  SQLs.Clear;
  tmpSql := getUpdSql(16);
  SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
  SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
  SetParamter(tmpSql, '$UPD_TIME$', ROCTime(now, ''));
  SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
  SQLs.Text := tmpSql;
  DM.ExecSQL(SQLs);
  SQLs.Clear;
  tmpSql := getUpdSql(17);
  SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
  SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
  SetParamter(tmpSql, '$UPD_TIME$', ROCTime(now, ''));
  SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
  SQLs.Text := tmpSql;
  DM.ExecSQL(SQLs);
  SQLs.Clear;
  tmpSql := getUpdSql(15);
  SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
  SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
  SetParamter(tmpSql, '$UPD_TIME$', ROCTime(now, ''));
  SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
  SQLs.Text := tmpSql;
  DM.ExecSQL(SQLs);
  SQLs.Clear;
  tmpSql := getUpdSql(19);
  SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
  SQLs.Text := tmpSql;
  DM.ExecSQL(SQLs);

  SQLs.Clear;
  tmpSql := getUpdSql(20);
  SetParamter(tmpSql, '$PART_CODE$', PARTTYPE);
  SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
  SQLs.Text := tmpSql;
  DM.ExecSQL(SQLs);

  SQLs.Clear;
  tmpSql := getChkSqlStr(58);
  SetParamter(tmpSql, '$CODE_NO$', PARTTYPE);
  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs, Qrys) then
  begin
    Part_Code1.Text := Qrys.FieldByName('code_desc').AsString;
    setPARTDESC(Part_Code1.Text);
  end;

  SQLs.Clear;
  tmpSql := getChkSqlStr(59);
  SetParamter(tmpSql, '$CODE_NO$', CASETYPE);
  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs, Qrys) then
  begin
    Case_Type1.Text := Qrys.FieldByName('code_desc').AsString;
    setCASEDESC(Case_Type1.Text);
  end;

  SQLs.Clear;
  tmpSql := getChkSqlStr(60);
  SetParamter(tmpSql, '$CODE_NO$', PAYTYPE);
  SQLs.Text := tmpSql;
  if DM.OpenSQL(SQLs, Qrys) then
  begin
    Pay_Type.Text := Qrys.FieldByName('code_desc').AsString;
    setPAYDESC(Pay_Type.Text);
  end;

  setFirstInsSeqNo('');
  setFirstDate('');
  card_no1.Text := '';
  year.Text := '';
  cnt.Text := '';
  ShowPnlMsg('取消同療成功！');

  SQLs.Free;
end;

procedure TFrmOrder.BtnICGetClick(Sender: TObject);
var
  IC_V, ComRet: Integer;
begin
  inherited;
  try
    if ((getPPatId = '1') and ((Trim(card_no1.Text) = '') or (trim(card_no1.Text) = 'IC')) and (not IsICSeqNo(getFeeNo))) then
    begin
      //20140829學承MARK
      //csCloseCom();
      //ComRet := csOpenCom(0);
      //if ComRet = 0 then
      //begin
      //  IC_V := IC_CHECK();
      //  if IC_V = 9999 then
      //  begin
      //    ShowPnlMsg('此IC卡與病患資料不符無法讀取卡序' + #13 + '請重新確認卡片');
      //    BtnFinish.Enabled := true;
      //    if getOpdStatus = '1' then
      //      BtnSave.Enabled := true;
      //    Exit;
      //  end;
      //end;
      ic_error_count := 0;
      isGetExecute := false;
      timer3.Enabled := true;
      //20140829學承MARK
      //g_ICSEQThread := ICSEQThread.Create(false);
      fin_get_seq();
    end;
  except
  end;

end;

procedure TFrmOrder.BtnAC95Click(Sender: TObject);
  function checkICstatus: boolean;
  var
    no_card_kind : string;
    ComRet, IC_V, DC_V : Integer;
  begin
    try
      if (getPPatId = '1') then
      begin
        csCloseCom();
        ComRet := csOpenCom(0);
        if ComRet = -1 then
        begin
          csCloseCom();
          MessageDlg('開啟健保IC卡失敗!!!!請聯絡資訊室', mtWarning, [mbOk], 0);
          Result := False;
          Exit;
        end;
        try
          DC_V := IDC_CONNECT();
          if (DC_V > 2) then
          begin
            csCloseCom();
            MessageDlg('驗證卡機失敗，請重新插拔卡機電源', mtWarning, [mbOk], 0);
            Result := False;
          end
          else
          begin
            IC_MachineStatus := True;
            IC_V := IC_CHECK();

            if (IC_V > 2) then
            begin
        
              if (IC_V = 4013) then
              begin
                no_card_kind := '4';
                if InputQuery('未置IC卡-身分別', '(1.未帶卡,2.自費,3.其他,4重新插卡)', no_card_kind) = true then
                begin
                  if (no_card_kind <> '1') and (no_card_kind <> '2') and (no_card_kind <> '3') and (no_card_kind <> '4') then
                  begin
                    ShowMessage('請輸入正確的值！');
                    Result := False;
                  end
                  else
                  begin
                    if (no_card_kind = '1') or (no_card_kind = '2') or (no_card_kind = '3') then
                    begin
                      Result := False;
                    end;
                    if (no_card_kind = '4') then
                    begin
                      Result := False;
                      ShowMessage('請重新插卡後,點選"預/產"！');
                    end;
                  end;
                end
                else
                begin
                  Result := False;
                end;
              end
              else
              begin
                if IC_V = 9999 then
                begin
                  MessageDlg('此IC卡與病患資料不符無法讀取卡序' + #13 + '請重新確認卡片', mtWarning, [mbOk], 0);
                  Result := False;
                end;
              end;
            end
            else
            begin
              Result := True;
            end;
          end;
        except
          Result := False;
          csCloseCom();
        end;
      end;
    except
      Result := False;
      csCloseCom();
    end;

    csCloseCom();
  end;

var
  tmpSql : string;
  SQLs: TStrings;
  Qrys: TADOQuery;
  i,itemno: integer;
  getlowincome, getdisabled, getaborigine, f8A_Pcase : string;
begin
  inherited;
  if (getPPatId = '1') then
  begin
    //if checkICstatus then
    //begin
      Case_Code.Text  := '';
      getlowincome    := '';
      getdisabled     := '';
      getaborigine    := '';
      getchrarea      := '';
      ServiceItem     := '';
      ServiceItemcode := '';
      f8A_Pcase       := '';
      SQLs := TStringList.Create;
      for i := 0 to SGFee.RowCount - 1 do
      begin
        if (SGFee.Cells[F_Code, i] <> '') then
        begin

          if POS(trim(SGFee.Cells[F_Code, i]), A381) > 0 then
          begin
            if StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcMonth)) <= 600 then   //未滿6歲(就醫年月-出生年月<=72個月)
            begin
              Case_Code.Text := '81';
              break;
            end
            else
            begin
              ShowPnlMsg('此病患年齡不符預防保健 81(未滿六歲) 適用年齡!!');
              Exit;
            end;
          end;

          if POS(trim(SGFee.Cells[F_Code, i]), A395) > 0 then
          begin
            Case_Code.Text := '95';
            break;
          end;
          if POS(trim(SGFee.Cells[F_Code, i]), A383) > 0 then
          begin
            Case_Code.Text := '83';
            break;
          end;
          if POS(trim(SGFee.Cells[F_Code, i]), A382) > 0 then
          begin
            Case_Code.Text := '82';
            break;
          end;

          if POS(trim(SGFee.Cells[F_Code, i]), A387) > 0 then
          begin
            if StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcMonth)) <= 1200 then   //未滿12歲之低收入戶、身心障礙、原住民、偏遠地區(就醫年月-出生年月<=72個月)
            begin
              case ShowMessage( '預防保健 87(未滿12歲之低收入戶、身心障礙、原住民族地區、偏遠及離島地區兒童)，請點選病患符合條件(若皆不符合條件者,請選擇自費) ', [' 低收入戶 ',' 身心障礙 ',' 原住民地區 ',' 偏遠及島地區 ', '取消'], msComf) of
                4: begin
                    Exit;
                   end;
                2,3: begin
                     PnlDiag.Visible := True;
                     With DM.QryTemp do
                     begin
                       Close;
                       SQL.Clear;
                       SQL.Add('SELECT CHR_AREA||''_''||CHR_NO||''_''||FEE_NO AS AREA FROM chr_identities WHERE FEE_NO LIKE ''X%'' ORDER BY CHR_AREA ');
                       Open;
                       DSDiag.DataSet := DM.QryTemp;
                     end;
                     showpnlDiagMsg('請選擇縣市鄉鎮地區');


                     getlowincome := 'N';
                     getdisabled  := 'N';
                     getaborigine := 'N';
                     Case_Code.Text := '87';
                     break;
                   end;
                1: begin
                     getlowincome := 'N';
                     getdisabled  := 'Y';
                     getaborigine := 'N';
                     Case_Code.Text := '87';
                     break;
                   end;
                0: begin
                     getlowincome := 'Y';
                     getdisabled  := 'N';
                     getaborigine := 'N';
                     Case_Code.Text := '87';
                     break;
                   end;
              end;

            end
            else
            begin
              ShowPnlMsg('此病患年齡不符預防保健 87(未滿12歲之低收入戶、身心障礙、原住民族地區、偏遠及離島地區兒童) 適用年齡!!');
              Exit;
            end;
          end;

          if POS(trim(SGFee.Cells[F_Code, i]), A397) > 0 then
          begin
            if (StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcYear)) >= 18) and (StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcYear)) <= 29) then   //18-29歲
            begin
              case ShowMessage( '預防保健 97(18歲以上,未滿30歲之原住民)，是否為原住民身份 ', [' 是 ', ' 否 '], msComf) of
                1: begin
                     ShowPnlMsg('不符預防保健適用條件,請選擇自費');
                     Exit;
                   end;
                0: begin
                     getlowincome := 'N';
                     getdisabled  := 'N';
                     getaborigine := 'Y';
                     Case_Code.Text := '97';

                     break;
                   end;
              end;

            end
            else
            begin
              ShowPnlMsg('此病患年齡不符預防保健 97(18歲以上,未滿30歲之原住民) 適用年齡!!');
              Exit;
            end;
          end;

          if (POS(trim(SGFee.Cells[F_Code, i]), A38A) > 0) or (POS(trim(SGFee.Cells[F_Code, i]), A38E) > 0) or
             (POS(trim(SGFee.Cells[F_Code, i]), A38I) > 0) or (POS(trim(SGFee.Cells[F_Code, i]), A38M) > 0) then
          begin
            //取case_code
            tmpSql := getChkSqlStr(82);
            SetParamter(tmpSql, '$FEE_CODE$', trim(SGFee.Cells[F_Code, i]));
            SQLs.Clear;
            SQLs.Text := tmpSql;
            if DM.OpenSQL(SQLs, Qrys) then
            begin
              f8A_Pcase := Qrys.FieldByName('ins_feecode').AsString; 
            end;

            //if (StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcYear)) >= 6) and (StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcYear)) <= 9) and
            //   ((POS(trim(SGFee.Cells[F_Code, i]), A38A) > 0) or (POS(trim(SGFee.Cells[F_Code, i]), A38E) > 0)) then
            if (StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcYear)) >= 6) and (StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcYear)) <= 12) and
               ((POS(trim(SGFee.Cells[F_Code, i]), A38A) > 0) or (POS(trim(SGFee.Cells[F_Code, i]), A38E) > 0)) then
            begin
              {2015/09/16健保檢核條件更改
              if StrToInt(GetAge(getBirthDate, RocDate(now, ''), acDay)) > 70000 then
              begin

              if  StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcYear)) > 70000 then
              begin
                if POS(trim(SGFee.Cells[F_Code, i]), A38A) > 0 then //中低收入
                   if MessageDlg('此病患的年齡需有『福保或依社會救助認定為中低收入戶』證明，才符合『國小學童臼齒窩溝封填補助服務方案』!!'+#10#13+'確認有 [Yes]'+#10#13+'不符合條件者,請選擇自費 [No]', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                   begin
                     getlowincome := 'Y';
                     getdisabled  := 'N';
                     getaborigine := 'N';
                     Case_Code.Text := f8A_Pcase;
                   end
                   else
                     Exit;
                if POS(trim(SGFee.Cells[F_Code, i]), A38E) > 0 then //山地原住民、離島、身心障礙
                   case ShowMessage( '此病患的年齡需有(身心障礙、原住民族地區、偏遠及離島地區兒童)才符合『國小學童臼齒窩溝封填補助服務方案』，'+#10#13+'請點選病患符合條件(若皆不符合條件者,請選擇 取消 改成自費) ', [' 身心障礙 ',' 原住民地區 ',' 偏遠及島地區 ', '取消'], msComf) of
                     3: begin
                          Exit;
                        end;
                   1,2: begin
                          PnlDiag.Visible := True;
                          With DM.QryTemp do
                          begin
                            Close;
                            SQL.Clear;
                            SQL.Add('SELECT CHR_AREA||''_''||CHR_NO||''_''||FEE_NO AS AREA FROM chr_identities WHERE FEE_NO LIKE ''X%'' ORDER BY CHR_AREA ');
                            Open;
                            DSDiag.DataSet := DM.QryTemp;
                          end;
                          showpnlDiagMsg('請選擇縣市鄉鎮地區');


                          getlowincome := 'N';
                          getdisabled  := 'N';
                          getaborigine := 'N';
                          Case_Code.Text := f8A_Pcase;
                          break;
                        end;
                     0: begin
                          getlowincome := 'N';
                          getdisabled  := 'Y';
                          getaborigine := 'N';
                          Case_Code.Text := f8A_Pcase;
                          break;
                        end;
                   end;
              end
              else
                Case_Code.Text := f8A_Pcase;
              end;}
              Case_Code.Text := f8A_Pcase;
            end
            else
            begin
              //if (StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcYear)) >= 6) and (StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcYear)) <= 9) and
              //   ((POS(trim(SGFee.Cells[F_Code, i]), A38I) > 0) or (POS(trim(SGFee.Cells[F_Code, i]), A38M) > 0)) then //第一、二次評估
              //2022-09-14 原溝隙封填年紀，由6歲至9歲放寬至12歲
              if (StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcYear)) >= 6) and (StrToInt(GetAge(getBirthDate, RocDate(now, ''), AcYear)) <= 12) and
                 ((POS(trim(SGFee.Cells[F_Code, i]), A38I) > 0) or (POS(trim(SGFee.Cells[F_Code, i]), A38M) > 0)) then //第一、二次評估
              begin
                DM.QryTemp.Close;
                DM.QryTemp.SQL.Clear;
                DM.QryTemp.SQL.Add('SELECT FEE_CODE FROM opd_fee WHERE fee_no in(select FEE_NO from opd_basic where chr_no='+Qt(getChrNo)+' and fee_no<>'+Qt(getFeeNo)+')'+
                        ' and fee_code in(select fee_code from fee_basic where ins_fee_code in(''8A'',''8B'',''8C'',''8D'',''8E'',''8F'',''8G'',''8H'',''8I'',''8J'',''8K'',''8L'',''8M'',''8N'',''8O'',''8P''))');
                DM.QryTemp.Open;
                SQLs.Clear;
                itemno := -1;
                IF DM.QryTemp.IsEmpty THEN
                BEGIN
                  if MessageDlg('此病患沒有做過『國小學童臼齒窩溝封填補助服務方案』不可用評估檢查請確認是否做過!!'+#10#13+'確認有 [Yes]'+#10#13+'不符合條件者,請選擇正確處置 [No]', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                    Case_Code.Text := f8A_Pcase
                  else
                    exit;
                END
                ELSE
                BEGIN
                  WHILE NOT DM.QryTemp.Eof DO
                  BEGIN
                    if trim(DM.QryTemp.FieldByName('fee_code').AsString)<> '' then
                      SQLs.Add(trim(DM.QryTemp.FieldByName('fee_code').AsString));
                    DM.QryTemp.Next;
                  END;
                  if POS(trim(SGFee.Cells[F_Code, i]), A38I) > 0 then
                    if (stringinlist(A38A,SQLs)) and (stringinlist(A38E,SQLs)) then
                      Case_Code.Text := f8A_Pcase
                    else
                      if MessageDlg('此病患沒有做過『國小學童臼齒窩溝封填補助服務方案』不可用第一次評估檢查請確認是否做過!!'+#10#13+'確認有 [Yes]'+#10#13+'不符合條件者,請選擇正確處置 [No]', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                        Case_Code.Text := f8A_Pcase
                      else
                        exit;

                  if POS(trim(SGFee.Cells[F_Code, i]), A38M) > 0 then
                    if (stringinlist(A38E,SQLs)) and (stringinlist(A38E,SQLs)) then
                      Case_Code.Text := f8A_Pcase
                    else
                      if MessageDlg('此病患沒有做過『國小學童臼齒窩溝封填補助服務方案』不可用第二次評估檢查請確認是否做過!!'+#10#13+'確認有 [Yes]'+#10#13+'不符合條件者,請選擇正確處置 [No]', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                        Case_Code.Text := f8A_Pcase
                      else
                        exit;
                END;
              end
              else
              begin
                ShowMessage('此病患年齡不符預防保健 『國小學童臼齒窩溝封填補助服務方案』的適用年齡!!');
                ServiceItem := '';
                exit;
              end;
            end;
          end;
        end;//if (SGFee.Cells[F_Code, i] <> '') then
      end; //for i := 0 to SGFee.RowCount - 1 do
      //20140829學承MARK
      //SQLs := TStringList.Create;               I

      //
      if trim(Case_Code.Text) = '81' then
      begin
        tmpSql := '';
        tmpSql := getChkSqlStr(83);
        SetParamter(tmpSql, '$CHR_NO$', getChrNo);
        SetParamter(tmpSql, '$INS_SEQ_NO$', '@' + trim(Case_Code.Text));
        SetParamter(tmpSql, '$OPD_DATE$', trim(OPD_Date1.Text));
        SQLs.Clear;
        SQLs.Text := tmpSql;
        if DM.OpenSQL(SQLs, Qrys) then
          if getOpdDate = '' then //20160121健保更改
          begin
            //ShowMessage('看診日期有問題');
          end
          else
            if Qrys.FieldByName('day').AsInteger >= StrToInt(copy(getOpdDate,1,5)) then
            begin
              ShowPnlMsg('此病患已在本院期限內做過塗氟預防保健');
              ServiceItem := '';
              Exit;
            end;
      end;

      if trim(Case_Code.Text) = '87' then
      begin
        tmpSql := getChkSqlStr(80);
        SetParamter(tmpSql, '$CHR_NO$', getChrNo);
        SetParamter(tmpSql, '$INS_SEQ_NO$', '@' + trim(Case_Code.Text));
        SetParamter(tmpSql, '$OPD_DATE$', trim(OPD_Date1.Text));
        SQLs.Clear;
        SQLs.Text := tmpSql;
        if DM.OpenSQL(SQLs, Qrys) then
          if Qrys.FieldByName('day').AsInteger < 90 then
          begin
            ShowPnlMsg('此病患已在本院期限內做過塗氟預防保健');
            ServiceItem := '';
            Exit;
          end;
      end;

      if trim(Case_Code.Text) = '97' then
      begin
        tmpSql := getChkSqlStr(85);
        SetParamter(tmpSql, '$CHR_NO$', getChrNo);
        SetParamter(tmpSql, '$INS_SEQ_NO$', '@' + trim(Case_Code.Text));
        SetParamter(tmpSql, '$OPD_DATE$', trim(OPD_Date1.Text));
        SQLs.Clear;
        SQLs.Text := tmpSql;
        if DM.OpenSQL(SQLs, Qrys) then
          //if Qrys.FieldByName('opd_date').AsInteger < 730 then 20160429附醫
          if copy(Qrys.FieldByName('opd_date').AsString,1,3) <= copy(getOpdDate,1,3) then
          begin
            ShowPnlMsg('此病患已在本院期限內('+Qrys.FieldByName('opd_date').AsString+')做過"口腔黏膜檢查"預防保健');
            ServiceItem := '';
            Exit;
          end;
      end;

      if getlowincome <> '' then
      begin
        tmpSql := getChkSqlStr(81);
        SetParamter(tmpSql, '$FEE_NO$', trim(getFeeNo));
        SQLs.Clear;
        SQLs.Text := tmpSql;
        if DM.OpenSQL(SQLs, Qrys) then
        begin
          tmpSql := getDeleteSql(4);
          SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
          SQLs.Clear;
          SQLs.Text := tmpSql;
          DM.ExecSQL(SQLs);
        end;
        tmpSql := getInsertSql(27);
        SetParamter(tmpSql, '$CHR_NO$', getChrNo);
        SetParamter(tmpSql, '$FEE_NO$', getFeeNo);
        SetParamter(tmpSql, '$LOW_INCOME$', getlowincome);
        SetParamter(tmpSql, '$disabled$', getdisabled);
        SetParamter(tmpSql, '$aborigine$', getaborigine);
        SetParamter(tmpSql, '$UPD_OPER$', getDocCode1);
        SetParamter(tmpSql, '$UPD_DATE$', ROCDate(now, ''));
        SetParamter(tmpSql, '$UPD_TIME$', ROCTime(now, ''));
        SetParamter(tmpSql, '$CHR_AREA$',getchrarea );
        SQLs.Clear;
        SQLs.Text := tmpSql;
        DM.ExecSQL(SQLs);
      end;



      if Case_Code.Text = '' then
      begin
        ShowPnlMsg('請在處置開單區輸入' + #13 +
                   '口篩 : ' + A395 + '、' + A397 + #13 +
                   '塗氟 : ' + A381 + '、' + A387 + #13 +
                   '封劑 : ' + A383 + #13 +
                   '臼齒窩溝封填 : ' + A38A+A38E+A38I+A38M + #13 +
                   '代碼才能進行"預/產"');
        ServiceItem := '';
        Exit;
      end;

      tmpSql := getChkSqlStr(59);
      SetParamter(tmpSql, '$CODE_NO$', trim(BtnAC95.Hint));
      SQLs.Clear;
      SQLs.Text := tmpSql;
      if DM.OpenSQL(SQLs, Qrys) then
      begin
        Case_Type1.Text := Qrys.FieldByName('code_desc').AsString;
        setCASEDESC(Case_Type1.Text);
      end;

      SQLs.Clear;
      tmpSql := getChkSqlStr(58);
      SetParamter(tmpSql, '$CODE_NO$', '009');
      SQLs.Text := tmpSql;
      if DM.OpenSQL(SQLs, Qrys) then
      begin
        Part_Code1.Text := Qrys.FieldByName('code_desc').AsString;
        setPARTDESC(Part_Code1.Text);
      end;

      SQLs.Free;
      GetICType := 3;
      BtnICGetClick(Sender);
    end;
  //end;
end;

procedure TFrmOrder.ToolButton49Click(Sender: TObject);
var
  xray_k, xray_n: string;
begin
  inherited;
  xray_k := SetSys.ReadString('DPD', 'XRAY_KIND', '');
  xray_n := SetSys.ReadString('DPD', 'XRAY_NO', '');

  if (xray_k <> '') and (xray_n <> '') then
  begin
    OutList.Clear;
    if not assigned(FrmDPDXray) then
      FrmDPDXray := TFrmDPDXray.Create(Self);
    FrmDPDXray.xray_kind := xray_k;
    FrmDPDXray.xray_no[0] := ReturnID(xray_n);
    FrmDPDXray.xray_no[1] := ReturnID(ReturnName(xray_n));
    FrmDPDXray.xray_no[2] := ReturnName(ReturnName(xray_n));
    FrmDPDXray.ShowModal;
    InsertXRay;
    if OutList.Count > 0 then
    begin
      Pgc_P.ActivePageIndex := 1;
      Pgc_P.OnChange(Sender);
    end;
  end
  else
    ShowPnlMsg('尚未有牙科放射相關設定檔');
end;

procedure TFrmOrder.card_no1Change(Sender: TObject);
var
  Itmp: integer;
begin
  inherited;
  try
    if length(trim(card_no1.Text)) = 4 then
    begin
      year.Text := GetYear(getOpdDate);
      cnt.Text := '1';
    end
    else if (trim(card_no1.Text) = '') or (trim(card_no1.Text) = 'IC') then
    begin
      year.Text := '';
      cnt.Text := '';
    end;
  except
  end;
end;

procedure TFrmOrder.SpHCanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
  inherited;
  Accept := (newSize + PanelP.Constraints.MinHeight + PanelH.Height + PanelS.Height + 6) < PanelSOHP.Height;
end;

procedure TFrmOrder.SpSCanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
  inherited;
  Accept := (newSize + PanelP.Constraints.MinHeight + PanelH.Height + PanelO.Height + 6) < PanelSOHP.Height;
end;

procedure TFrmOrder.Splitter2CanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
  inherited;
  Accept := (newSize + PanelP.Constraints.MinHeight + PanelH.Height + PanelS.Height + 6) < PanelSOHP.Height;
end;

procedure TFrmOrder.Button4Click(Sender: TObject);
begin
  inherited;
  PnlShow.Visible := false;
  ms := 1;
end;

procedure TFrmOrder.MemoHChange(Sender: TObject);
begin
  inherited;
  count_s_h_o;
end;

procedure TFrmOrder.MemoSChange(Sender: TObject);
begin
  inherited;
  count_s_h_o;
end;

procedure TFrmOrder.MemoOChange(Sender: TObject);
begin
  inherited;
  count_s_h_o;
end;

procedure TFrmOrder.MemoPChange(Sender: TObject);
begin
  inherited;
  count_s_h_o;
end;

procedure TFrmOrder.Timer3Timer(Sender: TObject);
begin
  inherited;
  if isGetExecute then
  begin
    Timer3.Enabled := false;
    MessageDlg('IC卡程序完成', mtWarning, [mbOk], 0);
  end;
end;

procedure TFrmOrder.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmOrder := nil;
end;

procedure TFrmOrder.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  //showMessage('Close;');
end;

procedure TFrmOrder.BtnLog(BtnText: string);
var
  LogText, SYSTYPE: string;
begin
  LogText := SetSys.ReadString('SYSTEMLOG', BtnText, '');
  SYSTYPE := SetSys.ReadString('SYSTEMLOG', 'SYSTEMTYPE', '');
  if (LogText <> '') and (SYSTYPE <> '') then
  begin
    with DM.Med_Check do
    begin
      Close;
      Parameters.Clear;
      ProcedureName := 'P_LAB_DATA_LOG';
      Parameters.CreateParameter('as_doc_code', ftString, pdInput, 4000, Null); // 傳入值
      Parameters.CreateParameter('as_chr_no', ftString, pdInput, 4000, Null);
      Parameters.CreateParameter('as_source_flag', ftString, pdInput, 4000, Null);
      Parameters.CreateParameter('as_data_type', ftString, pdInput, 4000, Null);
      Parameters.parambyname('as_doc_code').Value := getDocCode1;
      Parameters.parambyname('as_chr_no').Value := GetchrNo;
      Parameters.parambyname('as_source_flag').Value := SYSTYPE;
      Parameters.parambyname('as_data_type').Value := LogText;
      try
        ExecProc;
      except
        ShowMessage('醫令處理"查詢紀錄寫入"程序時發生錯誤');
        Exit;
      end;
    end;
  end;
end;

procedure TFrmOrder.SGLabMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  gid, gid1: TGridCoord;
  p1: TPoint;
begin
  gid := THyperGrid(Sender).MouseCoord(X, Y);
  //if (gid.Y = -1) or (gid.X = -1) or (gid.Y > THyperGrid(Sender).RowCount - 1) or (gid.X > THyperGrid(Sender).ColCount - 1) then
  //  hint := ''
  //else
  //  hint := TStringGrid(Sender).Cells[gid.x, gid.y];
  //p1 := TStringGrid(Sender).ClientToScreen(Point(x, y));
  //if Hint <> '' then
  //  application.ActivateHint(p1)
  //else
  //  application.CancelHint;


  //gid := TStringGrid(Sender).MouseCoord(x, y);
  if (gid.Y = -1) or (gid.X = -1) then
     Exit;
  if (gid.x = M_Memo) or (gid.x = M_Order) or (gid.x = M_CODE) then begin
     if gid.x = M_Memo then
        hint := TStringGrid(Sender).Cells[gid.x, gid.y]
     else begin
        if ((gid.x = M_CODE) or (gid.x = M_ORDER)) and ((TStringGrid(Sender).Cells[M_CODE, gid.y] <> '') and (TStringGrid(Sender).Cells[M_ORDER, gid.y] <> '')) then begin
           gid1 := TStringGrid(Sender).MouseCoord(myPoint.X, myPoint.Y);
           if gid1.y = gid.y then
              exit
           else
             if gid.y <> -1 then begin
                hint := TStringGrid(Sender).Cells[m_hint, gid.y]; // MouseCoord(m_hint,myPoint.Y);
             end;
        end
        else
          hint := '';
     end;
     p1 := TStringGrid(Sender).ClientToScreen(Point(x, y));
     application.ActivateHint(p1);
  end
  else begin
     Application.CancelHint;
     Application.HideHint;
  end;
end;

procedure TFrmOrder.chagepat;
var
  irow: Integer;
  patins : string;
begin
  //修改所有order的自費別
  if Pat_Id1.Text = '健保' then
  begin
    patins := 'Y';
  end
  else
  begin
    patins := 'N';
  end;
  //111.05.31 shh ITe 11138 modify H_自含 G_健含 不改自費別
  //med
  for irow := 0 to SGMed.RowCount do
    if (trim(SGMed.Cells[M_INS,irow]) <> '') and (((trim(SGMed.Cells[M_INS,irow]) <> 'H') and (patins = 'N')) or ((trim(SGMed.Cells[M_INS,irow]) <> 'G') and (patins = 'Y')))
        and (trim(SGMed.Cells[modifyType,irow]) <> 'O') then
      SGMed.Cells[M_INS,irow] := patins;
  //fee
  for irow := 0 to SGFee.RowCount do
    if (trim(SGFee.Cells[F_Ins,irow]) <> '') and (((trim(SGFee.Cells[F_Ins,irow]) <> 'H') and (patins = 'N')) or ((trim(SGFee.Cells[F_Ins,irow]) <> 'G') and (patins = 'Y')))
        and (trim(SGFee.Cells[modifyType,irow]) <> 'O') then
      SGFee.Cells[F_Ins,irow] := patins;
  //放射
  for irow := 0 to SGXRay.RowCount do
    if (trim(SGXRay.Cells[C_INS,irow]) <> '') and (((trim(SGXRay.Cells[C_INS,irow]) <> 'H') and (patins = 'N')) or ((trim(SGXRay.Cells[C_INS,irow]) <> 'G') and (patins = 'Y')))
         and (trim(SGXRay.Cells[modifyType,irow]) <> 'O') then
      SGXRay.Cells[C_INS,irow] := patins;
  //檢驗
  for irow := 0 to SGLab.RowCount do
    if (trim(SGLab.Cells[C_INS,irow]) <> '') and (((trim(SGLab.Cells[C_INS,irow]) <> 'H') and (patins = 'N')) or ((trim(SGLab.Cells[C_INS,irow]) <> 'G') and (patins = 'Y')))
         and (trim(SGLab.Cells[modifyType,irow]) <> 'O') then
      SGLab.Cells[C_INS,irow] := patins;
  //檢查
  for irow := 0 to SGChk.RowCount do
    if (trim(SGChk.Cells[C_INS,irow]) <> '') and (((trim(SGChk.Cells[C_INS,irow]) <> 'H') and (patins = 'N')) or ((trim(SGChk.Cells[C_INS,irow]) <> 'G') and (patins = 'Y')))
         and (trim(SGChk.Cells[modifyType,irow]) <> 'O') then
      SGChk.Cells[C_INS,irow] := patins;
  //衛材
  for irow := 0 to SGMtrl.RowCount do
    if (trim(SGMtrl.Cells[O_Ins,irow]) <> '') and (((trim(SGMtrl.Cells[O_Ins,irow]) <> 'H') and (patins = 'N')) or ((trim(SGMtrl.Cells[O_Ins,irow]) <> 'G') and (patins = 'Y')))
         and (trim(SGMtrl.Cells[modifyType,irow]) <> 'O') then
      SGMtrl.Cells[O_Ins,irow] := patins;
  {
  //原版source 111.05.31 backup
  //med
  for irow := 0 to SGMed.RowCount do
    if (trim(SGMed.Cells[M_INS,irow]) <> '') and (trim(SGMed.Cells[modifyType,irow]) <> 'O') then
      SGMed.Cells[M_INS,irow] := patins;
  //fee
  for irow := 0 to SGFee.RowCount do
    if (trim(SGFee.Cells[F_Ins,irow]) <> '') and (trim(SGFee.Cells[modifyType,irow]) <> 'O') then
      SGFee.Cells[F_Ins,irow] := patins;
  //放射
  for irow := 0 to SGXRay.RowCount do
    if (trim(SGXRay.Cells[C_INS,irow]) <> '') and (trim(SGXRay.Cells[modifyType,irow]) <> 'O') then
      SGXRay.Cells[C_INS,irow] := patins;
  //檢驗
  for irow := 0 to SGLab.RowCount do
    if (trim(SGLab.Cells[C_INS,irow]) <> '') and (trim(SGLab.Cells[modifyType,irow]) <> 'O') then
      SGLab.Cells[C_INS,irow] := patins;
  //檢查
  for irow := 0 to SGChk.RowCount do
    if (trim(SGChk.Cells[C_INS,irow]) <> '') and (trim(SGChk.Cells[modifyType,irow]) <> 'O') then
      SGChk.Cells[C_INS,irow] := patins;
  //衛材
  for irow := 0 to SGMtrl.RowCount do
    if (trim(SGMtrl.Cells[O_Ins,irow]) <> '') and (trim(SGMtrl.Cells[modifyType,irow]) <> 'O') then
      SGMtrl.Cells[O_Ins,irow] := patins;
  }
end;

procedure TFrmOrder.FormCreate(Sender: TObject);
var
  LinkItems,Key ,menuItems, subItems : String;
  myItems, mysubItems : TMenuItem;
begin
  inherited;
  LinkItems := '';
  PupMenuPromulgate.Items.Clear;
  cloudmedurl := SetSys.ReadString('WEB','MEDCLOUD','');
  ins_ctrl := SetSys.ReadString('SYSTEM','INS_CTRL','FALSE');//1030117
  Key := SetSys.ReadString('WEB','其他通報','False');
  if upperCase(Key) ='TRUE' then
    LinkItems := SetSys.ReadString('其他通報','項目','False');
  while LinkItems <>'' do
  begin
    myItems := TMenuItem.Create(self);
    myItems.Caption := ReTurnId(LinkItems);
    myItems.OnClick := MyItemsForLinkClick;
    PupMenuPromulgate.Items.Add(myItems);
    LinkItems := ReTurnName(LinkItems);
  end;

  //癌症資訊的其他選項-自訂子項

  menuItems := SetSys.ReadString('癌症資訊', '項目', 'False');
  while MenuItems <> '' do
  begin
    myItems := TMenuItem.Create(self);
    myItems.Caption := ReTurnId(MenuItems);
    myItems.Hint := '癌症資訊';
    myItems.OnClick := MyItemsForSysClick;
    PopCancer.Items.Add(myItems);

    if upperCase(SetSys.ReadString('癌症資訊', myItems.Caption, 'False')) = 'TRUE' then
    begin
      subItems := SetSys.ReadString(myItems.Caption, '項目', 'False');
    end;
    while SubItems <> '' do
    begin
      mysubItems := TMenuItem.Create(myItems);
      mysubItems.Caption := ReTurnId(SubItems);
      mysubItems.Hint := myItems.Caption;
      mysubItems.OnClick := MyItemsForSysClick;
      myItems.Add(mysubItems);
      SubItems := ReTurnName(SubItems);
    end;
    MenuItems := ReTurnName(MenuItems);
  end;

  //臨床資訊的其他選項-自訂子項

  menuItems := SetSys.ReadString('臨床資訊', '項目', '');
  while MenuItems <> '' do
  begin
    myItems := TMenuItem.Create(self);
    myItems.Caption := ReTurnId(MenuItems);
    myItems.Hint := '臨床資訊';
    myItems.OnClick := ToolButton28Click;
    PupMenuReport.Items.Add(myItems);
    MenuItems := ReTurnName(MenuItems);
    //子項
    subItems := '';
    subItems := SetSys.ReadString(myItems.Caption, '項目', '');
    if subItems <> '' then
      myItems.OnClick := nil;
    while SubItems <> '' do
    begin
      mysubItems := TMenuItem.Create(myItems);
      mysubItems.Caption := ReTurnId(SubItems);
      mysubItems.Hint := myItems.Caption;
      mysubItems.OnClick := ToolButton28Click;
      myItems.Add(mysubItems);
      SubItems := ReTurnName(SubItems);
    end;
  end;

  lschangepat := SetSys.ReadString('DPD','CHANGEPAT',''); //身份變換是否改變計價別
  A381 := Setsys.ReadString('DPD', 'A381', 'F481');
  A387 := Setsys.ReadString('DPD', 'A387', 'F487');
  A395 := Setsys.ReadString('DPD', 'A395', 'F495');
  A397 := Setsys.ReadString('DPD', 'A397', 'F497');
  A382 := Setsys.ReadString('DPD', 'A382', '');
  A383 := Setsys.ReadString('DPD', 'A383', '');
  A38A := Setsys.ReadString('DPD', 'A38A', '');
  A38E := Setsys.ReadString('DPD', 'A38E', '');
  A38I := Setsys.ReadString('DPD', 'A38I', '');
  A38M := Setsys.ReadString('DPD', 'A38M', '');

  ChBReadCloud.Checked := gsReadCloud;
  PnlDiag.Top    := 205;
  PnlDiag.Left   := 286;
  PnlDiag.Height := 348;
end;

procedure TFrmOrder.MyItemsForLinkClick(Sender: TObject);
var
  Handle : THandle;
  myStr,myParamter,msgstr : String;
begin
  msgstr := '';
  myStr :=Setsys.ReadString('其他通報',TMenuItem(sender).Caption,'');
  myParamter := Setsys.ReadString('PARAMTER',TMenuItem(sender).Caption,'');
  comStrRep(mystr);
  comstrRep(myParamter);
  if myStr ='' then
  begin
    showMessage(NullStrTo(gsSysMsg,'此功能不開放使用，如有疑問請洽資訊室詢問。'));
    Exit;
  end;
  try
    if winexec(PChar(PChar(myStr) +' '+ PChar(myParamter) ),SW_SHOWNORMAL) < 31 then
      ShellExecute(Handle, 'open',PChar(myStr),PChar(myParamter),nil,SW_SHOWNORMAL);
  except
  end;
end;

procedure TFrmOrder.Case_Type1Change(Sender: TObject);
begin
  inherited;
  if ReturnName(Case_type1.Text) = 'A3' then
    ChkIdl.Checked := False
  else
    ChkIdl.Checked := True;
end;


procedure TFrmOrder.DGDiagCellClick(Column: TColumn);
begin
  inherited;
  getChrarea := ReturnName(ReturnName(DM.Qrytemp.fieldByName('AREA').AsString));
end;

procedure TFrmOrder.Button1Click(Sender: TObject);
begin
  inherited;
  PnlDiag.Visible := false;
  ms := 1;
end;

procedure TFrmOrder.DGDiagDblClick(Sender: TObject);
begin
  inherited;
  getChrarea := ReturnName(ReturnName(DM.Qrytemp.fieldByName('AREA').AsString));
  PnlDiag.Visible := false;
  ms := 1;
end;

procedure TFrmOrder.SaveReaction(degree: string; medcode1: string; medcode2: string; kind: string; operno: string);
var
  SEQ: integer;
begin
  with DM.QryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select max(seq_no) seq_no from drug_safe_log where fee_no1=' + Qt(getfeeno));
    Open;
    SEQ := FieldbyName('seq_no').AsInteger + 1;
  end;


  if DM.ADOLink.InTransaction then
    DM.ADOLink.BeginTrans;
  DM.ADOLink.BeginTrans;

  try
    with DM.QryInsert do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO drug_safe_log ';
      SQL.Add(' (sour_type, fee_no1,fee_no2,seq_no, ');
      SQL.Add('chr_no,degree,med_code1,med_code2,kind,oper_no, ');
      SQL.Add(' upd_oper,upd_date,upd_time) VALUES(');
      SQL.Add(' ''D'', '); //opd_date
      SQL.Add(Qt(getFeeNo) + ' , '); //fee_no1
      SQL.Add(Qt(getFeeNo) + ' , '); //fee_no2
      SQL.Add(IntToStr(SEQ) + ' , '); //seq_no
      SQL.Add(Qt(getchrno) + ' , '); //dr_action
      SQL.Add(Qt(degree) + ' , '); //degree
      SQL.Add(Qt(medcode1) + ' , '); //med_code1
      SQL.Add(Qt(medcode2) + ' , '); //med_code2
      SQL.Add(Qt(kind) + ' , '); //kind
      SQL.Add(Qt(operno) + ' , '); //oper_no
      SQL.Add(Qt(getDocCode1) + ' , '); //upd_oper
      SQL.Add(Qt(UUpddate) + ',' + Qt(UUpdtime) + ')');
      //SQL.Add( Qt(DBDate(RocDate(now,'')))+','+Qt(RocTime(now,''))+')');
      execsql;
    end;
    DM.ADOLink.CommitTrans;
  except
    DM.ADOLink.RollbackTrans;
  end;
end;

procedure TFrmOrder.SpecMedbgCheck(Med: String);
var
  index,FT_R,FT_G,FT_B : integer;
begin
  FT_R := 0;
  FT_G := 0;
  FT_B := 0;
  for index := 0 to SpecbgMed.Count -1 do
  begin
    if Med = ReturnId(SpecbgMed[index])   then
    begin
      FT_R := strtoint(ReturnId(ReturnName(SpecbgMed[index])));
      FT_G := strtoint(ReturnId(ReturnName(ReturnName(SpecbgMed[index]))));
      FT_B := strtoint(ReturnId(ReturnName(ReturnName(ReturnName(SpecbgMed[index])))));
      SGMed.Canvas.Brush.Color := RGB(FT_R,FT_G,FT_B);
      Break;
    end;
  end;
end;

procedure TFrmOrder.SpecMedCheck(Med: String);
var
  index,FT_R,FT_G,FT_B : integer;
begin
  FT_R := 0;
  FT_G := 0;
  FT_B := 0;
  for index := 0 to SpecMed.Count -1 do
  begin
    if Med = ReturnId(SpecMed[index])   then
    begin
      FT_R := strtoint(ReturnId(ReturnName(SpecMed[index])));
      FT_G := strtoint(ReturnId(ReturnName(ReturnName(SpecMed[index]))));
      FT_B := strtoint(ReturnId(ReturnName(ReturnName(ReturnName(SpecMed[index])))));
      SGMed.Canvas.Font.Color := RGB(FT_R,FT_G,FT_B);
      Break;
    end;
  end;
end;

function TFrmOrder.CheckDupMed: Boolean;//20140115學承
var
  i,j,k : Integer;
  Dup_flag,FsBut,Mes: String;
  BDUP,Blocking_FLAG : Boolean;
  myRow,myDupList : TStrings;
begin
  Result := True;
  myRow := TStringList.Create;
  myDupList := TStringList.Create;
  Result := True;
  Blocking_FLAG := False;
  UUpddate :='';
  UUpdtime :='';
  UUpddate := DBDate(RocDate(now,''));
  UUpdtime := DBDate(RocTime(now,'')); //取得現在時間

  for i := 0 to SGMed.RowCount -1 do
  begin
    if (SGMed.Cells[modifytype,i] = 'O') or (SGMed.Cells[Del,i] = 'X') or ((Trim(SGMed.Cells[M_Cir,i]) = 'STAT') ) then
      continue
    else
    begin
      if (Trim(SGMed.Cells[M_Code,i]) <> '') then
      begin
        Dup_flag := '';
        for j := i to SGMed.RowCount -1 do
        begin
          if i <> j then
          begin
            if (Trim(SGMed.Cells[M_Code,j]) = '') then
              continue;
            Dup_flag := '';
            With DM.Med_Check do
            begin
              //as_rtn_code:檢查新開立一組藥品回傳代碼(YY:重覆並阻斷 YN:重覆僅提示 N:無重覆)
              Close;
              Parameters.Clear;
              ProcedureName := 'pk_drug_warning.p_med_dup_message_opd';

              Parameters.CreateParameter('as_sour_type',ftString,pdInput,4000,Null); // 傳入值
              Parameters.CreateParameter('as_chr_no',ftString,pdInput,4000,Null);
              Parameters.CreateParameter('as_fee_no',ftString,pdInput,4000,Null);
              Parameters.CreateParameter('as_case_type',ftString,pdInput,4000,Null);
              Parameters.CreateParameter('as_order_type',ftString,pdInput,4000,Null);
              Parameters.CreateParameter('as_med_code1',ftString,pdInput,4000,Null);
              Parameters.CreateParameter('as_med_code2',ftString,pdInput,4000,Null);
              Parameters.CreateParameter('as_self_flag1',ftString,pdInput,4000,Null);
              Parameters.CreateParameter('as_self_flag2',ftString,pdInput,4000,Null);
              Parameters.CreateParameter('as_cir_code1',ftString,pdInput,4000,Null);
              Parameters.CreateParameter('as_cir_code2',ftString,pdInput,4000,Null);
              Parameters.CreateParameter('an_qty_num1',ftFloat,pdInput,4000,Null);
              Parameters.CreateParameter('an_qty_num2',ftFloat,pdInput,4000,Null);
              Parameters.CreateParameter('as_rtn_code',ftString,pdReturnValue,4000,Null); // 回傳值
              Parameters.CreateParameter('as_rtn_msg',ftString,pdReturnValue,4000,Null); // 回傳值
              Parameters.CreateParameter('as_rtn_code2',ftString,pdReturnValue,4000,Null); // 回傳值
              Parameters.CreateParameter('as_rtn_msg2',ftString,pdReturnValue,4000,Null); // 回傳值

              Parameters.parambyname('as_sour_type').Value  := 'D';
              Parameters.parambyname('as_chr_no').Value     := GetChrNo;
              Parameters.parambyname('as_fee_no').Value     := GetfeeNo;
              Parameters.parambyname('as_case_type').Value  := ReturnName(getCASEDESC);//ReturnId(CbbCase.Text);
              Parameters.parambyname('as_order_type').Value := ReturnName(getPARTDESC);//ReturnId(CbbPart.Text);
              Parameters.parambyname('as_med_code1').Value  := Trim(SGMed.Cells[M_CODE,i]);
              Parameters.parambyname('as_med_code2').Value  := Trim(SGMed.Cells[M_CODE,j]);
              Parameters.parambyname('as_self_flag1').Value := Trim(SGMed.Cells[M_INS,i]);
              Parameters.parambyname('as_self_flag2').Value := Trim(SGMed.Cells[M_INS,j]);
              Parameters.parambyname('as_cir_code1').Value  := Trim(SGMed.Cells[M_cir,i]);
              Parameters.parambyname('as_cir_code2').Value  := Trim(SGMed.Cells[M_cir,j]);
              Parameters.parambyname('an_qty_num1').Value   := StrToFloat(NullStrTo(Trim(SGMed.Cells[M_qty,i]),'0'));
              Parameters.parambyname('an_qty_num2').Value   := StrToFloat(NullStrTo(Trim(SGMed.Cells[M_qty,j]),'0'));
              try
                ExecProc;
              except
                ShowMessage('牙科醫令處理"重覆用藥檢核"程序時發生錯誤');
                Result := False;
                Exit;
              end;

              if not varisnull(DM.Med_Check.Parameters.parambyname('as_rtn_code').Value) then
                if Trim(DM.Med_Check.Parameters.parambyname('as_rtn_code').Value)<>'N' then
                begin
                  Dup_flag := Trim(DM.Med_Check.Parameters.parambyname('as_rtn_code').Value);
                  if Dup_flag = 'YY' then
                  BEGIN
                    Blocking_FLAG := True;
                    Result := False;
                  END;
                  SaveReaction('0',Trim(SGMed.Cells[M_CODE,i]),Trim(SGMed.Cells[M_CODE,J]),'02','1');
                  Mes :=Mes+Trim(DM.Med_Check.Parameters.parambyname('as_rtn_msg').Value)+#13;
                  myRow.Add(inttostr(i));
                end;
            end;
          end;
        end;//for j

        //as_rtn_code2:檢查已開立過藥品回傳代碼(YY:重覆並阻斷 YN:重覆僅提示 N:無重覆)
        With DM.Med_Check do
        begin
          Close;
          Parameters.Clear;
          ProcedureName := 'pk_drug_warning.p_med_dup_message_opd';

          Parameters.CreateParameter('as_sour_type',ftString,pdInput,4000,Null); // 傳入值
          Parameters.CreateParameter('as_chr_no',ftString,pdInput,4000,Null);
          Parameters.CreateParameter('as_fee_no',ftString,pdInput,4000,Null);
          Parameters.CreateParameter('as_case_type',ftString,pdInput,4000,Null);
          Parameters.CreateParameter('as_order_type',ftString,pdInput,4000,Null);
          Parameters.CreateParameter('as_med_code1',ftString,pdInput,4000,Null);
          Parameters.CreateParameter('as_med_code2',ftString,pdInput,4000,Null);
          Parameters.CreateParameter('as_self_flag1',ftString,pdInput,4000,Null);
          Parameters.CreateParameter('as_self_flag2',ftString,pdInput,4000,Null);
          Parameters.CreateParameter('as_cir_code1',ftString,pdInput,4000,Null);
          Parameters.CreateParameter('as_cir_code2',ftString,pdInput,4000,Null);
          Parameters.CreateParameter('an_qty_num1',ftFloat,pdInput,4000,Null);
          Parameters.CreateParameter('an_qty_num2',ftFloat,pdInput,4000,Null);
          Parameters.CreateParameter('as_rtn_code',ftString,pdReturnValue,4000,Null); // 回傳值
          Parameters.CreateParameter('as_rtn_msg',ftString,pdReturnValue,4000,Null); // 回傳值
          Parameters.CreateParameter('as_rtn_code2',ftString,pdReturnValue,4000,Null); // 回傳值
          Parameters.CreateParameter('as_rtn_msg2',ftString,pdReturnValue,4000,Null); // 回傳值

          Parameters.parambyname('as_sour_type').Value  := 'D';
          Parameters.parambyname('as_chr_no').Value     := GetChrNo;
          Parameters.parambyname('as_fee_no').Value     := GetfeeNo;
          Parameters.parambyname('as_case_type').Value  := ReturnName(getCASEDESC);//ReturnId(CbbCase.Text);
          Parameters.parambyname('as_order_type').Value := ReturnName(getPARTDESC);//ReturnId(CbbPart.Text);
          Parameters.parambyname('as_med_code1').Value  := Trim(SGMed.Cells[M_CODE,i]);
          Parameters.parambyname('as_med_code2').Value  := '';
          Parameters.parambyname('as_self_flag1').Value := Trim(SGMed.Cells[M_INS,i]);
          Parameters.parambyname('as_self_flag2').Value := '';
          Parameters.parambyname('as_cir_code1').Value  := Trim(SGMed.Cells[M_cir,i]);
          Parameters.parambyname('as_cir_code2').Value  := '';
          Parameters.parambyname('an_qty_num1').Value   := StrToFloat(NullStrTo(Trim(SGMed.Cells[M_qty,i]),'0'));
          Parameters.parambyname('an_qty_num2').Value   := 0;
          {ShowMessage(GetChrNo+'_'+GetfeeNo+'_'+ReturnId(CbbCase.Text)+'_'+ReturnId(CbbPart.Text)+'_'+Trim(SGMed.Cells[M_CODE,i])
                      +'_'+Trim(SGMed.Cells[M_CODE,j])+'_'+Trim(SGMed.Cells[M_INS,i])+'_'+Trim(SGMed.Cells[M_INS,j])+'_'+Trim(SGMed.Cells[M_cir,i])+
                      Trim(SGMed.Cells[M_cir,j])+'_'+NullStrTo(Trim(SGMed.Cells[M_qty,i]),'0')); }
          try
            ExecProc;
          except
            ShowMessage('牙科醫令處理"重覆用藥檢核"程序時發生錯誤');
            Result := False;
            Exit;
          end;
          
          if not varisnull(Parameters.parambyname('as_rtn_code2').Value) then
            if Trim(Parameters.parambyname('as_rtn_code2').Value)<>'N' then
            begin
              Dup_flag := Trim(Parameters.parambyname('as_rtn_code2').Value);
              if Dup_flag = 'YY' then
              BEGIN
                Blocking_FLAG := True;
                Result := False;
              END;
              SaveReaction('0',Trim(SGMed.Cells[M_CODE,i]),' ','02','1');
              Mes :=Mes+Trim(Parameters.parambyname('as_rtn_msg2').Value)+#13;
              myRow.Add(inttostr(i));
            end;
        end;
      end;
    end;
  end;//for i

  if Mes <>'' then
  begin
    if not Assigned(FrmIPDDupMed) then
      FrmIPDDupMed := TFrmIPDDupMed.Create(self);
    with FrmIPDDupMed do
    begin
      iPSI_WaitTime :=0 ;
      FFeeNo:=GetFeeNo;
      FOpdDate:=DBDate(RocDate(now,''));
      FChrNo:= GetChrNo;
      FDocNo:= getDocCode;
      FDocName := getDocName;
      FPatName := getPatName;
      FDeptDesc := getDocDeptCode;
      FUpddate := UUpddate;
      FUpdtime := UUpdtime;
      IF Blocking_FLAG THEN
        but3.Enabled := False
      ELSE
        but3.Enabled := True;
      Richedit1.Lines.Add('');
      Richedit1.Lines.Strings[Richedit1.Lines.Count-1]:= Mes;
    end;
    FrmIPDDupMed.ShowModal;
    BDUP := FrmIPDDupMed.DUP;
    FSBut := FrmIPDDupMed.FsBut;
    if FrmIPDDupMed <> nil then
      FrmIPDDupMed := nil;
    if not BDUP then
    begin
      if FsBut = '3' then
        for j := 0 to myRow.Count-1 do
        begin
          SGMed.Cells[M_INS,Strtoint(myRow.Strings[j])] := 'N'; //改為自費
        end;
      Result := False;
    end
    else
      Result := True;
  end;
end;

function TFrmOrder.MedUseCtrl(i: Integer; var Mes: string): Boolean;
begin
  Result := True;
  with DM.Med_Check do
  begin
    Close;
    Parameters.Clear;
    ProcedureName := 'pk_ipd_order_ud.p_fee_use_ctrl';

    Parameters.CreateParameter('as_fee_no', ftString, pdInput, 4000, Null); // 傳入值
    Parameters.CreateParameter('as_medcode', ftString, pdInput, 4000, Null);
    Parameters.CreateParameter('doccode', ftString, pdInput, 4000, Null);
    Parameters.CreateParameter('self1', ftString, pdInput, 4000, Null);
    Parameters.CreateParameter('arrest', ftString, pdReturnValue, 1, Null); // 回傳值
    Parameters.CreateParameter('message', ftString, pdReturnValue, 4000, Null); // 回傳值

    Parameters.parambyname('as_fee_no').Value := GetfeeNo;
    Parameters.parambyname('as_medcode').Value := Trim(SGMed.Cells[M_CODE, i]);
    Parameters.parambyname('doccode').Value := getDocCode;
    Parameters.parambyname('self1').Value := Trim(SGMed.Cells[M_INS, i]);

    try
      ExecProc;
    except
      ShowMessage('急診醫令處理"特殊藥品權限管控檢核"程序時發生錯誤');
      Result := False;
      Exit;
    end;

    if Trim(Parameters.parambyname('arrest').Value) <> 'N' then
    begin
      if not varisnull(Parameters.parambyname('message').Value) then
        Mes := Mes + '第' + IntToStr(i + 1) + '筆藥物 [' + Trim(SGMed.Cells[M_Order, i]) + ']:' + Trim(Parameters.parambyname('message').Value) + #13;
      Result := False;
    end
    else
      Result := True;
  end;
end;

procedure TFrmOrder.ToolButton54Click(Sender: TObject);
var
  Path : String;
begin
  inherited;
  Path := SetSys.ReadString('SYSTEM','PATHOLOGY','');
  if UpperCase(path) = 'TRUE' then
  begin
    path := '';
    Path := SetSys.ReadString('WEB','PATHOLOGY','');
    comStrRep(Path);
    if trim(path) <> '' then //開啟病理開單畫面
    begin
      if WinExecAndWait32(Path,SW_SHOWNORMAL) >= 0 then
      begin
        getpathologydata;
        if trim(SGPath.Cells[pth_code,0]) <> '' then
          ShowMessage('已開立病理醫囑，請完成醫令『完診』才會計價');
      end;
    end
    else
      ShowMessage('功能未開放使用(PATHOLOGY)');
  end
  else
    ShowMessage('功能未開放使用(PATHOLOGY)');
end;

procedure TFrmOrder.SGPathDblClick(Sender: TObject);
begin
  inherited;
  ToolButton54Click(ToolButton54);
end;

procedure TFrmOrder.getpathologydata;
var
  i : integer;
begin
  //清除資料
  for i := 0 to SGPath.RowCount -1 do
    SGPath.Rows[i].Clear;
  SGPath.RowCount := SGPath.FixedRows +1;

  //讀取病理開單資料
  DM.QryTemp.Close;
  DM.QryTemp.SQL.Clear;
  DM.QryTemp.SQL.Add('select a.*,b.item_name as fee_name from opd_path a join pathology_basic b on a.item_no=b.item_no ');
  DM.QryTemp.SQL.Add('where fee_no='+Qt(GetFeeNo)+'  and ((del_flag =''N'') or ( del_flag=''Y'' and dc_sheet_no is null))');
  DM.QryTemp.Open;
  while not DM.QryTemp.Eof do
  begin
    if DM.QryTemp.FieldByName('del_flag').AsString = 'Y' then
      SGPath.Cells[Del, SGPath.Row] := 'X';
    if trim(DM.QryTemp.FieldByName('seq_no2').AsString) = '' then
      SGPath.Cells[modifytype, SGPath.Row] := 'N'
    else
      SGPath.Cells[modifytype, SGPath.Row] := 'O';
    SGPath.Cells[pth_code, SGPath.Row]   := DM.QryTemp.FieldByName('fee_code').AsString; //  費用代碼
    SGPath.Cells[pth_order, SGPath.Row]  := DM.QryTemp.FieldByName('fee_name').AsString; //  費用名稱
    SGPath.Cells[Pth_Qty, SGPath.Row]    := DM.QryTemp.FieldByName('qty_num').AsString;
    SGPath.Cells[Pth_item, SGPath.Row]   := DM.QryTemp.FieldByName('item_no').AsString;
    SGPath.Cells[Pth_seqno, SGPath.Row]  := DM.QryTemp.FieldByName('seq_no').AsString;
    SGPath.Cells[Pth_seqno2, SGPath.Row] := DM.QryTemp.FieldByName('seq_no2').AsString;
    SGPath.Cells[pth_seq, SGPath.Row]    := DM.QryTemp.FieldByName('seq').AsString;
    if trim(DM.QryTemp.FieldByName('self_pay_flag').AsString)= 'Y' then
      SGPath.Cells[Pth_INS, SGPath.Row]  := 'N'
    else
      SGPath.Cells[Pth_INS, SGPath.Row]  := 'Y';
    SGPath.Cells[Pth_EMG, SGPath.Row]    := DM.QryTemp.FieldByName('urg_flag').AsString;
    SGPath.Cells[Pth_MEMO, SGPath.Row]   := '';
    SGPath.Cells[Pth_CONFSTATUS, SGPath.Row] := DM.QryTemp.FieldByName('conf_flag').AsString;
    SGPath.Cells[pth_no, SGPath.Row] := DM.QryTemp.FieldByName('path_no').AsString;
    if SGPath.Row = (SGPath.RowCount - 1) then
    begin
      SGPath.RowCount := SGPath.RowCount + 1;
    end;
    SGPath.Row := SGPath.Row+1;
    DM.QryTemp.Next;
  end;
end;

procedure TFrmOrder.SGPathDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if TStringGrid(Sender).Cells[modifyType, ARow] = 'O' then
    TStringGrid(Sender).Canvas.Brush.Color := $00E0E0BA
  else
    TStringGrid(Sender).Canvas.Brush.Color := ClWindow;
  if TStringGrid(Sender).Cells[Del, ARow]  = 'X' then
    TStringGrid(Sender).Canvas.Font.Color  := ClRed
  else
    TStringGrid(Sender).Canvas.Font.Color  := Clblack;
  TStringGrid(Sender).Canvas.FillRect(Rect);
  TStringGrid(Sender).Canvas.TextOut(Rect.Left + 1, Rect.Top + 1, Trim(TStringGrid(Sender).Cells[ACol, ARow]));
end;

procedure TFrmOrder.FormActivate(Sender: TObject);
var
  OPDADV,AdvParamStr : string;
  statusint: integer;
begin
  inherited;
  statusint := 0;
  if frmshow = 'Y' then
  begin
    frmshow := 'N';
    if (getOpdStatus = '1') or (getOpdStatus = '2') then
    begin
      //4癌篩檢
      OPDADV := SetSys.ReadString('DPD', 'OPDADV', '');
      AdvParamStr := SetSys.ReadString('ADV', '4CANCERPROMPT', '');
      comAdvStrRep(AdvParamStr, '');
      if (TRIM(OPDADV) <> '') AND (TRIM(AdvParamStr) <> '') then
        ShellExecute(Handle, 'Open', PChar(OPDADV), PChar(AdvParamStr), nil, SW_SHOWNORMAL);
    end;

    //雲端藥歷20141014
    if ((getOpdStatus = '1') or (getOpdStatus = '0')) AND (UpperCase(SetSys.ReadString('DPD', 'CLOUDDRUG',''))='TRUE') and (gsReadCloud) then
    begin
      csCloseCom();
      statusint := csOpenCom(0);
      if statusint = 0 then
      begin
        //病人健保ic卡認證
        if not IC_PatientStatus then
        begin
          statusint := card_status(2);
          if (statusint >= 2) and (statusint <= 5) then
            IC_PatientStatus := True;
        end;

        //卡機SAM卡認證
        if not IC_MachineStatus then
        begin
          statusint := card_status(1);
          if statusint = 2 then
            IC_MachineStatus := True;
        end;

        //醫師卡認證
        if not IC_PhysicianStatus then
        begin
          statusint := HPC_check();
          if statusint = 0 then
            IC_PhysicianStatus := True;
        end;
        csCloseCom();
      end;
      if not IC_PatientStatus then
      begin
        insert_cloud_log('Y');
        if MessageDlg('讀病人IC卡失敗，是否要重新連結雲端藥歷?<重新連結，請將"醫師卡"與"健保IC"卡插入讀卡機後再點選"Yes">',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          //確認網頁是存在
          if not Assigned(FrmCloudDrug) then
            openclouddrug;
          runclouddrug;
        end
        else
          insert_cloud_log('P');
      end
      else
      begin
        if not Assigned(FrmCloudDrug) then
          openclouddrug;
        runclouddrug;
      end;
    end;
  end;
end;

procedure TFrmOrder.runclouddrug;
var
  statusint: integer;
begin
  //病人健保ic卡認證
  csCloseCom();
  statusint := csOpenCom(0);
  if statusint = 0 then
  begin
    if not IC_PatientStatus then
    begin
      statusint := card_status(2);
      if (statusint >= 2) and (statusint <= 5) then
        IC_PatientStatus := True;
    end;
    //卡機SAM卡認證
    if not IC_MachineStatus then
    begin
      statusint := card_status(1);
      if statusint = 2 then
        IC_MachineStatus := True;
    end;
    //醫師卡認證
    if not IC_PhysicianStatus then
    begin
      statusint := HPC_check();
      if statusint = 0 then
        IC_PhysicianStatus := True;
    end;
    csCloseCom();
  end;

  if (IC_PatientStatus) and (IC_MachineStatus) and (IC_PhysicianStatus) then
  begin
    try
      FrmCloudDrug.Button2Click(FrmCloudDrug.Button2);
      FrmCloudDrug.Show;
    except
      ShowMessage('雲端藥歷連結失敗，');
    end;
  end
  else
  begin
    ShowMessage('雲端藥歷連結失敗');
    insert_cloud_log('Y');
  end;

end;

function TFrmOrder.retryclouddrug:Boolean;
begin
  Result := True;

  if (IC_PatientStatus) and (IC_MachineStatus) and (IC_PhysicianStatus) then
  begin
    try
      FrmCloudDrug.Button2Click(FrmCloudDrug.Button2);
      FrmCloudDrug.Show;
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

procedure TFrmOrder.openclouddrug;
begin
  if not Assigned(FrmCloudDrug) then
    FrmCloudDrug := TFrmCloudDrug.Create(FrmCloudDrug);
 // if getOpdDate < '1041110' then
 //   FrmCloudDrug.WebBrowser1.Navigate('https://10.253.253.245/imme0000/IMME0002S01.aspx')
 // else
 //   FrmCloudDrug.WebBrowser1.Navigate('https://medcloud.nhi.gov.tw/imme0000/IMME0002S01.aspx');
    IF cloudmedurl <> '' THEN
      FrmCloudDrug.WebBrowser1.Navigate(cloudmedurl)
    ELSE
      FrmCloudDrug.WebBrowser1.Navigate('https://medcloud.nhi.gov.tw/imme0008/IMME0008S00.aspx');
end;

procedure TFrmOrder.BitBtn1Click(Sender: TObject);
var
  statusint: integer;
begin
  inherited;
  csCloseCom();
  statusint := csOpenCom(0);
  if statusint = 0 then
  begin
    if not IC_PatientStatus then
    begin
      statusint := card_status(2);
      if (statusint >= 2) and (statusint <= 5) then
        IC_PatientStatus := True;
    end;
    //卡機SAM卡認證
    if not IC_MachineStatus then
    begin
      statusint := card_status(1);
      if statusint = 2 then
        IC_MachineStatus := True;
    end;
    //醫師卡認證
    if not IC_PhysicianStatus then
    begin
      statusint := HPC_check();
      if statusint = 0 then
        IC_PhysicianStatus := True;
    end;
    csCloseCom();
  end;

  if (IC_PatientStatus) and (IC_MachineStatus) and (IC_PhysicianStatus) then
  begin
    if not Assigned(FrmCloudDrug) then
      openclouddrug;
    FrmCloudDrug.Show;
    insert_cloud_log('B');
    //'Y:第一次忘了插卡  P:拒絕插卡  B:補點';
  end
  else
    showmessage('請確認IC卡');
end;

procedure TFrmOrder.ICD9_first(icd9code: string);
begin
  if (trim(icd9code) = 'A') or (trim(icd9code) = 'B') or
     (trim(icd9code) = 'C') or (trim(icd9code) = 'D') or
     (trim(icd9code) = 'X') then
    ShowMessage('注意此診斷為 初級照護診斷 !!!');
end;

procedure TFrmOrder.SGIcdExit(Sender: TObject);
begin
  inherited;
  //依據醫事小組提案，提案單號20141001-A006，於門診醫令系統新增檢核主診斷是否為初級照護診斷提示 20141202
  if choosesgICD then
  begin
    choosesgICD := False;
    if (trim(SGIcd.Cells[4,0]) = 'A') or (trim(SGIcd.Cells[4,0]) = 'B') or
       (trim(SGIcd.Cells[4,0]) = 'C') or (trim(SGIcd.Cells[4,0]) = 'D') or
       (trim(SGIcd.Cells[4,0]) = 'X') then
      ShowMessage('注意此診斷為 初級照護診斷 !!!');
  end;
end;

procedure TFrmOrder.ChBReadCloudClick(Sender: TObject);
begin
  inherited;
  if ChBReadCloud.Checked then
    gsReadCloud := True
  else
    gsReadCloud := False;
end;

procedure TFrmOrder.DBText38Click(Sender: TObject);
var
  i,j: integer;
begin
  inherited;
  if Trim(DBCICD10.DataSource.DataSet.FieldByName('ICD9_CODE').AsString) <> '' then
  begin
    j := 0;
    for i := 0 to SGIcd10.RowCount - 1 do
    begin
      if SGIcd10.Cells[0, i] <> '' then
        if DBCICD10.DataSource.DataSet.FieldByName('ICD9_CODE').AsString = SGIcd10.Cells[0, i] then
        begin
          inc(j);
          if j > 1 then
          begin
            ShowPnlMsg('此' + DBCICD10.DataSource.DataSet.FieldByName('ICD9_CODE').AsString + '診斷碼已重複開立！');
            SetPanel(False, PnlICD10);
            SGIcd10.Cells[0, SGIcd10.Row] := '';
            if Sender = SGIcd10 then
              SGIcd10.SetFocus;
            Exit;
          end;
        end;
    end;
    //判斷是否為外因碼 20151218
    if SGIcd10.Row = 0 then
      if ((UpperCase(copy(DBCICD10.DataSource.DataSet.FieldByName('ICD9_CODE').AsString,1,1)) = 'V') or
          (UpperCase(copy(DBCICD10.DataSource.DataSet.FieldByName('ICD9_CODE').AsString,1,1)) = 'W') or
          (UpperCase(copy(DBCICD10.DataSource.DataSet.FieldByName('ICD9_CODE').AsString,1,1)) = 'X') or
          (UpperCase(copy(DBCICD10.DataSource.DataSet.FieldByName('ICD9_CODE').AsString,1,1)) = 'Y')) then
      begin
        ShowMessage('此碼為外因碼不能為主診斷!');
        SGIcd10.Rows[SGIcd10.Row].Clear;
        exit;
      end;

    SGIcd10.Cells[0, SGIcd10.Row] := DBCICD10.DataSource.DataSet.FieldByName('ICD9_CODE').AsString;
    SGIcd10.Cells[2, SGIcd10.Row] := DBCICD10.DataSource.DataSet.FieldByName('ENG_SIMP_DESC').AsString;
    SGIcd10.Cells[1, SGIcd10.Row] := DBCICD10.DataSource.DataSet.FieldByName('CHN_SIMP_DESC').AsString;
    SGIcd10.Cells[3, SGIcd10.Row] := DBCICD10.DataSource.DataSet.FieldByName('slow_flag').AsString;
    SGIcd10.Cells[4, SGIcd10.Row] := DBCICD10.DataSource.DataSet.FieldByName('first_flag').AsString;
    SGIcd10.Cells[5, SGIcd10.Row] := DBCICD10.DataSource.DataSet.FieldByName('CHN_FULL_DESC').AsString;
    SGIcd10.Cells[6, SGIcd10.Row] := DBCICD10.DataSource.DataSet.FieldByName('ENG_FULL_DESC').AsString;
    SGIcd10.Cells[7, SGIcd10.Row] := trim(DBCICD10.DataSource.DataSet.FieldByName('icd9toicd10').AsString);
    SGIcd10.Cells[8, SGIcd10.Row] := DBCICD10.DataSource.DataSet.FieldByName('choose_flag').AsString;
    if SGIcd10.Row < (SGIcd10.RowCount - 1) then
    begin
      SGIcd10.Row := SGIcd10.Row + 1;
    end;
    //showt傳染病通報=======================SELECT count(*) FROM icd9_basic WHERE icd9_code = :data AND inf_flag <> 'N'
    if DBCICD10.DataSource.DataSet.FieldByName('inf_flag').AsString <> 'N' then
      If MessageDlg('傳染病第1類~5類疾病碼 是否通報?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        ToolButton28Click(ToolButton28);
      end;
  end
  else
    SGIcd10.Rows[SGIcd10.Row].Clear;
  SetPanel(False, PnlICD10);
end;

procedure TFrmOrder.DSIcdDataChange(Sender: TObject; Field: TField);
VAR
  TMPSQL,STQRY: STRING;
begin
  inherited;
  STQRY := sqlstr(11);
  TMPSQL := sqlstr(1);
  SetParamter(STQRY, '$IDC9_CODE$', trim(DSIcd.DataSet.FIELDBYNAME('ICD9_CODE').AsString));
  SetParamter(STQRY, '$DEPT_CODE$', trim(getDeptCode));
  DM.QrySubSearch.Close;
  DM.QrySubSearch.SQL.Clear;
  DM.QrySubSearch.SQL.Text := STQRY;
  DM.QrySubSearch.Open;
  if DM.QrySubSearch.FieldByName('ROWCT').AsInteger > 0 then
    TMPSQL := StringReplace(TMPSQL, '$DEPT_CODE$', ' and dept_code='+qt(trim(getDocDeptCode)), [rfReplaceAll])
  else
    SetParamter(TMPSQL, '$DEPT_CODE$', '');

  SetParamter(TMPSQL, '$IDC9_CODE$', trim(DSIcd.DataSet.FIELDBYNAME('ICD9_CODE').AsString));
  DM.qryICD10.Close;
  DM.qryICD10.SQL.Clear;
  DM.qryICD10.SQL.Text := TMPSQL;
  DM.qryICD10.Open;
  if NOT DM.qryICD10.IsEmpty then
  begin
    DSICD10.DataSet := DM.qryICD10;
    PnlICD10.Top := (PanelShow.top-(PnlICD10.Height+5));
    PnlICD10.Height := 80;
    DBCICD10.RowCount := 2;
    PnlICD10.Width := PanelIcd.Width;
    SetPanel(True,PnlICD10);
    DBCICD10.Enabled := False;
  end;

end;

procedure TFrmOrder.ToolButton63Click(Sender: TObject);
var
  Handle: THandle;
  myStr, myParamter: string;
  i: Integer;
begin
  inherited;
  PopCancer.Popup(ToolButton63.ClientOrigin.x, ToolButton63.ClientOrigin.y + ToolButton63.Height);
  {myStr := Setsys.ReadString('癌症資訊', TToolButton(sender).Caption, '');
  myParamter := Setsys.ReadString('PARAMTER', TToolButton(sender).Caption, '');
  comStrRep(mystr);
  comstrRep(myParamter);
  //comstrRepALL(myParamter);
  if myStr = '' then
  begin
    showMessage(NullStrTo(gsSysMsg, '此功能不開放使用，如有疑問請洽資訊室詢問。'));
    Exit;
  end;
  if UpperCase(myStr) = 'TRUE' then
  begin
    PopCancer.Popup(ToolButton63.ClientOrigin.x, ToolButton63.ClientOrigin.y + ToolButton63.Height);
  end
  else
  try
    if winexec(PChar(PChar(myStr) + ' ' + PChar(myParamter)), SW_SHOWNORMAL) < 31 then
      ShellExecute(Handle, 'open', PChar(myStr), PChar(myParamter), nil, SW_SHOWNORMAL);
  except
  end;}
end;


procedure TFrmOrder.MyItemsForSysClick(Sender: TObject);
var
  Handle: THandle;
  myStr, myParamter, TempStr, TempStr2: string;
  tmpStr: TStrings;
  i: Integer;
begin
  myStr := Setsys.ReadString(TMenuItem(sender).Hint, TMenuItem(sender).Caption, '');
  myParamter := Setsys.ReadString('PARAMTERSYSTEM', TMenuItem(sender).Caption, '');
  comStrRep(mystr);
  comstrRep(myParamter);
  if myStr = '' then
  begin
    showMessage(NullStrTo(gsSysMsg, '此功能不開放使用，如有疑問請洽資訊室詢問。'));
    Exit;
  end;

  try
    if TMenuItem(sender).Caption = '化療醫令' then
      //CheckChemo(myStr, myParamter)
    else if TMenuItem(sender).Caption = '開立會診' then
    begin
      {if WinExecAndWait32(PChar(PChar(myStr) + ' ' + PChar(myParamter)), SW_SHOWNORMAL) = -1 then
        ShellExecute(Handle, 'open', PChar(myStr), PChar(myParamter), nil, SW_SHOW);

      OutList.Clear;
      if FileExists(ExtractFileDir(Application.ExeName) + '\consult.txt') then
      begin
        OutList.LoadFromFile(ExtractFileDir(Application.ExeName) + '\consult.txt');
        for i := 0 to OutList.Count - 1 do
        begin
          SGTextOrder.Cells[modifytype, SGTextOrder.RowCount - 1] := 'N';
          SGTextOrder.Cells[T_CIR, SGTextOrder.RowCount - 1] := 'STAT';
          SGTextOrder.Cells[T_kind, SGTextOrder.RowCount - 1] := 'C';
          SGTextOrder.Cells[T_Bdate, SGTextOrder.RowCount - 1] := RocDate(now, '');
          SGTextOrder.Cells[T_BTime, SGTextOrder.RowCount - 1] := Roctime(now, '');
          SGTextOrder.Cells[T_Qty, SGTextOrder.RowCount - 1] := '1';
          SGTextOrder.Cells[T_Item_no, SGTextOrder.RowCount - 1] := ReturnName(OutList.Strings[i]);
          SGTextOrder.Cells[T_Order, SGTextOrder.RowCount - 1] := ReturnID(OutList.Strings[i]);
          SGTextOrder.Cells[Ordertype, SGTextOrder.RowCount - 1] := NullStrTo(preOrderType, DefaultType);
          if SetCbbItem_(gsOrderType, 'S') <> -1 then
            SGTextOrder.Cells[ordertype, SGTextOrder.Rowcount - 1] := 'S'
          else
            SGTextOrder.Cells[ordertype, SGTextOrder.Rowcount - 1] := '';
          SGTextOrder.RowCount := SGTextOrder.RowCount + 1;
        end;
      end;
      OutList.Clear;
      DELETEFILE(ExtractFileDir(Application.ExeName) + '\consult.txt');
      }
    end
    else if TMenuItem(sender).Hint = '癌症資訊' then
    begin
      if winexec(PChar(PChar(myStr) + ' ' + PChar(myParamter)), SW_SHOWNORMAL) < 31 then
        ShellExecute(Handle, 'open', PChar(myStr), PChar(myParamter), nil, SW_SHOWNORMAL);

    end
    else if winexec(PChar(PChar(myStr) + ' ' + PChar(myParamter)), SW_SHOWNORMAL) < 31 then
    begin
      {if TMenuItem(sender).Caption = '門診預開單' then
      begin
        if not Assigned(FrmOPDOrder) then
          FrmOPDOrder := TFrmOPDOrder.Create(Self);
        FrmOPDOrder.ShowModal;
        if FrmOPDOrder.TransNo <> '' then
          LoadOPDOrder(FrmOPDOrder.TransNo);
        if not (FrmOPDOrder = nil) then
          FrmOPDOrder := nil;
      end
      else if TMenuItem(sender).Caption = '電子簽章' then
      begin
        SignWebservice(Self);
      end
      else 
        ShellExecute(Handle, 'open', PChar(myStr), PChar(myParamter), nil, SW_SHOWNORMAL);
      InsertLabLog(Trim(TMenuItem(sender).Caption));}
    end;

  except
  end;

end;

procedure TFrmOrder.BtnChangeHospCodeClick(Sender: TObject);
begin
  inherited;
  Referral := InputBox('推薦轉診院所代碼','請輸入院所代碼',Referral);
  //ShowMessage(Referral);
end;


procedure TFrmOrder.ImgB01AClick(Sender: TObject);
var
  myStr,myParamter : String;
  TempQ : TADOQuery;
  lsMedName : String;
begin
  inherited;

  myStr := Setsys.ReadString('WEB', '抗凝血劑停頓計畫', '');
  myParamter := Setsys.ReadString('PARAMTER', '抗凝血劑停頓計畫', '');


  comStrRep(mystr);
  comstrRep(myParamter);

  if myStr = '' then
  begin
    showMessage(NullStrTo(gsSysMsg, '此功能不開放使用，如有疑問請洽資訊室詢問。'));
    Exit;
  end;
  try
    if winexec(PChar(PChar(myStr) + ' ' + PChar(myParamter)), SW_SHOWNORMAL) < 31 then
      ShellExecute(Handle, 'open', PChar(myStr), PChar(myParamter), nil, SW_SHOWNORMAL);
  except
  end;

end;
//2022-04-07 SDM服務傳回值的檢查與配置
function TFrmOrder.SelectOrderitemData(sCode: string):string;
var
  sSql, sLine: string; tempQuery: TADOQuery;
begin
  try
     try
        sLine := 'Y';
        SGFee.Row := SGFee.RowCount - 1;
        sSql := 'select * from orderitem_basic where FEE_CODE = ' + Qt(sCode);
        tempQuery := TADOQuery.Create(self);
        tempQuery.ConnectionString := DM.ADOLink.ConnectionString;
        tempQuery.SQL.Add(sSql);
        tempQuery.Open;
        if not tempQuery.IsEmpty then begin
           SGFee.Cells[modifyType, SGFee.Rowcount - 1] := 'N';
           SGFee.Cells[Seq, SGFee.Rowcount - 1] := '';
           SGFee.Cells[Del, SGFee.Rowcount - 1] := '';
           SGFee.Cells[3, SGFee.Rowcount - 1] := tempQuery.FieldByName('FEE_CODE').Asstring;
           SGFee.Cells[4, SGFee.Rowcount - 1] := tempQuery.FieldByName('FEE_NAME').Asstring;
           SGFee.Cells[5, SGFee.Rowcount - 1] := '';
           SGFee.Cells[6, SGFee.Rowcount - 1] := tempQuery.FieldByName('UNIT_QTY').Asstring;
           SGFee.Cells[7, SGFee.Rowcount - 1] := tempQuery.FieldByName('INS_FLAG').Asstring;
           SGFee.Cells[F_Memo, SGFee.Rowcount - 1] := '';
           SGFee.Cells[F_Kind, SGFee.Rowcount - 1] := 'F';
           SGFee.Cells[F_INS_Flag, SGFee.Rowcount - 1] := tempQuery.FieldByName('FEE_CODE').Asstring;

           //FeeRow := SGFee.Row;
           //if SGFee.Row = (SGFee.RowCount - 1) then
           //begin
           //  SGFee.RowCount := SGFee.RowCount + 1;
           //end;
           SGFee.RowCount := SGFee.RowCount + 1;
           SGFee.Row := SGFee.Row + 1;

           BringChild(tempQuery.FieldByName('FEE_CODE').Asstring);
           fee_tabst.Caption := '處置[' + IntToStr(SGFee.RowCount - 1) + ']' + ' ' + '用藥[' + IntToStr(SGMed.RowCount - 1) + ']';
           CHKCASEPART('D', tempQuery.FieldByName('FEE_CODE').Asstring);
        end
        else begin
           sLine := 'N';
           SGFee.Rows[SGFee.Row].Clear;
           ShowMessage('此SDM服務代碼[*' + sCode + '*]不存在');
        end;
        tempQuery.Close;

        SGFee.SetFocus;
        SetPanel(False, pnlfee);
        ComputeAmt(SGFee, F_Qty, F_Code, F_Ins);
        SGFee.Options := SGFee.Options + [goEditing];
     except
        on e:exception do begin
           showmessage('錯誤訊息[SelectOrderitemData] ' + #13#10 + e.Message);
        end;
     end;
  finally
     FreeAndNil(tempQuery);
     Result := sLine;
  end;
end;

//2022-04-07讀出用藥跌倒分數FALL_SCORE
function TFrmOrder.FallScoreDescription(sCode: string; var sFscr, sRisk: string):boolean;
var tempQuery:TADOQuery; sSql: string; bRtn: boolean;
begin
  bRtn := False;
  sFscr := '';  sRisk := '';
  try
     try
        sSql := 'select FALL_SCORE, RISK_TEXT from med_basic ';
        sSql := sSql + ' where Trim(med_code) = ' + Qt(sCode) + ' and Fall_flag = ''Y''';
        tempQuery := TADOQuery.Create(self);
        tempQuery.ConnectionString := DM.ADOLink.ConnectionString;
        tempQuery.SQL.Add(sSql);
        tempQuery.Open;
        if tempQuery.RecordCount > 0 then begin
           sFscr := Trim(tempQuery.FieldByName('FALL_SCORE').AsString);
           sRisk := Trim(tempQuery.FieldByName('RISK_TEXT').AsString);
           if trim(sFscr) <> '' then begin
              bRtn := True;
           end;
        end;
        tempQuery.Close;
     except
        on e:exception do begin
           showmessage('錯誤訊息[FallScoreDescription] ' + e.Message);
        end;
     end;
  finally
     FreeAndNil(tempQuery);
     Result := bRtn;
  end;
end;

//2022-04-07 檢查SGOrder的Grid中藥物是否有跌倒註記及說明，高跌的分數累計>=6，顯示圖示
procedure TFrmOrder.CheckDrugFallScoreOverdose;
var
  haveFall: Boolean;
  i: Integer; sFscr, sRisk: string;
begin
  try
     giFscr := 0;
     for i := 0 to SGMed.RowCount - 1 do begin
        sFscr := ''; sRisk := '';
        if (Trim(SGMed.Cells[11, i]) <> '') then begin

           haveFall := FallScoreDescription(Trim(SGMed.Cells[11, i]), sFscr, sRisk);
           if Trim(sFscr) = '' then sFscr := '0';
           //ShowMessage(Trim(SGMed.Cells[11, i]) + ':' + sFscr);
           if (haveFall) and (sFscr <> '0') then begin
              giFscr := giFscr + strtoint(sFscr);
           end;
        end;
        //
        //SGMed.Cells[M_Hint, i] :=  SGMed.Cells[M_Hint, i] + #13 + '藥品跌倒注意事項：' + sRisk;
     end;
     if giFscr >= 6 then begin
        ShowMedicaleFallIcon(13);
     end
     else begin
        ShowMedicaleFallIcon(-1);
     end;
  except
     on e:exception do begin
        showmessage('錯誤訊息[CheckDrugFallScoreOverdose] ' + e.Message);
     end;
  end;
end;
//2022-04-07顯示藥跌圖示
procedure TFrmOrder.ShowMedicaleFallIcon(i: integer);
var
  bmp: TBitmap;
begin
  try
     bmp := TBitmap.Create;
     try
        if i >= 0 then begin
           ImageListforPat.GetBitmap(i, bmp);
           ImgMedFall.Picture.Assign(bmp);
           ImgMedFall.Hint := '[藥跌病人]';
           ImgMedFall.ShowHint := True;
        end
        else begin
           ImgMedFall.Picture.Assign(nil);
        end;
     except
        on e:exception do begin
           showmessage('錯誤訊息[ShowMedicaleFallIcon] ' + e.Message);
        end;
     end;
  finally
     bmp.FreeImage();
     FreeAndNil(bmp);
  end;
end;

//procedure TFrmOrder.Button5Click(Sender: TObject);
//begin
//  inherited;
//
//  ShowMessage('Row:=' + inttostr(StringGrid3.Row) + ',Col:='
//   + inttostr(StringGrid3.Col) + ',值:' + StringGrid3.Cells[StringGrid3.Col, StringGrid3.Row]);
//end;

procedure TFrmOrder.ImgMedFallClick(Sender: TObject);
begin
  inherited;
  //
  try
     if not Assigned(FrmMedFallItem) then
        FrmMedFallItem := TFrmMedFallItem.Create(self);
     FrmMedFallItem.ShowModal;

     FrmMedFallItem.Close;
  finally
     FreeAndNil(FrmMedFallItem);
  end;
end;

//Function TFrmOrder.SelectMedFallData(sCode: string; var sExpr: string):integer;
//var tempQuery: TADOQuery; sSql, sScore: string; iScore: integer;
//begin
//  result := 0; iScore := 0; sExpr := '';
//  try
//     try
//        sSql := 'Select FALL_SCORE, RISK_TEXT from med_basic where med_code = ' + Qt(sCode) + ' and FALL_FLAG = ''Y'' ';
//        tempQuery := TADOQuery.Create(Self);
//        tempQuery.ConnectionString := DM.ADOLink.ConnectionString;
//        tempQuery.SQL.Add(sSql);
//        tempQuery.Open;
//        if tempQuery.RecordCount > 0 then begin
//           sExpr := Trim(tempQuery.FieldByName('RISK_TEXT').AsString);
//           sScore := Trim(tempQuery.FieldByName('FALL_SCORE').AsString);
//           if sScore = '' then begin
//              iScore := 0;
//           end
//           else begin
//              iScore := StrToInt(sScore);
//           end;
//        end;
//     except
//        on e:exception do begin
//           ShowMessage('錯誤訊息[FallScoreDescription]' + e.Message);
//        end;
//     end;
//  finally
//     FreeAndNil(tempQuery);
//     result := iScore;
//  end;
//end;
//
function TFrmOrder.SelectIdnoFromChrBasicForChrNo(sChrNo: string):string;
var tempQuery:TADOQuery; sSql, sIdno: string; bRtn: boolean;
begin
  sIdno := '';
  try
     try
        sSql := 'select ID_NO from Chr_basic ';
        sSql := sSql + ' where Trim(chr_no) = ' + Qt(sChrNo) + ' ';
        tempQuery := TADOQuery.Create(self);
        tempQuery.ConnectionString := DM.ADOLink.ConnectionString;
        tempQuery.SQL.Add(sSql);
        tempQuery.Open;
        if tempQuery.RecordCount > 0 then begin
           sIdno := Trim(tempQuery.FieldByName('ID_NO').AsString);
        end;
        tempQuery.Close;
     except
        on e:exception do begin
           showmessage('錯誤訊息[FallScoreDescription] ' + e.Message);
        end;
     end;
  finally
     FreeAndNil(tempQuery);
     Result := sIdno;
  end;
end;


procedure TFrmOrder.imgCovidInqClick(Sender: TObject);
var sUrl, sChrNo, sPatId, sIdno: string;
begin
  inherited;
  //sIdno := SelectIdnoFromChrBasicForChrNo(GetChrNo);
  sUrl := 'http://10.125.254.166/covid3month/default.aspx?id_no=' + getIdNo + '&oper_id=' + getDocCode1;
  //sUrl := 'http://10.125.254.166/covid3month/default.aspx?id_no=' + GetPatid + '&oper_id=' + GetUserId;
  ShellExecute(Handle, 'open', 'IExplore.EXE', PChar(sUrl), nil, SW_SHOWNORMAL);
end;

//紀錄操作log
function TFrmOrder.CallStoreProcIPDOPERLOG(sFeno,sChno,sKdno,sClno,sTpno,sCode,sRpmk,sRpxr,sOper,sUpd,sVsdoc,sBedno,sDpno:string;var rtn_msg:string):integer;
var rtn_code: integer; tempStoredProc: TADOStoredProc;
begin
  rtn_code := 0;
  rtn_msg := '';
  try
     tempStoredProc := TADOStoredProc.Create(self);
     tempStoredProc.ConnectionString := DM.ADOLink.ConnectionString;
     tempStoredProc.ProcedureName := 'P_IPD_OPER_LOG_MSG';
     with tempStoredProc do begin
        Parameters.CreateParameter('arg_char_no', ftString, pdInput, 10, Null); // 傳入值
        Parameters.CreateParameter('arg_fee_no', ftString, pdInput, 12, Null); // 傳入值
        Parameters.CreateParameter('arg_kind_no', ftString, pdInput, 2, Null);
        Parameters.CreateParameter('arg_class_no', ftString, pdInput, 2, Null);
        Parameters.CreateParameter('arg_type_no', ftString, pdInput, 2, Null);
        Parameters.CreateParameter('arg_lot_code', ftString, pdInput, 12, Null);
        Parameters.CreateParameter('arg_reply_mark', ftString, pdInput, 2, Null);
        Parameters.CreateParameter('arg_reply_expr', ftString, pdInput, 4000, Null);
        Parameters.CreateParameter('arg_open_oper', ftString, pdInput, 10, Null);
        Parameters.CreateParameter('arg_upd_datetime', ftString, pdInput, 100, Null);
        Parameters.CreateParameter('arg_vsdoc', ftString, pdInput, 10, Null);
        Parameters.CreateParameter('arg_bed_no', ftString, pdInput, 10, Null);
        Parameters.CreateParameter('arg_dpt_no', ftString, pdInput, 6, Null);
        Parameters.CreateParameter('rtn_code', ftInteger, pdOutput, 0, Null);
        Parameters.CreateParameter('rtn_msg', ftString, pdOutput, 1000, Null);
        Parameters.parambyname('arg_char_no').Value := sChno;
        Parameters.parambyname('arg_fee_no').Value := sFeno;
        Parameters.parambyname('arg_kind_no').Value := sKdno;
        Parameters.parambyname('arg_class_no').Value := sClno;
        Parameters.parambyname('arg_type_no').Value := sTpno;
        Parameters.parambyname('arg_lot_code').Value := sCode;
        Parameters.parambyname('arg_reply_mark').Value := sRpmk;
        Parameters.parambyname('arg_reply_expr').Value := sRpxr;
        Parameters.parambyname('arg_open_oper').Value := sOper;
        Parameters.parambyname('arg_upd_datetime').Value := sUpd;
        Parameters.parambyname('arg_vsdoc').Value := sVsdoc;
        Parameters.parambyname('arg_bed_no').Value := sBedno;
        Parameters.parambyname('arg_dpt_no').Value := sDpno;

        try
           ExecProc;
        except
           rtn_code := Parameters.parambyname('rtn_code').Value;
           rtn_msg := Parameters.parambyname('rtn_msg').Value;
           ShowMessage('操作紀錄寫入IPD_OPER_LOG時發生錯誤' + #13#10 + rtn_msg);
        end;
     end;
  finally
     FreeAndNil(tempStoredProc);
  end;
  result := rtn_code;
end;


procedure TFrmOrder.Button3Click(Sender: TObject);
var i : integer;
begin
  inherited;
  for i := 0 to SGMed.RowCount - 1 do begin
     showmessage(' 0:' + SGMed.Cells[modifytype, i] + ' 1:' + SGMed.Cells[seq, i] + ' 2:' + SGMed.Cells[del, i] + ' 3:' + SGMed.Cells[M_Code, i]);
  end;
end;

procedure TFrmOrder.Button2Click(Sender: TObject);
begin
  inherited;
  icrewritetest;
end;
//同意書
procedure TFrmOrder.ToolButton71Click(Sender: TObject);
var tempQuery:TADOQuery; sSql, sUrl: string; bRtn: boolean;
begin
  inherited;
  sUrl := '';
  try
     try
        sSql := 'select F_THINKCLOUD_URL(' + Qt(GetFeeNo) + ',' + Qt(getDocCode) + ',' + Qt(getDocCode) + ') Url From Dual';
        tempQuery := TADOQuery.Create(self);
        tempQuery.ConnectionString := DM.ADOLink.ConnectionString;
        tempQuery.SQL.Add(sSql);
        tempQuery.Open;
        if not tempQuery.Eof then begin
           sUrl := Trim(tempQuery.FieldByName('Url').AsString);
           //ShellExecute(Handle, 'open', PChar(sUrl), nil, nil, SW_SHOWNORMAL);
           ShellExecute(Handle, 'open', 'chrome.EXE', PChar(sUrl), nil, SW_SHOWNORMAL);
        end;
        tempQuery.Close;
     except
        on e:exception do begin
           showmessage('錯誤訊息[讀取同意書網址失敗] ' + e.Message);
        end;
     end;
  finally
     FreeAndNil(tempQuery);
  end;
end;


end.

