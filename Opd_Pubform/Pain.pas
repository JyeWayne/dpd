unit Pain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, ExtCtrls, StdCtrls, ComCtrls, Buttons, XPMan, DB, ADODB;

type
  TFrmPain = class(TFrmMain)
    Panel17: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PGTR_Pain: TPageControl;
    TSh_pain1: TTabSheet;
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    TSh_pain2: TTabSheet;
    Panel3: TPanel;
    Splitter6: TSplitter;
    Label32: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label74: TLabel;
    Panel4: TPanel;
    Splitter5: TSplitter;
    Label39: TLabel;
    Label40: TLabel;
    Splitter13: TSplitter;
    Splitter14: TSplitter;
    Splitter19: TSplitter;
    RB29_0: TRadioButton;
    RB24_1: TRadioButton;
    RB19_2: TRadioButton;
    Panel5: TPanel;
    Splitter4: TSplitter;
    Label37: TLabel;
    Label38: TLabel;
    Splitter12: TSplitter;
    Splitter18: TSplitter;
    Label73: TLabel;
    RB28_0: TRadioButton;
    RB23_1: TRadioButton;
    RB18_2: TRadioButton;
    Panel6: TPanel;
    Splitter3: TSplitter;
    Label35: TLabel;
    Label36: TLabel;
    Splitter11: TSplitter;
    Splitter17: TSplitter;
    RB27_0: TRadioButton;
    RB22_1: TRadioButton;
    RB17_2: TRadioButton;
    Panel7: TPanel;
    Splitter2: TSplitter;
    Label33: TLabel;
    Label34: TLabel;
    Splitter10: TSplitter;
    Splitter16: TSplitter;
    Label46: TLabel;
    RB26_0: TRadioButton;
    RB21_1: TRadioButton;
    RB16_2: TRadioButton;
    Panel8: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Splitter1: TSplitter;
    Splitter8: TSplitter;
    Splitter9: TSplitter;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Panel9: TPanel;
    Splitter7: TSplitter;
    Label41: TLabel;
    Label42: TLabel;
    Splitter15: TSplitter;
    Splitter20: TSplitter;
    Label72: TLabel;
    RB30_0: TRadioButton;
    RB25_1: TRadioButton;
    RB20_2: TRadioButton;
    TSh_pain3: TTabSheet;
    Panel10: TPanel;
    Label47: TLabel;
    Label48: TLabel;
    Splitter21: TSplitter;
    Splitter22: TSplitter;
    Splitter23: TSplitter;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Panel11: TPanel;
    Splitter24: TSplitter;
    Label52: TLabel;
    Label53: TLabel;
    Splitter25: TSplitter;
    Splitter26: TSplitter;
    RB01_0: TRadioButton;
    RB06_1: TRadioButton;
    RB11_2: TRadioButton;
    Panel12: TPanel;
    Splitter27: TSplitter;
    Label55: TLabel;
    Label56: TLabel;
    Splitter28: TSplitter;
    Splitter29: TSplitter;
    Label54: TLabel;
    Label64: TLabel;
    RB02_0: TRadioButton;
    RB07_1: TRadioButton;
    RB12_2: TRadioButton;
    Panel13: TPanel;
    Splitter30: TSplitter;
    Label57: TLabel;
    Label58: TLabel;
    Splitter31: TSplitter;
    Splitter32: TSplitter;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    RB03_0: TRadioButton;
    RB08_1: TRadioButton;
    RB13_2: TRadioButton;
    Panel14: TPanel;
    Splitter33: TSplitter;
    Label59: TLabel;
    Label60: TLabel;
    Splitter34: TSplitter;
    Splitter35: TSplitter;
    Splitter36: TSplitter;
    RB04_0: TRadioButton;
    RB09_1: TRadioButton;
    RB14_2: TRadioButton;
    Panel15: TPanel;
    Splitter37: TSplitter;
    Label61: TLabel;
    Label62: TLabel;
    Splitter38: TSplitter;
    Splitter39: TSplitter;
    RB05_0: TRadioButton;
    RB10_1: TRadioButton;
    RB15_2: TRadioButton;
    Panel16: TPanel;
    Splitter40: TSplitter;
    Label63: TLabel;
    Label68: TLabel;
    Label71: TLabel;
    Label75: TLabel;
    ADOPain: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RB26_0Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure F_C_score;
  public
    { Public declarations }
    upd_flag, opd_date, chr_no, fee_no, doc_Code : string;
    ext,m_age,dept_code,age : string;
    _DB :TADOConnection;
  end;

var
  FrmPain: TFrmPain;

implementation

uses Commfunc, Global;

{$R *.dfm}

{ TFrmMain1 }

procedure TFrmPain.F_C_score;
var
  i,j,s_um : integer;
  ChildControl,thecontorl: TControl;
  sname : string;
begin
  s_um := 0;
  for i := 0 to PGTR_Pain.ActivePage.ControlCount- 1 do//panel數量
  begin
    ChildControl := PGTR_Pain.ActivePage.Controls[i];
    sname := ChildControl.Name;
    if ChildControl is TPanel then
    begin
      for j := 0 to TPanel(ChildControl).ControlCount -1 do
      begin
        thecontorl := TPanel(ChildControl).Controls[j];
        sname := thecontorl.Name;    
        if thecontorl is TRadioButton then
          if TRadioButton(thecontorl).Checked = true then
            s_um := s_um+StrToInt(ReturnName(thecontorl.Name));
      end;
    end;
  end;
  if PGTR_Pain.ActivePageIndex = 1 then
    Label69.Caption := IntToStr(s_um);
  if PGTR_Pain.ActivePageIndex = 2 then
    Label68.Caption := IntToStr(s_um);
end;

procedure TFrmPain.BitBtn1Click(Sender: TObject);
var
  grade,grade_d,n_d : string;
begin
  inherited;
  ext := 'Y';
  Case PGTR_Pain.ActivePageIndex of
    0:
    //if PGTR_Pain.ActivePageIndex = 0 then
    begin
      if RadioButton1.Checked then
      begin
        grade := 'N';
        grade_d := '無法評估';
        n_d := ' ';
      end else if RadioButton2.Checked then
      begin
        grade   := Trim(RadioButton2.Caption);
        grade_d := Trim(Label8.Caption);
        n_d     := Trim(Label2.Caption);
      end else if RadioButton3.Checked then
      begin
        grade   := Trim(RadioButton3.Caption);
        grade_d := Trim(Label14.Caption)+' '+Trim(Label9.Caption);
        n_d     := Trim(Label3.Caption);
      end else if RadioButton4.Checked then
      begin
        grade   := Trim(RadioButton4.Caption);
        grade_d := Trim(Label15.Caption)+' '+Trim(Label10.Caption);
        n_d     := Trim(Label4.Caption);
      end else if RadioButton5.Checked then
      begin
        grade   := Trim(RadioButton5.Caption);
        grade_d := Trim(Label16.Caption)+' '+Trim(Label11.Caption);
        n_d     := Trim(Label5.Caption);
      end else if RadioButton6.Checked then
      begin
        grade   := Trim(RadioButton6.Caption);
        grade_d := Trim(Label17.Caption)+' '+Trim(Label12.Caption);
        n_d     := Trim(Label6.Caption);
      end else if RadioButton7.Checked then
      begin
        grade   := Trim(RadioButton7.Caption);
        grade_d := Trim(Label18.Caption)+' '+Trim(Label13.Caption);
        n_d     := Trim(Label7.Caption);
      end else if RadioButton8.Checked then
      begin
        grade   := Trim(RadioButton8.Caption);
        grade_d := Trim(Label14.Caption)+' '+Trim(Label9.Caption);
        n_d     := Trim(Label3.Caption);
      end else if RadioButton9.Checked then
      begin
        grade   := Trim(RadioButton9.Caption);
        grade_d := Trim(Label15.Caption)+' '+Trim(Label10.Caption);
        n_d     := Trim(Label4.Caption);
      end else if RadioButton10.Checked then
      begin
        grade   := Trim(RadioButton10.Caption);
        grade_d := Trim(Label16.Caption)+' '+Trim(Label11.Caption);
        n_d     := Trim(Label5.Caption);
      end else if RadioButton11.Checked then
      begin
        grade   := Trim(RadioButton11.Caption);
        grade_d := Trim(Label17.Caption)+' '+Trim(Label12.Caption);
        n_d     := Trim(Label6.Caption);
      end else if RadioButton12.Checked then
      begin
        grade   := Trim(RadioButton12.Caption);
        grade_d := Trim(Label18.Caption)+' '+Trim(Label13.Caption);
        n_d     := Trim(Label7.Caption);
      end;
    end;
    1://else if PGTR_Pain.ActivePageIndex = 1 then
    begin
      grade := Label69.Caption;
      grade_d := '困難-[FLACC量表]';
      n_d     := ' ';
    end;
    2:// else if PGTR_Pain.ActivePageIndex = 2 then
    begin
      grade := Label68.Caption;
      grade_d := '困難-[CRIES量表]';
      n_d     := ' ';
    end;
  end;
  with ADOPain do
  begin
    try
      Close;
      sql.Clear;                               
      if upd_flag = 'ins' then
      begin
        SQL.Add('INSERT INTO pain_score(OPD_DATE,CHR_NO,FEE_NO,GRADE,GRADE_DESC,NOTE,UPD_OPER,UPD_DATE,UPD_TIME,SOUR_AP)');
        SQL.Add('VALUES('+QuotedStr(opd_date)+','+QuotedStr(chr_no)+','+QuotedStr(fee_no));
        SQL.Add(','+QuotedStr(grade)+','+QuotedStr(grade_d)+','+QuotedStr(n_d)+','+QuotedStr(doc_Code));
        SQL.Add(','+QuotedStr(ROCDate(Now,''))+','+QuotedStr(ROCTime(Now,''))+',''O'')');
      end
      else  //if upd_flag = 'upd' then
      begin
        SQL.Add('update pain_score set GRADE='+QuotedStr(grade)+',GRADE_DESC='+QuotedStr(grade_d)+',NOTE='+QuotedStr(n_d)+',UPD_DATE='+QuotedStr(ROCDate(Now,''))+',UPD_TIME='+QuotedStr(ROCTime(Now,'')));
        SQL.Add('where fee_no='+QuotedStr(fee_no)+' and opd_date='+QuotedStr(opd_date)+' and UPD_OPER='+QuotedStr(doc_Code));
      end;
      gspainscore := grade;
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('commit');
      ExecSQL;
    except
      ShowMessage('存檔失敗');
    end;
  end;//with dm3
  Self.Close;
end;

procedure TFrmPain.FormShow(Sender: TObject);
begin
  inherited;
  ADOPain.Connection := _DB;
  ext := 'N';
  PGTR_Pain.Pages[0].TabVisible := true;
  PGTR_Pain.Pages[1].TabVisible := true;
  PGTR_Pain.Pages[2].TabVisible := true;
  //兒科疼痛評估
  IF (StrToFloat(m_age) <= 2) and (copy(Trim(dept_code),1,2) = '22') THEN
  BEGIN
    PGTR_Pain.ActivePageIndex := 2;
    PGTR_Pain.Pages[0].TabVisible := False;
    PGTR_Pain.Pages[1].TabVisible := False;
  END
  ELSE
  begin
    IF copy(Trim(dept_code),1,2) <> '22' THEN
    begin
      PGTR_Pain.Pages[1].TabVisible := False;
      PGTR_Pain.Pages[2].TabVisible := False;
    end
    else
      PGTR_Pain.Pages[2].TabVisible := False;
    if StrToFloat(age) < 4 then
      PGTR_Pain.ActivePageIndex := 1
    else
      PGTR_Pain.ActivePageIndex := 0;
  end;

  with ADOPain do
  begin
    Close;
    sql.Clear;
    sql.Add('select * from pain_score where chr_no='+QuotedStr(chr_no)+' and fee_no='+QuotedStr(fee_no)+' and opd_date='+QuotedStr(opd_date)+' and UPD_OPER='+QuotedStr(doc_Code));
    Open;
    if ADOPain.RecordCount > 0 then
    begin
      upd_flag := 'upd';
      if ADOPain.FieldByName('GRADE').Asstring = 'N' then
        RadioButton1.Checked
      else if ADOPain.FieldByName('GRADE').Asstring = '0' then
        RadioButton2.Checked
      else if ADOPain.FieldByName('GRADE').Asstring = '1' then
        RadioButton8.Checked
      else if ADOPain.FieldByName('GRADE').Asstring = '2' then
        RadioButton3.Checked
      else if ADOPain.FieldByName('GRADE').Asstring = '3' then
        RadioButton9.Checked
      else if ADOPain.FieldByName('GRADE').Asstring = '4' then
        RadioButton4.Checked
      else if ADOPain.FieldByName('GRADE').Asstring = '5' then
        RadioButton10.Checked
      else if ADOPain.FieldByName('GRADE').Asstring = '6' then
        RadioButton5.Checked
      else if ADOPain.FieldByName('GRADE').Asstring = '7' then
        RadioButton11.Checked
      else if ADOPain.FieldByName('GRADE').Asstring = '8' then
        RadioButton6.Checked
      else if ADOPain.FieldByName('GRADE').Asstring = '9' then
        RadioButton12.Checked
      else if ADOPain.FieldByName('GRADE').Asstring = '10' then
        RadioButton7.Checked;
    end
    ELSE
      upd_flag := 'ins';
    Close;
  end;
end;

procedure TFrmPain.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ext := 'Y';
  Self.Close;
end;

procedure TFrmPain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if ext = 'N' then
  begin
    ShowMessage('請按"完成"或"離開"按鈕');
    Abort;
  end
  else
    action := cafree;
end;

procedure TFrmPain.RB26_0Click(Sender: TObject);
begin
  inherited;
  F_C_score;
end;

procedure TFrmPain.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmPain := NIL;
end;

end.
