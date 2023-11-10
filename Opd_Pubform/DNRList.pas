unit DNRList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids,
  Mask, DBCtrls, DB, ADODB, XPMan;

type
  TFrmPubDNRList = class(TFrmMain)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    ComboBox1: TComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    EdtAge: TEdit;
    DBEdit7: TDBEdit;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    GroupBox4: TGroupBox;
    Memo1: TMemo;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DateTimePicker2: TDateTimePicker;
    ComboBox2: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Panel4: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Panel5: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit7: TEdit;
    CheckBox1: TCheckBox;
    DateTimePicker3: TDateTimePicker;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DSPat: TDataSource;
    DSLog: TDataSource;
    QryPat: TADOQuery;
    QryLog: TADOQuery;
    Query3: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    DNR_No,cankey : String;
    procedure Cleardata();
  public
    { Public declarations }
    _DB :TADOConnection;
    Chr_no ,Fee_no,ModifyKind{1:新增 2:查詢修改} : String;
  end;

var
  FrmPubDNRList: TFrmPubDNRList;

implementation

uses Commfunc, Global;

{$R *.dfm}

procedure TFrmPubDNRList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action  := Cafree;
end;

procedure TFrmPubDNRList.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmPubDNRList := nil;
end;

procedure TFrmPubDNRList.FormShow(Sender: TObject);
begin
  inherited;
  QryPat.Connection := _DB;
  QryLog.Connection := _DB;
  Query3.Connection := _DB;
  DateTimePicker1.DateTime := now();
  DateTimePicker2.DateTime := now();
  DateTimePicker3.DateTime := now();
  ComboBox2.Items := Uuser;
  with QryPat do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from chr_basic where chr_no='+Qt(Chr_no));
    open;
    SetCbbitem(ComboBox1,Trim(FieldByName('Sex_type').AsString));
    EdtAge.Text := GetAge(FieldByName('Birth_Date').asString,RocDate(now,''),acYear);
  end;
  With QryLog do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from DNR_BASIC where CHR_NO='+Qt(chr_no)+' and can_cd=''N'' order by 1');
    Open;
    if Eof then
      BitBtn3.Visible := True
    else
      BitBtn3.Visible := False;
    Close;
    SQL.Clear;
    SQL.Add('Select DNR_BASIC.*,(select USER_name from USER_BASIC where USER_ID=oper_id) as a,(Case when Can_Cd=''D'' then ''已撤除'' else ''有效中'' end) as KK');
    SQL.Add('from DNR_BASIC where CHR_NO='+Qt(chr_no)+' and can_cd<>''Y'' order by 1');
    Open;
    if (RecordCount = 1) and (BitBtn3.Visible = False) then
        DBGrid1DblClick(DBGrid1);
  end;
end;

procedure TFrmPubDNRList.BitBtn4Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmPubDNRList.BitBtn3Click(Sender: TObject);
begin
 if RadioGroup1.itemIndex < 0 then
  begin
    ShowMessage('請先選擇簽屬人員');
    exit;
  end;
  //Button2.Visible := False;

  if Messagedlg('[ 再次確認 ]'+#10#10+'病人 [ '+ DBEdit2.Text +' ] 是否簽署DNR之紙本 ?'+#10+
                '確定簽屬請點選 [Yes], 取消請點選 [No]'+#10,mtInformation,[mbYes,mbno],1)=mrYes then
  begin
    With Query3 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select USER_PASSWD from user_basic where User_id ='+Qt(getDocCode));
      open;
      DefFontData.Name := '細明體';

      if trim(fieldByName('USER_PASSWD').AsString)<> InputBox('[ 確認密碼 ]',ReturnName(ComboBox2.text)+'醫師 ,請確認您的登入密碼 ','') then
      begin
        ShowMessage('密碼確認錯誤!!!');
        Exit;
      end;
    end;
  end
  else
    exit;

  if _DB.InTransaction then
    _DB.CommitTrans;
  Try
    _Db.BeginTrans;
    With Query3 do
    begin
      Close;
      SQL.Clear;
      if ModifyKind ='1' then
      begin
        SQL.Add('insert into dnr_basic (Dnr_No,Chr_No,Fee_no,Dnr_kind,' );
        SQL.Add('Can_id,Can_Date,Can_Time,Sign_id,Sign_Name,Sign_Rel,Can_cd,End_id,End_Date,End_Time,' );
        SQL.Add('Oper_id,Oper_Date,Oper_Time,Dnr_Memo,BooKDate1) Values ((select Nvl(max(to_number(nvl(dnr_no,''0''))),0)+1 from dnr_basic),');
        SQL.Add(Qt(chr_no)+','+Qt(Fee_no)+',''1'','''','''','''','+Qt(IntToStr(RadioGroup1.itemIndex))+','+Qt(Edit7.text)+','''',' );
        if CheckBox1.Checked then
          SQL.Add('''D'','+Qt(ReTurnID(ComboBox2.text))+','+Qt(DBDate(RocDate(DateTimePicker1.DateTime,'')))+','+Qt(ROcTime(DateTimePicker2.DateTime,'')) )
        else
          SQL.Add('''N'','''','''',''''');
        SQL.Add(','+Qt(getDocCode)+','+Qt(DBDate(RocDate(now,'')))+','+Qt(RocTIme(now,''))+','+Qt(Memo1.Lines.Text)+','+Qt(DBDate(RocDate(DateTimePicker3.DateTime,'')))+')');
      end
      else
      begin
        if DNR_No <>'' then
        begin
          SQL.Add( 'UPDATE dnr_basic Set Sign_id='+Qt(IntToStr(RadioGroup1.itemIndex))+',Can_cd ='+Qt(CanKey)+' ,Sign_Name='+qt(Edit7.text)+',' );
          SQL.Add( ' End_id='+Qt(ReTurnID(ComboBox2.text))+',End_Date='+Qt(DbDate(RocDate(DateTimePicker1.DateTime,'')))+',End_Time='+qt(RocTime(DateTimePicker2.Datetime,'')));
          SQL.Add( ',Dnr_Memo='''+(Memo1.Lines.Text)+'''' );
          SQL.Add( ' Where Dnr_No ='+Qt(DNR_No));
        end;
      end;
      execsql;
    end;
    _Db.CommitTrans;
  except
    _Db.RollbackTrans;

    ShowMessage('維護資料失敗');
  end;
  QryLog.Close;
  QryLog.Open;

end;

procedure TFrmPubDNRList.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  if not QryLog.Eof then
    With QryLog do
    begin
      ModifyKind := '2';
      Dnr_no := FieldbyName('DNR_NO').AsString;
      RadioGroup1.ItemIndex := FieldbyName('Sign_id').AsInteger;
      Edit7.Text := FieldbyName('Sign_Name').AsString;
      CheckBox1.Checked :=  FieldbyName('Can_cd').AsString='D';
      SetCbbItem(ComBoBox2,Trim(NullStrTo(FieldbyName('End_id').AsString,getDocCode)));
      Memo1.Lines.Text := FieldbyName('DNR_MEMO').AsString;
      DateTimePicker3.DateTime :=  RocToDate(NullStrTo(FieldbyName('BookDate1').AsString,RocDate(now,'')));
      DateTimePicker3.Enabled := False;
      if FieldbyName('can_CD').asString <>'N' then
      begin
        DateTimePicker1.DateTime :=  RocToDate(FieldbyName('End_date').AsString);
        DateTimePicker2.DateTime :=  RocToTime(FieldbyName('End_time').AsString);
      end;
      BitBtn1.Caption := '修改DNR資料';
      BitBtn1.Enabled := FieldbyName('CAN_CD').AsString ='N';
      Label15.Caption :='紙本DNR確認醫師 : '+ FieldbyName('a').AsString;
    end;

  if CheckBox1.Checked then
    cankey := 'D'
  else
    cankey := 'N';
end;

procedure TFrmPubDNRList.BitBtn1Click(Sender: TObject);
begin
  if CanKey = 'D' then
  begin
    if Messagedlg('[ 再次確認 ]'+#10#10+'病人 [ '+ DBEdit2.Text +' ] 是否簽署撤除DNR之紙本 ?'+#10+
                  '確定撤除請點選 [Yes], 取消請點選 [No]'+#10,mtInformation,[mbYes,mbno],1)=mrYes then
    begin
      With Query3 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select USER_PASSWD from user_basic where User_id ='+Qt(getDocCode));
        open;
        DefFontData.Name := '細明體';

        if trim(fieldByName('USER_PASSWD').AsString)<> InputBox('[ 確認密碼 ]',ReturnName(ComboBox2.text)+'醫師 ,請確認您的登入密碼 ','') then
        begin
          ShowMessage('密碼確認錯誤!!!');
          Exit;
        end;
      end;
    end
    else
      exit;
  end;


  if _DB.InTransaction then
    _DB.CommitTrans;
  Try
    if DNR_No <>'' then
    begin
      _Db.BeginTrans;
      With Query3 do
      begin
        Close;
        SQL.Clear;
        SQL.Add( 'UPDATE dnr_basic Set Sign_id='+Qt(IntToStr(RadioGroup1.itemIndex))+',Can_cd ='+Qt(CanKey)+' ,Sign_Name='+qt(Edit7.text)+',' );
        SQL.Add( ' End_id='+Qt(ReTurnID(ComboBox2.text))+',End_Date='+Qt(DbDate(RocDate(DateTimePicker1.DateTime,'')))+',End_Time='+qt(RocTime(DateTimePicker2.Datetime,'')));
        SQL.Add( ',Dnr_Memo='''+(Memo1.Lines.Text)+'''' );
        SQL.Add( ' Where Dnr_No ='+Qt(DNR_No));
        execsql;
      end;
    end;
    _Db.CommitTrans;
  except
    _Db.RollbackTrans;
    ShowMessage('維護資料失敗');
  end;
  QryLog.Close;
  QryLog.Open;

end;

procedure TFrmPubDNRList.BitBtn2Click(Sender: TObject);
var
  SQLStr : String;
begin
  inherited;
  if Messagedlg('[ 再次確認 ]'+#10#10+'病人 [ '+ DBEdit2.Text +' ] 是否簽署撤除DNR之紙本 ?'+#10+
                '確定撤除請點選 [Yes], 取消請點選 [No]'+#10,mtInformation,[mbYes,mbno],1)=mrYes then
  begin
    With Query3 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select USER_PASSWD from user_basic where User_id ='+Qt(getDocCode));
      open;
      DefFontData.Name := '細明體';
      if trim(fieldByName('USER_PASSWD').AsString)<> InputBox('[ 確認密碼 ]',ReturnName(ComboBox2.text)+'醫師 ,請確認您的登入密碼 ','') then
      begin
        ShowMessage('密碼確認錯誤!!!');
        Exit;
      end;
    end;
  end
  else
    exit;
  



  SQLStr := 'UPDATE dnr_basic Set Can_cd=''Y'',can_date='+Qt(DBDate(RocDate(now,'')))+',Can_Time='+Qt(RocTime(now,''))+',Can_Id='+Qt(getDocCode)
    + ' Where DNR_no='+Qt(DNR_No)+' And chr_No ='+Qt(chr_No)+' and Can_cd<>''Y''';
  if _DB.InTransaction then
    _DB.CommitTrans;
  Try
    _Db.BeginTrans;
    With Query3 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:= SQLStr;
      execsql;
    end;
    _Db.CommitTrans;
  except

    _Db.RollbackTrans;
    ShowMessage('維護資料失敗');
  end;
  QryLog.Close;
  QryLog.Open;

end;

procedure TFrmPubDNRList.CheckBox1Click(Sender: TObject);
begin
  inherited;
  DateTimePicker1.Enabled := CheckBox1.Checked;
  DateTimePicker2.Enabled := CheckBox1.Checked;
  ComboBox2.Enabled := CheckBox1.Checked;
  if CheckBox1.Checked then
  begin
    cankey := 'D';
    BitBtn1.Caption := '確認撤除該DNR記錄';
    GroupBox3.Visible := True;
  end
  else
  begin
    cankey := 'N';
    BitBtn1.Caption := '修改DNR資料';
    GroupBox3.Visible := False;
  end;
end;

procedure TFrmPubDNRList.Cleardata;
begin
  RadioGroup1.ItemIndex := -1;
  Edit7.Text := '';
  CheckBox1.Checked := False;
  Memo1.Lines.Clear;
  DNR_No:='';
  cankey:= 'N';
end;

end.
