unit PKG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, ComCtrls, ADODB,
  DBCtrls, dbcgrids, DB, XPMan;

type
  TFrmPKG = class(TFrmMain)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    User: TLabel;
    User_N: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    TabSheet2: TTabSheet;
    Panel6: TPanel;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edt_fee_code: TEdit;
    BitBtn1: TBitBtn;
    memo_fee_desc: TMemo;
    edt_icd9: TEdit;
    memo_s_d: TMemo;
    memo_o_d: TMemo;
    TabSheet5: TTabSheet;
    Label11: TLabel;
    Label16: TLabel;
    memo_fee_desc_update: TMemo;
    BitBtn5: TBitBtn;
    edt_icd9_upd: TEdit;
    memo_s_d_update: TMemo;
    memo_o_d_update: TMemo;
    TabSheet6: TTabSheet;
    Label12: TLabel;
    memo_fee_desc_del: TMemo;
    BitBtn6: TBitBtn;
    edt_icd9_del: TEdit;
    memo_s_d_del: TMemo;
    memo_o_d_del: TMemo;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    ComboBox2: TComboBox;
    Edit9: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    ComboBox3: TComboBox;
    BitBtn8: TBitBtn;
    Edit42: TEdit;
    Edit43: TEdit;
    TabSheet7: TTabSheet;
    Panel3: TPanel;
    PageControl3: TPageControl;
    TabSheet8: TTabSheet;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    edt_pkg_name: TEdit;
    memo_pkg_mx_new: TMemo;
    edt_pkd_icd9_new: TEdit;
    memo_pkg_s_d_new: TMemo;
    TabSheet9: TTabSheet;
    Label37: TLabel;
    Label38: TLabel;
    memo_pkg_mx_upd: TMemo;
    edt_pkd_icd9_upd: TEdit;
    memo_pkg_s_d_upd: TMemo;
    memo_pkg_o_d_upd: TMemo;
    TabSheet10: TTabSheet;
    Label42: TLabel;
    memo_pkg_mx_del: TMemo;
    edt_pkd_icd9_del: TEdit;
    memo_pkg_s_d_del: TMemo;
    memo_pkg_o_d_del: TMemo;
    SGPKGUpd1: TStringGrid;
    SGPKGDel1: TStringGrid;
    SGPKGUpd2: TStringGrid;
    SGPKGDel2: TStringGrid;
    DsMed: TDataSource;
    PanelMed: TPanel;
    DBCGMed: TDBCtrlGrid;
    Bevel1: TBevel;
    DBText2: TDBText;
    DBText1: TDBText;
    DBText3: TDBText;
    Label52: TLabel;
    Panel41: TPanel;
    Panel42: TPanel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBMemo1: TDBMemo;
    SGMed: TStringGrid;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Panel4: TPanel;
    Button1: TButton;
    memo_pkg_o_d_new: TMemo;
    BitBtn7: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Edit4: TEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure img_closeClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure SGPKGUpd1DblClick(Sender: TObject);
    procedure SGPKGDel1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure SGPKGUpd2Click(Sender: TObject);
    procedure SGPKGDel2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Edit42KeyPress(Sender: TObject; var Key: Char);
    procedure Edit42KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit42KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBText1Click(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Edit43KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure SGMedClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    mouse_x,mouse_y:integer;
    mouse_flag:boolean;
    procedure FrmTransparent(Handle,Flag:integer);
    procedure move_form(x,y:integer);
    procedure somx_add(item_no,fee_code,icd9:string;s_d,o_d,mx_d:TMemo);
    procedure somx_upd(item_no,icd9:string;s_d,o_d,mx_d:TMemo);
    procedure somx_del(item_no:string);
  public
    { Public declarations }
    doc_code, doc_name, class_id_upd, fee_code_upd, class_id_del, fee_code_del:string;
  end;

var
  FrmPKG: TFrmPKG;

implementation

uses Commfunc, DBDM, SqlCenter, Global, DPDFunc;

{$R *.dfm}

procedure TFrmPKG.somx_del(item_no:string);
var
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql :String;
begin
  SQLs:=TStringList.Create;
  SQLs.Clear;
  tmpSql:=getUpdSql(5);
  SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
  SetParamter(tmpSql,'$DOC_CODE$',doc_code);
  SetParamter(tmpSql,'$CLASS_CODE$',class_id_del);
  SetParamter(tmpSql,'$FEE_CODE$',fee_code_del);
  SQLs.Text:=tmpSql;
  DM.ExecSQL(SQLs);

  SQLs:=TStringList.Create;
  SQLs.Clear;
  tmpSql:=getUpdSql(6);
  SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
  SetParamter(tmpSql,'$DOC_CODE$',doc_code);
  SetParamter(tmpSql,'$CLASS_CODE$',class_id_del);
  SetParamter(tmpSql,'$CLASS_DESC$',fee_code_del);
  SQLs.Text:=tmpSql;
  DM.ExecSQL(SQLs);
  
end;

procedure TFrmPKG.somx_upd(item_no,icd9:string;s_d,o_d,mx_d:TMemo);
var
  i:integer;
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql :String;
begin
  SQLs:=TStringList.Create;
  tmpSql:=getUpdSql(5);
  SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
  SetParamter(tmpSql,'$DOC_CODE$',doc_code);
  SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
  SetParamter(tmpSql,'$FEE_CODE$',fee_code_upd);
  SQLs.Text:=tmpSql;
  DM.ExecSQL(SQLs);

  try
    for i := 0 to mx_d.Lines.Count - 1 do
    begin
      tmpSql:=getInsertSql(4);
      SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
      SetParamter(tmpSql,'$DOC_CODE$',doc_code);
      SetParamter(tmpSql,'$ITEM_NO$',item_no);
      SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
      SetParamter(tmpSql,'$FEE_CODE$',UpperCase(fee_code_upd));
      SetParamter(tmpSql,'$FEE_DESC$',mx_d.Lines.Strings[i]);
      SetParamter(tmpSql,'$UPD_OPER$',doc_code);
      SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
      SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
      SetParamter(tmpSql,'$SEQ_NO$',IntToStr(i));
      SQLs.Clear;
      SQLs.Text:=tmpSql;

      DM.ExecSQL(SQLs);
    end;
  except
    MessageDlg('資料庫寫入失敗',mtWarning,[mbOk],0);
  end;

  try
    tmpSql:=getInsertSql(4);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','6');
    SetParamter(tmpSql,'$CLASS_CODE$',trim(class_id_upd));
    SetParamter(tmpSql,'$FEE_CODE$',UpperCase(fee_code_upd));
    SetParamter(tmpSql,'$FEE_DESC$',icd9);
    SetParamter(tmpSql,'$UPD_OPER$',doc_code);
    SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
    SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
    SetParamter(tmpSql,'$SEQ_NO$','0');
    SQLs.Clear;
    SQLs.Text:=tmpSql;

    DM.ExecSQL(SQLs);
  except
    MessageDlg('資料庫寫入失敗',mtWarning,[mbOk],0);
  end;

  try
    for i := 0 to s_d.Lines.Count - 1 do
    begin
      tmpSql:=getInsertSql(4);
      SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
      SetParamter(tmpSql,'$DOC_CODE$',doc_code);
      SetParamter(tmpSql,'$ITEM_NO$','S');
      SetParamter(tmpSql,'$CLASS_CODE$',trim(class_id_upd));
      SetParamter(tmpSql,'$FEE_CODE$',UpperCase(fee_code_upd));
      SetParamter(tmpSql,'$FEE_DESC$',s_d.Lines.Strings[i]);
      SetParamter(tmpSql,'$UPD_OPER$',doc_code);
      SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
      SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
      SetParamter(tmpSql,'$SEQ_NO$',IntToStr(i));
      SQLs.Clear;
      SQLs.Text:=tmpSql;

      DM.ExecSQL(SQLs);
    end;
  except
    MessageDlg('處置代碼對應S的容寫入失敗',mtWarning,[mbOk],0);
  end;

  try
    for i := 0 to o_d.Lines.Count - 1 do
    begin
      tmpSql:=getInsertSql(4);
      SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
      SetParamter(tmpSql,'$DOC_CODE$',doc_code);
      SetParamter(tmpSql,'$ITEM_NO$','O');
      SetParamter(tmpSql,'$CLASS_CODE$',trim(class_id_upd));
      SetParamter(tmpSql,'$FEE_CODE$',UpperCase(fee_code_upd));
      SetParamter(tmpSql,'$FEE_DESC$',o_d.Lines.Strings[i]);
      SetParamter(tmpSql,'$UPD_OPER$',doc_code);
      SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
      SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
      SetParamter(tmpSql,'$SEQ_NO$',IntToStr(i));
      SQLs.Clear;
      SQLs.Text:=tmpSql;

      DM.ExecSQL(SQLs);
    end;
  except
    MessageDlg('處置代碼對應O的容寫入失敗',mtWarning,[mbOk],0);
  end;
  
end;

procedure TFrmPKG.somx_add(item_no,fee_code,icd9:string;s_d,o_d,mx_d:TMemo);
var
  class_code:string;
  num,i:integer;
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql :String;
begin
  SQLs:=TStringList.Create;

  tmpSql:=getChkSqlStr(8);
  SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
  SetParamter(tmpSql,'$DOCCODE$',doc_code);
  SetParamter(tmpSql,'$ITEMNO$',item_no);
  SetParamter(tmpSql,'$CLASSDESC$',fee_code);

  SQLs.Text:=tmpSql;
  if not DM.OpenSQL(SQLs,Qrys) then
  begin
    tmpSql:=getChkSqlStr(9);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$ITEMNO$',item_no);
    SetParamter(tmpSql,'$DOCCODE$',doc_code);
    SQLs.Clear;
    SQLs.Text:=tmpSql;


    if not DM.OpenSQL(SQLs,Qrys) then
    begin
        class_code := '1';
    end
    else
    begin
        if Qrys.FieldByName('max_code').AsString <> '' then
        begin
          class_code := Copy(Qrys.FieldByName('max_code').AsString, 2, Length(Qrys.FieldByName('max_code').AsString) - 1);
          num := StrToInt(class_code);
          Inc(num);
          class_code := IntToStr(num);
        end
        else
          class_code := '1';
    end;

    case Length(class_code) of
        1:
            class_code := '00' + class_code;
        2:
            class_code := '0' + class_code;
        3:
            class_code := '' + class_code;
        else
            MessageDlg('資料超過範圍,,請通知相關人員',mtWarning,[mbOk],0);
    end;
    class_code:=item_no+class_code;
    try
      tmpSql:=getInsertSql(3);
      SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
      SetParamter(tmpSql,'$DOC_CODE$',doc_code);
      SetParamter(tmpSql,'$ITEM_NO$',item_no);
      SetParamter(tmpSql,'$CLASS_CODE$',class_code);
      SetParamter(tmpSql,'$CLASS_DESC$',UpperCase(fee_code));
      SQLs.Clear;
      SQLs.Text:=tmpSql;

      DM.ExecSQL(SQLs);

      for i := 0 to mx_d.Lines.Count - 1 do
      begin
        tmpSql:=getInsertSql(4);
        SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
        SetParamter(tmpSql,'$DOC_CODE$',doc_code);
        SetParamter(tmpSql,'$ITEM_NO$',item_no);
        SetParamter(tmpSql,'$CLASS_CODE$',class_code);
        SetParamter(tmpSql,'$FEE_CODE$',UpperCase(fee_code));
        SetParamter(tmpSql,'$FEE_DESC$',mx_d.Lines.Strings[i]);
        SetParamter(tmpSql,'$UPD_OPER$',doc_code);
        SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
        SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
        SetParamter(tmpSql,'$SEQ_NO$',IntToStr(i));
        SQLs.Clear;
        SQLs.Text:=tmpSql;

        DM.ExecSQL(SQLs);
      end;
    except
      MessageDlg('資料庫寫入失敗',mtWarning,[mbOk],0);
    end;
  end
  else
    MessageDlg('輸入' + UpperCase(fee_code) + '代碼名稱已存在對應處置的內容'+#13+'請利用修改方來修改內容',mtWarning,[mbOk],0);

  tmpSql:=getChkSqlStr(10);
  SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
  SetParamter(tmpSql,'$DOC_CODE$',doc_code);
  SetParamter(tmpSql,'$ITEM_NO$','6');
  SetParamter(tmpSql,'$CLASS_CODE$',trim(class_code));
  SetParamter(tmpSql,'$FEE_CODE$',trim(UpperCase(fee_code)));

  SQLs.Text:=tmpSql;
  if not DM.OpenSQL(SQLs,Qrys) then
  begin
    try
      tmpSql:=getInsertSql(4);
      SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
      SetParamter(tmpSql,'$DOC_CODE$',doc_code);
      SetParamter(tmpSql,'$ITEM_NO$','6');
      SetParamter(tmpSql,'$CLASS_CODE$',trim(class_code));
      SetParamter(tmpSql,'$FEE_CODE$',UpperCase(fee_code));
      SetParamter(tmpSql,'$FEE_DESC$',icd9);
      SetParamter(tmpSql,'$UPD_OPER$',doc_code);
      SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
      SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
      SetParamter(tmpSql,'$SEQ_NO$','0');
      SQLs.Clear;
      SQLs.Text:=tmpSql;

      DM.ExecSQL(SQLs);
    except
      MessageDlg('資料庫寫入失敗',mtWarning,[mbOk],0);
    end;
  end
  else
    MessageDlg('輸入' + UpperCase(edt_fee_code.Text) + '處置代碼已存在對應的診斷代碼'+#13+'請利用修改方式來修改內容',mtWarning,[mbOk],0);

  tmpSql:=getChkSqlStr(10);
  SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
  SetParamter(tmpSql,'$DOC_CODE$',doc_code);
  SetParamter(tmpSql,'$ITEM_NO$','S');
  SetParamter(tmpSql,'$CLASS_CODE$',trim(class_code));
  SetParamter(tmpSql,'$FEE_CODE$',trim(UpperCase(fee_code)));

  SQLs.Text:=tmpSql;
  if not DM.OpenSQL(SQLs,Qrys) then
  begin
    try
      for i := 0 to s_d.Lines.Count - 1 do
      begin
        tmpSql:=getInsertSql(4);
        SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
        SetParamter(tmpSql,'$DOC_CODE$',doc_code);
        SetParamter(tmpSql,'$ITEM_NO$','S');
        SetParamter(tmpSql,'$CLASS_CODE$',trim(class_code));
        SetParamter(tmpSql,'$FEE_CODE$',UpperCase(fee_code));
        SetParamter(tmpSql,'$FEE_DESC$',s_d.Lines.Strings[i]);
        SetParamter(tmpSql,'$UPD_OPER$',doc_code);
        SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
        SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
        SetParamter(tmpSql,'$SEQ_NO$',IntToStr(i));
        SQLs.Clear;
        SQLs.Text:=tmpSql;

        DM.ExecSQL(SQLs);
      end;
    except
      MessageDlg('處置代碼對應S的容寫入失敗',mtWarning,[mbOk],0);
    end;
  end
  else
    MessageDlg('輸入' + UpperCase(edt_fee_code.Text) + '代碼代碼已存在對應S的內容'+#13+'請利用修改方式來修改內容',mtWarning,[mbOk],0);


  tmpSql:=getChkSqlStr(10);
  SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
  SetParamter(tmpSql,'$DOC_CODE$',doc_code);
  SetParamter(tmpSql,'$ITEM_NO$','O');
  SetParamter(tmpSql,'$CLASS_CODE$',trim(class_code));
  SetParamter(tmpSql,'$FEE_CODE$',trim(UpperCase(fee_code)));

  SQLs.Text:=tmpSql;
  if not DM.OpenSQL(SQLs,Qrys) then
  begin
    try
      for i := 0 to o_d.Lines.Count - 1 do
      begin
        tmpSql:=getInsertSql(4);
        SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
        SetParamter(tmpSql,'$DOC_CODE$',doc_code);
        SetParamter(tmpSql,'$ITEM_NO$','O');
        SetParamter(tmpSql,'$CLASS_CODE$',trim(class_code));
        SetParamter(tmpSql,'$FEE_CODE$',UpperCase(fee_code));
        SetParamter(tmpSql,'$FEE_DESC$',o_d.Lines.Strings[i]);
        SetParamter(tmpSql,'$UPD_OPER$',doc_code);
        SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
        SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
        SetParamter(tmpSql,'$SEQ_NO$',IntToStr(i));
        SQLs.Clear;
        SQLs.Text:=tmpSql;

        DM.ExecSQL(SQLs);
      end;
    except
      MessageDlg('處置代碼對應O的容寫入失敗',mtWarning,[mbOk],0);
    end;
  end
  else
    MessageDlg('輸入' + UpperCase(edt_fee_code.Text) + '代碼名稱已存在對應O的內容 '+#13+'請利用修改方式來修改內容',mtWarning,[mbOk],0);

  FreeAndNil(SQLs);
end;

procedure TFrmPKG.FrmTransparent(Handle,Flag:integer);
var
    l:integer;
begin
    if flag=0 then
    begin
        l:=getWindowLong(Handle, GWL_EXSTYLE);
        l:= l Or WS_EX_LAYERED;
        SetWindowLong (Handle, GWL_EXSTYLE, l);
        SetLayeredWindowAttributes(Handle, 0, 180, LWA_ALPHA);
    end
    else
    begin
        l:=getWindowLong(Handle, GWL_EXSTYLE);
        l:= l Or WS_EX_LAYERED;
        SetWindowLong (Handle, GWL_EXSTYLE, l);
        SetLayeredWindowAttributes(Handle, 0, 255, LWA_ALPHA);
    end;
end;

procedure TFrmPKG.move_form(x,y:integer);
begin
    self.Top := self.Top + y;
    self.Left := self.Left + X;
end;

procedure TFrmPKG.BitBtn3Click(Sender: TObject);
begin
  inherited;
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
end;

procedure TFrmPKG.BitBtn2Click(Sender: TObject);
var
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql :String;
  ls_chk, ls_psw_msg: string;
begin
  inherited;
  SQLs:=TStringList.Create;
  SQLs.Clear;

  //111.01.07 shh ITe 11138 modify 雙和新密碼認證機制
  {DM.QryTemp.Close;
  DM.QryTemp.SQL.Clear;

  DM.QryTemp.SQL.Text := 'select f_use_pwd(''L'',' + Qt(trim(User.Caption)) + ',' + Qt(trim(Edit1.Text)) + ') chk from DUAL';
  DM.QryTemp.Open;

  ls_chk := DM.QryTemp.fieldbyname('CHK').AsString;
  ls_psw_msg:= copy(TRIM(ls_chk), 3, length(ls_chk));
  ls_chk := copy(TRIM(ls_chk),1,1);

  if ls_chk = 'E' then
  begin
     MessageDlg(ls_psw_msg ,mtWarning,[mbOk],0);
     Exit;
  end;}


  if trim(Edit1.Text) = trim(Edit2.Text) then
  begin
    MessageDlg('新密碼不能與舊密碼相同',mtWarning,[mbOk],0);
    Exit;
  end;

  if trim(Edit2.Text) <> trim(Edit3.Text) then
  begin
    MessageDlg('您所輸入新密碼與確認密碼不相同!'+#13+'請再回去修改新密碼或確認密碼。',mtWarning,[mbOk],0);
    Exit;
  end;

  {DM.QryTemp.Close;
  DM.QryTemp.SQL.Clear;

  DM.QryTemp.SQL.Text := 'select f_use_pwd(''U'',' + Qt(trim(User.Caption)) + ',' + Qt(trim(Edit2.Text)) + ') chk from DUAL';
  DM.QryTemp.Open;

  ls_chk := DM.QryTemp.fieldbyname('CHK').AsString;
  ls_psw_msg:= copy(TRIM(ls_chk), 3, length(ls_chk));
  ls_chk := copy(TRIM(ls_chk),1,1);

  if ls_chk <> 'Y' then
  begin
     MessageDlg(ls_psw_msg ,mtWarning,[mbOk],0);
     Exit;
  end
  else
  begin
     SQLs.Clear;
     tmpSql:=getUpdSql(4);
     SetParamter(tmpSql,'$PSW_DESC$',trim(Edit2.Text));
     SetParamter(tmpSql,'$UPD_OPER$',trim(User.Caption));
     SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
     SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
     SetParamter(tmpSql,'$DOC_CODE$',User.Caption);
     SetParamter(tmpSql,'$OLDPSW_DESC$',trim(Edit1.Text));
     SQLs.Text:=tmpSql;

     DM.ExecSQL(SQLs);

     ShowMessage(ls_psw_msg);
     BitBtn3.OnClick(Self);
  end;

  FreeAndNil(SQLs);}


  tmpSql:=getChkSqlStr(7);
  SetParamter(tmpSql,'$DOC_CODE$',User.Caption);
  SetParamter(tmpSql,'$PSWD_DESC$',trim(Edit1.Text));

  SQLs.Text:=tmpSql;


  if DM.OpenSQL(SQLs,Qrys) then
  begin
    if trim(Edit1.Text) = trim(Edit2.Text) then
    begin
      MessageDlg('新密碼不能與舊密碼相同',mtWarning,[mbOk],0);
      Exit;
    end;

    if trim(Edit2.Text) = trim(Edit3.Text) then
    begin
      SQLs.Clear;
      tmpSql:=getUpdSql(4);
      SetParamter(tmpSql,'$PSW_DESC$',trim(Edit2.Text));
      SetParamter(tmpSql,'$UPD_OPER$',trim(User.Caption));
      SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
      SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
      SetParamter(tmpSql,'$DOC_CODE$',User.Caption);
      SetParamter(tmpSql,'$OLDPSW_DESC$',trim(Edit1.Text));
      SQLs.Text:=tmpSql;
      try
        DM.ExecSQL(SQLs);
        ShowMessage('密碼修改成功');
        //111-04-07-先不修改
        //SetDOCPSW(Edit2.Text);
      except
        ShowMessage('變更密碼作業未完成，請再次確認密碼。');
        Exit;
      end;

      BitBtn3.OnClick(Self);
    end
    else
      MessageDlg('您所輸入新密碼與確認密碼不相同!'+#13+'請再回去修改新密碼或確認密碼。',mtWarning,[mbOk],0);
  end
  else
    MessageDlg('您所輸入的員編或密碼有錯誤!'+#13+'請再回去檢查是否輸入正確。',mtWarning,[mbOk],0);

  FreeAndNil(SQLs);
  
end;

procedure TFrmPKG.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  mouse_x:=X;
  mouse_y:=Y;
  mouse_flag:=true;
end;

procedure TFrmPKG.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if mouse_flag then
  begin
    FrmTransparent(Handle,0);
    move_form(X-mouse_x,Y-mouse_y);
  end;
end;

procedure TFrmPKG.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  mouse_flag:=false;
  FrmTransparent(Handle,1);
end;

procedure TFrmPKG.FormShow(Sender: TObject);
begin
  inherited;
  Label13.Caption:=Setsys.ReadString('DPD','MX','MX')+' 內容';
  Label19.Caption:=Setsys.ReadString('DPD','MX','MX')+' 內容';
  Label20.Caption:=Setsys.ReadString('DPD','MX','MX')+' 內容';
  Label34.Caption:=Setsys.ReadString('DPD','MX','MX')+' 內容';
  Label39.Caption:=Setsys.ReadString('DPD','MX','MX')+' 內容';
  Label43.Caption:=Setsys.ReadString('DPD','MX','MX')+' 內容';
  TabSheet2.Caption:='S O A '+Setsys.ReadString('DPD','MX','MX')+'醫令';
  TabSheet7.Caption:='S O A '+Setsys.ReadString('DPD','MX','MX')+'套餐';
  user.Caption := doc_code;
  user_n.Caption := doc_name;
  if (trim(doc_code) = 'DPDTH') or (trim(doc_code) = 'SHDPD') or (trim(doc_code) = 'DENT') or (trim(doc_code) = 'DENT1') then
    doc_code:='DPD';
end;

procedure TFrmPKG.img_closeClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmPKG.FormDestroy(Sender: TObject);
begin
  inherited;
  try
    FrmPKG := nil;
  except
  end;
end;

procedure TFrmPKG.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if (edt_fee_code.Text = '') then
  begin
    MessageDlg('處置代碼不能為空!'+#13+'請從新填寫在點選 "新增"',mtWarning,[mbOk],0);
    Exit;
  end;

  somx_add('D',edt_fee_code.Text,edt_icd9.Text,memo_s_d,memo_o_d,memo_fee_desc);

  edt_fee_code.Text := '';
  memo_fee_desc.Clear;
  memo_s_d.Clear;
  memo_o_d.Clear;
  edt_icd9.Text := '';
end;

procedure TFrmPKG.PageControl2Change(Sender: TObject);
var
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql :String;
begin
  inherited;
  SQLs:=TStringList.Create;
  case PageControl2.ActivePageIndex of
    1,2:
    begin
      tmpSql:=getChkSqlStr(11);
      SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
      SetParamter(tmpSql,'$DOC_CODE$',doc_code);
      SetParamter(tmpSql,'$ITEM_NO$','D');

      SQLs.Text:=tmpSql;
      if PageControl2.ActivePageIndex = 1 then
      begin
        SGPKGUpd1.ColWidths[1]:=-1;
        SGPKGUpd1.ColWidths[0]:=SGPKGUpd1.Width-20;
        DM.OpenSQL(SQLs,SGPKGUpd1);
      end
      else
      begin
        SGPKGDel1.ColWidths[1]:=-1;
        SGPKGDel1.ColWidths[0]:=SGPKGUpd1.Width-20;
        DM.OpenSQL(SQLs,SGPKGDel1);
      end
    end;
  end;

  class_id_del:='';
  class_id_upd:='';
  fee_code_upd:='';
  fee_code_del:='';
  edt_icd9_upd.Text:='';
  edt_icd9_del.Text:='';
  memo_fee_desc_update.Clear;
  memo_fee_desc_del.Clear;
  memo_s_d_update.Clear;
  memo_o_d_update.Clear;
  memo_s_d_del.Clear;
  memo_o_d_del.Clear;
  FreeAndNil(SQLs);
end;

procedure TFrmPKG.SGPKGUpd1DblClick(Sender: TObject);
var
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql :String;
begin
  inherited;
  if (TStringGrid(Sender).Col = 0) and (TStringGrid(Sender).Row > 0) then
  begin
    class_id_upd := TStringGrid(Sender).Cells[1,TStringGrid(Sender).Row];
    fee_code_upd := TStringGrid(Sender).Cells[0,TStringGrid(Sender).Row];

    SQLs:=TStringList.Create;
    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','6');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_upd);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
      edt_icd9_upd.Text := trim(Qrys.FieldByName('fee_desc').AsString);


    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','D');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_upd);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_fee_desc_update.Clear;
      while not Qrys.Eof do
      begin
        memo_fee_desc_update.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;

    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','S');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_upd);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_s_d_update.Clear;
      while not Qrys.Eof do
      begin
        memo_s_d_update.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;

    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','O');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_upd);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_o_d_update.Clear;
      while not Qrys.Eof do
      begin
        memo_o_d_update.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;
  end;
  FreeAndNil(SQLs);
end;

procedure TFrmPKG.SGPKGDel1Click(Sender: TObject);
var
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql :String;
begin
  inherited;
  if (TStringGrid(Sender).Col = 0) and (TStringGrid(Sender).Row > 0) then
  begin
    class_id_del := TStringGrid(Sender).Cells[1,TStringGrid(Sender).Row];
    fee_code_del := TStringGrid(Sender).Cells[0,TStringGrid(Sender).Row];

    SQLs:=TStringList.Create;
    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','6');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_del);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_del);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
      edt_icd9_del.Text := trim(Qrys.FieldByName('fee_desc').AsString);


    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','D');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_del);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_del);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_fee_desc_del.Clear;
      while not Qrys.Eof do
      begin
        memo_fee_desc_del.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;

    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','S');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_del);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_del);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_s_d_del.Clear;
      while not Qrys.Eof do
      begin
        memo_s_d_del.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;

    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','O');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_del);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_del);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_o_d_del.Clear;
      while not Qrys.Eof do
      begin
        memo_o_d_del.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;
  end;
  FreeAndNil(SQLs);
end;

procedure TFrmPKG.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if (class_id_upd = '') or (fee_code_upd = '') then
  begin
    MessageDlg('請先選擇處置代碼',mtWarning,[mbOk],0);
    Abort;
  end;

  somx_upd('D',edt_icd9_upd.Text,memo_s_d_update,memo_o_d_update,memo_fee_desc_update);

  edt_icd9_upd.Text:='';
  memo_s_d_update.Clear;
  memo_o_d_update.Clear;
  memo_fee_desc_update.Clear;
  PageControl2Change(PageControl2);
end;

procedure TFrmPKG.BitBtn6Click(Sender: TObject);
begin
  inherited;
  if (class_id_del = '') or (fee_code_del = '') then
  begin
    MessageDlg('請先選擇處置代碼',mtWarning,[mbOk],0);
    Abort;
  end;

  somx_del('D');

  memo_fee_desc_del.Clear;
  memo_s_d_del.Clear;
  memo_o_d_del.Clear;
  edt_icd9_del.Text:='';
  PageControl2Change(PageControl2);
end;

procedure TFrmPKG.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if (edt_pkg_name.Text = '')then
  begin
    MessageDlg('代碼名稱不能為空，請從新填寫在點選 "新增"',mtWarning,[mbOk],0);
    Abort;
  end;

  somx_add('P',edt_pkg_name.Text,edt_pkd_icd9_new.Text,memo_pkg_s_d_new,memo_pkg_o_d_new,memo_pkg_mx_new);

  edt_pkg_name.Text := '';
  memo_pkg_mx_new.Clear;
  memo_pkg_s_d_new.Clear;
  memo_pkg_o_d_new.Clear;
  edt_pkd_icd9_new.Text := '';
end;

procedure TFrmPKG.PageControl3Change(Sender: TObject);
var
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql :String;
begin
  inherited;
  SQLs:=TStringList.Create;
  case PageControl3.ActivePageIndex of
    1,2:
    begin
      tmpSql:=getChkSqlStr(11);
      SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
      SetParamter(tmpSql,'$DOC_CODE$',doc_code);
      SetParamter(tmpSql,'$ITEM_NO$','P');

      SQLs.Text:=tmpSql;
      if PageControl3.ActivePageIndex = 1 then
      begin
        SGPKGUpd2.ColWidths[1]:=-1;
        SGPKGUpd2.ColWidths[0]:=SGPKGUpd2.Width-20;
        DM.OpenSQL(SQLs,SGPKGUpd2);
      end
      else
      begin
        SGPKGDel2.ColWidths[1]:=-1;
        SGPKGDel2.ColWidths[0]:=SGPKGUpd2.Width-20;
        DM.OpenSQL(SQLs,SGPKGDel2);
      end
    end;
  end;

  class_id_del:='';
  class_id_upd:='';
  fee_code_upd:='';
  fee_code_del:='';
  edt_icd9_upd.Text:='';
  edt_icd9_del.Text:='';
  memo_fee_desc_update.Clear;
  memo_fee_desc_del.Clear;
  memo_s_d_update.Clear;
  memo_o_d_update.Clear;
  memo_s_d_del.Clear;
  memo_o_d_del.Clear;
  FreeAndNil(SQLs);
end;

procedure TFrmPKG.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if (class_id_upd = '') or (fee_code_upd = '') then
  begin
    MessageDlg('請先選擇代碼名稱',mtWarning,[mbOk],0);
    Abort;
  end;

  somx_upd('P',edt_pkd_icd9_upd.Text,memo_pkg_s_d_upd,memo_pkg_o_d_upd,memo_pkg_mx_upd);

  edt_pkd_icd9_upd.Text:='';
  memo_pkg_s_d_upd.Clear;
  memo_pkg_o_d_upd.Clear;
  memo_pkg_mx_upd.Clear;
  PageControl3Change(PageControl3);
end;

procedure TFrmPKG.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if (class_id_del = '') or (fee_code_del = '') then
  begin
    MessageDlg('請先選擇處置代碼',mtWarning,[mbOk],0);
    Abort;
  end;

  somx_del('P');

  memo_pkg_s_d_del.Clear;
  memo_pkg_o_d_del.Clear;
  memo_pkg_mx_del.Clear;
  edt_pkd_icd9_del.Text:='';
  PageControl3Change(PageControl3);
end;

procedure TFrmPKG.SGPKGUpd2Click(Sender: TObject);
var
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql :String;
begin
  inherited;
  if (TStringGrid(Sender).Col = 0) and (TStringGrid(Sender).Row > 0) then
  begin
    class_id_upd := TStringGrid(Sender).Cells[1,TStringGrid(Sender).Row];
    fee_code_upd := TStringGrid(Sender).Cells[0,TStringGrid(Sender).Row];

    SQLs:=TStringList.Create;
    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','6');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_upd);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
      edt_pkd_icd9_upd.Text := trim(Qrys.FieldByName('fee_desc').AsString);


    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','P');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_upd);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_pkg_mx_upd.Clear;
      while not Qrys.Eof do
      begin
        memo_pkg_mx_upd.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;

    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','S');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_upd);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_pkg_s_d_upd.Clear;
      while not Qrys.Eof do
      begin
        memo_pkg_s_d_upd.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;

    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','O');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_upd);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_upd);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_pkg_o_d_upd.Clear;
      while not Qrys.Eof do
      begin
        memo_pkg_o_d_upd.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;
  end;
  FreeAndNil(SQLs);
end;

procedure TFrmPKG.SGPKGDel2Click(Sender: TObject);
var
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql :String;
begin
  inherited;
  if (TStringGrid(Sender).Col = 0) and (TStringGrid(Sender).Row > 0) then
  begin
    class_id_del := TStringGrid(Sender).Cells[1,TStringGrid(Sender).Row];
    fee_code_del := TStringGrid(Sender).Cells[0,TStringGrid(Sender).Row];

    SQLs:=TStringList.Create;
    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','6');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_del);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_del);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
      edt_pkd_icd9_del.Text := trim(Qrys.FieldByName('fee_desc').AsString);


    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','P');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_del);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_del);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_pkg_mx_del.Clear;
      while not Qrys.Eof do
      begin
        memo_pkg_mx_del.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;

    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','S');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_del);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_del);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_pkg_s_d_del.Clear;
      while not Qrys.Eof do
      begin
        memo_pkg_s_d_del.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;

    SQLs.Clear;
    tmpSql:=getChkSqlStr(10);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','O');
    SetParamter(tmpSql,'$CLASS_CODE$',class_id_del);
    SetParamter(tmpSql,'$FEE_CODE$',fee_code_del);

    SQLs.Text:=tmpSql;
    if DM.OpenSQL(SQLs,Qrys) then
    begin
      memo_pkg_o_d_del.Clear;
      while not Qrys.Eof do
      begin
        memo_pkg_o_d_del.Lines.Append(Qrys.FieldByName('fee_desc').AsString);
        Qrys.next;
      end;
    end;
  end;
  FreeAndNil(SQLs);
end;

procedure TFrmPKG.PageControl1Change(Sender: TObject);
var
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql :String;
begin
  inherited;
  DM.QryOrder.Close;
  DsMed.DataSet := nil;
  Edit42.Text := '';
  Edit43.Text := '';
  Edit9.Text := '';
  Edit9.Hint := '';
  ComboBox3.Text := '';
  ComboBox3.Hint := '';
  ComboBox2.Text := 'N';
  Edit11.Text := '';
  Edit11.Hint := '';
  Case PageControl1.ActivePageIndex  of
    2 :
    begin
      DsMed.DataSet := DM.QryOrder;
      SQLs:=TStringList.Create;
      tmpSQL:=getChkSqlStr(13);
      SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
      SetParamter(tmpSql,'$DOC_CODE$',doc_code);
      SetParamter(tmpSql,'$ITEM_NO$','1');
      SQLs.Text:=tmpSql;
      DM.OpenSQL(SQLs,SGMed);
      SQLs.Free;
    end;
    else
    begin
      DM.QryOrder.Close;
      DsMed.DataSet := nil;
      
    end;
  end;
end;

procedure TFrmPKG.Edit42KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if not (key in [#10,#13,#08,#10]) then
    key := key;
end;

procedure TFrmPKG.Edit42KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key in [vk_up,vk_down,vk_return]) and (PanelMed.Visible) then
    exit;
  if trim(Edit42.Hint) <> '' then
    exit;
  if trim(Edit42.Text) <> '' then
  begin
    with DM.QryOrder do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select A.*,decode(A.USE_STATUS_O,''1'',''供'',''2'',''缺'',''停'') USE_STATUS_DESC from OrderItem_basic A where TRIM(A.order_type)=''M'' and UPPER(A.fee_code) like '+Qt(UPPERCASE(trim(Edit42.Text))+'%')+' Order by  A.USE_STATUS_O,A.Fee_code,A.Fee_Desc,A.Fee_Name ');
      open;
      First;
    end;
    PanelMed.Visible:=true;
  end
  else
    PanelMed.Visible:=false;
end;

procedure TFrmPKG.Edit42KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Edit42.Hint:='';
  if PanelMed.Visible then
  begin
    if key in [vk_up,vk_down,vk_return] then
    begin
      if Key = vk_return then
      begin
        DBText1Click(self);
        key :=0;
      end;
      Sendmessage(DBCGMed.Handle,WM_KEYDOWN,key,0);
      key :=0;
    end;
  end;
end;

procedure TFrmPKG.DBText1Click(Sender: TObject);
var
  TempStr:string;
begin
  inherited;
  if Trim(DM.QryOrder.FieldByName('USE_STATUS_O').AsString) <>'1' then
  begin
    if DM.QryOrder.FieldByName('USE_STATUS').AsString ='2' then
      TempStr :=' 暫時缺藥' + #13#10 + '請改開其他藥品'
    else
      TempStr :=' 已取消' + #13#10 + '請改開其他藥品';

    ShowMessage(DM.QryOrder.FieldByName('Fee_name').AsString+TempStr);
    PanelMed.Visible:=false;
    Edit42.SetFocus;

    Exit;
  end;

  Edit42.Text := Trim(DM.QryOrder.FieldByName('Fee_Code').AsString);
  Edit43.Text := Trim(DM.QryOrder.FieldByName('Fee_name').AsString);
  Edit9.Text := Trim(DM.QryOrder.FieldByName('UNIT_QTY').AsString);
  Edit9.Hint := Trim(DM.QryOrder.FieldByName('UNIT').AsString);
  ComboBox3.Text := Trim(DM.QryOrder.FieldByName('CIR_CODE').AsString);
  ComboBox3.Hint := Trim(DM.QryOrder.FieldByName('PATH_CODE').AsString);
  ComboBox2.Text := Trim(DM.QryOrder.FieldByName('POWDER_FLAG').AsString);
  Edit11.Text := Trim(DM.QryOrder.FieldByName('med_days').AsString);
  Edit11.Hint := DM.QryOrder.FieldByName('FEE_PACK_O').AsString;
  Edit4.Text :=  Trim(DM.QryOrder.FieldByName('Accu_flag').AsString);
  Edit12.Text := CalMedTtl(ComboBox3.Text, trim(Edit4.Text), StrToInt(Edit11.Hint),StrToInt(Edit11.Text),StrToFloat(Edit9.Text));
  Edit42.Hint:='N';
  PanelMed.Visible:=false;
  Edit42.SetFocus;
end;

procedure TFrmPKG.Edit9Change(Sender: TObject);
begin
  inherited;
  if (trim(ComboBox3.Text) <> '') and (trim(Edit11.Hint) <> '') and (trim(Edit11.Text) <> '') and (trim(Edit9.Text) <> '') then
    Edit12.Text := CalMedTtl(ComboBox3.Text,trim(Edit4.Text),StrToInt(Edit11.Hint),StrToInt(Edit11.Text),StrToFloat(Edit9.Text));
end;

procedure TFrmPKG.Edit43KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key in [vk_up,vk_down,vk_return]) and (PanelMed.Visible) then
    exit;
  if trim(Edit42.Hint) <> '' then
    exit;
  if trim(Edit43.Text) <> '' then
  begin
    with DM.QryOrder do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select A.*,decode(A.USE_STATUS_O,''1'',''供'',''2'',''缺'',''停'') USE_STATUS_DESC from OrderItem_basic A where Trim(A.order_type)=''M'' and ((UPPER(A.Fee_DESC) like '+Qt(UPPERCASE(trim(Edit43.Text))+'%')+' ) or (UPPER(A.Fee_Name) like '+Qt(UPPERCASE(trim(Edit43.Text))+'%')+' )) Order by   A.USE_STATUS,A.Fee_code,A.Fee_Desc,A.Fee_Name');
      open;
      First;
    end;

    PanelMed.Visible:=true;
  end
  else
    PanelMed.Visible:=false;
end;

procedure TFrmPKG.BitBtn8Click(Sender: TObject);
var
  Qrys: TADOQuery;
  SQLs: TStrings;
  tmpSql :String;
begin
  inherited;
  if (edit42.Text <> '') and (Edit43.Text <> '') then
  begin
    SQLs:=TStringList.Create;
    tmpSql:=getChkSqlStr(12);
    SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
    SetParamter(tmpSql,'$DOC_CODE$',doc_code);
    SetParamter(tmpSql,'$ITEM_NO$','1');
    SetParamter(tmpSql,'$FEE_CODE$',edit42.Text);
    SQLs.Text:=tmpSql;
    DM.OpenSQL(SQLs,Qrys);
    if Qrys.FieldByName('cnt').AsInteger = 0 then
    begin
      tmpSql:=getInsertSql(5);
      SetParamter(tmpSql,'$DEPT_CODE$',getDocDeptCode);
      SetParamter(tmpSql,'$DOC_CODE$',doc_code);
      SetParamter(tmpSql,'$ITEM_NO$','1');
      SetParamter(tmpSql,'$CLASS_CODE$','0000');
      SetParamter(tmpSql,'$FEE_CODE$',edit42.Text);
      SetParamter(tmpSql,'$FEE_DESC$',edit43.Text);
      SetParamter(tmpSql,'$UNIT_QTY$',Edit9.Text);
      SetParamter(tmpSql,'$CIR_CODE$',ComboBox3.Text);
      SetParamter(tmpSql,'$PATH_CODE$',ComboBox3.Hint);
      SetParamter(tmpSql,'$MED_DAYS$',Edit11.Text);
      SetParamter(tmpSql,'$GRIND_FLAG$',ComboBox2.Text);
      SetParamter(tmpSql,'$TTL_QTY$',Edit12.Text);
      SetParamter(tmpSql,'$UPD_OPER$',doc_code);
      SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
      SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
      SetParamter(tmpSql,'$SEQ_NO$','1');
      SQLs.Text:=tmpSql;
      DM.ExecSQL(SQLs);
    end
    else
      MessageDlg('輸入的藥'+Edit43.Text+'已經存在',mtWarning,[mbOk],0);

    PageControl1Change(PageControl1);
    SQLs.Free;
  end;
end;

procedure TFrmPKG.Button1Click(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmPKG.ComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := #27;
end;

procedure TFrmPKG.SGMedClick(Sender: TObject);
var
  SQLs: TStrings;
  tmpSql :String;
begin
  inherited;

  if (SGMed.Col = 1) then
  begin

    if MessageDlg('是否要刪除個人常用藥', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      SQLs:=TStringList.Create;
      tmpSql:=getDeleteSql(3);
      SetParamter(tmpSql,'$ITEM_NO$','1');
      SetParamter(tmpSql,'$FEE_CODE$',SGMed.Cells[1,SGMed.Row]);
      SetParamter(tmpSql,'$DOC_CODE$',doc_code);
      SQLs.Text:=tmpSql;

      DM.ExecSQL(SQLs);
      SQLs.Free;
    end;

    FrmPKG.PageControl1Change(nil);
  end;
end;

procedure TFrmPKG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DsMed.DataSet := nil;
  
end;

end.
