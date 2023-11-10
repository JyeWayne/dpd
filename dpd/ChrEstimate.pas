unit ChrEstimate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, XPMan, ExtCtrls, ComCtrls, StdCtrls, ShellAPI;

type
  TFrmChrEstimate = class(TFrmMain)
    Panel1: TPanel;
    Label1: TLabel;
    EdtChr: TEdit;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    EdtName: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit6: TEdit;
    Label10: TLabel;
    Edit7: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edit8: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    CheckBox2: TCheckBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label15: TLabel;
    Panel5: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label18: TLabel;
    Edit9: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Edit10: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Edit11: TEdit;
    Label23: TLabel;
    Edit12: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    Edit13: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    Edit14: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    Edit15: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    Edit16: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Edit17: TEdit;
    Label34: TLabel;
    Edit18: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    Edit19: TEdit;
    Label41: TLabel;
    Label42: TLabel;
    Edit20: TEdit;
    Label43: TLabel;
    Edit21: TEdit;
    Label44: TLabel;
    Edit22: TEdit;
    Label45: TLabel;
    Panel6: TPanel;
    Label46: TLabel;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    Panel7: TPanel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Edit23: TEdit;
    Label50: TLabel;
    Edit24: TEdit;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Panel8: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    Panel9: TPanel;
    Label57: TLabel;
    CheckBox32: TCheckBox;
    Label58: TLabel;
    CheckBox33: TCheckBox;
    CheckBox34: TCheckBox;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox37: TCheckBox;
    CheckBox38: TCheckBox;
    Panel10: TPanel;
    Label59: TLabel;
    Label60: TLabel;
    Edit25: TEdit;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Edit26: TEdit;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    CheckBox39: TCheckBox;
    CheckBox40: TCheckBox;
    CheckBox41: TCheckBox;
    Edit27: TEdit;
    CheckBox42: TCheckBox;
    CheckBox43: TCheckBox;
    Label72: TLabel;
    Label73: TLabel;
    Edit28: TEdit;
    Label74: TLabel;
    Edit29: TEdit;
    Label75: TLabel;
    Label76: TLabel;
    Edit30: TEdit;
    Label77: TLabel;
    Edit31: TEdit;
    Label78: TLabel;
    Edit32: TEdit;
    Panel11: TPanel;
    Label79: TLabel;
    Memo1: TMemo;
    Panel12: TPanel;
    RadioButton4: TRadioButton;
    RadioButton3: TRadioButton;
    Panel13: TPanel;
    RadioButton97: TRadioButton;
    RadioButton98: TRadioButton;
    Panel14: TPanel;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Panel15: TPanel;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton9: TRadioButton;
    Panel16: TPanel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton12: TRadioButton;
    Panel17: TPanel;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    Panel18: TPanel;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    Panel19: TPanel;
    RadioButton21: TRadioButton;
    RadioButton22: TRadioButton;
    Panel20: TPanel;
    RadioButton24: TRadioButton;
    RadioButton23: TRadioButton;
    Panel21: TPanel;
    RadioButton19: TRadioButton;
    RadioButton20: TRadioButton;
    Panel22: TPanel;
    RadioButton25: TRadioButton;
    RadioButton26: TRadioButton;
    Panel23: TPanel;
    RadioButton27: TRadioButton;
    RadioButton28: TRadioButton;
    Panel24: TPanel;
    RadioButton29: TRadioButton;
    RadioButton30: TRadioButton;
    Panel25: TPanel;
    RadioButton31: TRadioButton;
    RadioButton32: TRadioButton;
    Panel26: TPanel;
    RadioButton33: TRadioButton;
    RadioButton34: TRadioButton;
    Panel27: TPanel;
    RadioButton35: TRadioButton;
    RadioButton36: TRadioButton;
    Panel28: TPanel;
    RadioButton37: TRadioButton;
    RadioButton38: TRadioButton;
    Panel29: TPanel;
    RadioButton45: TRadioButton;
    RadioButton50: TRadioButton;
    RadioButton44: TRadioButton;
    RadioButton49: TRadioButton;
    RadioButton48: TRadioButton;
    RadioButton43: TRadioButton;
    RadioButton42: TRadioButton;
    RadioButton47: TRadioButton;
    RadioButton41: TRadioButton;
    RadioButton46: TRadioButton;
    Panel30: TPanel;
    RadioButton55: TRadioButton;
    RadioButton54: TRadioButton;
    RadioButton53: TRadioButton;
    RadioButton52: TRadioButton;
    RadioButton51: TRadioButton;
    Panel31: TPanel;
    RadioButton61: TRadioButton;
    RadioButton62: TRadioButton;
    RadioButton63: TRadioButton;
    RadioButton64: TRadioButton;
    RadioButton65: TRadioButton;
    Panel32: TPanel;
    RadioButton56: TRadioButton;
    RadioButton57: TRadioButton;
    RadioButton58: TRadioButton;
    Panel33: TPanel;
    RadioButton59: TRadioButton;
    RadioButton60: TRadioButton;
    Panel34: TPanel;
    RadioButton70: TRadioButton;
    RadioButton69: TRadioButton;
    RadioButton68: TRadioButton;
    RadioButton67: TRadioButton;
    RadioButton66: TRadioButton;
    Panel35: TPanel;
    RadioButton77: TRadioButton;
    RadioButton79: TRadioButton;
    RadioButton78: TRadioButton;
    RadioButton80: TRadioButton;
    Panel36: TPanel;
    RadioButton74: TRadioButton;
    RadioButton75: TRadioButton;
    RadioButton76: TRadioButton;
    Panel37: TPanel;
    RadioButton39: TRadioButton;
    RadioButton40: TRadioButton;
    RadioButton71: TRadioButton;
    Panel38: TPanel;
    RadioButton81: TRadioButton;
    RadioButton82: TRadioButton;
    Panel39: TPanel;
    RadioButton72: TRadioButton;
    RadioButton73: TRadioButton;
    Panel40: TPanel;
    RadioButton85: TRadioButton;
    RadioButton86: TRadioButton;
    RadioButton87: TRadioButton;
    Panel41: TPanel;
    RadioButton88: TRadioButton;
    RadioButton89: TRadioButton;
    Panel42: TPanel;
    RadioButton91: TRadioButton;
    RadioButton90: TRadioButton;
    Panel43: TPanel;
    RadioButton92: TRadioButton;
    RadioButton93: TRadioButton;
    RadioButton94: TRadioButton;
    Panel44: TPanel;
    RadioButton96: TRadioButton;
    RadioButton95: TRadioButton;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    CheckBox44: TCheckBox;
    RadioButton83: TRadioButton;
    Edit2: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChrEstimate: TFrmChrEstimate;

implementation

uses Global, SqlCenter, Commfunc, DBDM;

{$R *.dfm}

procedure TFrmChrEstimate.Button2Click(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TFrmChrEstimate.FormShow(Sender: TObject);
var
  i,iIndex : Integer;
  thecontrol : Twincontrol;
begin
  inherited;
  for iIndex := 0 to TForm(Sender).ComponentCount -1 do
  begin
    theControl := TWinControl(TForm(Sender).Components[iIndex]);
    if (theControl is TEdit) and (TEdit(theControl).Tag = 1) then
      TEdit(theControl).Text := '   .0'
    else if (theControl is TEdit) and (TEdit(theControl).Tag = 2) then
      TEdit(theControl).Text := '   0'
    else if (theControl is TEdit) and (TEdit(theControl).Tag = 0) then
      TEdit(theControl).Text := ''
    else if (theControl is TRadioButton) and (TRadioButton(theControl).Tag = 1) then
      TRadioButton(theControl).Checked:=true
    else if (theControl is TRadioButton) then
      TRadioButton(theControl).Checked:=false
    else if (theControl is TCheckBox) then
      TCheckBox(theControl).Checked:=false;
  end;
end;

procedure TFrmChrEstimate.Button1Click(Sender: TObject);
var
  tmpSql,OPDADV:string;
  AdvParamStr:String;
  SQLs:TStrings;
begin
  inherited;
  SQLs:=TStringList.Create;
  tmpSql:=getInsertSql(24);
  SetParamter(tmpSql,'$CHR_NO$',EdtChr.Text);
  SetParamter(tmpSql,'$FIRST_DATE$',getOpdDate);
  if CheckBox1.Checked then
    SetParamter(tmpSql,'$UNMEASURE_H_W$','Y')
  else
    SetParamter(tmpSql,'$UNMEASURE_H_W$','Y');
  SetParamter(tmpSql,'$HIGH$',Edit3.Text);
  SetParamter(tmpSql,'$WEIGHT$',Edit4.Text);
  SetParamter(tmpSql,'$TEMPERATURE$',Edit5.Text);
  SetParamter(tmpSql,'$SYSTOLIC_PRESSURE$',Edit6.Text);
  SetParamter(tmpSql,'$DIASTOLIC_PRESSURE$',Edit7.Text);
  SetParamter(tmpSql,'$SPHYGMUS$',Edit8.Text);
  if CheckBox2.Checked then
    SetParamter(tmpSql,'$PREGNANCY$','Y')
  else
    SetParamter(tmpSql,'$PREGNANCY$','Y');
  if RadioButton1.Checked then
    SetParamter(tmpSql,'$DATA_SOURCE$','0')
  else
    SetParamter(tmpSql,'$DATA_SOURCE$','1');
  SetParamter(tmpSql,'$DATA_SOURCE_OTHER_DESC$',Edit1.Text);
  if RadioButton4.Checked then
    SetParamter(tmpSql,'$YIELD$','0')
  else
    SetParamter(tmpSql,'$YIELD$','1');
  SetParamter(tmpSql,'$YIELD_WEEK$',Edit9.Text);
  SetParamter(tmpSql,'$BORN_WEIGHT$',Edit10.Text);
  if RadioButton98.Checked then
    SetParamter(tmpSql,'$ADMISSION_FLAG$','0')
  else
    SetParamter(tmpSql,'$ADMISSION_FLAG$','1');
  SetParamter(tmpSql,'$ADMISSION_TIMES$',Edit11.Text);
  SetParamter(tmpSql,'$ADMISSION_HOSP$',Edit12.Text);
  if RadioButton7.Checked then
    SetParamter(tmpSql,'$MEDICINE_FLAG$','0')
  else if RadioButton83.Checked then
    SetParamter(tmpSql,'$MEDICINE_FLAG$','1')
  else
    SetParamter(tmpSql,'$MEDICINE_FLAG$','3');
  SetParamter(tmpSql,'$MEDICINE_HB_Y$',Edit13.Text);
  if RadioButton10.Checked then
    SetParamter(tmpSql,'$MEDICINE_HB_MED$','0')
  else if RadioButton11.Checked then
    SetParamter(tmpSql,'$MEDICINE_HB_MED$','1')
  else if RadioButton9.Checked then
    SetParamter(tmpSql,'$MEDICINE_HB_MED$','3');
  SetParamter(tmpSql,'$MEDICINE_HB_DESC$',Edit2.Text);
  SetParamter(tmpSql,'$MEDICINE_H_Y$',Edit14.Text);
  if RadioButton5.Checked then
    SetParamter(tmpSql,'$MEDICINE_H_MED$','0')
  else if RadioButton6.Checked then
    SetParamter(tmpSql,'$MEDICINE_H_MED$','1')
  else if RadioButton12.Checked then
    SetParamter(tmpSql,'$MEDICINE_H_MED$','3');
  SetParamter(tmpSql,'$MEDICINE_H_DESC$',Edit33.Text);
  SetParamter(tmpSql,'$MEDICINE_S_Y$',Edit15.Text);
  if RadioButton13.Checked then
    SetParamter(tmpSql,'$MEDICINE_S_MED$','0')
  else if RadioButton14.Checked then
    SetParamter(tmpSql,'$MEDICINE_S_MED$','1')
  else if RadioButton15.Checked then
    SetParamter(tmpSql,'$MEDICINE_S_MED$','3');
  SetParamter(tmpSql,'$MEDICINE_S_DESC$',Edit34.Text);
  SetParamter(tmpSql,'$MEDICINE_B_Y$',Edit16.Text);
  if RadioButton16.Checked then
    SetParamter(tmpSql,'$MEDICINE_B_MED$','0')
  else if RadioButton17.Checked then
    SetParamter(tmpSql,'$MEDICINE_B_MED$','1')
  else if RadioButton18.Checked then
    SetParamter(tmpSql,'$MEDICINE_B_MED$','3');
  SetParamter(tmpSql,'$MEDICINE_B_DESC$',Edit35.Text);
  if CheckBox3.Checked then
    SetParamter(tmpSql,'$MEDICINE_OTHER_1$','Y')
  else
    SetParamter(tmpSql,'$MEDICINE_OTHER_1$','N');
  if CheckBox4.Checked then
    SetParamter(tmpSql,'$MEDICINE_OTHER_2$','Y')
  else
    SetParamter(tmpSql,'$MEDICINE_OTHER_2$','N');
  if CheckBox5.Checked then
    SetParamter(tmpSql,'$MEDICINE_OTHER_3$','Y')
  else
    SetParamter(tmpSql,'$MEDICINE_OTHER_3$','N');
  SetParamter(tmpSql,'$MEDICINE_OTHER_DESC$',Edit17.Text);
  if RadioButton21.Checked then
    SetParamter(tmpSql,'$SURGERY_FLAG$','0')
  else
    SetParamter(tmpSql,'$SURGERY_FLAG$','1');
  SetParamter(tmpSql,'$SURGERY_DESC$',Edit18.Text);
  if RadioButton32.Checked then
    SetParamter(tmpSql,'$ALG_MED$','0')
  else
    SetParamter(tmpSql,'$ALG_MED$','1');
  SetParamter(tmpSql,'$ALG_MED_DESC$',Edit20.Text);
  if RadioButton34.Checked then
    SetParamter(tmpSql,'$ALG_FOOD$','0')
  else
    SetParamter(tmpSql,'$ALG_FOOD$','1');
  SetParamter(tmpSql,'$ALG_FOOD_DESC$',Edit21.Text);
  if RadioButton36.Checked then
    SetParamter(tmpSql,'$ALG_BLOOD$','0')
  else
    SetParamter(tmpSql,'$ALG_BLOOD$','1');
  SetParamter(tmpSql,'$ALG_BLOOD_DESC$',Edit22.Text);
  if RadioButton38.Checked then
    SetParamter(tmpSql,'$TRAVEL_HISTORY$','0')
  else
    SetParamter(tmpSql,'$TRAVEL_HISTORY$','1');
  SetParamter(tmpSql,'$TRAVEL_HISTORY_DESC$',Edit36.Text);
  if CheckBox9.Checked then
    SetParamter(tmpSql,'$FAMILY_HISTORY_1$','Y')
  else
    SetParamter(tmpSql,'$FAMILY_HISTORY_1$','N');
  if CheckBox10.Checked then
    SetParamter(tmpSql,'$FAMILY_HISTORY_2$','Y')
  else
    SetParamter(tmpSql,'$FAMILY_HISTORY_2$','N');
  if CheckBox11.Checked then
    SetParamter(tmpSql,'$FAMILY_HISTORY_3$','Y')
  else
    SetParamter(tmpSql,'$FAMILY_HISTORY_3$','N');
  if CheckBox12.Checked then
    SetParamter(tmpSql,'$FAMILY_HISTORY_4$','Y')
  else
    SetParamter(tmpSql,'$FAMILY_HISTORY_4$','N');
  if CheckBox13.Checked then
    SetParamter(tmpSql,'$FAMILY_HISTORY_5$','Y')
  else
    SetParamter(tmpSql,'$FAMILY_HISTORY_5$','N');
  if CheckBox14.Checked then
    SetParamter(tmpSql,'$FAMILY_HISTORY_6$','Y')
  else
    SetParamter(tmpSql,'$FAMILY_HISTORY_6$','N');
  if CheckBox15.Checked then
    SetParamter(tmpSql,'$FAMILY_HISTORY_7$','Y')
  else
    SetParamter(tmpSql,'$FAMILY_HISTORY_7$','N');
  if CheckBox16.Checked then
    SetParamter(tmpSql,'$FAMILY_HISTORY_8$','Y')
  else
    SetParamter(tmpSql,'$FAMILY_HISTORY_8$','N');
  if CheckBox17.Checked then
    SetParamter(tmpSql,'$FAMILY_HISTORY_9$','Y')
  else
    SetParamter(tmpSql,'$FAMILY_HISTORY_9$','N');
  if CheckBox18.Checked then
    SetParamter(tmpSql,'$FAMILY_HISTORY_10$','Y')
  else
    SetParamter(tmpSql,'$FAMILY_HISTORY_10$','N');
  if CheckBox19.Checked then
    SetParamter(tmpSql,'$FAMILY_HISTORY_11$','Y')
  else
    SetParamter(tmpSql,'$FAMILY_HISTORY_11$','N');
  if CheckBox20.Checked then
    SetParamter(tmpSql,'$FAMILY_HISTORY_12$','Y')
  else
    SetParamter(tmpSql,'$FAMILY_HISTORY_12$','N');
  if RadioButton41.Checked then
    SetParamter(tmpSql,'$PROFESSIONAL$','1')
  else if RadioButton46.Checked then
    SetParamter(tmpSql,'$PROFESSIONAL$','2')
  else if RadioButton42.Checked then
    SetParamter(tmpSql,'$PROFESSIONAL$','3')
  else if RadioButton47.Checked then
    SetParamter(tmpSql,'$PROFESSIONAL$','4')
  else if RadioButton43.Checked then
    SetParamter(tmpSql,'$PROFESSIONAL$','5')
  else if RadioButton48.Checked then
    SetParamter(tmpSql,'$PROFESSIONAL$','6')
  else if RadioButton44.Checked then
    SetParamter(tmpSql,'$PROFESSIONAL$','7')
  else if RadioButton49.Checked then
    SetParamter(tmpSql,'$PROFESSIONAL$','8')
  else if RadioButton45.Checked then
    SetParamter(tmpSql,'$PROFESSIONAL$','9')
  else if RadioButton50.Checked then
    SetParamter(tmpSql,'$PROFESSIONAL$','A');
  SetParamter(tmpSql,'$AREA_F$',Edit23.Text);
  SetParamter(tmpSql,'$AREA_S$','');
  SetParamter(tmpSql,'$AREA_OTHER$',Edit23.Text);
  if RadioButton51.Checked then
    SetParamter(tmpSql,'$LIVE$','1')
  else if RadioButton52.Checked then
    SetParamter(tmpSql,'$LIVE$','2')
  else if RadioButton53.Checked then
    SetParamter(tmpSql,'$LIVE$','3')
  else if RadioButton54.Checked then
    SetParamter(tmpSql,'$LIVE$','4')
  else
    SetParamter(tmpSql,'$LIVE$','5');
  if RadioButton56.Checked then
    SetParamter(tmpSql,'$SUPPORT$','1')
  else if RadioButton57.Checked then
    SetParamter(tmpSql,'$SUPPORT$','2')
  else
    SetParamter(tmpSql,'$SUPPORT$','3');
  if RadioButton59.Checked then
    SetParamter(tmpSql,'$SUPPORT_M$','1')
  else
    SetParamter(tmpSql,'$SUPPORT_M$','2');
  if RadioButton61.Checked then
    SetParamter(tmpSql,'$CARE_MASTER$','1')
  else if RadioButton62.Checked then
    SetParamter(tmpSql,'$CARE_MASTER$','2')
  else if RadioButton63.Checked then
    SetParamter(tmpSql,'$CARE_MASTER$','3')
  else if RadioButton64.Checked then
    SetParamter(tmpSql,'$CARE_MASTER$','4')
  else
    SetParamter(tmpSql,'$CARE_MASTER$','5');
  SetParamter(tmpSql,'$CARE_MASTER_DESC$',Edit37.Text);
  if CheckBox21.Checked then
    SetParamter(tmpSql,'$ASSESSMENT_P_1$','Y')
  else
    SetParamter(tmpSql,'$ASSESSMENT_P_1$','N');
  if CheckBox22.Checked then
    SetParamter(tmpSql,'$ASSESSMENT_P_2$','Y')
  else
    SetParamter(tmpSql,'$ASSESSMENT_P_2$','N');
  if CheckBox23.Checked then
    SetParamter(tmpSql,'$ASSESSMENT_P_3$','Y')
  else
    SetParamter(tmpSql,'$ASSESSMENT_P_3$','N');
  if CheckBox24.Checked then
    SetParamter(tmpSql,'$ASSESSMENT_P_4$','Y')
  else
    SetParamter(tmpSql,'$ASSESSMENT_P_4$','N');
  if CheckBox25.Checked then
    SetParamter(tmpSql,'$ASSESSMENT_P_5$','Y')
  else
    SetParamter(tmpSql,'$ASSESSMENT_P_5$','N');
  if CheckBox26.Checked then
    SetParamter(tmpSql,'$ASSESSMENT_P_6$','Y')
  else
    SetParamter(tmpSql,'$ASSESSMENT_P_6$','N');
  if CheckBox27.Checked then
    SetParamter(tmpSql,'$ASSESSMENT_P_7$','Y')
  else
    SetParamter(tmpSql,'$ASSESSMENT_P_7$','N');
  SetParamter(tmpSql,'$ASSESSMENT_P_DESC$',Edit38.Text);
  if CheckBox28.Checked then
    SetParamter(tmpSql,'$ASSESSMENT_N_1$','Y')
  else
    SetParamter(tmpSql,'$ASSESSMENT_N_1$','N');
  if CheckBox29.Checked then
    SetParamter(tmpSql,'$ASSESSMENT_N_2$','Y')
  else
    SetParamter(tmpSql,'$ASSESSMENT_N_2$','N');
  if CheckBox30.Checked then
    SetParamter(tmpSql,'$ASSESSMENT_N_3$','Y')
  else
    SetParamter(tmpSql,'$ASSESSMENT_N_3$','N');
  if CheckBox31.Checked then
    SetParamter(tmpSql,'$ASSESSMENT_N_4$','Y')
  else
    SetParamter(tmpSql,'$ASSESSMENT_N_4$','N');
  if RadioButton66.Checked then
    SetParamter(tmpSql,'$CONSCIOUSNESS$','1')
  else if RadioButton67.Checked then
    SetParamter(tmpSql,'$CONSCIOUSNESS$','2')
  else if RadioButton68.Checked then
    SetParamter(tmpSql,'$CONSCIOUSNESS$','3')
  else if RadioButton69.Checked then
    SetParamter(tmpSql,'$CONSCIOUSNESS$','4')
  else
    SetParamter(tmpSql,'$CONSCIOUSNESS$','5');
  if RadioButton39.Checked then
    SetParamter(tmpSql,'$CONJUNTIVA$','1')
  else if RadioButton40.Checked then
    SetParamter(tmpSql,'$CONJUNTIVA$','2')
  else
    SetParamter(tmpSql,'$CONJUNTIVA$','3');
  if RadioButton74.Checked then
    SetParamter(tmpSql,'$SCLERA$','1')
  else if RadioButton75.Checked then
    SetParamter(tmpSql,'$SCLERA$','2')
  else
    SetParamter(tmpSql,'$SCLERA$','3');
  if RadioButton77.Checked then
    SetParamter(tmpSql,'$THROAT$','1')
  else if RadioButton79.Checked then
    SetParamter(tmpSql,'$THROAT$','2')
  else if RadioButton78.Checked then
    SetParamter(tmpSql,'$THROAT$','3')
  else
    SetParamter(tmpSql,'$THROAT$','4');
  SetParamter(tmpSql,'$TONSILS_DESC$',Edit26.Text);
  if RadioButton81.Checked then
    SetParamter(tmpSql,'$NODE$','1')
  else
    SetParamter(tmpSql,'$NODE$','2');
  SetParamter(tmpSql,'$NODE_DESC$',Edit39.Text);
  if RadioButton72.Checked then
    SetParamter(tmpSql,'$THYROID$','1')
  else
    SetParamter(tmpSql,'$THYROID$','2');
  SetParamter(tmpSql,'$THYROID_DESC$',Edit40.Text);
  if RadioButton85.Checked then
    SetParamter(tmpSql,'$CHEST$','1')
  else if RadioButton86.Checked then
    SetParamter(tmpSql,'$CHEST$','2')
  else
    SetParamter(tmpSql,'$CHEST$','3');
  SetParamter(tmpSql,'$CHEST_DESC$',Edit41.Text);
  if RadioButton88.Checked then
    SetParamter(tmpSql,'$HEART_R$','1')
  else
    SetParamter(tmpSql,'$HEART_R$','2');
  SetParamter(tmpSql,'$HEART_R_DESC$',Edit42.Text);
  if RadioButton90.Checked then
    SetParamter(tmpSql,'$HEART_M$','1')
  else
    SetParamter(tmpSql,'$HEART_M$','2');
  SetParamter(tmpSql,'$HEART_M_DESC$',Edit42.Text);
  SetParamter(tmpSql,'$ABD$','');
  SetParamter(tmpSql,'$ABD_R_DESC$',Edit27.Text);
  SetParamter(tmpSql,'$ABD_T_DESC$',Edit44.Text);
  if RadioButton92.Checked then
    SetParamter(tmpSql,'$BOWEL_SOUND$','1')
  else if RadioButton93.Checked then
    SetParamter(tmpSql,'$BOWEL_SOUND$','2')
  else
    SetParamter(tmpSql,'$BOWEL_SOUND$','3');
  SetParamter(tmpSql,'$HEPATOMEGALY_DESC$',Edit28.Text);
  SetParamter(tmpSql,'$SPLENOMEGALY_DESC$',Edit29.Text);
  if RadioButton95.Checked then
    SetParamter(tmpSql,'$EXTREMITIES$','1')
  else
    SetParamter(tmpSql,'$EXTREMITIES$','2');
  SetParamter(tmpSql,'$EXTRE_C$',Edit30.Text);
  SetParamter(tmpSql,'$EXTRE_E$',Edit31.Text);
  SetParamter(tmpSql,'$EXTRE_P$',Edit32.Text);
  SetParamter(tmpSql,'$NEUROLOGICAL_SIGN$',Memo1.Text);
  SetParamter(tmpSql,'$AN_NEUROLOGICAL_SIGN$',Memo1.Text);
  SetParamter(tmpSql,'$UPD_OPER$',getDocCode1);
  SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
  SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
  SetParamter(tmpSql,'$ADMISSION_REASON$',Edit12.Text);
  if CheckBox39.Checked then
    SetParamter(tmpSql,'$ABD_SOFT$','Y')
  else
    SetParamter(tmpSql,'$ABD_SOFT$','N');
  if CheckBox40.Checked then
    SetParamter(tmpSql,'$ABD_FLAT$','Y')
  else
    SetParamter(tmpSql,'$ABD_FLAT$','N');
  if CheckBox41.Checked then
    SetParamter(tmpSql,'$ABD_DISTENSION$','Y')
  else
    SetParamter(tmpSql,'$ABD_DISTENSION$','N');
  if CheckBox42.Checked then
    SetParamter(tmpSql,'$ABD_RIGID$','Y')
  else
    SetParamter(tmpSql,'$ABD_RIGID$','N');
  if CheckBox43.Checked then
    SetParamter(tmpSql,'$ABD_TENDERNESS$','Y')
  else
    SetParamter(tmpSql,'$ABD_TENDERNESS$','N');
  if CheckBox32.Checked then
    SetParamter(tmpSql,'$REH_FLAG$','Y')
  else
    SetParamter(tmpSql,'$REH_FLAG$','N');
  if CheckBox33.Checked then
    SetParamter(tmpSql,'$REH_1$','Y')
  else
    SetParamter(tmpSql,'$REH_1$','N');
  if CheckBox35.Checked then
    SetParamter(tmpSql,'$REH_2$','Y')
  else
    SetParamter(tmpSql,'$REH_2$','N');
  if CheckBox37.Checked then
    SetParamter(tmpSql,'$REH_3$','Y')
  else
    SetParamter(tmpSql,'$REH_3$','N');
  if CheckBox34.Checked then
    SetParamter(tmpSql,'$REH_4$','Y')
  else
    SetParamter(tmpSql,'$REH_4$','N');
  if CheckBox36.Checked then
    SetParamter(tmpSql,'$REH_5$','Y')
  else
    SetParamter(tmpSql,'$REH_5$','N');
  if CheckBox38.Checked then
    SetParamter(tmpSql,'$REH_6$','Y')
  else
    SetParamter(tmpSql,'$REH_6$','N');
  SetParamter(tmpSql,'$CONSCIOUSNESS_DESC$',Edit25.Text);
  if CheckBox44.Checked then
    SetParamter(tmpSql,'$PRINT_FLAG$','D')
  else
    SetParamter(tmpSql,'$PRINT_FLAG$','N');
  if RadioButton23.Checked then
    SetParamter(tmpSql,'$SMOKE_FLAG$','0')
  else
    SetParamter(tmpSql,'$SMOKE_FLAG$','1');
  if RadioButton20.Checked then
    SetParamter(tmpSql,'$ARECA_FLAG$','0')
  else
    SetParamter(tmpSql,'$ARECA_FLAG$','1');
  if RadioButton26.Checked then
    SetParamter(tmpSql,'$BC_HEPATITIS_FLAG$','0')
  else
    SetParamter(tmpSql,'$BC_HEPATITIS_FLAG$','1');
  SetParamter(tmpSql,'$HEALTH_OTHER_DESC$','');
  if RadioButton30.Checked then
    SetParamter(tmpSql,'$PASSIVE_SMOKE_FLG$','0')
  else
    SetParamter(tmpSql,'$PASSIVE_SMOKE_FLG$','1');
  if CheckBox6.Checked then
    SetParamter(tmpSql,'$PASSIVE_SMOKE_1$','Y')
  else
    SetParamter(tmpSql,'$PASSIVE_SMOKE_1$','N');
  if CheckBox7.Checked then
    SetParamter(tmpSql,'$PASSIVE_SMOKE_2$','Y')
  else
    SetParamter(tmpSql,'$PASSIVE_SMOKE_2$','N');
  if CheckBox8.Checked then
    SetParamter(tmpSql,'$PASSIVE_SMOKE_3$','Y')
  else
    SetParamter(tmpSql,'$PASSIVE_SMOKE_3$','N');
  SetParamter(tmpSql,'$PASSIVE_SMOKE_DESC$',Edit19.Text);

  if RadioButton28.Checked then
    SetParamter(tmpSql,'$ALCOHOL_FLAG$','0')
  else
    SetParamter(tmpSql,'$ALCOHOL_FLAG$','1');
  SQLs.Text:=tmpSql;
  if DM.ExecSQL(SQLs) then
  begin
    OPDADV:=SetSys.ReadString('DPD','OPDADV','');
    AdvParamStr:=SetSys.ReadString('ADV','FPRINT','');
    comAdvStrRep(AdvParamStr,'');
    if (OPDADV <> '') and (AdvParamStr <> '') then
      ShellExecute(Handle,'Open',PChar(OPDADV), PChar(AdvParamStr),nil,SW_SHOWNORMAL);
      //winexec(PChar(OPDADV +' 1;1;'+getFeeNo+';X;'+getDocCode),0);
  end;

  SQLs.Free;
  Self.Close;
end;

end.
