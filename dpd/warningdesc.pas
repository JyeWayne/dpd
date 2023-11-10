unit warningdesc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, ExtCtrls, OleCtrls, SHDocVw, ComCtrls, XPMan;

type
  TFrmWarningdesc = class(TFrmMain)
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    Memo1: TMemo;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    BtnOK: TButton;
    BtnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    WarningFlag : integer;
    medcode : String;
    medstr  : String;
    atccode : String;
    Upddate,Updtime : String;
  end;

var
  FrmWarningdesc: TFrmWarningdesc;

implementation

uses Commfunc, DBDM, Global, SqlCenter;

{$R *.dfm}

procedure TFrmWarningdesc.FormShow(Sender: TObject);
var
  WebLink : String;
begin
  //inherited;
  WebLink:=SetSys.ReadString('WEB','¹L±Ó¥v','');
  comStrRep(WebLink);
  //SetParamter(WebLink,'$+MEDCODE+$',medcode);
  SetParamter(WebLink,'$+MEDCODE+$',medstr);
  WebBrowser1.Navigate(WebLink);
end;

procedure TFrmWarningdesc.BtnCancelClick(Sender: TObject);
begin
  inherited;
  WarningFlag := 0;
  Close;
end;

procedure TFrmWarningdesc.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  if RadioGroup1.ItemIndex = 3 then
  begin
    Memo1.Enabled := True;
    Memo1.Color := clWindow;
  end
  else
  begin
    Memo1.Enabled := False;
    Memo1.Color := clGray;
  end;

end;

procedure TFrmWarningdesc.BtnOKClick(Sender: TObject);
begin
  inherited;
  if (RadioGroup1.ItemIndex = 3) and (Memo1.Text = '') then
  begin
    Memo1.SetFocus;
    exit;
  end;

  WarningFlag := RadioGroup1.Itemindex;

  if WarningFlag > 0 then
  begin
    if DM.ADOLink.InTransaction then
      DM.ADOLink.BeginTrans;
    DM.ADOLink.BeginTrans;

    Try
      With DM.QryInsert do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'INSERT INTO opd_warning2_log ';
        SQL.Add( ' (fee_no, chr_no,med_code,atc_code,stop_memo ');
        SQL.Add( ' ,upd_oper,upd_date,upd_time) VALUES(');
        SQL.Add( Qt(getFeeNo) + ' , ' );                       //fee_no
        SQL.Add( Qt(getchrno) + ' , ' );                       //dr_action
        SQL.Add( Qt(medcode) + ' , ' );                        //med_code
        SQL.Add( Qt(atccode) + ' , ' );                        //atc_code

        if RadioGroup1.ItemIndex < 3 then
          SQL.Add( Qt(RadioGroup1.Items.Strings[RadioGroup1.ItemIndex]) + ' , ' )
        else
          SQL.Add( Qt(Trim(Memo1.Text)) + ' , ' );

        SQL.Add( Qt(getDocCode1) + ' , ' );                      //upd_oper
        SQL.Add( Qt(Upddate)+','+Qt(Updtime)+')');
        //SQL.Add( Qt(DBDate(RocDate(now,'')))+','+Qt(RocTime(now,''))+')');
        execsql;
      end;
      DM.ADOLink.CommitTrans;
    except
      DM.ADOLink.RollbackTrans;
    end;

  end;
  Close;
end;

end.
