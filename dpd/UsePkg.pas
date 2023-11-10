unit UsePkg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, ExtCtrls, ComCtrls, Grids, ADODB, XPMan;

type
  TFrmUsePkg = class(TFrmMain)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    S: TCheckBox;
    O: TCheckBox;
    P: TCheckBox;
    ICD: TCheckBox;
    All: TCheckBox;
    Button1: TButton;
    Dept: TCheckBox;
    Doc: TCheckBox;
    Panel4: TPanel;
    SGPKG: TStringGrid;
    Panel5: TPanel;
    edt_icd9: TEdit;
    Label11: TLabel;
    Label17: TLabel;
    memo_s_d: TMemo;
    memo_o_d: TMemo;
    Label18: TLabel;
    memo_fee_desc: TMemo;
    Label19: TLabel;
    Button2: TButton;
    procedure DeptClick(Sender: TObject);
    procedure SGPKGClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure CiteS();
    procedure CiteO();
    procedure CiteP();
    procedure CiteICD();
  public
    { Public declarations }
  end;

var
  FrmUsePkg: TFrmUsePkg;

implementation

uses SqlCenter, DBDM, Global, Order,Commfunc;

{$R *.dfm}

procedure TFrmUsePkg.CiteS();
var
  i:integer;
begin
  for i:= 0 to memo_s_d.Lines.Count -1 do
  begin
    FrmOrder.MemoS.Lines.Append(memo_s_d.Lines.Strings[i]);
  end;
end;
procedure TFrmUsePkg.CiteO();
var
  i:integer;
begin
  for i:= 0 to memo_o_d.Lines.Count -1 do
  begin
    FrmOrder.MemoO.Lines.Append(memo_o_d.Lines.Strings[i]);
  end;
end;
procedure TFrmUsePkg.CiteP();
var
  i:integer;
begin
  for i:= 0 to memo_fee_desc.Lines.Count -1 do
  begin
    FrmOrder.MemoP.Lines.Append(memo_fee_desc.Lines.Strings[i]);
  end;
end;
procedure TFrmUsePkg.CiteICD();
begin
  //FrmOrder.InsertIcd(edt_icd9.Text);
  if icdchange <> 'N' then
  begin

    DM.QrySearch3.Close;
    DM.QrySearch3.SQL.Clear;
    DM.QrySearch3.SQL.Add('select icd_code from icd9_trans_icd10 where icd9_code='+qt(Trim(edt_icd9.Text)));
    DM.QrySearch3.Open;
    if not DM.QrySearch3.IsEmpty then
      FrmOrder.InsertIcd10(Trim(DM.QrySearch3.FieldByName('icd_code').AsString))
    else
      FrmOrder.InsertIcd10(Trim(edt_icd9.Text));
  end
  else
  begin
    FrmOrder.InsertIcd(edt_icd9.Text);
  end;

end;

procedure TFrmUsePkg.DeptClick(Sender: TObject);
var
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql :String;
begin
  inherited;
  if TCheckBox(Sender).Checked then
  begin
    SQLs:=TStringList.Create;
    tmpSql:=getChkSqlStr(11);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$ITEM_NO$','P');


    if TCheckBox(Sender).Name = 'Dept' then
    begin
      SetParamter(tmpSql,'$DOC_CODE$','DPD');
      Doc.Checked:=false;
    end
    else
    begin
      SetParamter(tmpSql,'$DOC_CODE$',getDocCode1);
      Dept.Checked:=false;
    end;
    SQLs.Text:=tmpSql;

    SGPKG.ColWidths[1]:=-1;
    SGPKG.ColWidths[0]:=SGPKG.Width-20;
    DM.OpenSQL(SQLs,SGPKG);
    SQLs.Free;

    edt_icd9.Text :='';
    memo_fee_desc.Clear;
    memo_s_d.Clear;
    memo_o_d.Clear;
  end;
end;

procedure TFrmUsePkg.SGPKGClick(Sender: TObject);
var
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql,class_id_upd,fee_code_upd,Code :String;
begin
  inherited;
  if (TStringGrid(Sender).Col = 0) and (TStringGrid(Sender).Row > 0) then
  begin
    class_id_upd := TStringGrid(Sender).Cells[1,TStringGrid(Sender).Row];
    fee_code_upd := TStringGrid(Sender).Cells[0,TStringGrid(Sender).Row];

    if Doc.Checked then
      Code:=getDocCode1
    else
      Code:='DPD';

    SQLs:=TStringList.Create;
    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',Code);
    SetParamter(tmpSql,'$ITEM_NO$','6');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_upd);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
      edt_icd9.Text := trim(Qrys.FieldByName('fee_desc').AsString);


    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',Code);
    SetParamter(tmpSql,'$ITEM_NO$','P');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_upd);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_fee_desc.Clear;
      while not Qrys.Eof do
      begin
        memo_fee_desc.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;

    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',Code);
    SetParamter(tmpSql,'$ITEM_NO$','S');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_upd);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_s_d.Clear;
      while not Qrys.Eof do
      begin
        memo_s_d.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;

    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',Code);
    SetParamter(tmpSql,'$ITEM_NO$','O');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_upd);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_o_d.Clear;
      while not Qrys.Eof do
      begin
        memo_o_d.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;
  end;
  FreeAndNil(SQLs);
end;

procedure TFrmUsePkg.Button1Click(Sender: TObject);
begin
  inherited;
  if All.Checked then
  begin
    CiteS;
    CiteO;
    CiteP;
    CiteICD;
    Exit;
  end;

  if S.Checked then
    CiteS;

  if O.Checked then
    CiteO;

  if P.Checked then
    CiteP;

  if ICD.Checked then
    CiteICD;
end;

procedure TFrmUsePkg.Button2Click(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmUsePkg.FormShow(Sender: TObject);
begin
  inherited;
  Label19.Caption:=Setsys.ReadString('DPD','MX','MX')+' 內容';
  P.Caption:='帶入'+Setsys.ReadString('DPD','MX','MX');
end;

procedure TFrmUsePkg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := Cafree;
end;

procedure TFrmUsePkg.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmUsePkg := nil;
end;

end.
