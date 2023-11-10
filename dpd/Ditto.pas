unit Ditto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, ExtCtrls, ComCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, ADODB, XPMan, ShellAPI;

type
  TFrmDitto = class(TFrmMain)
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    SGOpd: TStringGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    S: TMemo;
    H: TMemo;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet8: TTabSheet;
    SGMed: TStringGrid;
    SGFee: TStringGrid;
    SGLab: TStringGrid;
    SGXRay: TStringGrid;
    SGChk: TStringGrid;
    AddS: TCheckBox;
    AddO: TCheckBox;
    AddICD: TCheckBox;
    AddAll: TCheckBox;
    Button1: TButton;
    AddMed: TCheckBox;
    AddFee: TCheckBox;
    AddLab: TCheckBox;
    AddMtrl: TCheckBox;
    AddChk: TCheckBox;
    AddXRay: TCheckBox;
    Button2: TButton;
    EdtChrNo: TEdit;
    EdtPatName: TEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    O: TMemo;
    AddP: TCheckBox;
    SGMtrl: TStringGrid;
    Panel14: TPanel;
    Panel15: TPanel;
    P: TMemo;
    AddH: TCheckBox;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SGOpdDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure EdtChrNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure SGOpdDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    procedure ClearItem(Sender : TObject);
    procedure CiteS();
    procedure CiteO();
    procedure CiteP();
    procedure CiteH();
    procedure CiteICD(icd:string);
    procedure HISLst(chr_no:string);
  public
    { Public declarations }
  end;

var
  FrmDitto: TFrmDitto;

implementation

uses DBDM, SqlCenter, Order, Global, LagReport, DPDFunc, OldOrderList,
  Commfunc;

{$R *.dfm}

procedure TFrmDitto.HISLst(chr_no:string);
var
  tmpSql :String;
  SQLs :TStrings;
begin

  SQLs:=TStringList.Create;
  SGOpd.ColWidths[4]:=-1;
  tmpSql:=getDittoSql(1);
  SetParamter(tmpSql,'$CHR_NO$',chr_no);
  SQLs.Text:=tmpSql;
  DM.OpenSQL(SQLs,SGOpd,true);
  SGOpd.Row:=0;
  SQLs.Free;
  //SGOpdDblClick(SGOpd);
end;


procedure TFrmDitto.CiteS();
var
  i:integer;
begin
  FrmOrder.MemoS.Clear;
  FrmOrder.MemoS.Text:=S.Text;
end;
procedure TFrmDitto.CiteO();
var
  i:integer;
begin
  FrmOrder.MemoO.Clear;
  FrmOrder.MemoO.Text:=O.Text;
end;
procedure TFrmDitto.CiteP();
var
  i:integer;
  tmpSql :String;
  SQLs :TStrings;
  Qrys :TADOQuery;
begin
  FrmOrder.MemoP.Clear;
  FrmOrder.MemoP.Text:=P.Text;
end;
procedure TFrmDitto.CiteH();
var
  i:integer;
begin
  FrmOrder.MemoH.Clear;
  FrmOrder.MemoH.Text:=H.Text;
end;
procedure TFrmDitto.CiteICD(icd:string);
begin
  //FrmOrder.InsertIcd(icd);
  if (icdchange<>'N') THEN
    FrmOrder.InsertIcd10(icd)
  ELSE
    FrmOrder.InsertIcd(icd);
end;

procedure TFrmDitto.ClearItem(Sender : TObject);
var
  i,iIndex : Integer;
  thecontrol : Twincontrol;
begin
  for iIndex := 0 to TForm(Sender).ComponentCount -1 do
  begin
    theControl := TWinControl(TForm(Sender).Components[iIndex]);
    if (theControl is TEdit) and (TEdit(theControl).Tag <> 999) then
      TEdit(theControl).Text := ''
    else if theControl is TStringGrid then
    begin
      //例外不清除的
      if TStringGrid(TheControl).Tag =777 then
        Continue;
      for i := TStringGrid(TheControl).FixedRows to TStringGrid(TheControl).RowCount -1 do
        TStringGrid(TheControl).Rows[i].Clear;
      if TStringGrid(TheControl).Tag <> 999 then
        TStringGrid(TheControl).RowCount := TStringGrid(TheControl).FixedRows+1;
    end
    else if theControl is TRichEdit then
      TRichEdit(Thecontrol).Lines.Text := ''
    else if theControl is TMemo then
      TMemo(Thecontrol).Lines.Text := ''
    else if theControl is TCheckBox then
      TCheckBox(Thecontrol).Checked := false;

  end;
end;

procedure TFrmDitto.Button2Click(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmDitto.FormShow(Sender: TObject);
begin
  inherited;
  ClearItem(FrmDitto);
  HISLst(EdtChrNo.Text);
  Panel15.Caption:=Setsys.ReadString('DPD','MX','MX')+' 內容';
  AddP.Caption:=Setsys.ReadString('DPD','MX','MX');
end;

procedure TFrmDitto.SGOpdDblClick(Sender: TObject);
var
  Qrys :TADOQuery;
  tmpSql,SEQ_NO :String;
  SQLs :TStrings;
  i:integer;
begin
  inherited;
  try
    TStringGrid(Sender).Refresh;
    ClearItem(FrmDitto);
    SQLs:=TStringList.Create;

    //tmpSql:=getDittoSql(2);
    if(icdchange<>'N') then
      tmpSql:=getDittoSql(11)
    else
      tmpSql:=getDittoSql(2);

    SetParamter(tmpSql,'$FEE_NO$',SGOpd.Cells[4,SGOpd.Row]);
    SQLs.Text:=tmpSql;

    if DM.OpenSQL(SQLs,Qrys) then
    begin
      S.Lines.Text:=Qrys.FieldByName('SUB_DESC2').AsString;
      O.Lines.Text:=Qrys.FieldByName('OBJ_DESC').AsString;
      P.Lines.Text:=Qrys.FieldByName('PLAN_DESC').AsString;
      H.Lines.Text:=Qrys.FieldByName('SUB_DESC').AsString;
      Edit1.Text:=Qrys.FieldByName('ICD9_CODE1').AsString;
      Edit2.Text:=Qrys.FieldByName('icd9_desc1').AsString;
      Edit3.Text:=Qrys.FieldByName('ICD9_CODE2').AsString;
      Edit4.Text:=Qrys.FieldByName('icd9_desc2').AsString;
      Edit5.Text:=Qrys.FieldByName('ICD9_CODE3').AsString;
      Edit6.Text:=Qrys.FieldByName('icd9_desc3').AsString;
    end;

    SQLs.Clear;

    //tmpSql:=getDittoSql(3);
    if(icdchange<>'N') then
      tmpSql:=getDittoSql(12)
    else
      tmpSql:=getDittoSql(3);

    SetParamter(tmpSql,'$FEE_NO$',SGOpd.Cells[4,SGOpd.Row]);
    SQLs.Text:=tmpSql;

    if DM.OpenSQL(SQLs,Qrys) then
    begin
      i:=7;
      while not Qrys.Eof do
      begin
        if FrmDitto.FindComponent('Edit'+IntToStr(i)) <> nil then
          TEdit(FrmDitto.FindComponent('Edit'+IntToStr(i))).Text:=Qrys.FieldByName('sdiag_code').AsString
        else
          break;
        i:=i+1;
        TEdit(FrmDitto.FindComponent('Edit'+IntToStr(i))).Text:=Qrys.FieldByName('icd9_desc').AsString;
        i:=i+1;
        Qrys.Next;
      end;
    end;

    SQLs.Clear;
    tmpSql:=getDittoSql(4);
    SetParamter(tmpSql,'$FEE_NO$',SGOpd.Cells[4,SGOpd.Row]);
    SQLs.Text:=tmpSql;
    DM.OpenSQL(SQLs,SGMed);

    SEQ_NO:=Setsys.ReadString('DPD','FixedAmt','');
    SQLs.Clear;
    tmpSql:=getDittoSql(5);
    SetParamter(tmpSql,'$ORDER_TYPE$','F');
    //tmpSql:=StringReplace(tmpSql,'$FEE_TYPE$',FEE_TYPE,[rfReplaceAll]);
    SetParamter(tmpSql,'$SEQ_NO1$',ReturnID(SEQ_NO));
    SetParamter(tmpSql,'$SEQ_NO2$',ReturnName(SEQ_NO));
    SetParamter(tmpSql,'$FEE_NO$',SGOpd.Cells[4,SGOpd.Row]);
    SQLs.Text:=tmpSql;
    DM.OpenSQL(SQLs,SGFee);
    SGFee.Visible:=true;

    SQLs.Clear;
    tmpSql:=getDittoSql(6);
    SetParamter(tmpSql,'$FEE_NO$',SGOpd.Cells[4,SGOpd.Row]);
    SQLs.Text:=tmpSql;
    DM.OpenSQL(SQLs,SGLab);

    SQLs.Clear;
    tmpSql:=getDittoSql(5);
    SetParamter(tmpSql,'$ORDER_TYPE$','S');
    //tmpSql:=StringReplace(tmpSql,'$FEE_TYPE$',FEE_TYPE,[rfReplaceAll]);
    SetParamter(tmpSql,'$SEQ_NO1$',ReturnID(SEQ_NO));
    SetParamter(tmpSql,'$SEQ_NO2$',ReturnName(SEQ_NO));
    SetParamter(tmpSql,'$FEE_NO$',SGOpd.Cells[4,SGOpd.Row]);
    SQLs.Text:=tmpSql;
    DM.OpenSQL(SQLs,SGMtrl);

    SQLs.Clear;
    tmpSql:=getDittoSql(7);
    SetParamter(tmpSql,'$FEE_NO$',SGOpd.Cells[4,SGOpd.Row]);
    SQLs.Text:=tmpSql;
    DM.OpenSQL(SQLs,SGXRay);

    SQLs.Clear;
    tmpSql:=getDittoSql(8);
    SetParamter(tmpSql,'$FEE_NO$',SGOpd.Cells[4,SGOpd.Row]);
    SQLs.Text:=tmpSql;
    DM.OpenSQL(SQLs,SGChk);
  except
  end;
  SQLs.Free;

end;

procedure TFrmDitto.Button1Click(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if (AddAll.Checked) or (AddS.Checked) then
    CiteS;

  if (AddAll.Checked) or (AddO.Checked) then
    CiteO;

  if (AddAll.Checked) or (AddP.Checked) then
    CiteP;

  if (AddAll.Checked) or (AddH.Checked) then
    CiteH;

  if (AddAll.Checked) or (AddICD.Checked) then
  begin
    if Edit1.Text <> '' then
      CiteICD(Edit1.Text);
    if Edit3.Text <> '' then
      CiteICD(Edit3.Text);
    if Edit5.Text <> '' then
      CiteICD(Edit5.Text);
    if Edit7.Text <> '' then
      CiteICD(Edit7.Text);
    if Edit9.Text <> '' then
      CiteICD(Edit9.Text);
    if Edit11.Text <> '' then
      CiteICD(Edit11.Text);
    if Edit13.Text <> '' then
      CiteICD(Edit13.Text);
    if Edit15.Text <> '' then
      CiteICD(Edit15.Text);
    if Edit17.Text <> '' then
      CiteICD(Edit17.Text);
    if Edit19.Text <> '' then
      CiteICD(Edit19.Text);
  end;

  if (AddAll.Checked) or (AddMed.Checked) then
  begin
    SLMed.Clear;
    for i:=0 to SGMed.RowCount - 1 do
      if SGMed.Cells[0,i] <> '' then
        SLMed.Add(SGMed.Cells[0,i]+'_'+SGMed.Cells[4,i]+'_'+SGMed.Cells[3,i]+'_'+SGMed.Cells[5,i]+'_'+SGMed.Cells[7,i]+'_'+SGMed.Cells[2,i]+'_'+SGMed.Cells[6,i]+'_'+'-1');
  end;

  if (AddAll.Checked) or (AddFee.Checked) then
  begin
    SLFee.Clear;
    for i:=0 to SGFee.RowCount - 1 do
      if SGFee.Cells[0,i] <> '' then
        SLFee.Add(SGFee.Cells[0,i]);
  end;

  if (AddAll.Checked) or (AddLab.Checked) then
  begin
    SLLab.Clear;
    for i:=0 to SGLab.RowCount - 1 do
      if SGLab.Cells[0,i] <> '' then
        SLLab.Add(SGLab.Cells[0,i]+'_'+SGLab.Cells[1,i]+'_'+SGLab.Cells[2,i]+'_'+SGLab.Cells[3,i]+'_'+SGLab.Cells[4,i]);
  end;

  if (AddAll.Checked) or (AddMtrl.Checked) then
  begin
    SLMtrl.Clear;
    for i:=0 to SGMtrl.RowCount - 1 do
      if SGMtrl.Cells[0,i] <> '' then
        SLMtrl.Add(SGMtrl.Cells[0,i]);
  end;

  if (AddAll.Checked) or (AddXRay.Checked) then
  begin
    SLXRay.Clear;
    for i:=0 to SGXRay.RowCount - 1 do
      if SGXRay.Cells[0,i] <> '' then
        SLXRay.Add(SGXRay.Cells[8,i]+'_'+SGXRay.Cells[6,i]+'_'+SGXRay.Cells[0,i]+'_'+SGXRay.Cells[1,i]+'_'+SGXRay.Cells[7,i]+'_'+SGXRay.Cells[2,i]+'_'+SGXRay.Cells[3,i]);
  end;

  if (AddAll.Checked) or (AddChk.Checked) then
  begin
    SLChk.Clear;
    for i:=0 to SGChk.RowCount - 1 do
      if SGChk.Cells[0,i] <> '' then
        SLChk.Add(SGChk.Cells[0,i]+'_'+SGChk.Cells[1,i]+'_'+SGChk.Cells[2,i]);
  end;
  Self.Close;
end;

procedure TFrmDitto.Button3Click(Sender: TObject);
var
  weblink : String;
begin
  inherited;
  WebLink:=SetSys.ReadString('WEB','檢驗','');
  comStrRep(WebLink);
  ShellExecute(Handle, 'open', 'iexplore.exe', PChar(WebLink), '', SW_SHOWNORMAL);
end;

procedure TFrmDitto.EdtChrNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  tmpSql :String;
  SQLs :TStrings;
  Qrys :TADOQuery;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    EdtChrNo.Text:=ADChar(EdtChrNo.Text,'0',8);

    SQLs:=TStringList.Create;
    tmpSql:=getChkSqlStr(43);
    SetParamter(tmpSql,'$CHR_NO$',EdtChrNo.Text);
    SQLs.Text:=tmpSql;

    if DM.OpenSQL(SQLs,Qrys) then
    begin
      ClearItem(FrmDitto);
      EdtPatName.Text:=trim(Qrys.FieldByName('Pat_Name').AsString);
      HISLst(EdtChrNo.Text);
    end;
    SQLs.Free;
  end;
end;

procedure TFrmDitto.Button4Click(Sender: TObject);
begin
  inherited;
  if trim(EdtChrNo.Text) <> '' then
  begin
    if not assigned(FrmOldOrderList) then
      FrmOldOrderList := TFrmOldOrderList.Create(Self);
    FrmOldOrderList._DB := DM.ADOLink;
    FrmOldOrderList.Chr_no := EdtChrNo.Text;
    FrmOldOrderList.StringGrid1.Enabled:=false;
    FrmOldOrderList.BitBtn1.Enabled:=false;
    FrmOldOrderList.BitBtn2.Enabled:=false;
    FrmOldOrderList.BitBtn3.Enabled:=false;
    FrmOldOrderList.ShowModal;                  
    FrmOldOrderList.StringGrid1.Enabled:=True;
    FrmOldOrderList.BitBtn1.Enabled:=True;
    FrmOldOrderList.BitBtn2.Enabled:=True;
    FrmOldOrderList.BitBtn3.Enabled:=True;
  end;
end;

procedure TFrmDitto.SGOpdDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if TStringGrid(Sender).Row = ARow then
    TStringGrid(Sender).Canvas.Brush.Color :=$00FFD7D7
  else
    TStringGrid(Sender).Canvas.Brush.Color :=$00CBFEFD;

  TStringGrid(Sender).Canvas.FillRect(Rect);
  TStringGrid(Sender).Canvas.TextOut(Rect.Left + 1, Rect.Top + 1, Trim(TStringGrid(Sender).Cells[ACol,ARow]));
  
end;

procedure TFrmDitto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action:=cafree;
end;

procedure TFrmDitto.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmDitto:=nil;
end;

procedure TFrmDitto.Button5Click(Sender: TObject);
var
  mystr,myparamter: string;
begin
  inherited;
  myStr :=Setsys.ReadString('DPD','OPDADV','');
  myParamter := Setsys.ReadString('ADV','DISEASESUMMARY','');
  comStrRep(mystr);
  comstrRep(myParamter);
  comAdvStrRep(myStr,'');
  comAdvStrRep(myParamter,'');
  if myStr ='' then
  begin
    showMessage(NullStrTo(gsSysMsg,'此功能不開放使用，如有疑問請洽資訊室詢問。'));
    Exit;
  end;
  try
    WinExecAndWait32(myStr+' '+myParamter,SW_SHOWNORMAL);
  except
    Exit;
  end;
  FrmOrder.MemoO.Lines.Add('已查閱過病摘');
end;

end.
