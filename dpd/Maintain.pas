unit Maintain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, ExtCtrls, ComCtrls, Grids, HgHGrid, HgGrid, StdCtrls, ADODB,
  XPMan;

type
  TFrmMaintain = class(TFrmMain)
    Panel1: TPanel;
    HG_DOCList: THyperGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Ckb_Leave: TCheckBox;
    Edt_ID: TEdit;
    Edt_Name: TEdit;
    Edt_PSW: TEdit;
    Edt_LeaveDate: TEdit;
    Edt_Amt1: TEdit;
    Edt_Amt2: TEdit;
    Edt_Dept: TEdit;
    Cmb_doc: TComboBox;
    Cmb_Trans: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Ckb_DecDoc: TCheckBox;
    Ckb_PbmDoc: TCheckBox;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure HG_DOCListDblClick(Sender: TObject);
    procedure HG_DOCListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Edt_IDChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    Row,Col:Integer;
    procedure SetDocList();
  public
    { Public declarations }
    OperID:String;
  end;

var
  FrmMaintain: TFrmMaintain;

implementation

uses DBDM, Commfunc;

{$R *.dfm}

procedure TFrmMaintain.SetDocList();
var
  Qrys:TADOQuery;
  SQLs:TStrings;
  isTrue:Boolean;
begin
  Qrys:=TADOQuery.Create(nil);
  SQLs:=TStringList.Create;
  SQLs.Text:=' select doc_code,pswd_desc,trim(doc_name) doc_name,decode(dec_doc,''0'',''否'',''是'') dec_doc,decode(pbm_doc,''0'',''否'',''是'') pbm_doc,off_date, ';
  SQLs.Add(' ins_amt1,ins_amt2,dept_code,vs_ts,tran_treat,remark from DENTAL_DOC_BASIC order by doc_code ');
  HG_DOCList.Clear;
  isTrue:=DM.OpenSQL(SQLs,Qrys);
  if isTrue then
    HG_DOCList.LoadFromDataSet(Qrys,false,0,1);

  Edt_ID.Text:='';
  Edt_Name.Text:='';
  Edt_PSW.Text:='';
  Ckb_Leave.Checked := false;
  Ckb_DecDoc.Checked := false;
  Ckb_PbmDoc.Checked := false;
  Edt_LeaveDate.Text:='9991231';
  Edt_Amt1.Text:='0';
  Edt_Amt2.Text:='0';
  Cmb_doc.ItemIndex:=0;
  Cmb_Trans.ItemIndex:=0;
  Edt_ID.Enabled:=true;
end;

procedure TFrmMaintain.FormShow(Sender: TObject);
begin
  inherited;
  Row:=0;
  Col:=0;
  SetDocList;
end;

procedure TFrmMaintain.Button2Click(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmMaintain.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmMaintain:=nil;
end;

procedure TFrmMaintain.HG_DOCListDblClick(Sender: TObject);
begin
  inherited;
  if (Row >= 0) and (Col >= 0) and (Row <= (THyperGrid(Sender).RowCount -1)) and (Col <= (THyperGrid(Sender).ColCount -1)) then
  begin
    Edt_ID.Text:=THyperGrid(Sender).Cells[0,Row];
    Edt_Name.Text:=THyperGrid(Sender).Cells[2,Row];
    Edt_PSW.Text:=THyperGrid(Sender).Cells[1,Row];
    if THyperGrid(Sender).Cells[11,Row] = '0' then
      Ckb_Leave.Checked := false
    else
      Ckb_Leave.Checked := true;
    if THyperGrid(Sender).Cells[3,Row] = '否' then
      Ckb_DecDoc.Checked := false
    else
      Ckb_DecDoc.Checked := true;
    if THyperGrid(Sender).Cells[4,Row] = '否' then
      Ckb_PbmDoc.Checked := false
    else
      Ckb_PbmDoc.Checked := true;
    Edt_LeaveDate.Text:=THyperGrid(Sender).Cells[5,Row];
    Edt_Amt1.Text:=THyperGrid(Sender).Cells[6,Row];
    Edt_Amt2.Text:=THyperGrid(Sender).Cells[7,Row];
    Edt_Dept.Text:=THyperGrid(Sender).Cells[8,Row];
    if THyperGrid(Sender).Cells[9,Row] = 'D' then
      Cmb_doc.ItemIndex:=0
    else if THyperGrid(Sender).Cells[9,Row] = 'T' then
      Cmb_doc.ItemIndex:=1
    else if THyperGrid(Sender).Cells[9,Row] = 'V' then
      Cmb_doc.ItemIndex:=2
    else if THyperGrid(Sender).Cells[9,Row] = 'A' then
      Cmb_doc.ItemIndex :=3 ;

    if THyperGrid(Sender).Cells[10,Row] = 'N' then
      Cmb_Trans.ItemIndex:=0
    else
      Cmb_Trans.ItemIndex:=1;

    Edt_ID.Enabled:=false;
  end;
end;

procedure TFrmMaintain.HG_DOCListSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  Row:=ARow;
  Col:=ACol;
end;

procedure TFrmMaintain.Button1Click(Sender: TObject);
var
  SQLs:TStrings;
  isTrue:Boolean;
  Leave,dec,pbm,vt,tran:String;
begin
  inherited;
  SQLs:=TStringList.Create;
  SQLs.Text:= ' select * from DENTAL_DOC_BASIC where doc_code='''+trim(Edt_ID.Text)+''' ';
  isTrue:=DM.OpenSQL(SQLs);

  if Ckb_Leave.Checked then
    Leave:='D'
  else
    Leave:='0';
  if Ckb_DecDoc.Checked then
    dec:='1'
  else
    dec:='0';
  if Ckb_pbmDoc.Checked then
    pbm:='1'
  else
    pbm:='0';

  case (Cmb_doc.ItemIndex) of
      0:
        vt:='D';
      1:
        vt:='T';
      2:
        vt:='V';
      3:
        vt:='A';
  end;

  case (Cmb_trans.ItemIndex) of
      0:
        tran:='N';
      1:
        tran:='Y';
  end;

  if isTrue then
  begin
    SQLs.Text:='';
    SQLs.Text:=' update DENTAL_DOC_BASIC ';
    SQLs.Add(' set pswd_desc='''+trim(Edt_Psw.Text)+''' ');
    SQLs.Add(' ,doc_name='''+trim(Edt_Name.Text)+''' ');
    SQLs.Add(' ,remark='''+trim(Leave)+''' ');
    SQLs.Add(' ,dec_doc='''+trim(dec)+''' ');
    SQLs.Add(' ,pbm_doc='''+trim(pbm)+''' ');
    SQLs.Add(' ,off_date='''+trim(Edt_LeaveDate.Text)+''' ');
    SQLs.Add(' ,ins_amt1='''+trim(Edt_Amt1.Text)+''' ');
    SQLs.Add(' ,ins_amt2='''+trim(Edt_Amt2.Text)+''' ');
    SQLs.Add(' ,dept_code='''+trim(Edt_Dept.Text)+''' ');
    SQLs.Add(' ,vs_ts='''+trim(vt)+''' ');
    SQLs.Add(' ,tran_treat='''+trim(tran)+''' ');
    SQLs.Add(' ,upd_oper='''+trim(OperID)+''' ');
    SQLs.Add(' ,upd_date='''+trim(ROCDate(now,''))+''' ');
    SQLs.Add(' ,upd_time='''+trim(ROCTime(now,''))+''' ');
    SQLs.Add(' where doc_code='''+trim(Edt_ID.Text)+''' ');
    isTrue:=DM.ExecSQL(SQLs);
    if isTrue then
      MessageDlg('更新成功',mtWarning,[mbOk],0);
  end
  else
  begin
    SQLs.Text:='';
    SQLs.Text:=' insert into DENTAL_DOC_BASIC (doc_code,pswd_desc,doc_name,remark,dec_doc,pbm_doc,off_date,ins_amt1,ins_amt2,dept_code,vs_ts,tran_treat,upd_oper,upd_date,upd_time)';
    SQLs.Add(' values ('''+trim(Edt_ID.Text)+''' ');
    SQLs.Add(' ,'''+trim(Edt_Psw.Text)+''' ');
    SQLs.Add(' ,'''+trim(Edt_Name.Text)+''' ');
    SQLs.Add(' ,'''+trim(Leave)+''' ');
    SQLs.Add(' ,'''+trim(dec)+''' ');
    SQLs.Add(' ,'''+trim(pbm)+''' ');
    SQLs.Add(' ,'''+trim(Edt_LeaveDate.Text)+''' ');
    SQLs.Add(' ,'''+trim(Edt_Amt1.Text)+''' ');
    SQLs.Add(' ,'''+trim(Edt_Amt2.Text)+''' ');
    SQLs.Add(' ,'''+trim(Edt_Dept.Text)+''' ');
    SQLs.Add(' ,'''+trim(vt)+''' ');
    SQLs.Add(' ,'''+trim(tran)+''' ');
    SQLs.Add(' ,'''+trim(OperID)+''' ');
    SQLs.Add(' ,'''+trim(ROCDate(now,''))+''' ');
    SQLs.Add(' ,'''+trim(ROCTime(now,''))+''') ');
    isTrue:=DM.ExecSQL(SQLs);
    if isTrue then
      MessageDlg('新增成功',mtWarning,[mbOk],0);
  end;
  SetDocList
end;

procedure TFrmMaintain.Edt_IDChange(Sender: TObject);
var
  low,up,mid:integer;
begin
  inherited;
  if length(trim(TEdit(Sender).Text)) in [5,6] then
  begin
    low:=1;
    up:=HG_DOCList.RowCount - 1;
    if (up mod 2) = 0 then
      mid:=up div 2
    else
      mid:=(up+1) div 2;

    while (low <= up) do
    begin
      if trim(TEdit(Sender).Text) = trim(HG_DOCList.Cells[0,mid]) then
      begin
        Row := mid;
        Col := 0;
        break;
      end
      else if (trim(TEdit(Sender).Text) <= trim(HG_DOCList.Cells[0,mid])) then
      begin
        up := mid - 1;
        if ((low+up) mod 2) = 0 then
          mid := (low+up) div 2
        else
          mid := (low+up+1) div 2;
      end
      else
      begin
        low:= mid + 1;
        if ((low+up) mod 2) = 0 then
          mid := (low+up) div 2
        else
          mid := (low+up+1) div 2;
      end;
    end;
    if low <= up then
      HG_DOCList.OnDblClick(HG_DOCList);
  end;
end;

procedure TFrmMaintain.Button3Click(Sender: TObject);
begin
  inherited;
  SetDocList;
end;

end.
