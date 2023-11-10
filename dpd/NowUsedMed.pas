unit NowUsedMed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, XPMan, ExtCtrls, ComCtrls, StdCtrls, Grids, ActiveX, DB, ADODB, DBDM,
  Buttons, Global;

type
  TFrmNowUsedMed = class(TFrmMain)
    pan_nowused: TPanel;
    sg_nowused: TStringGrid;
    hc_nowused: THeaderControl;
    pan_self: TPanel;
    sg_self: TStringGrid;
    hc_self: THeaderControl;
    but_confirm: TBitBtn;
    but_exit: TBitBtn;
    Shape1: TShape;
    lab_nowused: TLabel;
    Shape2: TShape;
    lab_self: TLabel;
    cb_used: TComboBox;
    butNoMed: TBitBtn;
    cb_used2: TComboBox;
    procedure but_exitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg_selfKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure but_confirmClick(Sender: TObject);
    procedure sg_selfKeyPress(Sender: TObject; var Key: Char);
    procedure sg_nowusedSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cb_usedChange(Sender: TObject);
    procedure sg_nowusedDblClick(Sender: TObject);
    procedure sg_selfDblClick(Sender: TObject);
    procedure sg_selfDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure butNoMedClick(Sender: TObject);
  private
    { Private declarations }
    CStrGrid: TStringGrid;
    CCol, CRow: integer;
    isModify: Boolean;
    inChrNo, inFeeNo, inUserId, inUserName, inSource: string;
    procedure DeleteRow(yourStringGrid: TStringGrid; ARow: Integer);
    procedure setPatInf();
    procedure SetCSG(inSg: TStringGrid; inCol, inRow: integer);
    procedure SetSelection(UseSG: TStringGrid; UseCB: TComboBox; ACol, ARow: integer);
  public
    { Public declarations }
    function setParams(iChrNo, iFeeNo, iUserId: string; ckOpen: Boolean = false): boolean;
  end;

var
  FrmNowUsedMed: TFrmNowUsedMed;

implementation

{$R *.dfm}

procedure TFrmNowUsedMed.DeleteRow(yourStringGrid: TStringGrid; ARow: Integer);
var i: Integer;
begin
  with yourStringGrid do
  begin
    for i := ARow to RowCount - 2 do
      Rows[i].Assign(Rows[i + 1]);
    RowCount := RowCount - 1
  end;
end;

procedure TFrmNowUsedMed.setPatInf();
var
  tempQuery: TADOQuery;
begin
  try
    tempQuery := TADOQuery.Create(self);
    with tempQuery do
    begin
      Connection := DM.ADOLink;
      SQL.Clear;
      //�|������
      SQL.Add(' SELECT OPD_DATE, MED_CODE, (SELECT TRIM(MED_DESC) FROM MED_BASIC WHERE MED_CODE = RPAD( VMU.MED_CODE, 12, '' '')) AS MED_DESC, ');
      SQL.Add(' UNIT_QTY, PER_QTY, CIR_CODE, PATH_CODE, MED_DAYS, DOC_CODE, (SELECT TRIM(DOC_NAME) FROM DOC_BASIC WHERE DOC_CODE = RPAD( VMU.DOC_CODE, 6, '' '')) AS DOC_NAME, ');
      SQL.Add(' CASE WHEN SOURCE_TYPE = ''I'' THEN ''��|'' WHEN SOURCE_TYPE = ''O'' THEN ''���E'' WHEN SOURCE_TYPE = ''E'' THEN ''��E'' ELSE SOURCE_TYPE END AS SOURCE_TYPE,');
      SQL.Add(' DEPT_CODE, CHR_NO FROM VIEW_MED_USAGED VMU WHERE CHR_NO = ''' + inChrNo + ''' ');
      Open;
      while not eof do
      begin
        sg_nowused.Cells[0, sg_nowused.RowCount - 1] := FieldByName('OPD_DATE').AsString;
        sg_nowused.Cells[1, sg_nowused.RowCount - 1] := FieldByName('SOURCE_TYPE').AsString;
        sg_nowused.Cells[2, sg_nowused.RowCount - 1] := FieldByName('MED_DESC').AsString;
        sg_nowused.Cells[3, sg_nowused.RowCount - 1] := FieldByName('PER_QTY').AsString;
        sg_nowused.Cells[4, sg_nowused.RowCount - 1] := FieldByName('CIR_CODE').AsString;
        sg_nowused.Cells[5, sg_nowused.RowCount - 1] := FieldByName('MED_DAYS').AsString;
        sg_nowused.Cells[6, sg_nowused.RowCount - 1] := FieldByName('DOC_NAME').AsString;
        sg_nowused.Cells[7, sg_nowused.RowCount - 1] := '�f�����ܤ��A��';
        sg_nowused.Cells[8, sg_nowused.RowCount - 1] := FieldByName('MED_CODE').AsString;
        sg_nowused.Cells[9, sg_nowused.RowCount - 1] := FieldByName('DOC_CODE').AsString + '_' + FieldByName('DEPT_CODE').AsString;
        sg_nowused.Cells[10, sg_nowused.RowCount - 1] := FieldByName('PATH_CODE').AsString;
        Next;
        sg_nowused.RowCount := sg_nowused.RowCount + 1;
      end;
      sg_nowused.RowCount := sg_nowused.RowCount - 1;

      //�L�|����(�����ġB���d���~)
      Close;
      SQL.Clear;
      SQL.Add(' SELECT MED_NAME, REASON, CREATE_USER, ');
      SQL.Add(' (SELECT TRIM(USER_NAME) FROM USER_BASIC WHERE USER_ID = CREATE_USER) AS DOC_NAME, CREATE_DATE FROM MED_COMPARE ');
      SQL.Add(' WHERE FEE_NO=''' + inFeeNo + ''' AND RECORD_TYPE = ''O'' AND REASON = ''�u��'' AND DELETE_USER IS NULL AND DELETE_DATE IS NULL ');
      Open;
      while not EOF do
      begin
        sg_self.Cells[0, sg_self.RowCount - 1] := FieldByName('MED_NAME').AsString;
        sg_self.Cells[1, sg_self.RowCount - 1] := FieldByName('DOC_NAME').AsString;
        sg_self.Cells[2, sg_self.RowCount - 1] := FieldByName('CREATE_DATE').AsString;
        sg_self.Cells[3, sg_self.RowCount - 1] := FieldByName('REASON').AsString;
        sg_self.Cells[4, sg_self.RowCount - 1] := 'O';
        sg_self.RowCount := sg_self.RowCount + 1;
        Next;
      end;
      Close;
    end;
  finally
    FreeAndNil(tempQuery);
  end;
end;

function TFrmNowUsedMed.setParams(iChrNo, iFeeNo, iUserId: string; ckOpen: Boolean = false): boolean;
var tempQuery: TADOQuery;
begin
  inUserId := iUserId;
  inFeeNo := iFeeNo;
  inChrNo := iChrNo;
  inSource := Copy(inFeeNo, 0, 1);

  //check usaged med
  if ckOpen = true then
  begin
    try
      tempQuery := TADOQuery.Create(self);
      with tempQuery do
      begin
        Connection := DM.ADOLink;
        SQL.Clear;
        SQL.Add(' SELECT USER_NAME FROM USER_BASIC WHERE USER_ID = ''' + inUserId + ''' ');
        Open;
        inUserName := FieldByName('USER_NAME').AsString;

        Close;
        SQL.Clear;
        //�o�̭n���CHRNO�P�_�~�i
        SQL.Add(' SELECT COUNT(*) AS MC_COUNT FROM MED_COMPARE WHERE CHR_NO= ''' + inChrNo + ''' AND RECORD_TYPE <> ''O'' ');
        Open;
        if FieldByName('MC_COUNT').AsInteger > 0 then
          Result := false
        else
        begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT COUNT(*) AS VMU_COUNT FROM VIEW_MED_USAGED WHERE CHR_NO = ''' + inChrNo + ''' ');
          Open;
          if FieldByName('VMU_COUNT').AsInteger = 0 then
            Result := false
          else
          begin
            setPatInf();
            Result := true;
          end;
          Close;
        end;
      end;
    finally
      FreeAndNil(tempQuery);
    end;
  end
  else
  begin
    Result := true;
    tempQuery := TADOQuery.Create(self);
    tempQuery.Connection := DM.ADOLink;
    with tempQuery do
    begin
      SQL.Clear;
      SQL.Add(' SELECT USER_NAME FROM USER_BASIC WHERE USER_ID = ''' + inUserId + ''' ');
      Open;
      inUserName := FieldByName('USER_NAME').AsString;
    end;

    try
      isModify := true;
      with tempQuery do
      begin
        SQL.Clear;
        SQL.Add(' SELECT COUNT(*) AS MC_COUNT FROM MED_COMPARE WHERE FEE_NO= ''' + inFeeNo + ''' AND RECORD_TYPE <> ''O'' ');
        Open;
        if FieldByName('MC_COUNT').AsInteger > 0 then
        begin
          if MessageDlg('�ثe�w��������ƬO�_�A���i�����?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
          begin
            isModify := true;
            Result := false;
          end
        end;
      end;
    finally
      FreeAndNil(tempQuery);
      setPatInf();
    end;
  end;
end;


procedure TFrmNowUsedMed.but_exitClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TFrmNowUsedMed.FormShow(Sender: TObject);
begin
  inherited;
  sg_self.Cells[1, sg_self.RowCount - 1] := inUserName;
  sg_self.Cells[2, sg_self.RowCount - 1] := DateTimeToStr(Now());
  sg_self.Cells[3, sg_self.RowCount - 1] := '���u��';
  sg_self.Cells[4, sg_self.RowCount - 1] := 'N';
end;

procedure TFrmNowUsedMed.sg_selfKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Trim(sg_self.Cells[0, sg_self.RowCount - 1]) <> '' then
  begin
    sg_self.RowCount := sg_Self.RowCount + 1;
    sg_self.Cells[1, sg_self.RowCount - 1] := inUserName;
    sg_self.Cells[2, sg_self.RowCount - 1] := DateTimeToStr(Now());
    sg_self.Cells[3, sg_self.RowCount - 1] := '���u��';
    sg_self.Cells[4, sg_self.RowCount - 1] := 'N';
  end;
end;

procedure TFrmNowUsedMed.but_confirmClick(Sender: TObject);
var
  tempQuery: TADOQuery;
  i: integer;
begin
  inherited;
  try
    tempQuery := TADOQuery.Create(self);
    tempQuery.Connection := DM.ADOLink;
    try
      with tempQuery do
      begin
        if Connection.InTransaction then
          Connection.CommitTrans;
        Connection.BeginTrans;

        //�p�G���s��Ҧ����R��
        if isModify then
        begin
          SQL.Clear;
          SQL.Add(' DELETE MED_COMPARE WHERE FEE_NO=''' + inFeeNo + ''' AND RECORD_TYPE <> ''O'' ');
          ExecSQL;
        end;
        Connection.CommitTrans;

        Connection.BeginTrans;
        //�g�J�|������
        for i := 0 to sg_nowused.RowCount - 1 do
        begin
          // 0:���  1:�ӷ�  2:�ĦW  3:���q  4:�W�v  5:�Ѽ�  6:��v  7:�O�_�u��  8:�ī~�N�X  9:�}����v���s_��O  10:�~�|
          SQL.Clear;
          SQL.Add(' INSERT INTO MED_COMPARE ');
          SQL.Add(' ( FEE_NO,  CHR_NO,  MED_CODE,  MED_NAME,  PER_QTY,  PATH_CODE,  CIR_CODE,  SOURCE,  SOURCE_DESC,  REASON,  RECORD_TYPE,  CREATE_USER, CREATE_DATE) ');
          SQL.Add(' VALUES ');
          SQL.Add(' (:FEE_NO, :CHR_NO, :MED_CODE, :MED_NAME, :PER_QTY, :PATH_CODE, :CIR_CODE, :SOURCE, :SOURCE_DESC, :REASON, :RECORD_TYPE, :CREATE_USER, SYSDATE) ');
          Prepared;
          Parameters.ParamByName('FEE_NO').Value := inFeeNo;
          Parameters.ParamByName('CHR_NO').Value := inChrNo;
          Parameters.ParamByName('MED_CODE').Value := sg_nowused.Cells[8, i];
          Parameters.ParamByName('MED_NAME').Value := sg_nowused.Cells[2, i];
          Parameters.ParamByName('PER_QTY').Value := sg_nowused.Cells[3, i];
          Parameters.ParamByName('PATH_CODE').Value := sg_nowused.Cells[10, i];
          Parameters.ParamByName('CIR_CODE').Value := sg_nowused.Cells[4, i];
          Parameters.ParamByName('SOURCE').Value := inSource;
          Parameters.ParamByName('SOURCE_DESC').Value := sg_nowused.Cells[9, i];
          Parameters.ParamByName('REASON').Value := sg_nowused.Cells[7, i];
          Parameters.ParamByName('RECORD_TYPE').Value := 'N';
          Parameters.ParamByName('CREATE_USER').Value := inUserId;
          ExecSQL;
        end;

        //��s�e���M���¸��
        SQL.Clear;
        SQL.Add(' UPDATE MED_COMPARE SET DELETE_USER=''SYSTEM'', DELETE_DATE=SYSDATE WHERE RECORD_TYPE=''O'' AND CHR_NO=''' + inChrNo + ''' ');
        ExecSQL;

        //�g�J�|�~����(�t�����ġB���d���~)
        for i := 0 to sg_self.RowCount - 2 do
        begin

          // 0:�ī~����  1:�����v  2:���ɶ�  3:�O�_�u��
          SQL.Clear;
          SQL.Add(' INSERT INTO MED_COMPARE ');
          SQL.Add(' ( FEE_NO,  CHR_NO,   MED_NAME,   SOURCE,   SOURCE_DESC,   REASON,   RECORD_TYPE,   CREATE_USER,  CREATE_DATE ) VALUES ');
          SQL.Add(' (:FEE_NO, :CHR_NO,  :MED_NAME,  :SOURCE, (SELECT USER_ID||''_''||USER_DEPT FROM USER_BASIC WHERE USER_ID=''' + inUserId + ''' AND ROWNUM = 1),  :REASON,  :RECORD_TYPE,  :CREATE_USER,  SYSDATE     ) ');
          Prepared;
          Parameters.ParamByName('FEE_NO').Value := inFeeNo;
          Parameters.ParamByName('CHR_NO').Value := inChrNo;
          Parameters.ParamByName('MED_NAME').Value := sg_self.Cells[0, i];
          Parameters.ParamByName('SOURCE').Value := Copy(inFeeNo, 0, 1);
          Parameters.ParamByName('REASON').Value := sg_self.Cells[3, i];
          Parameters.ParamByName('RECORD_TYPE').Value := 'O';
          Parameters.ParamByName('CREATE_USER').Value := inUserId;
          ExecSQL;
        end;
      end;
    except
      tempQuery.Connection.RollbackTrans;
      ShowMessage('�x�s���~�A���p����T��');
    end;
  finally
    tempQuery.Connection.CommitTrans;
    FreeAndNil(tempQuery);
    self.Close;
  end;
end;

procedure TFrmNowUsedMed.sg_selfKeyPress(Sender: TObject; var Key: Char);
var
  cSG: TStringGrid;
begin
  inherited;
  cSG := TStringGrid(Sender);
  if cSG.Col <> 0 then
    Key := #0;
end;

procedure TFrmNowUsedMed.SetCSG(inSg: TStringGrid; inCol, inRow: integer);
begin
  CStrGrid := inSg;
  CCol := inCol;
  CRow := inRow;
end;

procedure TFrmNowUsedMed.SetSelection(UseSG: TStringGrid; UseCB: TComboBox; ACol, ARow: integer);
var
  MyRec: TRect;
  Mypoint: TPoint;
begin
  UseSG.perform(WM_CANCELMODE, 0, 0);
  MyRec := UseSG.CellRect(Acol, Arow);
  Mypoint := ScreenToClient(ClientToScreen(MyRec.topleft));
  SetCSG(UseSG, ACol, ARow);
  UseCB.Text := UseSG.Cells[ACol, ARow];
  UseCB.setbounds(Mypoint.x + 2, Mypoint.y + 2 + UseSG.Top, MyRec.right - MyRec.left, height);
  UseCB.Show;
  UseCB.BringTofront;
  UseCB.SetFocus;
  UseCB.DroppedDown := true;
end;

procedure TFrmNowUsedMed.sg_nowusedSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  cSG: TStringGrid;
begin
  cSG := TStringGrid(Sender);
  if cSG.Name = 'sg_nowused' then
  begin
    if ACol = 7 then
      SetSelection(cSG, cb_used, ACol, ARow);
  end
  else if cSG.Name = 'sg_self' then
  begin
    if ACol = 3 then
      SetSelection(cSG, cb_used2, ACol, ARow);
  end;
end;

procedure TFrmNowUsedMed.cb_usedChange(Sender: TObject);
begin
  inherited;
  CStrGrid.Cells[CCol, CRow] := TComBoBox(Sender).Text;
  TComBoBox(Sender).Hide;
end;

procedure TFrmNowUsedMed.sg_nowusedDblClick(Sender: TObject);
begin
  inherited;
  if sg_nowused.Row <> 0 then
    sg_nowused.Row := 0;
end;

procedure TFrmNowUsedMed.sg_selfDblClick(Sender: TObject);
begin
  inherited;
  if (sg_self.Col = 0) and (sg_self.Cells[4, sg_self.Row] <> 'O') then
    DeleteRow(TStringGrid(Sender), sg_self.Row);
end;

procedure TFrmNowUsedMed.sg_selfDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with sg_self do
  begin
    if Cells[4, ARow] = 'O' then
      Canvas.Brush.Color := $00FFD7EC
    else
      Canvas.Brush.Color := ClWindow;

    Canvas.Font.Color := clBlack;
    Canvas.FillRect(Rect);
    Canvas.TextRect(Rect, Rect.Left, Rect.top, Cells[ACol, ARow]);
  end;
end;

procedure TFrmNowUsedMed.butNoMedClick(Sender: TObject);
var
  tempQuery: TADOQuery;
  i: integer;
begin

  try
    tempQuery := TADOQuery.Create(self);
    tempQuery.Connection := DM.ADOLink;
    try
      with tempQuery do
      begin
        if Connection.InTransaction then
          Connection.CommitTrans;
        Connection.BeginTrans;

        SQL.Clear;
        SQL.Add(' DELETE MED_COMPARE WHERE FEE_NO=''' + inFeeNo + ''' AND RECORD_TYPE <> ''O'' ');
        ExecSQL;

        SQL.Clear;
        SQL.Add(' INSERT INTO MED_COMPARE ');
        SQL.Add(' ( FEE_NO,  CHR_NO,  MED_NAME,  SOURCE,  RECORD_TYPE,  CREATE_USER, CREATE_DATE) ');
        SQL.Add(' VALUES ');
        SQL.Add(' (:FEE_NO, :CHR_NO, :MED_NAME, :SOURCE, :RECORD_TYPE, :CREATE_USER, SYSDATE) ');
        Prepared;
        Parameters.ParamByName('FEE_NO').Value := inFeeNo;
        Parameters.ParamByName('CHR_NO').Value := inChrNo;
        Parameters.ParamByName('MED_NAME').Value := 'NoMedUsed';
        Parameters.ParamByName('SOURCE').Value := inSource;
        Parameters.ParamByName('RECORD_TYPE').Value := 'N';
        Parameters.ParamByName('CREATE_USER').Value := inUserId;
        ExecSQL;
        Connection.CommitTrans
      end;
    except
      tempQuery.Connection.RollbackTrans;
    end;
  finally
    FreeAndNil(tempQuery);
    self.Close();
  end;
end;

end.

