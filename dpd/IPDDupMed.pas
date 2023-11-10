unit IPDDupMed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, ComCtrls, ExtCtrls, Buttons, XPMan;

type
  TFrmIPDDupMed = class(TFrmMain)
    Panel4: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    RichEdit1: TRichEdit;
    but1: TBitBtn;
    but3: TBitBtn;
    but4: TBitBtn;
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
    DUP : Boolean;
    FMEDCODE1 : String;
    FMEDCODE2 : String;
    FUpddate : String;
    FUpdtime : String;
  end;

var
  FrmIPDDupMed: TFrmIPDDupMed;

implementation

uses Commfunc, DBDM, Global, ADODB;

{$R *.dfm}

{ TFrmIPDDDI }

procedure TFrmIPDDupMed.SaveReaction(aOpdStatus: String);
begin
  if Trim(RichEdit1.Text) <> '' then
  begin
    if DM.ADOLink.InTransaction then
      DM.ADOLink.BeginTrans;
    DM.ADOLink.BeginTrans;
    Try
      With DM.QryInsert do
      begin
        SQL.Clear;
        SQL.Add('UPDATE drug_safe_log set OPER_NO=' + Qt(sBut));
        SQL.Add(' where SOUR_TYPE = ''D'' and fee_no1=' + QuotedStr(FFeeNo) + ' and oper_no=''1'' and kind = ''02'' and upd_oper = ' + Qt(FDocNo) + ' and upd_date = '+ Qt(FUpddate) + ' and upd_time <= ' + Qt(FUpdtime)  );
        //SQL.Add(' where SOUR_TYPE = ''I'' and fee_no1=' + QuotedStr(FFeeNo) + ' and oper_no=''1'' and kind = ''02'' and upd_oper = ' + Qt(getuserid) + ' and upd_date = '+ Qt(DBDate(RocDate(now,''))) + ' and upd_time <= ' + Qt(RocTime(now,''))  );
        ExecSQL;
      end;
      DM.ADOLink.CommitTrans;
    except
      DM.ADOLink.RollbackTrans;
    end;
  end;
end;

procedure TFrmIPDDupMed.but1Click(Sender: TObject);
begin
  inherited;
  Dup  := TBitBtn(Sender).Tag < 1;
  sBut := TBitBtn(Sender).Hint;
  FsBut := sBut;
  SaveReaction(IntToStr(TBitBtn(Sender).Tag));
  Close ;
end;

procedure TFrmIPDDupMed.FormShow(Sender: TObject);
var
  TempS : Tstringlist;
  i,j : Integer;
begin
  inherited;
  Temps := TStringList.Create;
  Temps.Text := Richedit1.Text;
  Richedit1.Lines.Clear;
  for i := 0 to TempS.Count -1 do
  begin
    RichEdit1.SelStart := Length(RichEdit1.Lines.Text);
    if ((i+1) div 2) = 1 then
      RichEdit1.SelAttributes.Color := clred
    else
      RichEdit1.SelAttributes.Color := clBlack;

    Richedit1.Lines.Add(Temps.Strings[i]);
    RichEdit1.SelLength := Length(Temps.Strings[i]);
  end;
  //RichEdit1.SelStart := Length(RichEdit1.Lines.Text);
  //RichEdit1.SelAttributes.Color := clTeal;
end;

procedure TFrmIPDDupMed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := Cafree;
end;

procedure TFrmIPDDupMed.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmIPDDupMed := nil;
end;

end.
