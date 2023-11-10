unit Global;

interface
uses MyUser, Classes, IniFiles, Controls, SysUtils, Windows;

var
  VsDoc, Cost, Dept, Uuser, gsOrderType, gsCir, gsPath: TStringList;
  //人員及藥品使用
  gsXpath: TStringList; //放射部位
  gsLabGroup: TStringList; //檢驗組別
  gsLabSample: TStringList; //檢體
  gsCheckRoom: TStringList; //檢查室
  OutList: TStringList;
  gsunitDesc: TStringList; //單位
  SpecMed : tstringlist;//20140115高危用藥警示
  SpecbgMed : tstringlist;//20140115高危用藥警示
  SLMed, SLFee, SLLab, SLMtrl, SLXRay, SLChk: TStringList; //Ditto Cite資料
  SetSys: TIniFile;
  myDate: TDate;
  myTime: TTime;
  DateTimeFlag, DateResult, DateIsNull, IC_MachineStatus, IC_PhysicianStatus, IC_PatientStatus: Boolean;
  userTime: Integer;
  myPoint: Tpoint;
  IPDUsePrinter: string;
  gsSysMsg: string;
  gsOpdKind, gsOpdCnt, gspainscore: string;
  gsIniDeptCode, gsDefaultDeptNo: string;
  isReadOnly, isSign, isDXray, isInsDoc, isFatDoc, isSOAP: Boolean;
  PARTTYPE, CASETYPE, PAYTYPE: string;
  gsReadCloud: Boolean;//雲端藥歷讀取判斷
  cloudmedurl:string;//雲端藥歷網址
  DPD_Dept_Room,Referral : String; //Referral轉入醫院帶碼
  icdchange : String;
  //***TReg Function & Procedure ***
procedure CheckReg;
procedure ClearReg;

procedure setOpdKind(Value: string);
procedure setOpdDate(Value: string);
procedure setFeeNo(Value: string);
procedure setDeptCode(Value: string);
procedure setDeptDesc(Value: string);
procedure setDeptRoom(Value: string);
procedure setDocCode(Value: string);
procedure setDocId(Value: string);
procedure setDocDeptCode(Value: string);
procedure setDocName(Value: string);
procedure setShiftNo(Value: string);
procedure setSeqNo(Value: string);
procedure setOpdStatus(Value: string);
procedure setOrderStatus(Value: string);
procedure setDocCode1(Value: string);
procedure setDocName1(Value: string);
procedure setDocCode2(Value: string);
procedure setDocName2(Value: string);
procedure setDocCode3(Value: string);
procedure setDocName3(Value: string);
procedure setIcSeqNo(Value: string);
procedure setIdlDate(Value: string);
procedure setIdlFeeCode(Value: string);
procedure setIdlPosition(Value: string);
procedure setIdlCardNo(Value: string);
procedure setIdlFeeNo(Value: string);
procedure setDiagFlag(Value: string);
procedure setROOMDESC(Value: string);
procedure setDOCPSW(Value: string);
procedure setPATID(Value: string);
procedure setOPDSTATUSDESC(Value: string);
procedure setPARTDESC(Value: string);
procedure setCASEDESC(Value: string);
procedure setPAYDESC(Value: string);
procedure setDECFLAG(Value: string);
procedure setPainScore(Value: string);
procedure setBodyWeight(Value: string);
procedure setFirstDate(Value: string);
procedure setFirstInsSeqNo(Value: string);
procedure setvspsw(Value: string);

function getvspsw(): string;
function getOpdKind(): string;
function getOpdDate(): string;
function getFeeNo(): string;
function getDeptCode(): string;
function getDeptDesc(): string;
function getDeptRoom(): string;
function getDocCode(): string;
function getDocId(): string;
function getDocDeptCode(): string;
function getDocName(): string;
function getShiftNo(): string;
function getSeqNo(): string;
function getOpdStatus(): string;
function getOrderStatus(): string;
function getDocCode1(): string;
function getDocName1(): string;
function getDocCode2(): string;
function getDocName2(): string;
function getDocCode3(): string;
function getDocName3(): string;
function getIcSeqNo(): string;
function getIdlDate(): string;
function getIdlFeeCode(): string;
function getIdlPosition(): string;
function getIdlCardNo(): string;
function getIdlFeeNo(): string;
function getDiagFlag(): string;
function getROOMDESC(): string;
function getDOCPSW(): string;
function getPPATID(): string;
function getOPDSTATUSDESC(): string;
function getPARTDESC(): string;
function getCASEDESC(): string;
function getPAYDESC(): string;
function getDECFLAG(): string;
function getPainScore(): string;
function getBodyWeight(): string;
function getFirstDate(): string;
function getFirstInsSeqNo(): string;

  //***TPat Function & Procedure ***
procedure CheckPat;
procedure ClearPat;

procedure setChrNo(Value: string);
procedure setPatName(Value: string);
procedure setIdNo(Value: string);
procedure setAcType(Value: string);
procedure setBirthDate(Value: string);
procedure setPSex(Value: string);
procedure setPAge(Value: string);
procedure setMAge(Value: string);
procedure setWeight(Value: string);
procedure setHigh(Value: string);
procedure setAddl(Value: string);
procedure setTel(Value: string);
procedure setWarn(Value: string);
procedure setDiscCode(Value: string);

function getChrNo(): string;
function getPatName(): string;
function getIdNo(): string;
function getAcType(): string;
function getBirthDate(): string;
function getPSex(): string;
function getPAge(): string;
function getMAge(): string;
function getWeight(): string;
function getHigh(): string;
function getAddl(): string;
function getTel(): string;
function getWarn(): string;
function getDiscCode(): string;


procedure comStrRep(var mystr: string);
procedure ComStrRepParam(var myStr: string; FeeCode: string);
procedure comAdvStrRep(var mystr: string; DelFlag: string);
function SexType(Sex: string): string;
procedure setUseTime(i: Integer);
function GetUseTime(): Integer;
function GetDeptName(sDept: string): string;

implementation

uses SqlCenter, Commfunc;
var
  Reg: TReg;
  Pat: TPat;

//***TReg Function & Procedure ***

procedure CheckReg;
begin
  if not Assigned(Reg) then
    Reg := TReg.Create;
end;

procedure ClearReg();
begin
  CheckReg;
  Reg.Clear;
end;

procedure setOpdKind(Value: string);
begin
  Reg.OpdKind := Value;
end;

procedure setOpdDate(Value: string);
begin
  Reg.OpdDate := Value;
end;

procedure setFeeNo(Value: string);
begin
  Reg.FeeNo := Value;
end;

procedure setDeptCode(Value: string);
begin
  Reg.DeptCode := Value;
end;

procedure setDeptDesc(Value: string);
begin
  Reg.DeptDesc := Value;
end;

procedure setDeptRoom(Value: string);
begin
  Reg.DeptRoom := Value;
end;

procedure setDocCode(Value: string);
begin
  Reg.DocCode := Value;
end;

procedure setDocId(Value: string);
begin
  Reg.DocId := Value;
end;

procedure setDocDeptCode(Value: string);
begin
  Reg.DocDeptCode := Value;
end;

procedure setDocName(Value: string);
begin
  Reg.DocName := Value;
end;

procedure setShiftNo(Value: string);
begin
  Reg.ShiftNo := Value;
end;

procedure setSeqNo(Value: string);
begin
  Reg.SeqNo := Value;
end;

procedure setOpdStatus(Value: string);
begin
  Reg.OpdStatus := Value;
end;

procedure setOrderStatus(Value: string);
begin
  Reg.OrderStatus := Value;
end;

procedure setDocCode1(Value: string);
begin
  Reg.DocCode1 := Value;
end;

procedure setDocName1(Value: string);
begin
  Reg.DocName1 := Value;
end;

procedure setDocCode2(Value: string);
begin
  Reg.DocCode2 := Value;
end;

procedure setDocName2(Value: string);
begin
  Reg.DocName2 := Value;
end;

procedure setDocCode3(Value: string);
begin
  Reg.DocCode3 := Value;
end;

procedure setDocName3(Value: string);
begin
  Reg.DocName3 := Value;
end;

procedure setIcSeqNo(Value: string);
begin
  Reg.IcSeqNo := Value;
end;

procedure setIdlDate(Value: string);
begin
  Reg.IdlDate := Value;
end;

procedure setIdlFeeCode(Value: string);
begin
  Reg.IdlFeeCode := Value;
end;

procedure setIdlPosition(Value: string);
begin
  Reg.IdlPosition := Value;
end;

procedure setIdlCardNo(Value: string);
begin
  Reg.IdlCardNo := Value;
end;

procedure setIdlFeeNo(Value: string);
begin
  Reg.IdlFeeNo := Value;
end;

procedure setDiagFlag(Value: string);
begin
  Reg.DiagFlag := Value;
end;

procedure setROOMDESC(Value: string);
begin
  Reg.ROOMDESC := Value;
end;

procedure setDOCPSW(Value: string);
begin
  Reg.DOCPSW := Value;
end;

procedure setPATID(Value: string);
begin
  Reg.PPATID := Value;
end;

procedure setOPDSTATUSDESC(Value: string);
begin
  Reg.OPDSTATUSDESC := Value;
end;

procedure setPARTDESC(Value: string);
begin
  Reg.PARTDESC := Value;
end;

procedure setCASEDESC(Value: string);
begin
  Reg.CASEDESC := Value;
end;

procedure setPAYDESC(Value: string);
begin
  Reg.PAYDESC := Value;
end;

procedure setDECFLAG(Value: string);
begin
  Reg.DECFLAG := Value;
end;

procedure setPainScore(Value: string);
begin
  Reg.PainScore := Value;
end;

procedure setBodyWeight(Value: string);
begin
  Reg.BodyWeight := Value;
end;

procedure setFirstDate(Value: string);
begin
  Reg.FirstDate := Value;
end;

procedure setFirstInsSeqNo(Value: string);
begin
  Reg.FirstInsSeqNo := Value;
end;

procedure setvspsw(Value: string);
begin
  Reg.vspsw := Value;
end;


function getvspsw():string;
begin
  Result := Reg.vspsw;
end;

function getOpdKind(): string;
begin
  Result := Reg.OpdKind;
end;

function getOpdDate(): string;
begin
  Result := Reg.OpdDate;
end;

function getFeeNo(): string;
begin
  Result := Reg.FeeNo;
end;

function getDeptCode(): string;
begin
  Result := Reg.DeptCode;
end;

function getDeptDesc(): string;
begin
  Result := Reg.DeptDesc;
end;

function getDeptRoom(): string;
begin
  Result := Reg.DeptRoom;
end;

function getDocCode(): string;
begin
  Result := Reg.DocCode;
end;

function getDocId(): string;
begin
  Result := Reg.DocId;
end;

function getDocDeptCode(): string;
begin
  Result := Reg.DocDeptCode;
end;

function getDocName(): string;
begin
  Result := Reg.DocName;
end;

function getShiftNo(): string;
begin
  Result := Reg.ShiftNo;
end;

function getSeqNo(): string;
begin
  Result := Reg.SeqNo;
end;

function getOpdStatus(): string;
begin
  Result := Reg.OpdStatus;
end;

function getOrderStatus(): string;
begin
  Result := Reg.OrderStatus;
end;

function getDocCode1(): string;
begin
  Result := Reg.DocCode1;
end;

function getDocName1(): string;
begin
  Result := Reg.DocName1;
end;

function getDocCode2(): string;
begin
  Result := Reg.DocCode2;
end;

function getDocName2(): string;
begin
  Result := Reg.DocName2;
end;

function getDocCode3(): string;
begin
  Result := Reg.DocCode3;
end;

function getDocName3(): string;
begin
  Result := Reg.DocName3;
end;

function getIcSeqNo(): string;
begin
  Result := Reg.IcSeqNo;
end;

function getIdlDate(): string;
begin
  Result := Reg.IdlDate;
end;

function getIdlFeeCode(): string;
begin
  Result := Reg.IdlFeeCode;
end;

function getIdlPosition(): string;
begin
  Result := Reg.IdlPosition;
end;

function getIdlCardNo(): string;
begin
  Result := Reg.IdlCardNo;
end;

function getIdlFeeNo(): string;
begin
  Result := Reg.IdlFeeNo;
end;

function getDiagFlag(): string;
begin
  Result := Reg.DiagFlag;
end;

function getROOMDESC(): string;
begin
  Result := Reg.ROOMDESC;
end;

function getDOCPSW(): string;
begin
  Result := Reg.DOCPSW;
end;

function getPPATID(): string;
begin
  Result := Reg.PPATID;
end;

function getOPDSTATUSDESC(): string;
begin
  Result := Reg.OPDSTATUSDESC;
end;

function getPARTDESC(): string;
begin
  Result := Reg.PARTDESC;
end;

function getCASEDESC(): string;
begin
  Result := Reg.CASEDESC;
end;

function getPAYDESC(): string;
begin
  Result := Reg.PAYDESC;
end;

function getDECFLAG(): string;
begin
  Result := Reg.DECFLAG;
end;

function getPainScore(): string;
begin
  Result := Reg.PainScore;
end;

function getBodyWeight(): string;
begin
  Result := Reg.BodyWeight;
end;

function getFirstDate(): string;
begin
  Result := Reg.FirstDate;
end;

function getFirstInsSeqNo(): string;
begin
  Result := Reg.FirstInsSeqNo;
end;

//***TPat Function & Procedure ***

procedure CheckPat;
begin
  if not Assigned(Pat) then
    Pat := TPat.Create;
end;

procedure ClearPat;
begin
  Pat.Clear;
end;

procedure setChrNo(Value: string);
begin
  Pat.ChrNo := Value;
end;

procedure setPatName(Value: string);
begin
  Pat.PatName := Value;
end;

procedure setIdNo(Value: string);
begin
  Pat.IdNo := Value;
end;

procedure setAcType(Value: string);
begin
  Pat.AcType := Value;
end;

procedure setBirthDate(Value: string);
begin
  Pat.BirthDate := Value;
end;

procedure setPSex(Value: string);
begin
  Pat.Sex := Value;
end;

procedure setPAge(Value: string);
begin
  Pat.Age := Value;
end;

procedure setMAge(Value: string);
begin
  Pat.MAge := Value;
end;

procedure setWeight(Value: string);
begin
  Pat.Weight := Value;
end;

procedure setHigh(Value: string);
begin
  Pat.High := Value;
end;

procedure setAddl(Value: string);
begin
  Pat.Addl := Value;
end;

procedure setTel(Value: string);
begin
  Pat.Tel := Value;
end;

procedure setWarn(Value: string);
begin
  Pat.Warn := Value;
end;

procedure setDiscCode(Value: string);
begin
  Pat.DiscCode := Value;
end;

function getChrNo(): string;
begin
  Result := Pat.ChrNo;
end;

function getPatName(): string;
begin
  Result := Pat.PatName;
end;

function getIdNo(): string;
begin
  Result := Pat.IdNo;
end;

function getAcType(): string;
begin
  Result := Pat.AcType;
end;

function getBirthDate(): string;
begin
  Result := Pat.BirthDate;
end;

function getPSex(): string;
begin
  Result := Pat.Sex;
end;

function getPAge(): string;
begin
  Result := Pat.Age;
end;

function getMAge(): string;
begin
  Result := Pat.MAge;
end;

function getWeight(): string;
begin
  Result := Pat.Weight;
end;

function getHigh(): string;
begin
  Result := Pat.High;
end;

function getAddl(): string;
begin
  Result := Pat.Addl;
end;

function getTel(): string;
begin
  Result := Pat.Tel;
end;

function getWarn(): string;
begin
  Result := Pat.Tel;
end;

function getDiscCode(): string;
begin
  Result := Pat.DiscCode;
end;

procedure comStrRep(var mystr: string);
begin
  mystr := StringReplace(mystr, '$+USERID+$', getDocCode1, [rfReplaceAll]); //使用者代碼
  mystr := StringReplace(mystr, '$+USERPWS+$', getDOCPSW, [rfReplaceAll]); //使用者密碼
  mystr := StringReplace(mystr, '$+USERNAME+$', getDocName1, [rfReplaceAll]); //使用者名稱
  mystr := StringReplace(mystr, '$+USERDEPT+$', getDocDeptCode, [rfReplaceAll]);
  mystr := StringReplace(mystr, '$+PATNAME+$', getPatName, [rfReplaceAll]); //病人名稱
  mystr := StringReplace(mystr, '$+PATCHRNO+$', getChrNo, [rfReplaceAll]); //病歷號
  mystr := StringReplace(mystr, '$+PATIDNO+$', getIdNo, [rfReplaceAll]); //身分證字號
  mystr := StringReplace(mystr, '$+PATFEENO+$', getFeeNo, [rfReplaceAll]); //病患批序
  mystr := StringReplace(mystr, '$+PATVSCODE+$', getDocCode, [rfReplaceAll]);  //主治醫師
  mystr := StringReplace(mystr, '$+VSRPW+$', getvspsw, [rfReplaceAll]); //主治醫師密碼
  mystr := StringReplace(mystr, '$+USERPW+$', getDOCPSW, [rfReplaceAll]); //使用者密碼
  mystr := StringReplace(mystr, '$+PATOPDDATE+$', getOpdDate, [rfReplaceAll]); //就診日期
  mystr := StringReplace(mystr, '$+PATDEPT+$', getDeptcode, [rfReplaceAll]); //就診科別
end;

procedure ComStrRepParam(var mystr: string; FeeCode: string);
begin
  mystr := StringReplace(mystr, '$+FEECODE+$', getFeeNo, [rfReplaceAll]); //使用者代碼
end;

procedure comAdvStrRep(var mystr: string; DelFlag: string);
begin
  mystr := StringReplace(mystr, '$FEENO$', getFeeNo, [rfReplaceAll]); //批價序號
  mystr := StringReplace(mystr, '$DOCCODE$', getDocCode2, [rfReplaceAll]); //申報醫師
  mystr := StringReplace(mystr, '$DELFLAG$', DelFlag, [rfReplaceAll]); //DelFlag
end;

function SexType(Sex: string): string;
begin
  if Sex = '0' then
    SexType := '女'
  else if Sex = '1' then
    SexType := '男'
  else
    SexType := '不明';
end;

procedure SetUseTime(i: Integer);
begin
  userTime := i;
end;

function GetUseTime(): Integer;
begin
  GetUseTime := userTime;
end;

function GetDeptName(sDept: string): string;
begin
  try
    GetDeptName := ReTurnName(Dept.Strings[SetCbbItem_(Dept, trim(sDept))]);
  except
    GetDeptName := '';
  end;
end;

end.

