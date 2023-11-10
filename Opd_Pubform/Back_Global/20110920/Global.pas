unit Global;

interface
uses MyUser,Classes,IniFiles,Controls,SysUtils,Windows;
var
  VsDoc,Cost,Dept,Uuser,gsOrderType,gsCir,gsPath:TStringList;
  //�H�����ī~�ϥ�
  gsXpath : TStringList;//��g����
  gsLabGroup : TStringList;//����էO
  gsLabSample : TStringList;//����
  gsCheckRoom : TStringList;//�ˬd��
  OutList : TStringList;
  gsunitDesc : TStringList;//���
  SetSys : TIniFile;
  myDate : TDate;
  myTime : TTime;
  DateTimeFlag,DateResult,DateIsNull : Boolean;
  userTime : Integer;
  myPoint : Tpoint;
  IPDUsePrinter : String;
  gsSysMsg : String;
  procedure CheckUser;

  function SetUser(id,name,level,dept,pwd,Cost,Pwd2,BDate : string): Boolean;
  Procedure ClearUser();
  function getUserId(): String; //�ϥΪ̱b��
  function getUserName(): String; //�ϥΪ̦W��
  Function GetUserDept():String; //�ϥΪ̬�O
  Function GetUserPW():String;  //�ϥΪ̱K�X
  Function GetUserPw2 : String;
  function GetUserLevel():String;
  Procedure CheckPat;
  Function SetPat(chrno,feeno,idno,bedno,sex,dept,vscode,ipddate,ipdtime,cost,Birthdate,patname,patid,micd,cpddate : String): Boolean;
  Procedure ClearPat;
  function GetChrNo : String;
  function GetFeeNo : String;
  function GetIdNo : String;
  function GetBedNo : String;
  function Getsex : String;
  function GetPatDept : String;
  function GetVsCode : String;
  function GetIpdDate : String;
  function GetIpdTime : String;
  function GetCost : String;
  function GetBirth : String;
  function GetPatName : String;
  function GetPatId : String;
  function CPD_DATE : String;

  function HavePat : Boolean;
  Procedure comStrRep(var mystr:String);
  Procedure ComStrRepParam(Var myStr:String;FeeCode:String);
  function SexType(Sex : String):String;
  procedure setUseTime(i : Integer);
  function GetUseTime():Integer;
Const
  IPD_Ver ='TMUIPD V1.1.2.9';
implementation
var
  User : TUser;
  Pat : TPat;

procedure CheckUser;
begin
  if not Assigned(User) then
    User := TUser.Create;
end;
function SetUser(id,name,level,dept,pwd ,Cost,Pwd2,BDate : string): Boolean;
begin
  CheckUser;
  SetUser := User.SetUser(id,name,level,dept,pwd,cost,Pwd2,BDate);
end;
Procedure ClearUser();
begin
  CheckUser;
  User.Clear;
end;
function getUserId(): String;
begin
  CheckUser;
  getUserId:= user.GetUserID ;
end;
function getUserName(): String;
begin
  CheckUser;
  getUserName:= user.GetUserName;
end;
Function GetUserDept():String;
begin
  CheckUser;
  GetUserDept := user.GetUserDept;
end;
Function GetUserPW():String;
begin
  CheckUser;
  GetUserPW := User.GetUserPW;
end;
Function GetUserPW2():String;
begin
  CheckUser;
  if TRim(User.GetUserPw2) = '' then
    GetUserPW2 := User.GetUserPW
  else
    GetUserPW2 := User.GetUserPw2;
end;
Function GetUserLevel():String;
begin
  CheckUser;
  GetUserLevel := User.GetUserLevel;
end;
Procedure CheckPat;
begin
  if not Assigned(Pat) then
    Pat := TPat.Create;
end;
Function SetPat(chrno,feeno,idno,bedno,sex,dept,vscode,ipddate,ipdtime,cost,Birthdate,patname,patid,micd,cpddate : String): Boolean;
begin
  SetPat := Pat.SetPat(chrno,feeno,idno,bedno,sex,dept,vscode,ipddate,ipdtime,cost,Birthdate,patname,patid,micd,cpddate);
end;
Procedure ClearPat;
begin
  Pat.Clear;
end;
function GetChrNo : String;
begin
  GetChrNo := Pat.GetChrNo;
end;
function GetFeeNo : String;
begin
  GetFeeNo := Pat.GetFeeNo;
end;
function GetIdNo : String;
begin
  GetIdNo := Pat.GetIdNo;
end;
function GetBedNo : String;
begin
  GetBedNo := Pat.GetBedNo;
end;
function Getsex : String;
begin
  Getsex := Pat.Getsex;
end;
function GetPatDept : String;
begin
  GetPatDept := Pat.GetPatDept;
end;
function GetVsCode : String;
begin
  GetVsCode := Pat.GetVsCode;
end;
function GetIpdDate : String;
begin
  GetIpdDate := Pat.GetIpdDate;
end;
function GetIpdTime : String;
begin
  GetIpdTime := Pat.GetIpdTime;
end;
function GetCost : String;
begin
  GetCost := Pat.GetCost;
end;
function GetBirth : String;
begin
  GetBirth := Pat.GetBirth;
end;
function GetPatName : String;
begin
  GetPatName := Pat.GetPatName;
end;
function GetPatId : String;
begin
  GetPatId := Pat.GetPatId;
end;
function CPD_DATE : String;
begin
  CPD_DATE := Pat.CPD_DATE;
end;
function HavePat : Boolean;
begin
  HavePat := Pat.HvaePat;
end;
Procedure comStrRep(var mystr:String);
begin
  mystr := StringReplace(mystr,'$+USERID+$',GETUSERID,[rfReplaceAll]); //�ϥΪ̥N�X
  mystr := StringReplace(mystr,'$+USERNAME+$',GETUSERNAME,[rfReplaceAll]); //�ϥΪ̦W��
  mystr := StringReplace(mystr,'$+USERDEPT+$',GETUSERDEPT,[rfReplaceAll]);
  mystr := StringReplace(mystr,'$+PATNAME+$',GETPATNAME,[rfReplaceAll]); //�f�H�W��
  mystr := StringReplace(mystr,'$+PATCHRNO+$',GETCHRNO,[rfReplaceAll]);  //�f����
  mystr := StringReplace(mystr,'$+PATIDNO+$',GETIDNO,[rfReplaceAll]); //�����Ҧr��
  mystr := StringReplace(mystr,'$+PATFEENO+$',GETFEENO,[rfReplaceAll]); //�����Ҧr��
  mystr := StringReplace(mystr,'$+PATVSCODE+$',GETVSCODE,[rfReplaceAll]);

end;
Procedure ComStrRepParam(var mystr:String;FeeCode:string);
begin
  mystr := StringReplace(mystr,'$+FEECODE+$',FeeCode,[rfReplaceAll]); //�ϥΪ̥N�X
end;
function SexType(Sex:String):String;
begin
  if Sex ='0' then
    SexType := '�k'
  else if Sex ='1' then
    SexType := '�k'
  else
    SexType := '����';
end;
procedure SetUseTime(i : Integer);
begin
  userTime := i ;
end;
function GetUseTime():Integer;
begin
  GetUseTime := userTime;
end;
end.
