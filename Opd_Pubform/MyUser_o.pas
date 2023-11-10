unit MyUser;

interface
uses
Sysutils;
type Roper = record
  ID,Name,Dept,Level,Password,Cost,PassWord2,BeginDate: String;
end;
type Rpat = record
  chr_no,fee_no,id_no,bed_no,sex,dept,vscode,ipd_date,ipd_time,cost,Birth_date,Pat_name,PAT_ID,Micd,CPD_DATE,MDR,themoney: String;
  HasPat : Boolean;
end;
type TUser = Class
private
  myUser : Roper;
public
  procedure Clear;
  function SetUser(id,name,level,dept,pwd,Cost,Pwd2, BDate : string) : Boolean;
  property GetUserID : String read myUser.ID ;
  property GetUserName : String read myUser.Name;
  property GetUserLevel : String read myUser.Level;
  property GetUserDept : String read myUser.Dept;
  property GetUserPW : String read myUser.PassWord;
  property GetUserCost : String read myUser.Cost;
  property GetUserPw2 : String read myUser.PassWord2;
  property GetUserBeginDate : String read myUser.BeginDate;
end;
type TPat = Class
private
  myPat : Rpat;
public
  Procedure Clear;
  function SetPat(chrno,feeno,idno,bedno,sex,dept,vscode,ipddate,ipdtime,cost,Birthdate,patname,patid,micd,cpddate : String): Boolean;
  property GetChrNo : String Read myPat.Chr_no;
  property GetFeeNo : String Read myPat.Fee_no;
  property GetIdNo : String Read myPat.ID_No;
  property GetBedNo : String Read myPat.Bed_no;
  property Getsex : String Read myPat.sex;
  property GetPatDept : String Read myPat.Dept;
  property GetVsCode : String Read myPat.VsCode;
  property GetIpdDate : String Read myPat.Ipd_date;
  property GetIpdTime : String Read myPat.Ipd_Time;
  property GetCost : String Read myPat.Cost;
  property GetBirth : String Read myPat.Birth_date;
  property GetPatName : String Read myPat.Pat_Name;
  property GetPatId : String Read myPat.Pat_ID;
  property CPD_DATE : String read myPat.CPD_DATE;
  property HvaePat : boolean Read MyPat.HasPat;
end;




implementation

uses Commfunc;

{ User }

procedure TUser.Clear;
begin
  myUser.ID := '';
  myUser.Name := '';
  myUser.Dept := '';
  myUser.Level := '';
  myUser.Password := '';
  myUser.Cost := '';
  myUser.PassWord2 := '';
  myUser.BeginDate := '';
end;

function TUser.SetUser(id, name, level, dept, pwd, Cost,Pwd2, BDate: string): Boolean;
begin
  if (Trim(id)<>'') or
     (Trim(name)<>'') or
     (Trim(level)<>'') or
     (Trim(Pwd)<>'') then
  begin
    myUser.ID   := trim(id);
    myUser.name := Trim(Name);
    myUser.dept := Trim(dept);
    myUser.Level := Trim(Level);
    myUser.password := Trim(PWD);
    myUser.Cost := Trim(Cost);
    myUser.BeginDate := Trim(BDate);
    if Trim(Pwd2)='' then
      myUser.Password2 :=Trim(PWD)
    else
      myUser.Password2 :=Trim(Pwd2);
    SetUser := True;
  end
  else
  begin
    SetUser := False;
  end
end;

{ TPat }

procedure TPat.Clear;
begin
  myPat.chr_no:='';
  myPat.fee_no:='';
  myPat.id_no:='';
  myPat.bed_no:='';
  myPat.sex:='';
  myPat.dept:='';
  myPat.vscode:='';
  //myPat.password:='';
  myPat.ipd_date:='';
  myPat.ipd_time:='';
  myPat.cost:='';
  //myPat.address:='';
  //myPat.vip:='';
  myPat.Birth_date:='';
  myPat.Pat_name:='';
  myPat.PAT_ID:='';
  myPat.Micd:='';
  myPat.CPD_DATE:='';
  myPat.MDR:='';
  myPat.themoney:='';
  myPat.HasPat := False;
end;


function TPat.SetPat(chrno, feeno, idno, bedno, sex, dept, vscode, ipddate,
  ipdtime, cost, Birthdate, patname, patid, micd,
  cpddate: String): Boolean;
begin
  myPat.chr_no:=Trim(chrno);
  myPat.fee_no:=Trim(feeno);
  myPat.id_no:=Trim(idno);
  myPat.bed_no:=Trim(bedno);
  myPat.sex:=sex;
  myPat.dept:=Trim(dept);
  myPat.vscode:=Trim(vscode);
  myPat.ipd_date:=AddChar(Trim(ipddate),'0',7);
  myPat.ipd_time:=ipdtime;
  myPat.cost:=Trim(cost);
  //myPat.address:=add;
  //myPat.vip:='';
  myPat.Birth_date:=AddChar(Trim(birthdate),'0',7);
  myPat.Pat_name:=Trim(patname);
  myPat.PAT_ID:=patid;
  myPat.Micd:=micd;
  myPat.CPD_DATE:=Trim(cpddate);
  if myPat.CPD_DATE <> ''then
    myPat.CPD_DATE := AddChar(Trim(myPat.CPD_DATE),'0',7);
  myPat.MDR:='';
  myPat.themoney:='';
  myPat.HasPat := True;
  Result := True;
end;

end.
