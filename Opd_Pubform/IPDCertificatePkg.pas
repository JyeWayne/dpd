unit IPDCertificatePkg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, Grids, Buttons, ExtCtrls, ComCtrls, XPMan;

type
  TFrmIPDCertificatePkg = class(TFrmMain)
    Panel2: TPanel;
    StringGrid1: TStringGrid;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Sg1: TStringGrid;
    Sg2: TStringGrid;
    GroupBox2: TGroupBox;
    Memo2: TMemo;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    BtnClose: TBitBtn;
    BtnDel: TBitBtn;
    BtnUse: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure StringGrid1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BtnUseClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  sSQL : TStrings;
  public
    { Public declarations }
  end;

var
  FrmIPDCertificatePkg: TFrmIPDCertificatePkg;

implementation

uses Commfunc, DBDM, Global, IPDCertificate;

{$R *.dfm}

procedure TFrmIPDCertificatePkg.StringGrid1Click(Sender: TObject);
begin
  inherited;
  if StringGrid1.Row > 0 then
  begin
    if RadioGroup1.ItemIndex <> 2 then
    begin
      Memo1.Lines.Text := Sg1.Cells[1,StringGrid1.Row];
      Memo2.Lines.Text := Sg1.Cells[2,StringGrid1.Row];
    end
    else
    begin
      Memo1.Lines.Text := Sg2.Cells[1,StringGrid1.Row];
      Memo2.Lines.Text := Sg2.Cells[2,StringGrid1.Row];
    end;
  end;
end;

procedure TFrmIPDCertificatePkg.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  ComboBox1.Visible := RadioGroup1.ItemIndex =0;
  ComboBox2.Visible := RadioGroup1.ItemIndex =1;
  if RadioGroup1.ItemIndex = 0 then
  begin
    sSQL.Text := 'select sample_name "範本名稱",DIAGNOSIS,TREATMENT from sample_medical_certificate where doc_code='+Qt(ReTurnId(combobox1.Text));
    DM.OpenSQL(sSQL,Sg1);
    StringGrid1.RowCount := Sg1.RowCount;
    StringGrid1.Cols[0] := Sg1.Cols[0];

    BtnDel.Enabled := True;
  end
  else if RadioGroup1.ItemIndex = 1 then
  begin
    sSQL.Text := 'select sample_name "範本名稱",DIAGNOSIS,TREATMENT from sample_medical_certificate where doc_code='+Qt(NullStrto(ReTurnId(combobox2.Text),getDeptCode));
    DM.OpenSQL(sSQL,Sg1);
    StringGrid1.RowCount := Sg1.RowCount;
    StringGrid1.Cols[0] := Sg1.Cols[0];
    BtnDel.Enabled := True;
  end
  else
  begin
    StringGrid1.RowCount := Sg2.RowCount;
    StringGrid1.Cols[0] := Sg2.Cols[0];
    BtnDel.Enabled := False;
  end;
end;

procedure TFrmIPDCertificatePkg.FormShow(Sender: TObject);

begin
  inherited;
  sSQL := TSTringList.Create;
  sSQL.Text := 'select sample_name "範本名稱",DIAGNOSIS,TREATMENT from sample_medical_certificate where doc_code='+Qt(getDocCode);
  DM.OpenSQL(sSQL,Sg1);//醫師範本
  sSQL.Text := 'select opd_date "開立日期",DIAGNOSIS,TREATMENT from medical_certificate where chr_no='+Qt(Getchrno)+' order by 1 desc';
  DM.OpenSQL(sSQL,Sg2);//醫師範本
  //FreeAndNil(sSQL);
  ComboBox1.Items.Text := Uuser.Text;
  ComBoBox2.Items.Text := Dept.Text;
  SetCbbItem(comBoBox1,getDocCode);
  SetCbbItem(comBoBox2,getDeptCode);
end;

procedure TFrmIPDCertificatePkg.BtnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmIPDCertificatePkg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := Cafree;
end;

procedure TFrmIPDCertificatePkg.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmIPDCertificatePkg := nil;
end;

procedure TFrmIPDCertificatePkg.BtnUseClick(Sender: TObject);
begin
  inherited;
  FrmIPDCertificate.Memo1.Lines.Append(Memo1.Lines.Text);
  FrmIPDCertificate.Memo2.Lines.Append(Memo2.Lines.Text);
end;

procedure TFrmIPDCertificatePkg.BtnDelClick(Sender: TObject);
begin
  inherited;
  if DM.ADOLink.InTransaction then
    DM.ADOLink.CommitTrans;
  try
    DM.ADOLink.BeginTrans;
    With DM.QryUpdate do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE from sample_medical_certificate where doc_code=');
      if RadioGroup1.ItemIndex = 0 then
        SQL.Add(Qt(ReTurnId(ComBoBox1.Text)))
      else
        SQL.Add(Qt(ReturnId(ComBoBox2.Text)));
      SQL.Add(' AND sample_name='+Qt(StringGrid1.Cells[0,StringGrid1.row]));
      EXECSQL;
    end;
    DM.ADOLink.CommitTrans;
  except
    DM.ADOLink.RollbackTrans;
  end;
  if RadioGroup1.ItemIndex >=0 then
    RadioGroup1Click(RadioGroup1);
end;

procedure TFrmIPDCertificatePkg.ComboBox1Change(Sender: TObject);
begin
  inherited;
  sSQL := TSTringList.Create;
  sSQL.Text := 'select sample_name "範本名稱",DIAGNOSIS,TREATMENT from sample_medical_certificate where doc_code='+Qt(ReTurnId(ComboBox1.Text));
  DM.OpenSQL(sSQL,Sg1);
  StringGrid1.RowCount := Sg1.RowCount;
  StringGrid1.Cols[0] := Sg1.Cols[0];
end;

procedure TFrmIPDCertificatePkg.ComboBox2Change(Sender: TObject);
begin
  inherited;
  sSQL := TSTringList.Create;
  sSQL.Text := 'select sample_name "範本名稱",DIAGNOSIS,TREATMENT from sample_medical_certificate where doc_code='+Qt(ReTurnId(ComboBox2.Text));
  DM.OpenSQL(sSQL,Sg1);
  StringGrid1.RowCount := Sg1.RowCount;
  StringGrid1.Cols[0] := Sg1.Cols[0];
end;

end.
