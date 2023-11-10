unit DPDXray;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, XPMan, ExtCtrls, ComCtrls, StdCtrls, jpeg, Grids, Mask,
  DBCtrls, dbcgrids, DB, ADODB;
//Lbl_FM.hint := 0150 ?
type
  TFrmDPDXray = class(TFrmMain)
    Panel1: TPanel;
    Image1: TImage;
    Lbl_55: TLabel;
    Lbl_54: TLabel;
    Lbl_53: TLabel;
    Lbl_52: TLabel;
    Lbl_51: TLabel;
    Lbl_61: TLabel;
    Lbl_62: TLabel;
    Lbl_63: TLabel;
    Lbl_64: TLabel;
    Lbl_65: TLabel;
    Lbl_75: TLabel;
    Lbl_74: TLabel;
    Lbl_73: TLabel;
    Lbl_72: TLabel;
    Lbl_71: TLabel;
    Lbl_81: TLabel;
    Lbl_82: TLabel;
    Lbl_83: TLabel;
    Lbl_84: TLabel;
    Lbl_85: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel6: TPanel;
    SGKind: TStringGrid;
    SGNo: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Panel7: TPanel;
    DB_wait: TDBCtrlGrid;
    Shape2: TShape;
    ADODPDXrayQ: TADOQuery;
    ADODPDXrayD: TDataSource;
    SEND_CD_2: TDBText;
    fee_name: TDBText;
    Lbl_FM: TLabel;
    Edt_1: TEdit;
    Edt_2: TEdit;
    Edt_3: TEdit;
    Edt_4: TEdit;
    Edt_5: TEdit;
    Edt_6: TEdit;
    Edt_7: TEdit;
    Edt_8: TEdit;
    Edt_9: TEdit;
    Edt_10: TEdit;
    Edt_11: TEdit;
    Edt_12: TEdit;
    Edt_13: TEdit;
    Edt_14: TEdit;
    Shape9: TShape;
    Shape1: TShape;
    Lbl_UR: TImage;
    Shape3: TShape;
    Lbl_UA: TImage;
    Shape4: TShape;
    Lbl_UL: TImage;
    Shape5: TShape;
    Lbl_LR: TImage;
    Shape6: TShape;
    Lbl_LA: TImage;
    Shape7: TShape;
    Lbl_LL: TImage;
    Lbl_19: TImage;
    Lbl_18: TImage;
    Lbl_17: TImage;
    Lbl_16: TImage;
    Lbl_15: TImage;
    Lbl_14: TImage;
    Lbl_13: TImage;
    Lbl_12: TImage;
    Lbl_11: TImage;
    Lbl_21: TImage;
    Lbl_22: TImage;
    Lbl_23: TImage;
    Lbl_24: TImage;
    Lbl_25: TImage;
    Lbl_26: TImage;
    Lbl_27: TImage;
    Lbl_28: TImage;
    Lbl_29: TImage;
    Lbl_49: TImage;
    Lbl_48: TImage;
    Lbl_47: TImage;
    Lbl_46: TImage;
    Lbl_45: TImage;
    Lbl_44: TImage;
    Lbl_43: TImage;
    Lbl_42: TImage;
    Lbl_41: TImage;
    Lbl_31: TImage;
    Lbl_32: TImage;
    Lbl_33: TImage;
    Lbl_34: TImage;
    Lbl_35: TImage;
    Lbl_36: TImage;
    Lbl_37: TImage;
    Lbl_38: TImage;
    Lbl_39: TImage;

    Shape10: TShape;
    Shape11: TShape;
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SGKindClick(Sender: TObject);
    procedure SGKindDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGNoDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DB_waitPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure SGNoClick(Sender: TObject);
    procedure Lbl_19Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SEND_CD_2Click(Sender: TObject);
    procedure Edt_1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure iniPanel(pnl:TPanel);
    function searchName(code_no,part:string):string;
  public
    { Public declarations }
    xray_no: array[0..2] of string;
    xray_kind:string;
  end;

var
  FrmDPDXray: TFrmDPDXray;

implementation

uses SqlCenter, DBDM, Global, Commfunc;

{$R *.dfm}

procedure TFrmDPDXray.iniPanel(pnl:TPanel);
begin
  Panel1.Visible:=false;
  Panel4.Visible:=false;
  Panel5.Visible:=false;
  Panel7.Visible:=false;

  pnl.Visible:=true;
end;

procedure TFrmDPDXray.Button3Click(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmDPDXray.FormShow(Sender: TObject);
var
  tmpSql:String;
  SQLs:TStrings;
begin
  inherited;
  Panel1.Align := AlClient;
  Panel5.Align := AlClient;
  Panel4.Align := AlClient;
  Panel7.Align := AlClient;
  SGKind.ColWidths[1]:=-1;
  SGNo.ColWidths[1]:=-1;
  SQLs:=TStringList.Create;
  tmpSql:=getChkSqlStr(74);
  SetParamter(tmpSql,'$CODE_TYPE$',xray_Kind);
  SQLs.Text:=tmpSql;
  DM.OpenSQL(SQLs,SGKind,true);

  tmpSql:=getChkSqlStr(74);
  SetParamter(tmpSql,'$CODE_TYPE$',xray_no[0]);
  SQLs.Text:=tmpSql;
  DM.OpenSQL(SQLs,SGNo,true);
  iniPanel(Panel4);
  ADODPDXrayQ.Open;
  SQLs.Free;
end;

procedure TFrmDPDXray.SGKindClick(Sender: TObject);
var
  tmpSql:String;
  SQLs:TStrings;
begin
  inherited;
  SQLs:=TStringList.Create;
  tmpSql:=getChkSqlStr(74);
  SetParamter(tmpSql,'$CODE_TYPE$',xray_no[SGKind.Row]);
  SQLs.Text:=tmpSql;
  DM.OpenSQL(SQLs,SGNo,true);
  SGNo.Row:=0;
  SGNoClick(SGNo);
  SQLs.Free;
end;

procedure TFrmDPDXray.SGKindDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if TStringGrid(Sender).Row = ARow then
    TStringGrid(Sender).Canvas.Brush.Color :=$00FFD7D7
  else
    TStringGrid(Sender).Canvas.Brush.Color :=$00CBFEFD;

  TStringGrid(Sender).Canvas.FillRect(Rect);
  TStringGrid(Sender).Canvas.Font.Color:=clBlack;
  TStringGrid(Sender).Canvas.TextOut(Rect.Left + 1, Rect.Top + 1, Trim(TStringGrid(Sender).Cells[ACol,ARow]));

end;

procedure TFrmDPDXray.SGNoDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if TStringGrid(Sender).Row = ARow then
    TStringGrid(Sender).Canvas.Brush.Color :=$00FFD7D7
  else
    TStringGrid(Sender).Canvas.Brush.Color :=$00CBFEFD;

  TStringGrid(Sender).Canvas.FillRect(Rect);
  TStringGrid(Sender).Canvas.Font.Color:=clBlack;
  TStringGrid(Sender).Canvas.TextOut(Rect.Left + 1, Rect.Top + 1, Trim(TStringGrid(Sender).Cells[ACol,ARow]));
end;

procedure TFrmDPDXray.DB_waitPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  inherited;
  if Index mod 2 = 0 then
    Shape2.Brush.Color:=$00FFC8FF
  else
    Shape2.Brush.Color:=$00FFCECE;
end;

procedure TFrmDPDXray.SGNoClick(Sender: TObject);
begin
  inherited;
  case StrToInt(SGNo.Cells[1,SGNo.Row]) of
    1,10 :
      iniPanel(Panel4);
    2,11 :
      iniPanel(Panel1);
    5 :
      iniPanel(Panel5);
    else
    begin
      iniPanel(Panel7);
      //ADODPDXrayQ.Close;
      ADODPDXrayQ.Filter:= 'SEND_CD_1=' + SGNo.Cells[1,SGNo.Row];
      ADODPDXrayQ.Filtered := true;
      ADODPDXrayQ.Open;
    end;
  end;
end;

function TFrmDPDXray.searchName(code_no,part:string):string;
var
  i:integer;
begin
  Result:='N_已開立14項目，請先確認再進行牙科放射開立。';
  for i:= 1 to 14 do
  begin
    if FrmDPDXray.FindComponent('Edt_'+IntToStr(i)) <> nil then
    begin
      if code_no = '' then
      begin
        if TEdit(FrmDPDXray.FindComponent('Edt_'+IntToStr(i))).Hint = '' then
        begin
          Result:='Y_Edt_'+IntToStr(i);
          break;
        end;
      end
      else
      begin
        if TEdit(FrmDPDXray.FindComponent('Edt_'+IntToStr(i))).Hint = '' then
        begin
          Result:='Y_Edt_'+IntToStr(i);
          break;
        end
        else
        begin
          if (copy(TEdit(FrmDPDXray.FindComponent('Edt_'+IntToStr(i))).Text,1,2) = part) or (copy(TEdit(FrmDPDXray.FindComponent('Edt_'+IntToStr(i))).Text,3,2) = part) or (copy(TEdit(FrmDPDXray.FindComponent('Edt_'+IntToStr(i))).Text,5,2) = part) then
          begin
            Result:='N_'+part+'部位已重複';
            break;
          end
          else
          begin
            if (ReturnId(ReturnName(ReturnName(ReturnName(ReturnName(TEdit(FrmDPDXray.FindComponent('Edt_'+IntToStr(i))).Hint))))) = code_no) and (Length(TEdit(FrmDPDXray.FindComponent('Edt_'+IntToStr(i))).Text) div 2 < 3) then
            begin
              Result:='Y_Edt_'+IntToStr(i);
              break;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFrmDPDXray.Lbl_19Click(Sender: TObject);
var
  part,str,comName:string;
  tmpSql:String;
  SQLs:TStrings;
  Qrys:TADOQuery;
begin
  inherited;
  part:='';
  //part:=ReturnName(TLabel(Sender).Name);
  part:=NullstrTo(ReturnName(TControl(Sender).Hint),ReturnName(TControl(Sender).Name));
  str:=searchName(SGNo.Cells[1,SGNo.Row],part);
  if ReturnId(str) = 'Y' then
  begin
    comName:=ReturnName(str);
    TEdit(FrmDPDXray.FindComponent(comName)).Text:=TEdit(FrmDPDXray.FindComponent(comName)).Text+part;
    if TEdit(FrmDPDXray.FindComponent(comName)).Hint = '' then
    begin
      SQLs:=TStringList.Create;
      tmpSql:=getChkSqlStr(75);
      SetParamter(tmpSql,'$SEND_CD_1$',SGNo.Cells[1,SGNo.Row]);
      //if TLabel(Sender).Hint <> '' then
      if TControl(Sender).Hint = 'Lbl_FM' then
        SetParamter(tmpSql,'$SEND_CD_2$','0150')
      else
        SetParamter(tmpSql,'$SEND_CD_2$','%');
      SQLs.Text:=tmpSql;
      if DM.OpenSQL(SQLs,Qrys) then
      begin
        TEdit(FrmDPDXray.FindComponent(comName)).Hint:=trim(Qrys.FieldByName('Order_type').AsString)+'_牙科放射_'+trim(Qrys.FieldByName('fee_code').AsString)+'_'+trim(Qrys.FieldByName('fee_name').AsString)+'_'+trim(Qrys.FieldByName('SEND_CD_1').AsString)+'_'+trim(Qrys.FieldByName('path_code_o').AsString)+'_'+trim(Qrys.FieldByName('SEND_CD_2').AsString);
      end;
      SQLs.Free;
    end;
  end
  else
    MessageDlg(ReturnName(str),mtWarning,[mbOk],0);
end;

procedure TFrmDPDXray.FormCreate(Sender: TObject);
begin
  inherited;
  Edt_1.Hint:='';
  Edt_2.Hint:='';
  Edt_3.Hint:='';
  Edt_4.Hint:='';
  Edt_5.Hint:='';
  Edt_6.Hint:='';
  Edt_7.Hint:='';
  Edt_8.Hint:='';
  Edt_9.Hint:='';
  Edt_10.Hint:='';
  Edt_11.Hint:='';
  Edt_12.Hint:='';
  Edt_13.Hint:='';
  Edt_14.Hint:='';
  Edt_1.Text:='';
  Edt_2.Text:='';
  Edt_3.Text:='';
  Edt_4.Text:='';
  Edt_5.Text:='';
  Edt_6.Text:='';
  Edt_7.Text:='';
  Edt_8.Text:='';
  Edt_9.Text:='';
  Edt_10.Text:='';
  Edt_11.Text:='';
  Edt_12.Text:='';
  Edt_13.Text:='';
  Edt_14.Text:='';
end;

procedure TFrmDPDXray.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  action := Cafree;
end;

procedure TFrmDPDXray.Button2Click(Sender: TObject);
begin
  inherited;
  FormCreate(self);
end;

procedure TFrmDPDXray.Button1Click(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i:= 1 to 14 do
    if FrmDPDXray.FindComponent('Edt_'+IntToStr(i)) <> nil then
      if (TEdit(FrmDPDXray.FindComponent('Edt_'+IntToStr(i))).Text <> '') and (TEdit(FrmDPDXray.FindComponent('Edt_'+IntToStr(i))).Hint <> '') then
        OutList.Add(TEdit(FrmDPDXray.FindComponent('Edt_'+IntToStr(i))).Hint+'_'+TEdit(FrmDPDXray.FindComponent('Edt_'+IntToStr(i))).Text);
  self.Close;
end;

procedure TFrmDPDXray.SEND_CD_2Click(Sender: TObject);
var
  part,str,comName:string;
begin
  inherited;
  str:=searchName('','');
  if ReturnId(str) = 'Y' then
  begin
    comName:=ReturnName(str);
    if ADODPDXrayQ.FieldByName('Order_type').AsString = 'T3' then
      TEdit(FrmDPDXray.FindComponent(comName)).Text:=ADODPDXrayQ.FieldByName('send_cd_2').AsString
    else
      TEdit(FrmDPDXray.FindComponent(comName)).Text:=ADODPDXrayQ.FieldByName('path_code_o').AsString;
    TEdit(FrmDPDXray.FindComponent(comName)).Hint:=trim(ADODPDXrayQ.FieldByName('Order_type').AsString)+'_牙科放射_'+trim(ADODPDXrayQ.FieldByName('fee_code').AsString)+'_'+trim(ADODPDXrayQ.FieldByName('fee_name').AsString)+'_'+trim(ADODPDXrayQ.FieldByName('SEND_CD_1').AsString)+'_'+trim(ADODPDXrayQ.FieldByName('path_code_o').AsString)+'_'+trim(ADODPDXrayQ.FieldByName('SEND_CD_2').AsString);
  end
  else
    MessageDlg(ReturnName(str),mtWarning,[mbOk],0);
end;

procedure TFrmDPDXray.Edt_1Change(Sender: TObject);
begin
  inherited;
  if trim(TEdit(Sender).Text) = '' then
  begin
    TEdit(Sender).Text:='';
    TEdit(Sender).Hint:='';
  end;
end;

procedure TFrmDPDXray.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmDPDXray:=nil;
end;

end.
