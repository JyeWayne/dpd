unit warning;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask,
  DBCtrls, dbcgrids, OleCtrls, SHDocVw, ComCtrls, DB, XPMan;

type
  TFrmWarning = class(TFrmMain)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    WebBrowser1: TWebBrowser;
    TabSheet2: TTabSheet;
    DBCtrlGrid1: TDBCtrlGrid;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    BtnClose: TBitBtn;
    BtnModify: TBitBtn;
    btnDel: TBitBtn;
    btnNew: TBitBtn;
    BtnClear: TBitBtn;
    CheckBox1: TCheckBox;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBEdit1: TDBEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    FEE_CODE: TEdit;
    FEE_DESC: TEdit;
    ALISE_DESC: TEdit;
    med_type: TEdit;
    OPD_DATE: TEdit;
    Label4: TLabel;
    ATC_CODE: TEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    GroupBox5: TGroupBox;
    edtAlg1: TEdit;
    edtAlg2: TEdit;
    edtAlg3: TEdit;
    GroupBox6: TGroupBox;
    drug_inter1: TCheckBox;
    drug_inter2: TCheckBox;
    drug_inter3: TCheckBox;
    drug_inter6: TCheckBox;
    drug_inter5: TCheckBox;
    drug_inter4: TCheckBox;
    CheckBox2: TCheckBox;
    btnAlg: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    DBText2: TDBText;
    Label7: TLabel;
    DBText3: TDBText;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure DBCtrlGrid1Click(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FEE_CODEChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FEE_CODEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNewClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnModifyClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FEE_DESCChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ALISE_DESCChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnAlgClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    Procedure NDate();
    procedure UDate();
  public
    { Public declarations }
  end;

var
  FrmWarning: TFrmWarning;

implementation

uses Commfunc, DBDM, Global, SqlCenter , DPDFunc;

{$R *.dfm}

procedure TFrmWarning.FormShow(Sender: TObject);
var
  weblink : String;
begin
  inherited;
  WebLink:=SetSys.ReadString('WEB','過敏史','');
  comStrRep(WebLink);
  SetParamter(WebLink,'$+MEDCODE+$','');
  WebBrowser1.Navigate(WebLink);
  DM.QrySubSearch.Close;
  DataSource1.DataSet :=  DM.QrySubSearch;
  with DM.QrySubSearch do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from OPD_WARNING2 where CHR_NO='+Qt(GetChrno)+' and nvl(MED_CODE ,''nil'')<>''nil''');
    open;
  end;
  with DM.QrySearch3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select substr(ALG_DESC,1,40) AS ALG1,substr(ALG_DESC,41,40) AS ALG2,substr(ALG_DESC,81,40) AS ALG3 from ALG_BASIC where CHR_NO='+Qt(GetChrno));
    open;
    edtAlg1.Text := FieldbyName('ALG1').AsString;
    edtAlg2.Text := FieldbyName('ALG2').AsString;
    edtAlg3.Text := FieldbyName('ALG3').AsString;
  end;
end;

procedure TFrmWarning.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := Cafree;
end;

procedure TFrmWarning.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmWarning := nil;
end;

procedure TFrmWarning.DBCtrlGrid1Click(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  If not DM.QrySubSearch.Eof then
  begin
    CheckBox1.Checked := True;
    CheckBox1.Hint := DM.QrySubSearch.fieldByName('UPD_TIME').AsString;
    //CheckBox1Click(CheckBox1);
    FEE_CODE.Text := DM.QrySubSearch.fieldByName('MED_CODE').AsString;
    FEE_DESC.Text := DM.QrySubSearch.fieldByName('MED_DESC').AsString;
    ALISE_DESC.Text := DM.QrySubSearch.fieldByName('ALISE_DESC').AsString;
    med_type.Text := DM.QrySubSearch.fieldByName('med_type').AsString;
    OPD_DATE.Text := DM.QrySubSearch.fieldByName('UPD_DATE').AsString;
    OPD_DATE.Hint := DM.QrySubSearch.fieldByName('UPD_TIME').AsString;
    ATC_CODE.Text := DM.QrySubSearch.fieldByName('ATC_CODE').AsString;
    Memo1.Text := DM.QrySubSearch.fieldByName('ADR_DESC').AsString;
    with DM.QryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from opd_warning3 where chr_no='+Qt(getchrno));
      SQL.Add(' and upd_oper='+Qt(DM.QrySubSearch.fieldByName('UPD_OPER').AsString)+' and upd_date='+Qt(DM.QrySubSearch.fieldByName('UPD_DATE').AsString));
      SQL.Add(' and UPD_TIME='+Qt(DM.QrySubSearch.fieldByName('UPD_TIME').AsString)+' and MED_CODE='+QT(DM.QrySubSearch.fieldByName('MED_CODE').AsString));
      Open;
      for i := 1 to 6 do
        TCheckBox(FrmWarning.FindComponent('drug_inter'+IntToStr(i))).Checked := NullStrTo(fieldByName('drug_inter'+IntToStr(i)).AsString,'N') ='Y';
    end;
    CheckBox2.Checked := DM.QrySubSearch.fieldByName('STOP_FLAG').AsString ='Y';
    //for i := 1 to 6 do
    //  TCheckBox(FrmWarning.FindComponent('drug_inter'+IntToStr(i))).Checked := NullStrTo(Query1.fieldByName('drug_inter'+IntToStr(i)).AsString,'N') ='Y';

  end

end;

procedure TFrmWarning.BtnClearClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  FEE_CODE.Text := '';
  FEE_DESC.Text := '';
  ALISE_DESC.Text := '';
  med_type.Text := '';
  CheckBox1.Hint := '';
  OPD_DATE.Text :='';
  ATC_CODE.Text := '';
  Memo1.Lines.Clear;
  for i := 1 to 6 do
    TCheckBox(FrmWarning.FindComponent('drug_inter'+IntToStr(i))).Checked := False;
  CheckBox1.Checked := False;
  CheckBox1Click(CheckBox1);

end;

procedure TFrmWarning.CheckBox1Click(Sender: TObject);
begin
  inherited;
  BtnNew.Enabled := not CheckBox1.Checked;
  BtnMoDify.Enabled :=  CheckBox1.Checked;
  BtnDel.Enabled :=  CheckBox1.Checked;
end;

procedure TFrmWarning.NDate;
  function Check(sender : TObject): String;
  begin
    if TcheckBox(Sender).Checked then
      Result := 'Y'
    else
      Result := 'N';
  end;
var
  TheSQL ,Tempstr: String;
  i : Integer;
begin
  try
    With DM.QryInsert do
    begin
      Close;
      Tempstr := RocTimes(now,'');//為了讓新增進去的資料時間一致
      SQL.Clear;
      SQL.Add('INSERT INTO OPD_WARNING2 (CHR_NO,MED_CODE,ALISE_DESC,MED_DESC,COMM_DESC,MED_TYPE,UPD_DATE,UPD_TIME,UPD_OPER');
      SQL.Add(',OPER_NAME,ATC_CODE,ADR_DESC,STOP_FLAG,UPD_OPER2,UPD_DATE2,UPD_TIME2 )');
      SQL.Add('Values ');
      SQL.Add('('':CHR_NO'','':MED_CODE'','':ALISE_DESC'','':MED_DESC'','':COMM_DESC'','':MED_TYPE'','':UPD_DATE'','':UPD_TIME'','':UPD_OPER''');
      SQL.Add(','':OPER_NAME'','':ATC_CODE'','':ADR_DESC'','':STOP_FLAG'','':UPDOPER2'','':UPDDATE2'','':UPDTIME2'' )');
      TheSQL := SQL.Text;
      SetParamter(TheSQL,':CHR_NO',getChrno);
      SetParamter(TheSQL,':MED_CODE',Trim(FEE_CODE.Text));
      SetParamter(TheSQL,':ALISE_DESC',Trim(ALISE_DESC.Text));
      SetParamter(TheSQL,':MED_DESC',Trim(FEE_DESC.Text));
      SetParamter(TheSQL,':COMM_DESC','');
      SetParamter(TheSQL,':MED_TYPE',Trim(med_type.Text));
      SetParamter(TheSQL,':UPD_DATE',RocDate(now,''));
      SetParamter(TheSQL,':UPD_TIME',Tempstr);
      SetParamter(TheSQL,':UPD_OPER',getDocCode1);
      SetParamter(TheSQL,':OPER_NAME',getDocName1);
      SetParamter(TheSQL,':ATC_CODE',ATC_CODE.Text);
      SetParamter(TheSQL,':ADR_DESC',Copy(Memo1.Lines.Text,1,254));
      SetParamter(TheSQL,':STOP_FLAG',Check(CheckBox2));
      SetParamter(TheSQL,':UPDOPER2','');
      SetParamter(TheSQL,':UPDDATE2','');
      SetParamter(TheSQL,':UPDTIME2','');
      SQL.Text := TheSQL;
      EXECSQL;
      TheSQL := '';
      TheSQL := 'INSERT INTO OPD_WARNING3 (CHR_NO,MED_CODE,DRUG_INTER1,DRUG_INTER2,DRUG_INTER3,DRUG_INTER4,DRUG_INTER5,DRUG_INTER6,OPD_DATE,NO_FLAG,UPD_DATE,UPD_TIME,UPD_OPER)'
              + ' Values '
              + '('':CHR_NO'','':MED_CODE'','':DRUG_INTER1'','':DRUG_INTER2'','':DRUG_INTER3'','':DRUG_INTER4'','':DRUG_INTER5'','':DRUG_INTER6'','':OPD_DATE'','':NO_FLAG'','':UPD_DATE'','':UPD_TIME'','':UPD_OPER'')';
      SetParamter(TheSQL,':CHR_NO',GetChrNo);
      SetParamter(TheSQL,':MED_CODE',Trim(FEE_CODE.Text));
      SetParamter(TheSQL,':DRUG_INTER1',Check(drug_inter1));
      SetParamter(TheSQL,':DRUG_INTER2',Check(drug_inter2));
      SetParamter(TheSQL,':DRUG_INTER3',Check(drug_inter3));
      SetParamter(TheSQL,':DRUG_INTER4',Check(drug_inter4));
      SetParamter(TheSQL,':DRUG_INTER5',Check(drug_inter5));
      SetParamter(TheSQL,':DRUG_INTER6',Check(drug_inter6));
      SetParamter(TheSQL,':OPD_DATE',NullStrTo(Trim(OPD_DATE.Text),RocDate(now,'')));
      SetParamter(TheSQL,':NO_FLAG','N');
      SetParamter(TheSQL,':UPD_DATE',RocDate(now,''));
      SetParamter(TheSQL,':UPD_TIME',Tempstr);
      SetParamter(TheSQL,':UPD_OPER',getDocCode1);
      Close;
      SQL.Text := TheSQL;
      EXECSQL;
      TheSQL := '';     //更新alg_basic
      With DM.QryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from alg_basic where chr_no=' + Qt(getchrno));
        Open;
        if not Eof then
        begin
          TheSQL := 'Update ALG_BASIC set ALG_DESC = rpad( '+ Qt(edtAlg1.Text)+',40,'' '')||rpad( ' + Qt(edtAlg2.Text)+',40,'' '')||rpad( ' + Qt(edtAlg3.Text)+',40,'' '')'
                  + ' , UPD_OPER = ' + Qt(getDocCode1)
                  + ' , UPD_DATE = ' + Qt(RocDate(now,''))
                  + ' , UPD_TIME = to_char(sysdate, ''hh24mi'')'
                  + ' where chr_no= ' + Qt(getchrno) ;
        end
        else
        begin
          TheSQL := 'INSERT INTO ALG_BASIC (CHR_NO,ALG_DESC,UPD_OPER,UPD_DATE,UPD_TIME)'
                  + ' Values '
                  + '('':CHR_NO'','':ALG_DESC'','':UPD_OPER'','':UPD_DATE'',''to_char(sysdate,''hh24mi'')'')';
          SetParamter(TheSQL,':CHR_NO',GetChrNo);
          //SetParamter(TheSQL,':ALG_DESC',Qt(edtAlg1.Text + edtAlg2.Text + edtAlg3.Text));
          SetParamter(TheSQL,':ALG_DESC',edtAlg1.Text + edtAlg2.Text + edtAlg3.Text);
          SetParamter(TheSQL,':UPD_DATE',RocDate(now,''));
          SetParamter(TheSQL,':UPD_TIME',Tempstr);
          //SetParamter(TheSQL,':UPD_TIME',Copy(Tempstr,1,4));
          SetParamter(TheSQL,':UPD_OPER',getDocCode1);
        end;
        Close;
        SQL.Text := TheSQL;
        EXECSQL;
      end;
    end;
  except
    sql_time_log('WARNING',TheSQL);
  end;
end;

procedure TFrmWarning.UDate;
begin
  With DM.QryUpdate do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE OPD_WARNING2');
    SQL.Add('Where Chr_no='+Qt(getChrno)+' and UPD_OPER='+Qt(getDocCode1)+' and MED_CODE='+Qt(FEE_CODE.Text));
    SQL.Add(' And UPD_DATE='+Qt(OPD_DATE.Text)+' and UPD_TIME='+Qt(CheckBox1.Hint));
    EXECSQL;
  end;
end;

procedure TFrmWarning.FEE_CODEChange(Sender: TObject);
begin
  inherited;
  if Fee_Code.Focused then
  begin
    if not CheckBox1.Checked then
      if Trim(TEDIT(Sender).TEXT) <>'' then
      begin
        With DM.QrySearch3 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select a.*,decode(USE_STATUS,''1'',''供'',''2'',''缺'',''停'') use_type from OrderItem_basic a where Trim(order_type)=''M'' and Upper('+TEdit(SEnder).Name+') like '+Qt('%'+Trim(UPPERCASE(TEdit(SEnder).TEXT))+'%'));
          //SQL.Add('Select * from OrderItem_basic where Trim(order_type)=''M'' and Upper('+TEdit(SEnder).Name+') like '+Qt('%'+Trim(UPPERCASE(TEdit(SEnder).TEXT))+'%'));

          open;
          if not Eof then
            DBGrid1.Visible := True
          else
            DBGrid1.Visible := False;

        end;
      end
      else
        DBGrid1.Visible := False;
    end;
end;

procedure TFrmWarning.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  alise_desc.Text := Trim(DM.QrySearch3.fieldByName('FEE_NAME').AsString);
  FEE_code.Text := Trim(DM.QrySearch3.fieldByName('FEE_code').AsString);
  FEE_desc.Text := Trim(DM.QrySearch3.fieldByName('FEE_desc').AsString);

  med_type.Text := Trim(DM.QrySearch3.fieldByName('MED_TYPE').AsString);
  ATC_CODE.Text := Trim(DM.QrySearch3.fieldByName('ATC_CODE').AsString);
  DM.QrySearch3.Close;
  DBGrid1.Visible := false;

  //交叉過敏檢核
  if (Copy(Trim(med_type.Text),1,5) = '02020') and (Trim(med_type.Text)<>'02020100') and (Trim(med_type.Text)<>'02020600')  and (Trim(med_type.Text)<>'02021000') then    //NASIDs類
  begin
    drug_inter1.Checked := True;

    drug_inter2.Checked := False;
    drug_inter3.Checked := False;
    drug_inter4.Checked := False;
    drug_inter5.Checked := False;
    drug_inter6.Checked := False;
  end
  else if Copy(Trim(med_type.Text),1,6) = '100101' then    //Penicillin類
  begin
    drug_inter2.Checked := True;

    drug_inter1.Checked := False;
    drug_inter3.Checked := False;
    drug_inter4.Checked := False;
    drug_inter5.Checked := False;
    drug_inter6.Checked := False;

  end
  else if Copy(Trim(med_type.Text),1,6) = '100102' then    //Cephalosporin類
  begin
    drug_inter3.Checked := True;

    drug_inter1.Checked := False;
    drug_inter2.Checked := False;
    drug_inter4.Checked := False;
    drug_inter5.Checked := False;
    drug_inter6.Checked := False;
  end
  else if Trim(med_type.Text) = '10010700' then    //Tetracycline類
  begin
    drug_inter4.Checked := True;

    drug_inter1.Checked := False;
    drug_inter2.Checked := False;
    drug_inter3.Checked := False;
    drug_inter5.Checked := False;
    drug_inter6.Checked := False;
  end
  else if (Trim(med_type.Text) = '10010900') or (Trim(med_type.Text) = '02021000') then    //Sulfonamide類
  begin
    drug_inter5.Checked := True;

    drug_inter1.Checked := False;
    drug_inter2.Checked := False;
    drug_inter3.Checked := False;
    drug_inter4.Checked := False;
    drug_inter6.Checked := False;
  end
  //else if Copy(Trim(med_type.Text),1,5) = '01070' then   
  else if (Copy(Trim(ATC_CODE.Text),1,4) = 'N03A')  and (Copy(Trim(ATC_CODE.Text), 1, 5) <> 'N03AG') and (Copy(Trim(ATC_CODE.Text), 1, 5) <> 'N03AX') then    //Anticonvulsant類
  begin
    drug_inter6.Checked := True;

    drug_inter1.Checked := False;
    drug_inter2.Checked := False;
    drug_inter3.Checked := False;
    drug_inter4.Checked := False;
    drug_inter5.Checked := False;
  end
  else
  begin
    drug_inter1.Checked := False;
    drug_inter2.Checked := False;
    drug_inter3.Checked := False;
    drug_inter4.Checked := False;
    drug_inter5.Checked := False;
    drug_inter6.Checked := False;
  end;

end;

procedure TFrmWarning.FEE_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case key of
    VK_DOWN :
    begin
      DM.QrySearch3.Next;
      Key := 0;
    end;
    VK_UP :
    begin
      DM.QrySearch3.Prior;
      Key := 0;
    end;
    VK_RETURN :
    begin
      DBGrid1DblClick(DBGrid1);
      Key := 0;
      DBGrid1.Visible := False;
    end;
  end;
end;

procedure TFrmWarning.btnNewClick(Sender: TObject);
begin
  inherited;
  if Trim(Memo1.Text) = '' then
  begin
    Showmessage('請敘述病人過敏/不良反應症狀或注意事項');
    Memo1.SetFocus;
    Exit;
  end;
  if DM.ADOLink.InTransaction then
    DM.ADOLink.CommitTrans;
  Try
    DM.ADOLink.BeginTrans ;
    NDate;
    DM.ADOLink.CommitTrans;
  except
    DM.ADOLink.RollbackTrans;
  end;
  DM.QrySubSearch.Close;
  DM.QrySubSearch.Open;
  WebBrowser1.Refresh;
  BtnClearClick(BtnClear);
end;

procedure TFrmWarning.BtnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmWarning.BtnModifyClick(Sender: TObject);
begin
  inherited;
  if Trim(Memo1.Text) = '' then
  begin
    Showmessage('請敘述病人過敏/不良反應症狀或注意事項');
    Memo1.SetFocus;
    Exit;
  end;
  if DM.ADOLink.InTransaction then
    DM.ADOLink.CommitTrans;
  Try
    DM.ADOLink.BeginTrans;
    UDate;
    NDate;
    DM.ADOLink.CommitTrans;
  except
    DM.ADOLink.RollbackTrans;
  end;
  DM.QrySubSearch.Close;
  DM.QrySubSearch.Open;
  WebBrowser1.Refresh;
  BtnClearClick(BtnClear);
end;

procedure TFrmWarning.btnDelClick(Sender: TObject);
begin
  inherited;
  if DM.ADOLink.InTransaction then
    DM.ADOLink.CommitTrans;
  Try
    DM.ADOLink.BeginTrans;
    UDate;
    DM.ADOLink.CommitTrans;
  except
    DM.ADOLink.RollbackTrans;
  end;
  DM.QrySubSearch.Close;
  DM.QrySubSearch.Open;
  WebBrowser1.Refresh;
  BtnClearClick(BtnClear);
end;

procedure TFrmWarning.PageControl1Change(Sender: TObject);
var
  WebLink : String;
begin
  inherited;
  if PageControl1.ActivePageIndex = 0 then
  begin
    WebLink:=SetSys.ReadString('WEB','過敏史','');
    comStrRep(WebLink);
    SetParamter(WebLink,'$+MEDCODE+$','');
    WebBrowser1.Navigate(WebLink);
  end;
end;

procedure TFrmWarning.FEE_DESCChange(Sender: TObject);
begin
  inherited;
  if TEDIT(Sender).Focused then
  begin
    if not CheckBox1.Checked then
      if Trim(TEDIT(Sender).TEXT) <>'' then
      begin
        With DM.QrySearch3 do
        begin
          Close;
          SQL.Clear;
          //SQL.Add('Select * from OrderItem_basic where Trim(order_type)=''M'' and ((UPPER(Fee_DESC) like '+Qt(UPPERCASE(FEE_DESC.Text)+'%')+' ) or (UPPER(Fee_Name) like '+Qt(UPPERCASE(FEE_DESC.Text)+'%')+' ))');
          SQL.Add('Select a.*,decode(USE_STATUS,''1'',''供'',''2'',''缺'',''停'') use_type from OrderItem_basic a where Trim(order_type)=''M'' and ((UPPER(Fee_DESC) like '+Qt(UPPERCASE(FEE_DESC.Text)+'%')+' ) or (UPPER(Fee_Name) like '+Qt(UPPERCASE(FEE_DESC.Text)+'%')+' ))');
          open;
          if not Eof then
            DBGrid1.Visible := True
          else
            DBGrid1.Visible := False;
        end;
      end
      else
        DBGrid1.Visible := False;
  end;
end;

procedure TFrmWarning.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmWarning.ALISE_DESCChange(Sender: TObject);
begin
  inherited;
  if TEDIT(Sender).Focused then
  begin
    if not CheckBox1.Checked then
      if Trim(TEDIT(Sender).TEXT) <>'' then
      begin
        With DM.QrySearch3 do
        begin
          Close;
          SQL.Clear;
          //SQL.Add('Select * from OrderItem_basic  where Trim(order_type)=''M'' and ((UPPER(Fee_NAME) like '+Qt(UPPERCASE(ALISE_DESC.Text)+'%')+' ) or (UPPER(Fee_Name) like '+Qt(UPPERCASE(ALISE_DESC.Text)+'%')+' ))');
          SQL.Add('Select a.*,decode(USE_STATUS,''1'',''供'',''2'',''缺'',''停'') use_type from OrderItem_basic a where Trim(order_type)=''M'' and ((UPPER(Fee_NAME) like '+Qt(UPPERCASE(ALISE_DESC.Text)+'%')+' ) or (UPPER(Fee_Name) like '+Qt(UPPERCASE(ALISE_DESC.Text)+'%')+' ))');
          open;
          if not Eof then
            DBGrid1.Visible := True
          else
            DBGrid1.Visible := False;
        end;
      end
      else
        DBGrid1.Visible := False;
  end;
end;



procedure TFrmWarning.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column.Fieldname='USE_TYPE' then
    if Column.Field.asString = '供' then
      with Sender as TDBGrid do
      begin
        canvas.Font.color:=clblue;
        DefaultDrawColumnCell(Rect, DataCol,Column, State);
      end;

end;

procedure TFrmWarning.btnAlgClick(Sender: TObject);
var
  TheSQL ,Tempstr: String;
  i : Integer;
begin
  Tempstr := RocTimes(now,'');//為了讓新增進去的資料時間一致
  TheSQL := '';     //更新alg_basic
  With DM.QryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from alg_basic where chr_no=' + Qt(getchrno));
    Open;
    if not Eof then
    begin
      TheSQL := 'Update ALG_BASIC set ALG_DESC = rpad( '+ Qt(edtAlg1.Text)+',40,'' '')||rpad( ' + Qt(edtAlg2.Text)+',40,'' '')||rpad( ' + Qt(edtAlg3.Text)+',40,'' '')'
              + ' , UPD_OPER = ' + Qt(getDocCode1)
              + ' , UPD_DATE = ' + Qt(RocDate(now,''))
              + ' , UPD_TIME = ' + Qt(Copy(Tempstr,1,4))
              + ' where chr_no= ' + Qt(getchrno) ;
    end
    else
    begin
      TheSQL := 'INSERT INTO ALG_BASIC (CHR_NO,ALG_DESC,UPD_OPER,UPD_DATE,UPD_TIME)'
              + ' Values '
              + '('':CHR_NO'','':ALG_DESC'','':UPD_OPER'','':UPD_DATE'','':UPD_TIME'')';
      SetParamter(TheSQL,':CHR_NO',GetChrNo);
      //SetParamter(TheSQL,':ALG_DESC',edtAlg1.Text + edtAlg2.Text + edtAlg3.Text);
      SetParamter(TheSQL,':ALG_DESC',edtAlg1.Text + edtAlg2.Text + edtAlg3.Text);
      SetParamter(TheSQL,':UPD_DATE',RocDate(now,''));
      SetParamter(TheSQL,':UPD_TIME',Tempstr);
      SetParamter(TheSQL,':UPD_TIME',Copy(Tempstr,1,4));
      SetParamter(TheSQL,':UPD_OPER',getDocCode1);
    end;
    Close;
    SQL.Text := TheSQL;
    EXECSQL;
  end;
end;

procedure TFrmWarning.BitBtn2Click(Sender: TObject);
begin
  inherited;
  edtAlg1.Text := 'nil';
  edtAlg2.Text := '';
  edtAlg3.Text := '';
end;

end.
