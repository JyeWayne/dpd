unit HosPiceList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, Buttons, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids,
  Mask, DBCtrls, DB, ADODB, XPMan;

type
  TFrmHosPiceList = class(TFrmMain)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboBox1: TComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Edit1: TEdit;
    DBEdit7: TDBEdit;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox4: TGroupBox;
    Memo1: TMemo;
    Panel3: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit7: TEdit;
    CheckBox1: TCheckBox;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DateTimePicker2: TDateTimePicker;
    ComboBox2: TComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    BitBtn1: TBitBtn;
    Query1: TADOQuery;
    Query2: TADOQuery;
    Query3: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    DNR_No,cankey : String;
    procedure Cleardata();
    function get_age(birth_date, AC_TYPE, OPD_DATE,y_m_d :string):string;
    function date_transform(dt,ac_type :string):string;
    procedure Between_MonthsDays(start_date,end_date,m_d:String;out months,days:Integer);
  public
    { Public declarations }
    Chr_no,Fee_no,oper_id,ModifyKind{1:新增 2:查詢修改} : String;
  end;

var
  FrmHosPiceList: TFrmHosPiceList;

implementation

uses Commfunc, DBDM, Global;

{$R *.dfm}

{ TFrmMain1 }

procedure TFrmHosPiceList.Between_MonthsDays(start_date, end_date, m_d: String;
  out months, days: Integer);
var
    year1,month1,day1,year2,month2,day2:integer;
begin
  months:=0;
  days:=0;
  if end_date > start_date then
  begin
    year1:=StrToInt(copy(start_date,1,4));
    month1:=StrToInt(copy(start_date,5,2));
    day1:=StrToInt(copy(start_date,7,2));
    year2:=StrToInt(copy(end_date,1,4));
    month2:=StrToInt(copy(end_date,5,2));
    day2:=StrToInt(copy(end_date,7,2));
    if m_d = 'd' then
    begin
      months:=(year2-year1)*12+month2-month1;
      days:=day2-day1;
      if days < 0 then
      begin
        months:=months-1;
        days:=(MonthDays[IsLeapYear(year1),month1]+day2-day1)+1;
      end;
    end
    else
    begin
      months:=(year2-year1)*12+month2-month1;
      days:=0;
    end;
  end;

end;

procedure TFrmHosPiceList.Cleardata;
begin
  RadioGroup1.ItemIndex := -1;
  Edit7.Text := '';
  CheckBox1.Checked := False;
  Memo1.Lines.Clear;
  DNR_No:='';
  cankey:= 'N';
end;

function TFrmHosPiceList.date_transform(dt, ac_type: string): string;
var
  y : string;
begin
  Result := '';
  if ac_type = '-' then
  begin
    y := IntToStr(1912-StrToInt(copy(dt,1,LENGTH(dt)-4)));
    y := y+copy(dt,LENGTH(dt)-3,4);
  end
  else
  begin
    y := IntToStr(StrToInt(copy(dt,1,LENGTH(dt)-4))+1911);
    y := y+copy(dt,LENGTH(dt)-3,4);
  end;
  Result := y;
end;

function TFrmHosPiceList.get_age(birth_date, AC_TYPE, OPD_DATE,
  y_m_d: string): string;
var
  months,days : integer;
begin
  Between_MonthsDays(date_transform(Trim(birth_date),AC_TYPE),date_transform(OPD_DATE,'+'),'d',months,days);
  if days > 0 then
    months := months + 1;
  if UpperCase(y_m_d) = 'Y' then
  begin
    if (months mod 12) <> 0 then
      Result := IntToStr((months div 12)+1)+'歲'
    else
      Result := IntToStr(months div 12)+'歲';
  end
  else if UpperCase(y_m_d) = 'M' then
  begin
    if (months mod 12) <> 0 then
      Result := IntToStr((months div 12))+'歲'+IntToStr((months mod 12))+'月'
    else
      Result := IntToStr(months div 12)+'歲';
  end  
  else if UpperCase(y_m_d) = 'D' then
  begin
    if days > 0 then
      months := months - 1;
    if (months mod 12) <> 0 then
    begin
      if days > 0 then
        Result := IntToStr((months div 12))+'歲'+IntToStr((months mod 12))+'月'+ IntToStr(days)+'日'
      else
        Result := IntToStr((months div 12))+'歲'+IntToStr((months mod 12))+'月';
    end
    else
      if days > 0 then
        Result := IntToStr(months div 12)+'歲'+ IntToStr(days)+'日'
      else
        Result := IntToStr(months div 12)+'歲'; 
  end
  else if UpperCase(y_m_d) = '1' then
  begin
    if (months mod 12) <> 0 then
      Result := IntToStr((months div 12))+'_'+IntToStr((months mod 12))
    else
      Result := IntToStr(months div 12)+'_0';
  end
  else if UpperCase(y_m_d) = '2' then
  begin
    if (months mod 12) <> 0 then
      Result := IntToStr((months div 12)+1)//未滿一年算一年
    else
      Result := IntToStr(months div 12);
  end;

end;

procedure TFrmHosPiceList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := Cafree;
end;

procedure TFrmHosPiceList.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmHosPiceList := nil;
end;

procedure TFrmHosPiceList.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if DM.ADOLink.InTransaction then
    DM.ADOLink.CommitTrans;
  Try
    if DNR_No <>'' then
    begin
      DM.ADOLink.BeginTrans;
      With Query3 do
      begin
        Close;
        SQL.Clear;
        SQL.Add( 'UPDATE hospice_basic Set Sign_id='+Qt(IntToStr(RadioGroup1.itemIndex))+',Can_cd ='+Qt(CanKey)+' ,Sign_Name='+qt(Edit7.text)+',' );
        SQL.Add( ' End_id='+Qt(ReTurnID(ComboBox2.text))+',End_Date='+Qt(RocDate(DateTimePicker1.DateTime,''))+',End_Time='+qt(RocTime(DateTimePicker2.Datetime,'')));
        SQL.Add( ',hospice_Memo='''+(Memo1.Lines.Text)+'''' );
        SQL.Add( ' Where hospice_No ='+Qt(DNR_No));
        execsql;
      end;
    end;
    DM.ADOLink.CommitTrans;
  except
    DM.ADOLink.RollbackTrans;
    ShowMessage('維護資料失敗');
  end;
  Query1.Close;
  Query1.Open;
end;

procedure TFrmHosPiceList.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  if not Query1.Eof then
    With Query1 do
    begin
      ModifyKind := '2';
      Dnr_no := FieldbyName('hospice_NO').AsString;
      RadioGroup1.ItemIndex := FieldbyName('Sign_id').AsInteger;
      Edit7.Text := FieldbyName('Sign_Name').AsString;
      CheckBox1.Checked :=  FieldbyName('Can_cd').AsString='D';
      SetCbbItem(ComBoBox2,Trim(NullStrTo(FieldbyName('End_id').AsString,oper_id)));
      Memo1.Lines.Text := FieldbyName('hospice_MEMO').AsString;
      DateTimePicker3.DateTime :=  RocToDate(NullStrTo(FieldbyName('BookDate1').AsString,RocDate(now,'')));
      DateTimePicker3.Enabled := False;
      //Memo1.Lines.Text := FieldbyName('DNR_MEMO').AsString;
      if FieldbyName('can_CD').asString <>'N' then
      begin
        DateTimePicker1.DateTime :=  RocToDate(FieldbyName('End_date').AsString);
        DateTimePicker2.DateTime :=  RocToTime(FieldbyName('End_time').AsString);
      end;
      BitBtn1.Caption := '修改';
      BitBtn1.Enabled := FieldbyName('CAN_CD').AsString ='N';

      Label15.Caption :='資料維護人員 : '+ FieldbyName('a').AsString;
    end;

  {if CheckBox1.Checked then
    cankey := 'D'
  else
    cankey := 'N';}
  CheckBox1Click(CheckBox1);
end;

procedure TFrmHosPiceList.Button3Click(Sender: TObject);
var
  SQLStr : String;
begin
  SQLStr := 'UPDATE hospice_basic Set Can_cd=''Y'',can_date='+Qt(RocDate(now,''))+',Can_Time='+Qt(RocTime(now,''))+',Can_Id='+Qt(oper_id)
    + ' Where hospice_no='+Qt(DNR_No)+' And chr_No ='+Qt(chr_No)+' and Can_cd<>''Y''';
  if DM.ADOLink.InTransaction then
    DM.ADOLink.CommitTrans;
  Try
    DM.ADOLink.BeginTrans;
    With Query3 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:= SQLStr;
      execsql;
    end;
    DM.ADOLink.CommitTrans;
  except
    DM.ADOLink.RollbackTrans;
    ShowMessage('維護資料失敗');
  end;
  Query1.Close;
  Query1.Open;

end;

procedure TFrmHosPiceList.Button2Click(Sender: TObject);
begin
  inherited;
  if RadioGroup1.itemIndex < 0 then
  begin
    ShowMessage('請先選擇簽屬人員');
    exit;
  end;
  Button2.Visible := False;

  if DM.ADOLink.InTransaction then
    DM.ADOLink.CommitTrans;
  Try
    DM.ADOLink.BeginTrans;
    With Query3 do
    begin
      Close;
      SQL.Clear;
      if ModifyKind ='1' then
      begin
        SQL.Add('insert into hospice_basic (hospice_No,Chr_No,Fee_no,hospice_kind,' );
        SQL.Add('Can_id,Can_Date,Can_Time,Sign_id,Sign_Name,Sign_Rel,Can_cd,End_id,End_Date,End_Time,' );
        SQL.Add('Oper_id,Oper_Date,Oper_Time,hospice_Memo,BooKDate1) Values ((select nvl(max(to_number(hospice_no))+1,''1'') from hospice_basic),');
        SQL.Add(Qt(chr_no)+','+Qt(Fee_no)+',''1'','''','''','''','+Qt(IntToStr(RadioGroup1.itemIndex))+','+Qt(Edit7.text)+','''',' );
        if CheckBox1.Checked then
          SQL.Add('''D'','+Qt(ReTurnID(ComboBox2.text))+','+Qt(RocDate(DateTimePicker1.DateTime,''))+','+Qt(ROcTime(DateTimePicker2.DateTime,'')) )
        else
          SQL.Add('''N'','''','''',''''');
        SQL.Add(','+Qt(oper_id)+','+Qt(RocDate(now,''))+','+Qt(RocTIme(now,''))+','+Qt(Memo1.Lines.Text)+','+Qt(RocDate(DateTimePicker3.DateTime,''))+')');
      end
      else
      begin
        if DNR_No <>'' then
        begin
          SQL.Add( 'UPDATE hospice_basic Set Sign_id='+Qt(IntToStr(RadioGroup1.itemIndex))+',Can_cd ='+Qt(CanKey)+' ,Sign_Name='+qt(Edit7.text)+',' );
          SQL.Add( ' End_id='+Qt(ReTurnID(ComboBox2.text))+',End_Date='+Qt(RocDate(DateTimePicker1.DateTime,''))+',End_Time='+qt(RocTime(DateTimePicker2.Datetime,'')));
          SQL.Add( ',hospice_Memo='''+Memo1.Lines.Text+'''' );
          SQL.Add( ' Where hospice_No ='+Qt(DNR_No));
        end;
      end;
      execsql;
    end;
    DM.ADOLink.CommitTrans;
  except
    DM.ADOLink.RollbackTrans;
    ShowMessage('維護資料失敗');
  end;
  Query1.Close;
  Query1.Open;
end;

procedure TFrmHosPiceList.Button1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmHosPiceList.FormShow(Sender: TObject);
VAR
  ROOM_STR,ROOMNO,DOCLIST :STRING;
begin
  ROOMNO   := '';
  ROOM_STR := '';
  DOCLIST  := '';

  DateTimePicker1.DateTime := now();
  DateTimePicker2.DateTime := now();
  DateTimePicker3.DateTime := now();
  ComboBox2.Items.Clear;
  DNR_No := '';
  Button2.Enabled := false;
  Button3.Enabled := false;
  BitBtn1.Enabled := false;
  with Query3 do
  begin
    Close;
    sql.Clear;
    sql.Add('select * from control_condition where ctrl_name=''Tranquil'' AND CNCL_FLAG=''N'' AND SDATE<= '+QuotedStr(FormatDateTime('YYYYMMDD',Now))+' AND EDATE>='+QuotedStr(FormatDateTime('YYYYMMDD',Now)));
    Open;
    if not Eof then
    begin
      room_str := trim(FieldByName('ctrl_rule').asstring);
      if ReturnID(room_str)='DOCCODE' then
      begin
        room_str := ReturnName(room_str);
        room_str := copy(room_str,1,pos('^',room_str)-1);
        repeat
          roomno := copy(room_str,1,pos('|',room_str)-1);
          if oper_id = roomno then
          begin
            Button2.Enabled := true;
            Button3.Enabled := true;
            BitBtn1.Enabled := true;
          end;
          IF TRIM(DOCLIST) = '' THEN
            DOCLIST := ''+ROOMNO
          ELSE
            DOCLIST := DOCLIST +';'+ ROOMNO;
          room_str := copy(room_str,pos('|',room_str)+1,length(room_str));
        until pos('|', room_str) = 0;
        DOCLIST := DOCLIST +'';
      end;
    end;
   { Close;
    SQL.Clear;
    SQL.Add('Select Trim(Doc_code)||''_''||Trim(Doc_Name) as aa from Doc_BASIC where DOC_PHAR_FLAG=''D'' and doc_code in ('+Qt(DOCLIST)+')');
    Open;
    while not Eof do
    begin
      ComboBox2.Items := gsVs;
      Next;
    end;  }
    Close;
  end;
  ComboBox2.Items := VsDoc;
  SetCbbItem(ComboBox2,oper_id);
  if Trim(Chr_no)<>'' then
  begin
    with Query2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select CHR_BASIC.* from CHR_BASIC where CHR_NO='+Qt(chr_no));
      Open;
      SetCbbItem(ComBoBox1,FieldByName('Sex_type').AsString);
      Edit1.Text := get_age(Trim(FieldByName('BIRTH_DATE').AsString),Trim(FieldByName('AC_TYPE').AsString),RocDate(now,''),'M');
    end;
    with Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from hospice_basic where CHR_NO='+Qt(chr_no)+' and can_cd=''N'' order by 1');
      Open;
      if Eof then
        Button2.Visible := True
      else
        Button2.Visible := False;
      Close;
      SQL.Clear;
      SQL.Add('Select hospice_basic.*,decode(can_cd,''D'',''已撤除'',''N'',''有效'',can_cd) AS CAN_FLAG,(select USER_name from User_basic where USER_id=oper_id) as a from hospice_basic where CHR_NO='+Qt(chr_no)+' and can_cd<>''Y'' order by to_number(HOSPICE_NO) desc');
      Open;
      if (RecordCount = 1) and (Button2.Visible = False) then
        DBGrid1DblClick(DBGrid1);
    end;
  end;

end;

procedure TFrmHosPiceList.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CHeckBox1.Checked then
    cankey := 'D'
  else
    cankey := 'N';
end;

end.
