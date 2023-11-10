unit DDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, ComCtrls, Buttons, ExtCtrls, XPMan;

type
  TFrmDDI = class(TFrmMain)
    Panel4: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    but1: TBitBtn;
    but2: TBitBtn;
    BitBtn1: TBitBtn;
    but3: TBitBtn;
    but4: TBitBtn;
    but5: TBitBtn;
    but7: TBitBtn;
    RichEdit1: TRichEdit;
    procedure but1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    sbut : String;
    procedure SaveReaction( aOpdStatus : String);
  public
    { Public declarations }
    FsBut: String;
    FPsiData : TStringList;
    sGetPSI_Data : String;
    iPSI_WaitTime : Integer ;
    FFeeNo: String;
    FOpdDate: String;
    FChrNo: String;
    FDocNo: String;
    FDocName : String;
    FPatName : String;
    FDeptDesc : String;
    FMed_code1,FMed_Code2: STRING;
    DDI : Boolean;
  end;

var
  FrmDDI: TFrmDDI;

implementation

uses DBDM, Commfunc, Global, MyUser;

{$R *.dfm}


procedure TFrmDDI.SaveReaction(aOpdStatus: String);
begin
  if Trim(RichEdit1.Text) <> '' then
  begin
    if DM.ADOLink.InTransaction then
      DM.ADOLink.BeginTrans;
    DM.ADOLink.BeginTrans;
    Try
      With DM.QryInsert do
      begin
        SQL.Text := 'INSERT INTO psi_ddi_dr_action ';
        SQL.Add( ' (OPD_DATE, FEE_NO,DOC_CODE,CHR_NO, ');
        SQL.Add( 'DR_ACTION,OPD_TIME,DOC_NAME,PAT_NAME,DEPT_DESC,MED_CODE1,MED_CODE2,DDI_MSG, ');
        SQL.Add( ' REMINDERED,OPD_STATUS) VALUES(');
        SQL.Add( QuotedStr( FOpdDate) + ' , ' );                     //opd_date
        SQL.Add( QuotedStr( FFeeNo) + ' , ' );                       //fee_no
        SQL.Add( QuotedStr( FDocNo) + ' , ' );                       //doc_code
        SQL.Add( QuotedStr( FChrNo) + ' , ' );                       //chr_no
        SQL.Add( QuotedStr('C') + ' , ' );                           //dr_action
        SQL.Add( QuotedStr(RocTimes(now,'') ) + ' , ' );             //opd_time
        SQL.Add( QuotedStr( FDocName ) + ' , ' );                    //doc_name
        SQL.Add( QuotedStr( FPatName) + ' , ' );                     //pat_name
        SQL.Add( QuotedStr( FDeptDesc ) + ' , ' );                    //dept_desc
        SQL.Add( QuotedStr( FMed_code1) + ' , ');
        SQL.Add( QuotedStr( FMed_code2) + ' , ');
        SQL.Add( QuotedStr( RichEdit1.Text ) + ' , ' );              //ddi_msg
        SQL.Add( '''N'' , ' );                                       //remindered
        SQL.Add( QuotedStr( aOpdStatus ) + ' ) ' );                  //opd_status
      end;
      DM.ADOLink.CommitTrans;
    except
      DM.ADOLink.RollbackTrans;
    end;
  end;
end;

procedure TFrmDDI.but1Click(Sender: TObject);
begin
  inherited;
  DDI  := TBitBtn(Sender).Tag < 1;
  sBut := TBitBtn(Sender).Hint;
  SaveReaction(IntToStr(TBitBtn(Sender).Tag));
  Close ;
end;

procedure TFrmDDI.FormShow(Sender: TObject);
var
  TempS : Tstringlist;
  i,j : Integer;
  s : String;
begin
  inherited;
  Temps := TStringList.Create;
  Temps.Text := Richedit1.Text;
  Richedit1.Lines.Clear;
  s:='Reference：'+#13#10 +'Hansten PD, Horn JR. Managing clinical important drug interactions. Missouri: Facts and Comparisons, 2003'+#10#13+'Tatro DS. Drug interaction facts. Missouri: Facts and Comparisons, 2004.';
  for i := 0 to TempS.Count -1 do
  begin
    RichEdit1.SelStart := Length(RichEdit1.Lines.Text);
    if pos('藥品 : ',Temps.Strings[i]) > 0 then
      RichEdit1.SelAttributes.Color := clred;
    if pos('嚴重度 : ',Temps.Strings[i]) > 0 then
      RichEdit1.SelAttributes.Color := clBlue;
    if pos('文獻證據性 : ',Temps.Strings[i]) > 0 then
      RichEdit1.SelAttributes.Color := clBlack;
    if pos('交互作用 : ',Temps.Strings[i]) > 0 then
      RichEdit1.SelAttributes.Color := clGreen;
    if pos('影響 : ',Temps.Strings[i]) > 0 then
      RichEdit1.SelAttributes.Color := clBlack;
    Richedit1.Lines.Add(Temps.Strings[i]);
    RichEdit1.SelLength := Length(Temps.Strings[i]);
  end;
  RichEdit1.SelStart := Length(RichEdit1.Lines.Text);
  RichEdit1.SelAttributes.Color := clTeal;
  Richedit1.Lines.Add(s);
  RichEdit1.SelLength := Length(s);
end;

procedure TFrmDDI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := Cafree;
end;

procedure TFrmDDI.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmDDI := nil;
end;

end.
