unit DBDM;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, ADODB, Grids, Contnrs, Variants;

type
  TDM = class(TDataModule)
    ADOLink: TADOConnection;
    QrySearch: TADOQuery;
    QrySubSearch: TADOQuery;
    QrySearch3: TADOQuery;
    QryTemp: TADOQuery;
    QryInsert: TADOQuery;
    QryUpdate: TADOQuery;
    QrySelf: TADOQuery;
    QryOrder: TADOQuery;
    SPALL: TADOStoredProc;
    QryExec: TADOQuery;
    Med_Check: TADOStoredProc;
    qryICD10: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure QrySearchBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    function DBisOpen:Boolean;
    function OpenDB : Boolean;
    procedure sql_time_log(titl,Desc:string);
  public
    { Public declarations }
    gsTitle: string;
    function OpenSQL(SQLs: TStrings):boolean;overload; //have data ?
    Function OpenSQL(SQLs: TStrings;var MyQuery : TADOQuery):Boolean;OverLoad; // 全新的StringGrid
    Function OpenSQL(SQLs: TStrings;var MyStringGrid : TStringGrid):Boolean;OverLoad; // 全新的StringGrid
    Function OpenSQL(SQLs: TStrings;var MyStringGrid : TStringGrid ; ReWrite : Boolean):Boolean;OverLoad; //不包含欄位的
    Function ExecSQL(SQLo: TObjectList):boolean;OverLoad;
    Function ExecSQL(SQLs: TStrings):boolean;OverLoad;
    Function ExecSP(Paramter,PType,RType,PData:TStrings;SPName:string):String;OverLoad;
    function JudgmentTestOrProd(sConn:string): string;
  end;

var
  DM: TDM;

implementation

uses Main;
{$R *.dfm}

procedure TDM.sql_time_log(titl,Desc:string);
var
  filehandle : integer;
  openfileName : TextFile;
  inputdata, ma : string;
begin
  Desc := titl +' / '+ Desc;
  try
    AssignFile(openfileName, ExtractFileDir(Application.ExeName)+'\DPD_ERROR_log_DB.txt');
    if FileExists(ExtractFileDir(Application.ExeName)+'\DPD_ERROR_log_DB.txt') then
      Append(openfileName)
    else
      Rewrite(openfileName);
    Writeln(openfileName, DateTimeToStr(Now) + Desc + #9);
    CloseFile(openfileName);
  except

  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  ADOLink.Connected := False;
  ADOLink.ConnectionString := 'FILE NAME='+ExtractFilePath(Application.ExeName)+'\commonlink.udl';
  ADOLink.Connected := True;
  gsTitle := JudgmentTestOrProd(ADOLink.ConnectionString);
  ADOLink.Open;
end;

function TDM.DBisOpen: Boolean;
begin
  if stOpen in ADOLink.State then
    DBisOpen := true
  else
    DBisOpen := False;
end;

function TDM.OpenDB: Boolean;
begin
  if (stClosed in ADOLink.State) or not (stConnecting in ADOLink.State) then
  begin
    OpenDB := False;
    try
      ADOLink.Connected := False;
      ADOLink.ConnectionString := 'FILE NAME='+ExtractFilePath(Application.ExeName)+'\commonlink.udl';
      ADOLink.Connected := True;
      gsTitle := JudgmentTestOrProd(ADOLink.ConnectionString);
      ADOLink.Open;
      OpenDB := true;
    except on E: Exception  do
    begin
      OpenDB := False;
      ShowMessage('開啟資料庫有誤'+e.Message);
    end;
    end;
  end
  else
  begin
    ADOLink.Open;
    OpenDB := true;
  end;
end;

function TDM.OpenSQL(SQLs: TStrings): boolean;
begin
  if not DBisOpen then
    OpenDb;
  with QrySelf do
  begin
    Close;
    SQL.Clear;
    SQL.Text := SQLs.Text;
    open;
    if Eof then
      OpenSQL := False
    else
      OpenSQL := true;
    close;
  end;
end;

function TDM.OpenSQL(SQLs: TStrings;
  var MyStringGrid: TStringGrid): Boolean;
var
  i,j : Integer;
  tmpBool:Boolean;
begin

  if not DBisOpen then
    OpenDb;
  tmpBool:=MyStringGrid.Visible;
  MyStringGrid.Visible:=false;
  for i := 0 to MyStringGrid.RowCount -1 do
    MyStringGrid.Rows[i].Clear;
  MyStringGrid.RowCount := MyStringGrid.FixedRows +1; ;
  with QrySelf do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=SQLs.Text;
    open;
    if Eof then
      OpenSQL := False
    else
    begin
      OpenSQL := true;
      first;
      MyStringGrid.ColCount := FieldCount;
      GetFieldNames(MyStringGrid.Rows[0]);
      i := 1;
      j := 0;
      While not Eof do
      begin
        for j := 0 to QrySelf.FieldCount -1 do
          MyStringGrid.Cells[j,i] := FieldByName(MyStringGrid.Cells[j,0]).AsString;
        Inc(i);
        try
          if i >= MyStringGrid.RowCount then
            MyStringGrid.RowCount := i;
        except
        end;
        Next;
      end;
    end;
    close;
  end;
  MyStringGrid.Visible:=tmpBool;
end;

function TDM.OpenSQL(SQLs: TStrings; var MyStringGrid: TStringGrid;
  ReWrite: Boolean): Boolean;
var
  i,j,k : Integer;
  Title : TStringList;
begin
  Title := TStringList.Create;
  if not DBisOpen then
    OpenDb;
  if ReWrite then
  begin
    for i := 0 to MyStringGrid.RowCount -1 do
      MyStringGrid.Rows[i].Clear;
    MyStringGrid.RowCount := 1; ;
  end;
  with QrySelf do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=SQLs.Text;
    open;
    if IsEmpty then
      OpenSQL := False
    else
    begin
      OpenSQL := true;
      first;
      //MyStringGrid.ColCount := FieldCount;
      GetFieldNames(Title);
      if ReWrite then
      begin
        i := 0;
        K := 0;
      end
      else
      begin
        i := MyStringGrid.RowCount-1;
        K := MyStringGrid.RowCount-1;
      end;
      j := 0;
      While not Eof do
      begin
        for j := 0 to QrySelf.FieldCount -1 do
          MyStringGrid.Cells[j,i] := FieldByName(Title.Strings[j]).AsString;
        Inc(i);
        try
          //if i >= MyStringGrid.RowCount+k-1 then
            MyStringGrid.RowCount := i+1;
        except
        end;
        Next;
      end;
    end;
    close;
  end;

end;

Function TDM.ExecSQL(SQLs: TStrings):boolean;
var
  cnt:integer;
begin
  if not DBisOpen then
    OpenDb;
  try
    ADOLink.BeginTrans;

    with QryExec do
    begin
      Close;
      SQL.Clear;
      SQL.Text := SQLs.Text;
      //SQL.SaveToFile('OPD_BASIC1.SQL');
      cnt := ExecSQL;
      close;
    end;

    ExecSQL:=True;
    ADOLink.CommitTrans;
  except on E: Exception do
    begin
      sql_time_log('ExecSQL:',E.Message+SQLs.Text);
      ExecSQL:=false;
      ADOLink.RollbackTrans;
    end;
  end;
end;


Function TDM.ExecSQL(SQLo: TObjectList):boolean;
var
  cnt,i:integer;
  SQLs:TStrings;
begin
  if not DBisOpen then
    OpenDb;
  try
    ADOLink.BeginTrans;
    for i := 0 to SQLo.Count -1 do
    begin
      SQLs:=TStrings(SQLo[i]);
      with QryExec do
      begin
        Close;
        SQL.Clear;
        SQL.Text := SQLs.Text;
        //SQL.SaveToFile('OPD_BASIC1.SQL');
        cnt := ExecSQL;
        close;
      end;
    end;
    ExecSQL:=True;
    ADOLink.CommitTrans;
  except
    on E : Exception do
    begin
      sql_time_log('ExecSQL:',E.Message+SQLs.Text);
      ExecSQL:=false;
      ADOLink.RollbackTrans;
    end;
  end;
end;

function TDM.OpenSQL(SQLs: TStrings;
  var MyQuery : TADOQuery): Boolean;
var
  i,j : Integer;
begin
 if not DBisOpen then
    OpenDb;

  with QrySelf do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=SQLs.Text;
    SQL.SaveToFile('ChkFee.SQL');
    open;
    if Eof then
      OpenSQL := False
    else
    begin
      OpenSQL := true;
      MyQuery := QrySelf;
    end;
    //close;
  end;
end;

Function TDM.ExecSP(Paramter,PType,RType,PData:TStrings;SPName:string):String;
var
  i:integer;
  RtnResult:String;
begin
  RtnResult:='Error_Paramters Qty not same';
  if (Paramter.Count = PType.Count) and (Paramter.Count = RType.Count) then
  begin
    with SPALL DO
    begin
      Close;
      Parameters.Clear;
      ProcedureName := SPName;
      for i:= 0 to Paramter.Count -1 do
      begin
        case (StrToInt(PType[i])) of
          1:
          begin
            case (StrToInt(RType[i])) of
              1:
                Parameters.CreateParameter(Paramter[i],ftString,pdInput,4000,Null);
              2:
                Parameters.CreateParameter(Paramter[i],ftString,pdOutput,4000,Null);
              3:
                Parameters.CreateParameter(Paramter[i],ftString,pdInputOutput,4000,Null);
              4:
                Parameters.CreateParameter(Paramter[i],ftString,pdReturnValue,4000,Null);
            end;
          end;
          2:
          begin
            case (StrToInt(RType[i])) of
              1:
                Parameters.CreateParameter(Paramter[i],ftInteger,pdInput,8,Null);
              2:
                Parameters.CreateParameter(Paramter[i],ftInteger,pdOutput,8,Null);
              3:
                Parameters.CreateParameter(Paramter[i],ftInteger,pdInputOutput,8,Null);
              4:
                Parameters.CreateParameter(Paramter[i],ftInteger,pdReturnValue,8,Null);
            end;
          end;
        end;
      end;

      for i:= 0 to Paramter.Count -1 do
      begin
        case (StrToInt(PType[i])) of
          1:
          begin
            if (StrToInt(RType[i])) in [1,3] then
              Parameters.parambyname(Paramter[i]).Value := PData[i];
          end;
          2:
          begin
            if (StrToInt(RType[i])) in [1,3] then
              Parameters.parambyname(Paramter[i]).Value := StrToInt(PData[i]);
          end;
        end;
      end;

      ExecProc;
      RtnResult:='';
      
      for i:=0 to RType.Count -1 do
      begin
        case (StrToInt(RType[i])) of
          2..4:
            if Parameters.parambyname(Paramter[i]).Value = Null then
              RtnResult:=RtnResult+'_'
            else
              RtnResult:=RtnResult+trim(Parameters.parambyname(Paramter[i]).Value)+'_';
        end;
      end;

      Result:=RtnResult;
    end;
  end
  else
    Result:=RtnResult;
end;

procedure TDM.QrySearchBeforeOpen(DataSet: TDataSet);
begin
  if not DBisOpen then
    if not OpenDB then
      ShowMessage('資料庫開啟失敗');
end;

function TDM.JudgmentTestOrProd(sConn:string): string;
var i: integer;
begin
   result := '';
   if trim(sConn) <> '' then begin
      sConn := UpperCase(sConn);
      i := pos('DOUBLET', sConn);
      if i > 0 then begin
         result := '測試環境';
      end
      else begin
         i := pos('DOUBLE', sConn);
         if i > 0 then begin
            result := '正式環境';
         end
         else begin
            result := '非double環境';
         end;
      end;
   end;
end;

end.
