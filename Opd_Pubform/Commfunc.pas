unit Commfunc;

interface
Uses
  Windows,Classes,Grids,StdCtrls,Dialogs,SysUtils,Shellapi;
const
  MsError   = 0;
  MsInfor   = 1;
  MsComf    = 2;
  MsWarning = 3;
type TAgeClass =(acYear, acMonth, acDay);
Function Qt(s: String): String ; external 'FuncLib.DLL';
Function Qts(s: String): String ; external 'FuncLib.DLL';
//字串前後加引號(')如遇分號(;)自動轉換成(',')多用於組合sql
Function ROCToDate(SDate: String):TDateTime;  external 'FuncLib.DLL';
//將民國年轉成西元年
Function ROCToTime(STime: String):TDateTime; external 'FuncLib.DLL';
//將時間字串轉為時間格式
Function ROCDate(const dtDate: TDateTime; const sSeparator: string): string; external 'FuncLib.DLL' ;
//計算民國年
Function ROCTime(const dtDate: TDateTime; const sSeparator: string): string; external 'FuncLib.DLL';
//取回四碼時間字串
Function ROCTimes(const dtDate: TDateTime; const sSeparator: string): string; external 'FuncLib.DLL';
//取回六碼時間字串
Function NullStrTo(const sStr : string; schange :string) : string; external 'FuncLib.DLL';
//空字串轉換
Function ReturnId(s : String):String; external 'FuncLib.DLL';
//回傳(_)前字串
Function ReturnName(s: String): String ; external 'FuncLib.DLL';
//回傳(_)後字串
Function AddChar(Val,key: string; leng: integer): string; external 'FuncLib.DLL';
//前補字
Function CharAdd(Val,key: string; leng: integer): string; external 'FuncLib.DLL';
//後補字
Function MinsDiff_(const sROCDateFrom, sTimeFrom,sROCDateTo, sTimeTo : String) : Integer; external 'FuncLib.DLL';
//計算兩時間差
Function NumberToCH(const iKey : integer) :String; external 'FuncLib.DLL';
//將數字轉化成中文
Function SetCbbitem_(const item : TStrings;sSelStr : String):Integer; external 'FuncLib.DLL';
//回傳字串位置
Function GetAge(const sStartDate, sEndROCDate : String; AgeClass : TAgeClass):String; external 'FuncLib.DLL';
//年齡
Function GetSex(Source:String):String; external 'FuncLib.DLL';
//性別
Function GetPatId(Source:String):String; external 'FuncLib.DLL';
//身分別
function DecodeStr(source,key:String):String;external 'FuncLib.DLL';
function EncodeStr(source,key:String):String;external 'FuncLib.DLL';
//開啟網頁
function Browseropen():Boolean;far;external 'FuncLib.DLL';
//判斷是否已開啟broweser
Function Translate(Str : String):Boolean; external 'FuncLib.DLL';
//google字典
Function ShowMessage_(Msg:string;btns : array Of String;MsgType : Integer):Integer;far; external 'FuncLib.DLL';
Function ShowMessage(Msg:string;btns : array Of String;MsgType : Integer):Integer; overload;
procedure ShowMessage(Msg:String);Overload;
Function MyIP() : String ;external 'FuncLib.DLL';
Function mypc() : String ;external 'FuncLib.DLL';
Function LastDateOfMonth(D:TDateTime):TDateTime; far;external 'FuncLib.DLL';
Function FirstDateOfMonth(D:TDateTime):TDateTime; far;external 'FuncLib.DLL';
Procedure SetCbbitem(const item : TObject;sSelStr : String);
//下拉選單跳至目標文字
Function ClearSG(MyStringGrid : TStringGrid) : Boolean;
Function GetYear(sRocDate : String) : String;
Function Getmonth(sRocDate : String) : String;
Function GetDays(sRocDate : String) : String;
Function DateToString(TT : TDateTime) : String;
Function DBDate(DD : String) : String;
Function DateInt(DD : String) : Integer;
Function ExecBrowser(Url : String):Boolean;
Function StrToList(s : string) : TSTringlist;
Function WinExecAndWait32(FileName:String; Visibility :Integer):Integer;
implementation
Procedure SetCbbitem(const item : TObject;sSelStr : String);
begin
  if item is TComBoBox then
  begin
    TComBoBox(item).ItemIndex :=SetCbbitem_(TComBoBox(item).items ,sSelStr)
  end
  else if item is TListBox then
    TlistBox(item).ItemIndex :=SetCbbitem_(TlistBox(item).items ,sSelStr);
end;
Function ClearSG(MyStringGrid : TStringGrid) : Boolean;
var
  i : Integer;
begin
  for i := 1 to MyStringGrid.RowCount -1 do
    MyStringGrid.Rows[i].Clear;
  MyStringGrid.RowCount := 2;
  result := True;
end;
function showMessage(Msg:string;btns : array Of String;MsgType : Integer):Integer; overload;
begin
  ShowMessage := ShowMessage_(Msg,btns,MsgType);
end;
procedure ShowMessage(Msg:String);Overload;
begin
  Dialogs.ShowMessage(Msg);
end;
Function GetYear(sRocDate : String) : String;
begin
  Result := Copy(sRocDate,0,Length(sRocDate)-4);
end;
Function Getmonth(sRocDate : String) : String;
begin
  Result := Copy(sRocDate,length(sRocDate)-3,2);
end;
Function GetDays(sRocDate : String) : String;
begin
  Result := Copy(sRocDate,length(sRocDate)-1,2);
end;
function DateToString(TT : TDateTime) : String;
var
  yy,mm,dd : Word;
begin
  DecodeDate(TT,yy,mm,dd);
  Result := IntTostr(yy)+AddChar(intToStr(mm),'0',2)+AddChar(IntTostr(dd),'0',2);
end;
Function DBDate(DD : String) : String;
begin
  Result := IntToStr(StrToInt64(DD));
end;
function DateInt(DD : String) : Integer;
begin
  Result := StrToInt64(NullStrTo(DD,'0'));
end;
function ExecBrowser(Url : String):Boolean;
var
  handle : Thandle;
begin
  ShellExecute(Handle, 'open', 'iexplore.exe',PChar(Url),nil,SW_SHOWNORMAL);
end;
Function StrToList(s : string) : TSTringlist;
var
  mystr , Keystr : string;
begin
  KeyStr := s;
  Result := TStringList.Create;
  Result.Clear;
  while Length(KeyStr) > 0 do
  begin
    MyStr := Copy(KeyStr,1,pos(';',keyStr)-1);
    Keystr := Copy(Keystr,Length(MyStr)+2,Length(keyStr)-Length(MyStr));
    Result.Add(myStr);
  end;
end;
Function WinExecAndWait32(FileName:String; Visibility :Integer):Integer;
var
  zAppName:array[0..512] of char;
  zCurDir:array[0..255] of char;
  WorkDir:String;
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
begin 
  StrPCopy(zAppName,FileName);
  GetDir(0,WorkDir);
  StrPCopy(zCurDir,WorkDir);
  FillChar(StartupInfo,Sizeof(StartupInfo),#0);
  StartupInfo.cb := Sizeof(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not CreateProcess(nil,
                      zAppName, { pointer to command line string }
                      nil, { pointer to process securityattributes }
                      nil, { pointer to thread securityattributes }
                      false, { handle inheritance flag }
                      CREATE_NEW_CONSOLE or { creation flags }
                      NORMAL_PRIORITY_CLASS,
                      nil, { pointer to new environment block }
                      nil, { pointer to current directory name }
                      StartupInfo, { pointer to STARTUPINFO }
                      ProcessInfo) then
    Result := -1 { pointer to PROCESS_INF }
  else
  begin
    WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
  end;
end; 

end.
