unit ICFunction;

interface

uses Classes, Dialogs, ADODB, SysUtils;

type
  pat = record
    card_no: array[0..11] of Byte;
    pat_name: array[12..31] of Byte;
    id_no: array[32..41] of Byte;
    bitrh_date: array[42..48] of Byte;
    sex: array[49..49] of Byte;
    get_date: array[50..56] of Byte;
    card_flag: array[57..57] of Byte;
    pat_code: array[58..59] of Byte;
    pat_mark: array[60..60] of Byte;
    end_date: array[61..67] of Byte;
    use_count: array[68..69] of Byte;
    new_born_birth: array[70..76] of Byte;
    new_born_flag: array[77..77] of Byte;
  end;

  //重大傷病區
  ILL = record
    ILL_Code1: array[0..4] of Byte;
    ILL_SDATE1: array[5..11] of Byte;
    ILL_EDATE1: array[12..18] of Byte;
    ILL_Code2: array[19..23] of Byte;
    ILL_SDATE2: array[24..30] of Byte;
    ILL_EDATE2: array[31..37] of Byte;
    ILL_Code3: array[38..42] of Byte;
    ILL_SDATE3: array[43..49] of Byte;
    ILL_EDATE3: array[50..56] of Byte;
    ILL_Code4: array[57..61] of Byte;
    ILL_SDATE4: array[62..68] of Byte;
    ILL_EDATE4: array[69..75] of Byte;
    ILL_Code5: array[76..80] of Byte;
    ILL_SDATE5: array[81..87] of Byte;
    ILL_EDATE5: array[88..94] of Byte;
    ILL_Code6: array[95..99] of Byte;
    ILL_SDATE6: array[100..106] of Byte;
    ILL_EDATE6: array[107..113] of Byte;
  end;

  //診療紀錄加重大傷病
  cure = record
    all_record: array [0..371] of Byte;
  end;

  //診療紀錄10加重大傷病
  cure10 = record
    //all_record10: array [0..539] of Byte;
    all_record10: array [0..539] of Byte;
  end;

  //重大傷病與就醫資料
  treat = record
    all_treat_record: array [0..497] of Byte;
  end;

  //新版
  ic_seq = record
    opd_date: array [0..12] of Byte;      //看診日期
    seq: array [13..16] of Byte;          //就醫序號
    hosp_code: array [17..26] of Byte;    //醫院代碼
    safe_sign: array [27..282] of Byte;   //安全簽章
    sam_id: array [283..294] of Byte;     //SAM ID
    re_reg: array [295..295] of Byte;     //是否同日看診 'Y'表同日就診，'N'表非同日就診
  end;
//門診處方籤
  OP = record
    OPD_Date: array [0..12] of Byte;
    Order_Kind: Byte;
    Treate_No: array [14..25] of Byte;
    Treate_Part: array [26..31] of Byte;
    method: array [32..49] of Byte;
    Days: array [50..51] of Byte;
    Total: array [52..58] of Byte;
    P_Note: array [59..60] of Byte;
  end;
  //長期處方籤
  LP = record
    OPD_Date: array [0..6] of Byte;
    Med_code: array [7..16] of Byte;
    Method: array [17..34] of Byte;
    Days: array [35..36] of Byte;
    TTL: array [37..43] of Byte;
  end;
  //重大醫令處方籤
  IT = record
    Exec_Date: array [0..6] of Byte;
    H_code: array [7..16] of Byte;
    Order_Code: array [17..22] of Byte;
    Exec_Part_Code: array[23..28] of Byte;
    TTL: array [29..35] of Byte;
  end;
  //過敏
  PD = record
    Med_name1: array[0..39] of Byte;
    Med_name2: array[40..79] of Byte;
    Med_name3: array[80..119] of Byte;
  end;

  //產檢
  ppreg = record
    opd_date: array[0..6] of Byte;
    hsop_code: array[7..16] of Byte;
    preg_code: array[17..18] of Byte;
  end;
  //預防保健
  prev = record
    prev_mark: array[0..1] of Byte;
    opd_date: array[2..8] of Byte;
    hsop_code: array[9..18] of Byte;
    prev_code: array[19..20] of Byte;
  end;

  //預防接種
  Inoculate = record
    Inoculate_kind: array[0..5] of Byte;
    Inoculate_date: array[6..12] of Byte;
    Inoculate_hsop: array[13..22] of Byte;
    Inoculate_no: array[23..34] of Byte;
  end;
  //器官捐贈
  Donate = record
    Donate_flag: array[0..0] of Byte;
  end;
  icdate = record
    y: array [0..2] of Byte;
    m: array [3..4] of Byte;
    d: array [5..6] of Byte;
    h: array [7..8] of Byte;
    mi: array [9..10] of Byte;
    s: array [11..12] of Byte;
  end;

type
  ic_start = class(TThread)
  protected
    procedure Execute; override;
  end;

type
  ic_HPCstart = class(TThread)
  protected
    procedure Execute; override;
  end;

type
  ic_basic = class(TThread)
  protected
    procedure Execute; override;
  end;

type
  ic_data = class(TThread)
  protected
    procedure Execute; override;
  end;

  { 1.1 讀取不需個人PIN碼資料}
function hisGetBasicData(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 1.2 掛號或報到時讀取基本資料 }
function hisGetRegisterBasic(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 1.3 預防保健掛號作業 }
function hisGetRegisterPrevent(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 1.4 孕婦產前檢查掛號作業 }
function hisGetRegisterPregnant(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 1.5 讀取就醫資料不需HPC卡的部份 }
function hisGetTreatmentNoNeedHPC(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 1.6 讀取就醫累計資料 }
function hisGetCumulativeData(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 1.7 讀取醫療費用線累計 }
function hisGetCumulativeFee(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 1.8 讀取就醫資料需HPC卡的部份 }
function hisGetTreatmentNeedHPC(Buffer: String; BufLen: PInteger): Integer; stdcall;
  { 1.9 取得就醫序號}
function hisGetSeqNumber(CTreatItem: PChar; CBabyTreat: PChar; Buffer: Pbyte; BufLen: PInteger): Integer; stdcall;
  { 1.10 讀取處方箋作業 }
function hisReadPrescription(OutPatientPrescription: PByte; BufLenOutPatient: PInteger; LongTermPrescriptions: PByte; BufLenLongTerm: PInteger; ImportantTreatmentCode: PByte; BufLenImportant: PInteger; IrritationDrug: PByte; BufLenIrritation: PInteger): Integer; stdcall;
  { 1.11 讀取預防接種資料 }
function hisGetInoculateData(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 1.12 讀取器官捐贈資料 }
function hisGetOrganDonate(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 1.13  讀取緊急聯絡電話資料 }
function hisGetEmergentTel(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 1.14  讀取最近一次就醫序號 }
function hisGetLastSeqNum(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 1.15  讀取卡片狀態 }
function hisGetCardStatus(CardType: Integer): Integer; stdcall;
  { 1.16 就醫診療資料寫入作業 }
function hisWriteTreatmentCode(DateTime: PChar; PatientID: PChar; PatientBirthDate: PChar; DataWrite: PChar; BufDocID: PChar): Integer; stdcall;
  { 1.17 就醫費用資料寫入作業 }
function hisWriteTreatmentFee(DateTime: PChar; PatientID: PChar; PatientBirthDate: PChar; DataWrite: PChar): Integer; stdcall;
  { 1.18 處方箋寫入作業	}
function hisWritePrescription(DateTime: PChar; PatientID: PChar; PatientBirthDate: PChar; DataWrite: PChar): Integer; stdcall;
  { 3.1  處方箋寫入作業並回傳簽章	}
function hisWritePrescriptionSign(DateTime: PChar; PatientID: PChar; PatientBirthDate: PChar; DataWrite: PChar; Buffer: PByte; Len: PInteger): Integer; stdcall;
  { 1.19 新生兒註記寫入作業 }
function hisWriteNewBorn(DateTime: PChar; PatientID: PChar; PatientBirthDay: PChar; DateWrite: PChar): Integer; stdcall;
  { 1.20 過敏藥物寫入作業 }
function hisWriteAllergicMedicines(PatientID: PChar; PatientBirthDate: PChar; DataWrite: PChar; BufferDocID: PChar): Integer; stdcall;
  { 1.21 同意器官捐贈及安寧緩和醫療註記寫入作業}
function hisWriteOrganDonate(PatientID: PChar; PatientBirthDate: PChar; OrganDonate: PChar): Integer; stdcall;
  { 1.22 預防保健資料寫入作業 }
function hisWriteHealthInsurance(PatientID: PChar; PatientBirthDate: PChar; ServiceItem: PChar; ServiceItemCode: PChar): Integer; stdcall;
  { 1.23 寫入緊急聯絡電話 }
function hisWriteEmergentTel(PatientID: PChar; PatientBirthDate: PChar; EmergentTel: PChar): Integer; stdcall;
  { 1.24 寫入產前檢查資料 }
function hisWritePredeliveryCheckup(PatientID: PChar; PatientBirthDate: PChar; CheckupCode: PChar): Integer; stdcall;
  { 1.25 清除產前檢查資料 }
function hisDeletePredeliveryData(PatientID: PChar; PatientBirthDate: PChar): Integer; stdcall;
  { 1.26 預防接種資料寫入作業 }
function hisWriteInoculateData(PatientID: PChar; PatientBirthDate: PChar; Item: PChar; PackageNumber: PChar): Integer; stdcall;
  { 1.27 驗證健保IC卡之PIN值 }
function csVerifyHCPIN(): Integer; stdcall;
  { 1.28 輸入新的健保IC卡PIN值 }
function csInputHCPIN(): Integer; stdcall;
  { 1.29 停用健保IC卡之PIN碼輸入功能 }
function csDisableHCPIN(): Integer; stdcall;
  { 1.30 健保IC卡卡片內容更新作業 }
function csUpdateHCContents(): Integer; stdcall;
  { 1.31 開啟COM埠 }
function csOpenCom(ComPort: Integer): Integer; stdcall;
  { 1.32 關閉COM埠 }
function csCloseCom(): Integer; stdcall;
  { 1.33 讀取重大傷病註記資料 }
function hisGetCriticalIllness(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  {1.34 讀取讀卡機日期時間}
function csGetDateTime(pBuffer: PByte; iBufferLen: Pinteger): Integer; stdcall;
  { 1.37 取得就醫序號新版 ***}
function hisGetSeqNumber256(CTreatItem: PChar; CBabyTreat: PChar; cTreatAfterCheck: PChar; Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 1.37 回復就醫資料累計值 ***}
function csUnGetSeqNumber(Buffer: PByte): Integer; stdcall;

  {1.45 hisWriteMultiPrescript 多筆處方箋寫入作業)}
function hisWriteMultiPrescript(pDateTime: PChar; pPatientID: PChar; pPatientBirthDate: PChar; pDataWrite: PChar; iWriteCount: PInteger): Integer; stdcall;


  { 2.1 SAM與DC認證 }
function csVerifySAMDC(): Integer; stdcall;
  { 3.1 資料上傳 }
function csUploadData(UploadFileName: PChar; FileSize: PChar; Number: PChar): Integer; stdcall;
  { 4.1 取得醫事人員卡狀態 }
function hpcGetHPCStatus(Req: Integer; Status: PInteger): Integer; stdcall;
  { 4.2 檢查醫事人員卡之PIN值 }
function hpcVerifyHPCPIN(): Integer; stdcall;
  { 4.3 輸入新的醫事人員卡之PIN值 }
function hpcInputHPCPIN(): Integer; stdcall;
  { 4.4 解開鎖住的醫事人員卡 }
function hpcUnlockHPC(): Integer; stdcall;
  { 4.5 取得醫事人員卡序號 }
function hpcGetHPCSN(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 4.6 取得醫事人員卡身份證字號 }
function hpcGetHPCSSN(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 4.7 取得醫事人員卡中文姓名 }
function hpcGetHPCCNAME(Buffer: PByte; BufLen: PInteger): Integer; stdcall;
  { 4.8 取得醫事人員卡英文姓名 }
function hpcGetHPCENAME(Buffer: PByte; BufLen: PInteger): Integer; stdcall;

  //*************************************

function card_status(Kind: Integer): Integer;     //卡片狀態
function IC_date_time(Kind: Integer): string;     //卡機時間
function IDC_CONNECT(): Integer; //檢查SAM卡
function HPC_check(): Integer;  //檢查醫事人員卡
function IC_check(): Integer;                     //檢查IC卡
function reupdate_ic(): Integer;                  //卡片更新
function get_preg(temp_fee: string): Integer;  //取的產檢資料
function get_prev(temp_fee: string): Integer;//取得預防保健
function get_Inoculate(temp_fee: string): Integer;  //取的預防接種資料
function get_CRITICALILLNESS(temp_fee, temp_chr: string): Integer;
function error_list(Kind, code: Integer): string;
procedure ic_error_log(Kind, code, doc: string);
function Write_TreatmentCode(): Integer;
function Write_TreatmentCode_10(): Integer;
procedure insert_card_med();   //等待寫卡
procedure insert_card_fee();   //等待寫卡
function insert_med(): Integer;
function insert_fee(): Integer;
function get_seq(treatIte: PChar; ac_code: string; baby_kind: string; card_kind: string): Integer;
function icrewritetest():string;

procedure insert_preg(fee_no, id_no, opd_date, hosp_code, preg_code: string);//寫回產檢紀錄
procedure insert_prev(fee_no, id_no, prev_mark, opd_date, hosp_code, preg_code: string);//寫回預防保健
procedure insert_Inoculate(temp_fee, Inoculate_kind, Inoculate_date, Inoculate_hsop, Inoculate_no: string);
procedure insert_allergy(Med_name1, Med_name2, Med_name3: string);   //紀錄過敏
procedure inser_PRESCRIPTION(fee_no, OPD_DATE, ORDER_KIND, INS_FEE_CODE, PART_CODE, PATH_CODE, MED_DAYS, TTL_QTY, MARK_CODE, CHR_NO: string); //寫回重大醫令
procedure inser_CRITICALILLNESS(fee_no, ILL, bdate, edate, CHR_NO: string); //寫回重大傷病
procedure insert_cure_record(fee_no, opd_Date, A_CODE1, A_CODE2, A_CODE3, A_CODE4, A_CODE5, A_CODE6: string);//診療紀錄寫入
procedure insert_treat_record(FEE_NO, TREATITEM, BABYTREAT, OPD_DATE, CARD_COMP, IC_SEQ_NO, HOSP_ID, OPD_FEE_AMT, OPD_PART_AMT, IPD_FEE_AMT, IPD_PART_AMT_MORE, IPD_PART_AMT_LESS: string); //就醫資訊
procedure insert_ic_treat_dtl(med_Code, pich_code, seq_no, MED_TTL_QTY, sing_code: string); //ic_treat_Dtl

function GetFromBuffer(Buffer: array of Byte): string; //buffer
procedure GetnilBuffer(Buffer: array of Byte); //清除buffer
function UnGetSeqNum(fee_no:string):Boolean;
function Write_HealthInsurance(ServiceItem,ServiceItemCode:string): Integer;//預防保健註記
procedure nil_ic_all();  //清除

function write_right(Kind, spec_kind, fee_no: string): Boolean;
var
  pat_Record: array [0..0] of pat;    //病人IC卡基本資料段
  ILL_Record: array [0..0] of ILL;    //IC卡重大傷病段

  cure_record: array [0..0] of cure;        //就診紀錄
  treat_record: array [0..0] of treat;      //就醫資訊
  ic_seq_record: array[0..0] of ic_seq;     //取得卡序段
  ic_date_record: array [0..0] of icdate;   //日期
  ic_med_record: array of array of string;  //藥品紀錄
  IC_fee_record: array of array of string;  //處置紀錄
  sing_buffer: array[0..39] of Byte;        //藥品簽章

  OP_Record: array[0..59] of OP; //六十組醫令
  LP_Record: array[0..29] of LP; //長期處方
  IT_Record: array[0..9] of IT; //重大醫令
  PD_Record: PD;//過敏
  preg_record: array [0..10] of ppreg; //產健
  prev_record: array [0..4] of prev; //預防保健
  Inoculate_record: array [0..39] of Inoculate;
  Donate_record: array [0..0] of Donate; //器官捐贈

  //卡片中之病人基本資料
  card_no, pat_name, id_no, sex, birth_date, card_end_date, get_date, card_flag, pat_code, pat_mark, use_count, new_born_birth, new_born_flag: string;
  //器官捐贈
  Donate_flag: string;
  //取得卡序後之資訊
  opd_date, seq, hosp_code, safe_sign, sam_id, re_reg: string;
  //重大傷病變數
  ILL_Code1, ILL_SDATE1, ILL_EDATE1, ILL_Code2, ILL_SDATE2, ILL_EDATE2, ILL_Code3, ILL_SDATE3, ILL_EDATE3: string;
  ILL_Code4, ILL_SDATE4, ILL_EDATE4, ILL_Code5, ILL_SDATE5, ILL_EDATE5, ILL_Code6, ILL_SDATE6, ILL_EDATE6: string;
  //過敏史紀錄
  Med_name1, Med_name2, Med_name3: string;
  //取卡機時間
  yy, mm, dd, hh, Min1, sec: string;
  //依附胎序
  ic_bc: Integer;      //轉換bb成為數值

  ic_error_count: Integer;  //錯誤次數;

  ServiceItem, ServiceItemcode: string;//預防保健服務項目、檢查代碼

  isExecute : Boolean;
  ErrStr : String;


  ic_start_thread: tthread;
  ic_HPCstart_thread: tthread;
  ic_basic_thread: tthread;
  ic_data_thread: tthread;
implementation

uses Global, SqlCenter, DBDM, DPDFunc, Commfunc,
  Order, FrmIC_Insert_InFo, DB;

function hisGetBasicData; stdcall; external 'cshis.dll';

function hisGetRegisterBasic; stdcall; external 'cshis.dll';

function hisGetRegisterPrevent; stdcall; external 'cshis.dll';

function hisGetRegisterPregnant; stdcall; external 'cshis.dll';

function hisGetTreatmentNoNeedHPC; stdcall; external 'cshis.dll';

function hisGetCumulativeData; stdcall; external 'cshis.dll';

function hisGetCumulativeFee; stdcall; external 'cshis.dll';

function hisGetTreatmentNeedHPC; stdcall; external 'cshis.dll';

function hisGetSeqNumber; stdcall; external 'cshis.dll';

function hisReadPrescription; stdcall; external 'cshis.dll';

function hisGetInoculateData; stdcall; external 'cshis.dll';

function hisGetOrganDonate; stdcall; external 'cshis.dll';

function hisGetEmergentTel; stdcall; external 'cshis.dll';

function hisGetLastSeqNum; stdcall; external 'cshis.dll';

function hisGetCardStatus; stdcall; external 'cshis.dll';

function hisWriteTreatmentCode; stdcall; external 'cshis.dll';

function hisWriteTreatmentFee; stdcall; external 'cshis.dll';

function hisWritePrescription; stdcall; external 'cshis.dll';

function hisWriteNewBorn; stdcall; external 'cshis.dll';

function hisWriteAllergicMedicines; stdcall; external 'cshis.dll';

function hisWriteOrganDonate; stdcall; external 'cshis.dll';

function hisWriteHealthInsurance; stdcall; external 'cshis.dll';

function hisWriteEmergentTel; stdcall; external 'cshis.dll';

function hisWritePredeliveryCheckup; stdcall; external 'cshis.dll';

function hisDeletePredeliveryData; stdcall; external 'cshis.dll';

function hisWriteInoculateData; stdcall; external 'cshis.dll';

function csVerifyHCPIN; stdcall; external 'cshis.dll';

function csInputHCPIN; stdcall; external 'cshis.dll';

function csDisableHCPIN; stdcall; external 'cshis.dll';

function csUpdateHCContents; stdcall; external 'cshis.dll';

function csOpenCom; stdcall; external 'cshis.dll';

function csCloseCom; stdcall; external 'cshis.dll';

function hisGetCriticalIllness; stdcall; external 'cshis.dll';

function csGetDateTime; stdcall; external 'cshis.dll';

function hisGetSeqNumber256; stdcall; external 'cshis.dll';

function hisWriteMultiPrescript; stdcall; external 'cshis.dll';

function csVerifySAMDC; stdcall; external 'cshis.dll';

function csUploadData; stdcall; external 'cshis.dll';

function hpcGetHPCStatus; stdcall; external 'cshis.dll';

function hpcVerifyHPCPIN; stdcall; external 'cshis.dll';

function hpcInputHPCPIN; stdcall; external 'cshis.dll';

function hpcUnlockHPC; stdcall; external 'cshis.dll';

function hpcGetHPCSN; stdcall; external 'cshis.dll';

function hpcGetHPCSSN; stdcall; external 'cshis.dll';

function hpcGetHPCCNAME; stdcall; external 'cshis.dll';

function hpcGetHPCENAME; stdcall; external 'cshis.dll';

function hisWritePrescriptionSign; stdcall; external 'cshis.dll';

function csUnGetSeqNumber; stdcall; external 'cshis.dll';

function UnGetSeqNum(fee_no:string):Boolean;
var
  tmpSql,icDT,err_msg :String;
  ErrCode:Integer;
  Qrys:TADOQuery;
begin
  Result:=true;
  Qrys := TADOQuery.Create(nil);
  try
    Qrys.Connection := DM.ADOLink;
    tmpSql:=getChkSqlStr(66);
    SetParamter(tmpSql,'$FEE_NO$',fee_no);
    Qrys.Close;
    Qrys.SQL.Clear;
    Qrys.SQL.Text:=tmpSql;
    Qrys.Open;
    if not Qrys.IsEmpty then
      if Qrys.FieldByName('ic_seq_no').AsString <> 'Z000' then
      begin
        icDT:=Qrys.FieldByName('icDT').AsString;
        ErrCode:=csUnGetSeqNumber(PByte(icDT));
        if ErrCode <> 0 then
        begin
          //err_msg := error_list(1, ErrCode); //傳入錯誤代碼
          //ic_error_log('2', err_msg, getDocCode1);
          Result:=false;
        end;
      end;
  except
    FreeAndNil(Qrys);
  end;
  FreeAndNil(Qrys);
end;

procedure ic_error_log(Kind, code, doc: string);
var
  tmpSql :String;
  SQLs :TStrings;
begin
  SQLs:=TStringList.Create;
  tmpSql:=getInsertSql(16);
  SetParamter(tmpSql,'$ERROR_KIND$',Kind);
  SetParamter(tmpSql,'$OPD_DATE$',getOpdDate);
  SetParamter(tmpSql,'$OPD_TIME$',ROCTime(now,''));
  SetParamter(tmpSql,'$CHR_NO$',getChrNo);
  SetParamter(tmpSql,'$FEE_NO$',getFeeNo);
  SetParamter(tmpSql,'$ERROR_CODE$',code);
  SetParamter(tmpSql,'$DOC_CODE$',doc);
  SetParamter(tmpSql,'$upd_oper$',doc);
  SetParamter(tmpSql,'$upd_date$',ROCDate(now,''));
  SetParamter(tmpSql,'$upd_time$',ROCTime(now,''));
  SQLs.Text:=tmpSql;
  DM.ExecSQL(SQLs);
end;

function insert_fee(): Integer;
var
  i: Integer;
  ins_fee_code, opd_datetime, order_kind, fee_code, order_set, fee_path, fee_day, fee_ttl, fee_mark, code: string;
  w_pre: Integer;
  k: Integer;
  h: array [0..0] of Integer;
  Qrys :TADOQuery;
  tmpSql,sign :String;
  SQLs :TStrings;
begin
  SQLs:=TStringList.Create;
  Qrys := TADOQuery.Create(nil);
  Qrys.Connection := DM.ADOLink;
  try
    k := 0;
    code := '';
    for i := 0 to (High(icfunction.ic_fee_record)) do
    begin
      Qrys.Close;
      Qrys.SQL.Clear;
      GetnilBuffer(sing_buffer);
      Qrys.SQL.Add('select * from orderitem_basic where fee_code=' + QuotedStr(icfunction.ic_fee_record[i][0]));
      Qrys.Open;
      if not Qrys.IsEmpty then
      begin
        if Trim(Qrys.FieldByName('ins_feecode').AsString) <> '' then
        begin
          ins_fee_code := Trim(Qrys.FieldByName('ins_feecode').AsString);
          if trim(icfunction.opd_date) = '' then
            opd_datetime := IC_date_time(1)
          else
            opd_datetime := icfunction.opd_date;
          if StrToInt(icfunction.ic_fee_record[i][2]) >= 14 then
          begin
            order_kind := '2';
          end
          else
          begin
            order_kind := '1';
          end;

          fee_code := ADSpace(ins_fee_code, 12);
          order_set := '      ';
          fee_path := ADSpace(icfunction.ic_fee_record[i][1], 18);
          fee_day := ADSpace(icfunction.ic_fee_record[i][2], 2);
          fee_ttl := ADSpace(FloatToStr(StrToFloat(icfunction.ic_fee_record[i][3]) * 100), 7);
          fee_mark := '01';
          code := code + opd_datetime + order_kind + fee_code + order_set + fee_path + fee_day + fee_ttl + fee_mark;
          k := k + 1;

          k := SizeOf(sing_buffer);

                   //hisWritePrescriptionSign(PChar(ADSpace(ICfunction.opd_date,14)), PChar(id_no), PChar(birth_date), PChar(code), PByte(@sing_buffer), Pinteger(@k))
          w_pre := hisWritePrescriptionSign(PChar(ADSpace(opd_datetime,14)), PChar(id_no), PChar(birth_date), PChar(code), PByte(@sing_buffer), Pinteger(@k));
          sign:= GetFromBuffer(sing_buffer);
          insert_ic_treat_dtl(ins_fee_code,'',icfunction.IC_fee_record[i][4],fee_ttl,sign);
        end;
      end
      else
        ins_fee_code := '';
    end;//for


    if w_pre = 0 then
    begin
      Result := 0;
    end
    else
    begin
      ic_error_log('R', IntToStr(k) + ',' + IntToStr(High(icfunction.ic_fee_record) + 1), getDocCode1);
      Result := 1; //錯誤
    end;

  except
    ic_error_log('M', IntToStr(k) + ',' + IntToStr(High(icfunction.ic_fee_record) + 1), getDocCode1);
    Result := 1;
    SQLs.Free;
    FreeAndNil(Qrys);
  end;
  SQLs.Free;
  FreeAndNil(Qrys);
end;

procedure insert_card_fee();   //等待寫卡
var
  ComRet, DC_V, IC_V: Integer;
  insert_fee: Integer;
  temp_chr: string;
  i: Integer;
begin
  try
    csCloseCom();
    ComRet := csOpenCom(0);
    if ComRet = -1 then
    begin
      csCloseCom();
    end
    else
    begin
      DC_V := IDC_CONNECT();  //SAM卡檢查
      if (DC_V > 2) then
      begin
        //錯誤不處理
      end
      else
      begin
        //IC_V := IC_CHECK();//檢查IC卡

        if (IC_V > 2) then
        begin
          //錯誤不處理
        end
        else
        begin
          insert_fee := icfunction.insert_fee();
        end;
      end;
    end;

  except
    csCloseCom();
  end;
  csCloseCom();
end;

procedure insert_ic_treat_dtl(med_Code, pich_code, seq_no, MED_TTL_QTY, sing_code: string);
var
  tmpSql :String;
  SQLs :TStrings;
  Qrys :TADOQuery;
begin
  SQLs:=TStringList.Create;
  Qrys := TADOQuery.Create(nil);
  try
    Qrys.Connection := DM.ADOLink;

    tmpSql:=getChkSqlStr(29); //ic_treat_dtl
    SetParamter(tmpSql,'$FEE_NO$',getFeeNo);
    SetParamter(tmpSql,'$FEE_CODE$',med_Code);
    Qrys.SQL.Clear;
    Qrys.SQL.Text:=tmpSql;
    Qrys.Open;
    if Qrys.IsEmpty then
    begin
      SQLs.Clear;
      tmpSql:=getInsertSql(17);//insert into ic_treat_dtl
      SetParamter(tmpSql,'$SOUR_TYPE$',getOpdKind);
      SetParamter(tmpSql,'$FEE_NO$',getFeeNo);
      if Trim(IC_date_time(2)) = '' then
        SetParamter(tmpSql,'$IC_DATE$',ROCDate(now,''))
      else
        SetParamter(tmpSql,'$IC_DATE$',IC_date_time(2));

      if Trim(IC_date_time(3)) = '' then
        SetParamter(tmpSql,'$IC_TIME$',ROCTime(now,''))
      else
        SetParamter(tmpSql,'$IC_TIME$',IC_date_time(3));
      SetParamter(tmpSql,'$TREATITEM$','' );

      if Trim(icfunction.card_no) = '' then
        SetParamter(tmpSql,'$CARD_NO$',getFeeNo)
      else
        SetParamter(tmpSql,'$CARD_NO$',icfunction.card_no);
      SetParamter(tmpSql,'$CHR_NO$',getChrNo);
      if Trim(icfunction.id_no) = '' then
        SetParamter(tmpSql,'$ID_NO$',getIdNo)
      else
        SetParamter(tmpSql,'$ID_NO$',icfunction.id_no);

      SetParamter(tmpSql,'$FEE_TYPE$','2');
      SetParamter(tmpSql,'$FEE_CODE$',med_code);
      SetParamter(tmpSql,'$MED_LOCATION$',' ');
      SetParamter(tmpSql,'$MED_METHOD$',pich_code);
      SetParamter(tmpSql,'$MED_DAYS$','1');
      SetParamter(tmpSql,'$MED_TTL_QTY$',MED_TTL_QTY);
      SetParamter(tmpSql,'$MED_INS_SEQ_NO$','');
      SetParamter(tmpSql,'$UPD_OPER$',getDocCode1);
      SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
      SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
      SetParamter(tmpSql,'$SEQ_NO$',seq_no);
      SetParamter(tmpSql,'$OK_FLAG$','F');
      if trim(ICfunction.hosp_code) <> '' then
        SetParamter(tmpSql,'$HOS_CODE$',ICfunction.hosp_code)
      else
        SetParamter(tmpSql,'$HOS_CODE$','');
      if sing_code <> '' then
        SetParamter(tmpSql,'$signature$',sing_code)
      else
        SetParamter(tmpSql,'$signature$',getFeeNo);

      SQLs.Text:=tmpSql;
      DM.ADOLink.BeginTrans;
      DM.ExecSQL(SQLs);
      DM.ADOLink.CommitTrans;
    end;
  except
    DM.ADOLink.RollbackTrans;
    SQLs.Free;
    FreeAndNil(Qrys);
  end;
  SQLs.Free;
  FreeAndNil(Qrys);
end;

function insert_med(): Integer;
var
  i: Integer;
  ins_med_code, opd_datetime, order_kind, med_code, order_set, med_path, med_day, med_ttl, med_mark, code: string;
  w_pre: Integer;
  k: Integer;
  h: array [0..0] of Integer;
  Qrys :TADOQuery;
  tmpSql :String;
  SQLs :TStrings;
begin
  try
    k := 0;
    Qrys := TADOQuery.Create(nil);
    Qrys.Connection := DM.ADOLink;
    SQLs:=TStringList.Create;
    code := '';
    for i := 0 to (High(icfunction.ic_med_record)) do
    begin
      GetnilBuffer(sing_buffer);
      Qrys.Close;
      Qrys.SQL.Clear;
      Qrys.SQL.Add('select * from orderitem_basic where fee_code=' + QuotedStr(icfunction.ic_med_record[i][0]));
      Qrys.Open;
      if not Qrys.IsEmpty then
        if Trim(Qrys.FieldByName('ins_feecode').AsString) <> '' then
        begin
          ins_med_code := Trim(Qrys.FieldByName('ins_feecode').AsString);

          if trim(icfunction.opd_date) ='' then
            opd_datetime := IC_date_time(1)
          else
            opd_datetime := icfunction.opd_date;

          if StrToInt(icfunction.ic_med_record[i][2]) >= 14 then
          begin
            order_kind := '2';
          end
          else
          begin
            order_kind := '1';
          end;

          med_code := ADSpace(ins_med_code, 12);
          order_set := '      ';
          med_path := ADSpace(icfunction.ic_med_record[i][1], 18);
          med_day := ADSpace(icfunction.ic_med_record[i][2], 2);
          med_ttl := ADSpace(FloatToStr(StrToFloat(icfunction.ic_med_record[i][3]) * 100), 7);
          med_mark := '01';
          code := code + opd_datetime + order_kind + med_code + order_set + med_path + med_day + med_ttl + med_mark;

          k := SizeOf(sing_buffer);
          w_pre:=hisWritePrescriptionSign(PChar(ADSpace(opd_datetime,14)), PChar(id_no), PChar(birth_date), PChar(code), PByte(@sing_buffer), @k);


          insert_ic_treat_dtl(ins_med_code,icfunction.ic_med_record[i][1],icfunction.ic_med_record[i][4],med_ttl,GetFromBuffer(sing_buffer));
        end;

      //h[0]  := k;
      //w_pre := hisWriteMultiPrescript(PChar(opd_datetime), PChar(id_no), PChar(birth_date), PChar(code), Pinteger(@h));
    end;
    FreeAndNil(Qrys);

    if w_pre = 0 then
    begin
      Result := 0;
    end
    else
    begin
      ic_error_log('R', IntToStr(k) + ',' + IntToStr(High(icfunction.ic_med_record) + 1), getDocCode1);
      Result := 1; //錯誤
    end;

  except
    ic_error_log('M', IntToStr(k) + ',' + IntToStr(High(icfunction.ic_med_record) + 1), getDocCode1);
    Result := 1;
    FreeAndNil(Qrys);
  end;
end;

procedure insert_card_med();   //等待寫卡
var
  ComRet, DC_V, IC_V: Integer;
  insert_med: Integer;
  temp_chr: string;
  i: Integer;
begin
  try
    csCloseCom();
    ComRet := csOpenCom(0);
    if ComRet = -1 then
    begin
      csCloseCom();
    end
    else
    begin
      DC_V := IDC_CONNECT();  //SAM卡檢查
      if (DC_V > 2) then
      begin
        //錯誤不處理
      end
      else
      begin
        //IC_V := IC_CHECK();//檢查IC卡

        if (IC_V > 2) then
        begin
          //錯誤不處理
        end
        else
          insert_med := icfunction.insert_med();
      end;
    end;

  except
    csCloseCom();
  end;
  csCloseCom();
end;

function Write_HealthInsurance(ServiceItem,ServiceItemCode:string): Integer;
var
  ErrCode:integer;
begin
  ErrCode:=hisWriteHealthInsurance(PChar(getIdNo),PChar(getBirthDate),PChar(ServiceItem),PChar(ServiceItemCode));
  result:=ErrCode;
end;

function Write_TreatmentCode(): Integer;
var
  wt: Integer;
  i: Integer;
  icd9_str: string;
  doc_code: string;
  doc_id: array [0..10] of Byte;
  a_code: string;
  Qrys :TADOQuery;
  tmpSql :String;
begin
  Qrys := TADOQuery.Create(nil);
  try
    Qrys.Connection := DM.ADOLink;
    icd9_str := '';
    icd9_str := icd9_Str + '1';
    for i := 0 to 4 do
    begin
      a_code := '';
      Qrys.Close;
      Qrys.SQL.Clear;
      Qrys.SQL.Add('select * from icd9_basic where op_flag=''N'' and final_flag=''Y'' and icd9_code=' + QuotedStr(FrmOrder.SGIcd.Cells[0, i]));
      Qrys.Open;
      if not Qrys.IsEmpty then
      begin
        a_code := Trim(Qrys.FieldByName('a_code').AsString);
        if Length(a_code) > 5 then
        begin
          a_code := Copy(a_code, 1, 5);
        end;
        icd9_str := icd9_str + ADSpace(a_code, 5);
      end;
    end;
    wt := hisWriteTreatmentCode(PChar(icfunction.opd_Date), PChar(icfunction.id_no), PChar(icfunction.birth_date), PChar(icd9_str), PChar(@doc_id));

    if wt = 0 then
      Result := 0;
    FreeAndNil(Qrys);
  except
    Result := 1;
    FreeAndNil(Qrys);
  end;
end;

function Write_TreatmentCode_10(): Integer;
var
  wt: Integer;
  i: Integer;
  icd9_str: string;
  doc_code: string;
  doc_id: array [0..10] of Byte;
  a_code: string;
  Qrys :TADOQuery;
  tmpSql :String;
begin
  Qrys := TADOQuery.Create(nil);
  try
    Qrys.Connection := DM.ADOLink;
    icd9_str := '';
    icd9_str := icd9_Str + '1';
    for i := 0 to 5 do
    begin
      a_code := '';
      Qrys.Close;
      Qrys.SQL.Clear;
      //Qrys.SQL.Add('select * from icd9_basic where op_flag=''N'' and final_flag=''Y'' and icd9_code=' + QuotedStr(FrmOrder.SGIcd.Cells[0, i]));
      Qrys.SQL.Add('select REPLACE(ICD_CODE,''.'','''') AS A_CODE from icd_code_basic where ICD_SYSTEM=''C'' AND eff_flag=''Y'' AND icd_code=' + QuotedStr(trim(FrmOrder.SGIcd10.Cells[0, i])));
      Qrys.Open;
      if not Qrys.IsEmpty then
      begin
        a_code := Trim(Qrys.FieldByName('a_code').AsString);

        icd9_str := icd9_str + '[' + CharAdd(a_code,' ', 7) + ']';
      end;
    end;
    wt := hisWriteTreatmentCode(PChar(icfunction.opd_Date), PChar(icfunction.id_no), PChar(icfunction.birth_date), PChar(icd9_str), PChar(@doc_id));

    if wt = 0 then
      Result := 0;
    FreeAndNil(Qrys);
  except
    Result := 1;
    FreeAndNil(Qrys);
  end;
end;

function icrewritetest():string;
var
  recod_row :Integer;//記錄是否有開立健保項目
  redstr: string;
  i: Integer;
begin
  redstr := '';
          SetLength(IC_med_record, 0, 5);
          SetLength(IC_med_record, FrmOrder.SGMed.RowCount - 1, 5);
          recod_row := 0;
          for i := 0 to (FrmOrder.SGMed.RowCount - 2) do
          begin
            if FrmOrder.SGMed.Cells[Del, i] <> 'X' then
            begin
              if FrmOrder.SGMed.Cells[M_Ins, i] = 'Y' then
              begin
                redstr := redstr+FrmOrder.SGMed.Cells[M_Code, i];
                icfunction.ic_med_record[i][0] := FrmOrder.SGMed.Cells[M_Code, i];
                icfunction.ic_med_record[i][1] := FrmOrder.SGMed.Cells[M_Path, i];
                icfunction.ic_med_record[i][2] := FrmOrder.SGMed.Cells[M_Day, i];
                icfunction.ic_med_record[i][3] := FrmOrder.SGMed.Cells[M_Ttl, i];
                icfunction.ic_med_record[i][4] := FrmOrder.SGMed.Cells[1, i];
                recod_row := recod_row + 1;
              end;
            end;
          end;
          if recod_row = 0 then
          begin
            SetLength(IC_med_record, 0, 5);
          end;

          SetLength(IC_fee_record, 0, 5);
          SetLength(IC_fee_record, FrmOrder.SGFee.RowCount - 1, 5);
          recod_row := 0;
          for i := 0 to (FrmOrder.SGFee.RowCount - 2) do
          begin
            if FrmOrder.SGFee.Cells[0, i] <> 'X' then
            begin
              if FrmOrder.SGFee.Cells[F_Ins, i] = 'Y' then
              begin
                redstr := redstr+FrmOrder.SGFee.Cells[F_Code, i];
                icfunction.ic_fee_record[i][0] := FrmOrder.SGFee.Cells[F_Code, i];
                icfunction.ic_fee_record[i][1] := 'STAT';
                icfunction.ic_fee_record[i][2] := '1';
                icfunction.ic_fee_record[i][3] := FrmOrder.SGFee.Cells[F_Qty, i];
                icfunction.ic_fee_record[i][4] := FrmOrder.SGFee.Cells[1, i];
                recod_row := recod_row + 1;
              end;
            end;
          end;
  Result := redstr
end;


function get_seq(treatIte: PChar; ac_code: string; baby_kind: string; card_kind: string): Integer;
var
  card_s2: Integer;  //卡片狀態傳回值
  seq_code: Integer; //取卡序傳回值
  seq_len: Integer;  //取卡需所需長度
  bab: PChar;        //傳入取卡序的胎序參數
  car: PChar;        //補卡註記，醫令皆帶 1
  fin: Integer;      //寫入產檢或預防保健或慢處傳回值
  recod_row :Integer;//記錄是否有開立健保項目
  bb: string;        //醫師輸入的胎序註記值
  i: Integer;
begin
  try
    begin
      card_s2 := card_status(2); //檢查IC卡狀態

      if baby_kind = 'B' then   //B代表2胎以上
      begin
        bb := inputbox('胎序註記', '請輸入本次就診為第幾個小孩        .', '');
        if bb <> '' then
        begin
          try
            ic_bc := StrToInt(bb);    // bc宣告成ic_function全域
          except
            ShowMessage('請輸入數字！');
            Abort;
          end;

          if ic_bc > StrToInt(new_born_flag) then
          begin
            ShowMessage('請輸入正確的胎序！');
            Abort;
          end
          else
          begin
            bab := PChar(bb);
          end;
        end
        else
        begin
          ShowMessage('請輸入胎數');
          Abort;
        end;
      end
      else
      begin
        if baby_kind = 'A' then
        begin
          bab := '1';
        end
        else
        begin
          bab := ' ';
        end
      end;
      car := '1';

      if (card_s2 >= 2) and (card_s2 <= 5) then
      begin
        //hisGetSeqNumber256(就醫類別(3),
        //                   新生兒就醫註記(2),
        //                   補卡註記:1正常,2:補卡(1),
        //                   HIS準備之buffer
        //                   HIS準備之buffer長度);
        seq_len := SizeOf(ic_seq_Record);
        seq_code := hisGetSeqNumber256(treatIte, bab, car, PByte(@ic_seq_Record), @seq_len); //新版取卡序
        //seq_code:=hisGetSeqNumber(treatIte,pchar(bab),Pbyte(@ic_seq_Record),@seq_len); //舊版取卡序
        if (seq_code = 0) or (seq_code = 5010) then
        begin
          opd_date := GetFromBuffer(ic_seq_Record[0].opd_date);
          seq := GetFromBuffer(ic_seq_Record[0].seq);
          hosp_code := GetFromBuffer(ic_seq_Record[0].hosp_code);
          safe_sign := GetFromBuffer(ic_seq_Record[0].safe_sign);
          sam_id := GetFromBuffer(ic_seq_Record[0].sam_id);
          re_reg := GetFromBuffer(ic_seq_Record[0].re_reg); //新版才有
          //safe_sign:=tran_safe_sign();

          fin := 0;

          SetLength(IC_med_record, 0, 5);
          SetLength(IC_med_record, FrmOrder.SGMed.RowCount - 1, 5);
          recod_row := 0;
          for i := 0 to (FrmOrder.SGMed.RowCount - 2) do
          begin
            if FrmOrder.SGMed.Cells[Del, i] <> 'X' then
            begin
              if FrmOrder.SGMed.Cells[M_Ins, i] = 'Y' then
              begin
                icfunction.ic_med_record[i][0] := FrmOrder.SGMed.Cells[M_Code, i];
                icfunction.ic_med_record[i][1] := FrmOrder.SGMed.Cells[M_Path, i];
                icfunction.ic_med_record[i][2] := FrmOrder.SGMed.Cells[M_Day, i];
                icfunction.ic_med_record[i][3] := FrmOrder.SGMed.Cells[M_Ttl, i];
                icfunction.ic_med_record[i][4] := FrmOrder.SGMed.Cells[1, i];
                recod_row := recod_row + 1;
              end;
            end;
          end;
          if recod_row = 0 then
          begin
            SetLength(IC_med_record, 0, 5);
          end;

          SetLength(IC_fee_record, 0, 5);
          SetLength(IC_fee_record, FrmOrder.SGFee.RowCount - 1, 5);
          recod_row := 0;
          for i := 0 to (FrmOrder.SGFee.RowCount - 2) do
          begin
            if FrmOrder.SGFee.Cells[0, i] <> 'X' then
            begin
              if FrmOrder.SGFee.Cells[F_Ins, i] = 'Y' then
              begin
                icfunction.ic_fee_record[i][0] := FrmOrder.SGFee.Cells[F_Code, i];
                icfunction.ic_fee_record[i][1] := 'STAT';
                icfunction.ic_fee_record[i][2] := '1';
                icfunction.ic_fee_record[i][3] := FrmOrder.SGFee.Cells[F_Qty, i];
                icfunction.ic_fee_record[i][4] := FrmOrder.SGFee.Cells[1, i];
                recod_row := recod_row + 1;
              end;
            end;
          end;
          if recod_row = 0 then
          begin
            SetLength(ic_fee_record, 0, 5);
          end;
          //20140829學承MARK
          {if (treatIte = 'AC') and (card_kind = 'B') then //產檢紀錄
          begin
            fin := hisWritePredeliveryCheckup(PChar(id_no), PChar(birth_date), PChar(ac_code));
          end;
          if (treatIte = 'AC') and (Copy(card_kind, 1, 1) = 'A') then //預防保健
          begin
            if baby_kind = 'A' then //hisWriteHealthInsurance(身分證號(11),出生日期(8),保健服務項目註記(3),檢查項目代碼(3))
            begin
              //新生兒
              fin := hisWriteHealthInsurance(PChar(id_no), PChar(new_born_birth), PChar(Copy(card_kind, 2, 2)), PChar(ac_code));
            end
            else
            begin
              fin := hisWriteHealthInsurance(PChar(id_no), PChar(birth_date), PChar(Copy(card_kind, 2, 2)), PChar(ac_code));
            end;
          end; }

          if fin = 0 then
          begin
            Result := 0;
          end
          else
          begin
            Result := fin;
          end;
        end
        else
        begin
          Result := seq_code;
        end;  
      end
      else
      begin
        Result := card_s2;
      end;
    end;
  except
    Result := -1;
  end;
end;

function reupdate_ic(): Integer; //更新卡片
var
  up: Integer;
begin
  up := csUpdateHCContents();
  Result := up;
end;

function GetFromBuffer(Buffer: array of Byte): string; //buffer
var
  i: Integer;
  tmp: string;
begin
  for i := Low(Buffer) to High(Buffer) do
  begin
    tmp := tmp + Chr(Buffer[i]);
  end;

  Result := tmp;
end;

function IC_date_time(Kind: Integer): string;
var
  da_length, d: Integer;
begin
  try
    da_length := SizeOf(ic_date_record);
    if csGetDateTime(PByte(@ic_date_record), @da_length) = 0 then
    begin
      yy := GetFromBuffer(ic_date_record[0].y);
      mm := GetFromBuffer(ic_date_record[0].m);
      dd := GetFromBuffer(ic_date_record[0].d);
      hh := GetFromBuffer(ic_date_record[0].h);
      Min1 := GetFromBuffer(ic_date_record[0].mi);
      sec := GetFromBuffer(ic_date_record[0].s);
      case Kind of
        1:
          Result := (yy + mm + dd + hh + Min1 + sec);
        2:
          Result := (yy + mm + dd);
        3:
          Result := (hh + Min1 + sec);
      end;
    end;
  except
  end;
end;

procedure GetnilBuffer(Buffer: array of Byte); //buffer
var
  i: Integer;
  tmp: string;
begin
  for i := Low(Buffer) to High(Buffer) do
  begin
    tmp := '';//tmp + chr(Buffer[i]);
  end;
end;

procedure nil_ic_all();
begin
  GetnilBuffer(pat_Record[0].card_no);
  GetnilBuffer(pat_Record[0].pat_name);
  GetnilBuffer(pat_Record[0].id_no);
  GetnilBuffer(pat_Record[0].sex);
  GetnilBuffer(pat_Record[0].bitrh_date);
  GetnilBuffer(pat_Record[0].end_date);
  GetnilBuffer(pat_Record[0].use_count);
  GetnilBuffer(pat_Record[0].pat_mark);
  GetnilBuffer(pat_Record[0].new_born_birth);
  GetnilBuffer(pat_Record[0].new_born_flag);

  GetnilBuffer(ic_seq_Record[0].opd_date);
  GetnilBuffer(ic_seq_Record[0].seq);
  GetnilBuffer(ic_seq_Record[0].hosp_code);
  GetnilBuffer(ic_seq_Record[0].safe_sign);
  GetnilBuffer(ic_seq_Record[0].sam_id);

  ICFunction.card_no := '';
  ICFunction.pat_name := '';
  ICFunction.id_no := '';
  ICFunction.sex := '';
  ICFunction.birth_date := '';
  ICFunction.card_end_date := '';
  ICFunction.get_date := '';
  ICFunction.card_flag := '';
  ICFunction.pat_code := '';
  ICFunction.pat_mark := '';
  ICFunction.use_count := '';
  ICFunction.new_born_birth := '';
  ICFunction.new_born_flag := '';

  ICFunction.opd_date := '';
  ICFunction.seq := '';
  ICFunction.hosp_code := '';
  ICFunction.safe_sign := '';
  ICFunction.sam_id := '';
  ICFunction.re_reg := '';
end;

function card_status(Kind: Integer): Integer;  // 檢查卡片狀態
var
  card_code: Integer;
begin
  card_code := hisGetCardStatus(Kind);
  Result := card_code;
end;

function error_list(Kind, code: Integer): string;
var
  ERR_DESC, ERR_PLAN, ERR_RETURN_CODE: string;
  Qrys :TADOQuery;
  tmpSql :String;
begin
  Qrys := TADOQuery.Create(nil);
  try
    Qrys.Connection := DM.ADOLink;
    Qrys.SQL.Clear;
    tmpSql:=getICSql(1);
    SetParamter(tmpSql,'$ERROR_CODE$',IntToStr(code));
    Qrys.SQL.Text:=tmpSql;
    Qrys.Open;

    if not Qrys.IsEmpty then
    begin
      ERR_DESC := Qrys.FieldByName('ERR_DESC').AsString;
      ERR_PLAN := Qrys.FieldByName('ERR_PLAN').AsString;
      ERR_RETURN_CODE := Qrys.FieldByName('ERR_RETURN_CODE').AsString;
      case Kind of
        0:
          Result := IntToStr(code) + ':' + ERR_DESC + '#' + ERR_PLAN;
        1:
          Result := ERR_RETURN_CODE;
      end;
    end;
  finally
     FreeAndNil(Qrys);
  end;
end;

function IDC_CONNECT(): Integer; //檢查SAM卡
var
  card_s1, IDC: Integer;
begin
  card_s1 := card_status(1); //檢查SAM卡狀態

  if card_s1 = 1 then
  begin
    IDC := csVerifySAMDC();
    if (IDC <> 0) or (IDC <> 4050) then
    begin
      if IDC <> 0 then
      begin
        IDC := csVerifySAMDC();
        if IDC <> 0 then
        begin
          Result := IDC;//傳入錯誤代碼
        end
        else
        begin
          Result := 0;
        end;
      end
      else
      begin
        Result := 0;
      end;
    end
    else
    begin
      Result := IDC;//傳入錯誤代碼
    end;
  end
  else if card_s1 = 2 then
  begin
    Result := 0;
  end
  else
    Result := card_s1;

end;

function HPC_check(): Integer;  //檢查醫事人員卡
var
  card_s3, HPC: Integer;
begin
  card_s3 := card_status(3); //檢查醫事人員卡狀態
  if  (card_s3 <> 3) then //(card_s3 <> 2) or
  begin
    //card_s3 := 2; 20141014 terry
    if card_s3 = 2 then
    begin
      HPC := hpcVerifyHPCPIN();
      if (HPC <> 0)  then //or (HPC <> 4050)  20141014 terry
      begin
        //if HPC <> 0 then  20141014 terry
        //begin
          HPC := hpcVerifyHPCPIN();
          if HPC <> 0 then
          begin
            Result := HPC;//傳入錯誤代碼
          end
          else
          begin
            Result := 0;
          end;
        //end
       // else
       // begin
       //   Result := 0;
       // end;
      end
      else
      begin
        Result := HPC;//傳入錯誤代碼
      end;
    end
    else
    begin
      //Result := 0;
      Result := 9; //20141014 terry
    end;
  end
  else
    Result := 0;
end;

procedure ic_HPCstart.Execute;
var
  ComRet, DC_V, HPC_V: Integer;//ComRet...comport傳回直; DC_V....IDC認證傳回值;
  err_msg: string;
begin
  FreeOnTerminate := true;
  isExecute:=false;
  try
    csCloseCom();
    ComRet := csOpenCom(0);
    if ComRet = -1 then
    begin
      csCloseCom();
      ErrStr:='開啟健保IC卡失敗!!!!請聯絡資訊室';
    end
    else
    begin
      DC_V := IDC_CONNECT();  //SAM卡檢查
      if (DC_V <> 0) then
      begin
        err_msg := error_list(0, DC_V); //傳入錯誤代碼
        ErrStr:='請確認您的卡機！！'+err_msg;
      end
      else
      begin
        HPC_V := HPC_check(); //醫事人員卡檢查
        if HPC_V <> 0 then
        begin
          err_msg := error_list(0, HPC_V); //傳入錯誤代碼
          ErrStr:='醫師卡認證失敗！請重新認證！'+err_msg;
        end
        else
        begin
          ErrStr:='醫師卡認證成功！';
        end;
      end;
    end;
  finally
    csCloseCom();
    isExecute:=true;
  end;
end;

procedure ic_start.Execute;
var
  ComRet, DC_V: Integer;//ComRet...comport傳回直; DC_V....IDC認證傳回值;
  err_msg: string;
begin
  FreeOnTerminate := true;
  isExecute:=false;

  try
    csCloseCom();
    ComRet := csOpenCom(0);
    if ComRet = -1 then
        ErrStr:='開啟讀卡機失敗!'+#13+'請聯絡資訊室'
    else
    begin
      DC_V := IDC_CONNECT();  //SAM卡檢查
      if (DC_V <> 0) then
      begin
        err_msg := error_list(0, DC_V); //傳入錯誤代碼
        ErrStr:='請確認您的卡機！！'+err_msg;
      end
      else
        ErrStr:='卡機認證成功！！';
    end;
  finally
    csCloseCom();
    isExecute:=true;
  end;
end;

function IC_check(): Integer;
var
  card_s2: Integer;
  //reg:integer;
  basic_Len: Integer;
  use: Integer;
  n: Integer;
  Donate_Len: Integer;
  d: Integer;
begin
  card_s2 := card_status(2); //檢查IC卡狀態
  if (card_s2 >= 2) and (card_s2 <= 5) then
  begin
    basic_Len := SizeOf(pat_Record);
    n         := hisGetRegisterBasic(PByte(@pat_Record), @basic_Len);
    if n = 0 then
    begin
      card_no := GetFromBuffer(pat_Record[0].card_no);
      pat_name := GetFromBuffer(pat_Record[0].pat_name);

      id_no := GetFromBuffer(pat_Record[0].id_no);
      sex := GetFromBuffer(pat_Record[0].sex);
      birth_date := GetFromBuffer(pat_Record[0].bitrh_date);

      get_date := GetFromBuffer(pat_Record[0].get_date);
      card_flag := GetFromBuffer(pat_Record[0].card_flag);
      pat_code := GetFromBuffer(pat_Record[0].pat_code);

      card_end_date := GetFromBuffer(pat_Record[0].end_date);
      use_count := GetFromBuffer(pat_Record[0].use_count);
      pat_mark := GetFromBuffer(pat_Record[0].pat_mark);
      new_born_birth := GetFromBuffer(pat_Record[0].new_born_birth);
      new_born_flag := GetFromBuffer(pat_Record[0].new_born_flag);
    end;

    Donate_Len := SizeOf(Donate_record);
    D          := hisGetOrganDonate(PByte(@Donate_record), @Donate_Len);
    if d = 0 then
    begin
      Donate_flag := GetFromBuffer(Donate_record[0].Donate_flag);
    end;

    try
      if id_no = trim(getIdNo) then
      begin
        if StrToInt(card_end_Date) > StrToInt(IC_date_time(2)) then
        begin
          if StrToInt(use_count) > 0 then
          begin
            Result := 0;
          end
          else
          begin
            use := reupdate_ic();
            if use = 0 then
            begin
              Result := 0;
            end
            else
            begin
              Result := use;
            end;
          end;
        end
        else
        begin
          //小於今天
          use := reupdate_ic();
          if use = 0 then
          begin
            Result := 0;
          end
          else
          begin
            Result := use;
          end;
        end;
      end
      else
      begin
        Result := 9999;//非本人
      end;
    except
    end;
  end
  else
  begin
    case card_s2 of
      0:
        Result := 4013;
      1:
        Result := 4050;
      9:
        Result := 4033;
    end;
  end;
end;

function write_right(Kind, spec_kind, fee_no: string): Boolean;
var
  tmpSql :String;
  Qrys :TADOQuery;
begin
  case StrToInt(Kind) of
    1:
    begin
      tmpSql:=getChkSqlStr(20);
      SetParamter(tmpSql,'$FEE_NO$',fee_no);
    end;
    2:
    begin
      tmpSql:=getChkSqlStr(21);
      SetParamter(tmpSql,'$FEE_NO$',fee_no);
    end;
    3:
    begin
      tmpSql:=getChkSqlStr(22);
      SetParamter(tmpSql,'$FEE_NO$',fee_no);
      if spec_kind = '1' then
        SetParamter(tmpSql,'$PREVENT_KIND$','P')
      else
        SetParamter(tmpSql,'$PREVENT_KIND$','C');
    end;
    4:
    begin
      tmpSql:=getChkSqlStr(23);
      SetParamter(tmpSql,'$FEE_NO$',fee_no);
    end;
  end;

  Qrys := TADOQuery.Create(nil);
  try
    Qrys.Connection := DM.ADOLink;
    Qrys.SQL.Clear;
    Qrys.SQL.Text:=tmpSql;
    Qrys.Open;
    if not Qrys.IsEmpty then
      Result:=true
    else
      Result:=false;
  finally
     FreeAndNil(Qrys);
  end;
end;

procedure insert_preg(fee_no, id_no, opd_date, hosp_code, preg_code: string);
var
  tmpSql :String;
  SQLs :TStrings;
begin
  SQLs:=TStringList.Create;
  tmpSql:=getInsertSql(9);
  SetParamter(tmpSql,'$FEE_NO$',fee_no);
  SetParamter(tmpSql,'$id_no$',id_no);
  SetParamter(tmpSql,'$Prevent_kind$','P');
  SetParamter(tmpSql,'$Prevent_mark$','');
  SetParamter(tmpSql,'$OPD_DATE$',opd_date);
  SetParamter(tmpSql,'$hosp_code$',hosp_code);
  SetParamter(tmpSql,'$preg_code$',preg_code);
  SetParamter(tmpSql,'$upd_oper$',getDocCode1);
  SetParamter(tmpSql,'$upd_date$',ROCDate(now,''));
  SetParamter(tmpSql,'$upd_time$',ROCTime(now,''));
  SQLs.Text:=tmpSql;
  try
    begin
      DM.ExecSQL(SQLs);
    end;
  except
  end;
  SQLs.Free;
end;

function get_preg(temp_fee: string): Integer;  //取的產檢資料
var
  preg_len: Integer;
  preg: Integer;
  preg_opd_date, preg_hosp_code, preg_preg_code: string;
  i: Integer;
begin
  preg_len := SizeOf(preg_Record);
  preg := hisGetRegisterPregnant(Pbyte(@preg_Record), @preg_Len);
  if preg = 0 then
  begin
    for i := 0 to 10 do
    begin
      preg_opd_Date := GetFromBuffer(preg_Record[i].opd_date);
      if Trim(preg_opd_Date) <> '' then
      begin
        preg_hosp_code := GetFromBuffer(preg_Record[i].hsop_code);
        preg_preg_code := GetFromBuffer(preg_Record[i].preg_code);
        insert_preg(temp_fee, getIdNo, preg_opd_date, preg_hosp_code, preg_preg_code);
      end
      else
      begin
        Result := 0;
        Break;
      end;
      Result := 0
    end;
  end
  else
  begin
    Result := 1;
  end;
end;

procedure insert_prev(fee_no, id_no, prev_mark, opd_date, hosp_code, preg_code: string);
var
  tmpSql :String;
  SQLs :TStrings;
begin
  SQLs:=TStringList.Create;
  tmpSql:=getInsertSql(9);
  SetParamter(tmpSql,'$FEE_NO$',fee_no);
  SetParamter(tmpSql,'$ID_NO$',id_no);
  SetParamter(tmpSql,'$Prevent_kind$','C');
  SetParamter(tmpSql,'$Prevent_mark$',prev_mark);
  SetParamter(tmpSql,'$OPD_DATE$',opd_date);
  SetParamter(tmpSql,'$hosp_code$',hosp_code);
  SetParamter(tmpSql,'$preg_code$',preg_code);
  SetParamter(tmpSql,'$upd_oper$',getDocCode1);
  SetParamter(tmpSql,'$upd_date$',ROCDate(now,''));
  SetParamter(tmpSql,'$upd_time$',ROCTime(now,''));
  SQLs.Text:=tmpSql;
  try
    begin
      DM.ExecSQL(SQLs);
    end;
  except
  end;
  SQLs.Free;
end;

function get_prev(temp_fee: string): Integer;//取得預防保健
var
  prev_len: Integer;
  prev: Integer;
  prev_opd_date, prev_hosp_code, prev_prev_code, prev_prev_mark: string;
  i: Integer;
begin
  prev_len := SizeOf(prev_Record);
  prev := hisGetRegisterPrevent(Pbyte(@prev_Record), @prev_Len);
  if prev = 0 then
  begin
    for i := 0 to 5 do
    begin
      prev_prev_mark := GetFromBuffer(prev_Record[i].prev_mark);
      if Trim(prev_prev_mark) <> '' then
      begin
        prev_opd_Date := GetFromBuffer(prev_Record[i].opd_date);
        prev_hosp_code := GetFromBuffer(prev_Record[i].hsop_code);
        prev_prev_code := GetFromBuffer(prev_Record[i].prev_code);
        insert_prev(temp_fee, getIdNo, prev_prev_mark, prev_opd_date, prev_hosp_code, prev_prev_code);
      end
      else
      begin
        Result := 0;
        Break;
      end;
    end;
  end
  else
  begin
    Result := 1;
  end;
end;

procedure insert_Inoculate(temp_fee, Inoculate_kind, Inoculate_date, Inoculate_hsop, Inoculate_no: string);
var
  tmpSql :String;
  SQLs :TStrings;
begin
  SQLs:=TStringList.Create;
  tmpSql:=getInsertSql(10);
  SetParamter(tmpSql,'$FEE_NO$',temp_fee);
  SetParamter(tmpSql,'$OPD_DATE$',getOpdDate);
  SetParamter(tmpSql,'$Inoculate_kind$',Inoculate_kind);
  SetParamter(tmpSql,'$Inoculate_date$',Inoculate_date);
  SetParamter(tmpSql,'$HOSP_CODE$',Inoculate_hsop);
  SetParamter(tmpSql,'$Inoculate_no$',Inoculate_no);
  SetParamter(tmpSql,'$upd_oper$',getDocCode1);
  SetParamter(tmpSql,'$upd_date$',ROCDate(now,''));
  SetParamter(tmpSql,'$upd_time$',ROCTime(now,''));
  SQLs.Text:=tmpSql;
  try
    begin
      DM.ExecSQL(SQLs);
    end;
  except
  end;
  SQLs.Free;

end;

function get_Inoculate(temp_fee: string): Integer;  //取的預防接種資料
var
  Inoculate_len: Integer;
  Inoculate: Integer;
  Inoculate_kind, Inoculate_date, Inoculate_hsop, Inoculate_no: string;
  i: Integer;
begin
  Inoculate_len := SizeOf(Inoculate_Record);

  Inoculate := hisGetInoculateData(Pbyte(@Inoculate_Record), @Inoculate_Len);

  if Inoculate = 0 then
  begin
    for i := 0 to 39 do
    begin
      Inoculate_kind := GetFromBuffer(Inoculate_Record[i].Inoculate_kind);
      if Trim(Inoculate_kind) <> '' then
      begin
        Inoculate_date := GetFromBuffer(Inoculate_Record[i].Inoculate_date);
        Inoculate_hsop := GetFromBuffer(Inoculate_Record[i].Inoculate_hsop);
        Inoculate_no := GetFromBuffer(Inoculate_Record[i].Inoculate_no);
        insert_Inoculate(temp_fee, Inoculate_kind, Inoculate_date, Inoculate_hsop, Inoculate_no);
      end
      else
      begin
        Result := 0;
        Break;
      end;
      Result := 0
    end;
  end
  else
  begin
    Result := 1;
  end;
end;

procedure insert_allergy(Med_name1, Med_name2, Med_name3: string);
var
  Qrys :TADOQuery;
  tmpSql :String;
  SQLs :TStrings;
begin
  SQLs:=TStringList.Create;
  tmpSql:=getChkSqlStr(24);
  SetParamter(tmpSql,'$FEE_NO$',getFeeNo);
  SQLs.Clear;
  SQLs.Text:=tmpSql;
  if not DM.OpenSQL(SQLs,Qrys) then
  begin
    tmpSql:=getInsertSql(11);
    SetParamter(tmpSql,'$FEE_NO$',getFeeNo);
    SetParamter(tmpSql,'$ID_NO$',getIdNo);
    SetParamter(tmpSql,'$OPD_DATE$',getOpdDate);
    SetParamter(tmpSql,'$CHR_NO$',getChrNo);
    SetParamter(tmpSql,'$allergy1$',Med_name1);
    SetParamter(tmpSql,'$allergy2$',Med_name2);
    SetParamter(tmpSql,'$allergy3$',Med_name3);
    SetParamter(tmpSql,'$UPD_OPER$',getDocCode1);
    SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
    SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
    SQLs.Clear;
    SQLs.Text:=tmpSql;
    try
      begin
        DM.ExecSQL(SQLs);
      end;
    except
    end;
  end;
  SQLs.Free;
end;

procedure inser_PRESCRIPTION(fee_no, OPD_DATE, ORDER_KIND, INS_FEE_CODE, PART_CODE, PATH_CODE, MED_DAYS, TTL_QTY, MARK_CODE, CHR_NO: string); //寫入重大醫令
var
  Qrys :TADOQuery;
  tmpSql :String;
  SQLs :TStrings;
begin
  SQLs:=TStringList.Create;
  tmpSql:=getInsertSql(12);
  SetParamter(tmpSql,'$FEE_NO$',getFeeNo);
  SetParamter(tmpSql,'$OPD_DATE$',OPD_DATE);
  SetParamter(tmpSql,'$ORDER_KIND$',ORDER_KIND);
  SetParamter(tmpSql,'$INS_FEE_CODE$',INS_FEE_CODE);
  SetParamter(tmpSql,'$PART_CODE$',PART_CODE);
  SetParamter(tmpSql,'$PATH_CODE$',PATH_CODE);
  SetParamter(tmpSql,'$MED_DAYS$',MED_DAYS);
  SetParamter(tmpSql,'$TTL_QTY$',TTL_QTY);
  SetParamter(tmpSql,'$MARK_CODE$',MARK_CODE);
  SetParamter(tmpSql,'$CHR_NO$',CHR_NO);
  SQLs.Clear;
  SQLs.Text:=tmpSql;
  try
    begin
      DM.ExecSQL(SQLs);
    end;
  except
  end;
  SQLs.Free;
end;

function get_PRESCRIPTION(temp_chr, temp_fee: string): Integer;
var
  op_len, lp_len, it_len, pd_len: Integer;
  Order_Ret: Integer;
  i, j: Integer;
  op_OPD_DATE, op_ORDER_KIND, op_INS_FEE_CODE, op_PART_CODE, op_PATH_CODE, op_MED_DAYS, op_TTL_QTY, op_MARK_CODE: string;
begin
  OP_Len := SizeOf(OP_Record);
  LP_Len := SizeOf(LP_Record);
  IT_Len := SizeOf(IT_Record);
  PD_Len := SizeOf(PD_Record);
  Order_Ret := hisReadPrescription(Pbyte(@OP_Record), @OP_Len, Pbyte(@LP_Record), @LP_Len, Pbyte(@IT_Record), @IT_Len, Pbyte(@PD_Record), @PD_Len);

  if Order_Ret = 0 then
  begin
    for i := 0 to 59 do
    begin
      op_opd_Date := GetFromBuffer(op_Record[i].OPD_Date);
      if Trim(op_opd_Date) <> '' then
      begin
        op_ORDER_KIND := GetFromBuffer(op_Record[i].Order_Kind);
        op_INS_FEE_CODE := GetFromBuffer(op_Record[i].Treate_No);
        op_PART_CODE := GetFromBuffer(op_Record[i].Treate_Part);
        op_PATH_CODE := GetFromBuffer(op_Record[i].method);
        op_MED_DAYS := GetFromBuffer(op_Record[i].Days);

        Med_name1 := GetFromBuffer(PD_Record.Med_name1);
        Med_name2 := GetFromBuffer(PD_Record.Med_name2);
        Med_name3 := GetFromBuffer(PD_Record.Med_name3);

        if ((Trim(Med_name1) <> '') or (Trim(Med_name2) <> '') or (Trim(Med_name3) <> '')) then
        begin
          insert_allergy(Trim(Med_name1), Trim(Med_name2), Trim(Med_name3));    //寫入過敏史
        end;

        if GetFromBuffer(op_Record[i].Total) = '' then
        begin
          op_TTL_QTY := '   ';
        end
        else
        begin
          op_TTL_QTY := FloatToStr(StrToFloat(GetFromBuffer(op_Record[i].Total)) / 100);
        end;
        op_MARK_CODE := GetFromBuffer(op_Record[i].P_Note);
        inser_PRESCRIPTION(temp_fee, op_OPD_DATE, op_ORDER_KIND, op_INS_FEE_CODE, op_PART_CODE, op_PATH_CODE, op_MED_DAYS, op_TTL_QTY, op_MARK_CODE, temp_chr);
      end
      else
      begin
        Result := 0;
        Break;
      end;
    end;
    Result := 0;
  end
  else
  begin
    Result := 1;
  end;

end;

procedure inser_CRITICALILLNESS(fee_no, ILL, bdate, edate, CHR_NO: string);  //寫入重大傷病
var
  tmpSql :String;
  SQLs :TStrings;
begin
  SQLs:=TStringList.Create;
  tmpSql:=getInsertSql(13);
  SetParamter(tmpSql,'$FEE_NO$',getFeeNo);
  SetParamter(tmpSql,'$CRITICAL_CODE$',ILL);
  SetParamter(tmpSql,'$BEGIN_DATE$',bdate);
  SetParamter(tmpSql,'$END_DATE$',edate);
  SetParamter(tmpSql,'$CHR_NO$',CHR_NO);
  SQLs.Text:=tmpSql;
  try
    begin
      DM.ExecSQL(SQLs);
    end
  except
  end;
  SQLs.Free;
end;

procedure insert_cure_record(fee_no, opd_Date, A_CODE1, A_CODE2, A_CODE3, A_CODE4, A_CODE5, A_CODE6: string);
var
  tmpSql :String;
  SQLs :TStrings;
begin
  SQLs:=TStringList.Create;
  tmpSql:=getInsertSql(14);
  SetParamter(tmpSql,'$FEE_NO$',FEE_NO);
  SetParamter(tmpSql,'$ID_NO$',trim(getIdNo));
  SetParamter(tmpSql,'$OPD_DATE$',OPD_DATE);
  SetParamter(tmpSql,'$A_CODE1$',A_CODE1);
  SetParamter(tmpSql,'$A_CODE2$',A_CODE2);
  SetParamter(tmpSql,'$A_CODE3$',A_CODE3);
  SetParamter(tmpSql,'$A_CODE4$',A_CODE4);
  SetParamter(tmpSql,'$A_CODE5$',A_CODE5);
  SetParamter(tmpSql,'$A_CODE6$',A_CODE6);
  SetParamter(tmpSql,'$upd_oper$',getDocCode1);
  SetParamter(tmpSql,'$upd_date$',ROCDate(now,''));
  SetParamter(tmpSql,'$upd_time$',ROCTime(now,''));

  SQLs.Text:=tmpSql;
  try
    begin
      DM.ExecSQL(SQLs);
    end
  except
  end;
  SQLs.Free;
end;

procedure insert_treat_record(FEE_NO, TREATITEM, BABYTREAT, OPD_DATE, CARD_COMP, IC_SEQ_NO, HOSP_ID, OPD_FEE_AMT, OPD_PART_AMT, IPD_FEE_AMT, IPD_PART_AMT_MORE, IPD_PART_AMT_LESS: string);
var
  tmpSql :String;
  SQLs :TStrings;
begin
  SQLs:=TStringList.Create;
  tmpSql:=getInsertSql(15);
  SetParamter(tmpSql,'$FEE_NO$',FEE_NO);
  SetParamter(tmpSql,'$TREATITEM$',TREATITEM);
  SetParamter(tmpSql,'$BABYTREAT$',BABYTREAT);
  SetParamter(tmpSql,'$OPD_DATE$',OPD_DATE);
  SetParamter(tmpSql,'$CARD_COMP$',CARD_COMP);
  SetParamter(tmpSql,'$IC_SEQ_NO$',IC_SEQ_NO);
  SetParamter(tmpSql,'$HOSP_ID$',HOSP_ID);
  SetParamter(tmpSql,'$OPD_FEE_AMT$',OPD_FEE_AMT);
  SetParamter(tmpSql,'$OPD_PART_AMT$',OPD_PART_AMT);
  SetParamter(tmpSql,'$IPD_FEE_AMT$',IPD_FEE_AMT);
  SetParamter(tmpSql,'$IPD_PART_AMT_MORE$',IPD_PART_AMT_MORE);
  SetParamter(tmpSql,'$IPD_PART_AMT_LESS$',IPD_PART_AMT_LESS);
  SetParamter(tmpSql,'$UPD_OPER$',getDocCode1);
  SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
  SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
  SQLs.Text:=tmpSql;
  try
    DM.ExecSQL(SQLs);
  except
  end;
  SQLs.Free;
end;

function get_CRITICALILLNESS(temp_fee, temp_chr: string): Integer;
var
  ILL_len: Integer;
  ILL_code: Integer;
  cure_len: Integer;
  cure_code: Integer;
  cure_str: string;
  ills: string;
  cures: string;
  ill_b: Integer;
  ill_codeA, ill_dateA, ill_dateB, cure_Date1, cure_code1, cure_Code2, cure_Code3, cure_Code4, cure_Code5, cure_Code6: string;
  i, j: Integer;
  cures_b: Integer;
  treat_len: Integer;
  treat_code: Integer;
  treat_str: string;
  treats: string;
  treat_b: Integer;
  TREATITEM, BABYTREAT, OPD_DATE, CARD_COMP, IC_SEQ_NO, HOSP_ID, OPD_FEE_AMT, OPD_PART_AMT, IPD_FEE_AMT, IPD_PART_AMT_MORE, IPD_PART_AMT_LESS: string;
begin
  try
    cure_len  := SizeOf(cure_Record);
    //cure_code := hisGetTreatmentNeedHPC(PByte(@cure_record), @cure_len);

    cure_str := '[XXXXXXX]              [XXXXXXX]              [XXXXXXX]              [XXXXXXX]              [XXXXXXX]              [XXXXXXX]                           ';
    cure_str :=cure_str+'[XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX]             [XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX]             ';
    cure_str :=cure_str+'[XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX]             [XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX]             [XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX]             [XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX][XXXXXXX]';
    cure_code := hisGetTreatmentNeedHPC(cure_str, @cure_len);

    if cure_code = 0 then
    begin
      cure_str := GetFromBuffer(cure_Record[0].all_record);

      //ills := Copy(cure_str, 1, 114);
      ills := Copy(cure_str, 1, 138);
      //cures := Copy(cure_str, 115, 258);
      cures := Copy(cure_str, 139, 402);
      ill_b := 1;


      //for i := 0 to ((Length(ills)) div 19) - 1 do   //重大傷病
      for i := 0 to ((Length(ills)) div 23) - 1 do   //重大傷病
      begin
        {ill_codeA := Copy(ills, ill_b, 7);
        ill_dateA := Copy(ills, ill_b + 5, 7);
        ill_dateB := Copy(ills, ill_b + 12, 7);}

        ill_codeA := Copy(ills, ill_b + 1, 7);
        ill_dateA := Copy(ills, ill_b + 9, 7);
        ill_dateB := Copy(ills, ill_b + 16, 7);
        if Trim(ill_codeA) <> '' then
        begin
          inser_CRITICALILLNESS(getFeeNo, ill_codeA, ill_dateA, ill_dateB, getChrNo);
        end
        else
        begin
          Break;
        end;
//        ill_b := ill_b + 19;
        ill_b := ill_b + 23;
      end;

      cures_b := 1;
      for j := 0 to 5 do   //就診紀錄
      begin
        cure_date1 := Copy(cures, cures_b, 13);
        //cures_b := cures_b + 13;
        cures_b := cures_b + 14;
        if Trim(cure_date1) <> '' then
        begin
          {cure_code1 := Copy(cures, cures_b, 5);
          cures_b := cures_b + 5;
          cure_code2 := Copy(cures, cures_b, 5);
          cures_b := cures_b + 5;
          cure_code3 := Copy(cures, cures_b, 5);
          cures_b := cures_b + 5;
          cure_code4 := Copy(cures, cures_b, 5);
          cures_b := cures_b + 5;
          cure_code5 := Copy(cures, cures_b, 5);
          cures_b := cures_b + 5;
          cure_code6 := Copy(cures, cures_b, 5);
          cures_b := cures_b + 5;}

          cure_code1 := Copy(cures, cures_b, 7);
          cures_b := cures_b + 9;
          cure_code2 := Copy(cures, cures_b, 7);
          cures_b := cures_b + 9;
          cure_code3 := Copy(cures, cures_b, 7);
          cures_b := cures_b + 9;
          cure_code4 := Copy(cures, cures_b, 7);
          cures_b := cures_b + 9;
          cure_code5 := Copy(cures, cures_b, 7);
          cures_b := cures_b + 9;
          cure_code6 := Copy(cures, cures_b, 7);
          cures_b := cures_b + 8;

          insert_cure_record(getFeeNo, cure_date1, cure_code1, cure_code2, cure_code3, cure_code4, cure_code5, cure_code6);
        end
        else
        begin
          //cures_b := cures_b + 30;
          cures_b := cures_b + 53;
        end;
      end;

      treat_len := SizeOf(treat_Record);
      treat_code := hisGetTreatmentNoNeedHPC(PByte(@treat_Record), @treat_len);
      if treat_code = 0 then
      begin
        treat_str := GetFromBuffer(treat_record[0].all_treat_record);
        treats := Copy(treat_str, 85, 414);
        treat_b := 1;
        for j := 0 to 5 do
        begin
          TREATITEM := Copy(treats, treat_b, 2);
          if Trim(TREATITEM) <> '' then
          begin
            treat_b := treat_b + 2;
            BABYTREAT := Copy(treats, treat_b, 1);
            treat_b := treat_b + 1;
            OPD_DATE := Copy(treats, treat_b, 13);
            treat_b := treat_b + 13;
            CARD_COMP := Copy(treats, treat_b, 1);
            treat_b := treat_b + 1;
            IC_SEQ_NO := Copy(treats, treat_b, 4);
            treat_b := treat_b + 4;
            HOSP_ID := Copy(treats, treat_b, 10);
            treat_b := treat_b + 10;
            OPD_FEE_AMT := Copy(treats, treat_b, 8);
            treat_b := treat_b + 8;
            OPD_PART_AMT := Copy(treats, treat_b, 8);
            treat_b := treat_b + 8;
            IPD_FEE_AMT := Copy(treats, treat_b, 8);
            treat_b := treat_b + 8;
            IPD_PART_AMT_MORE := Copy(treats, treat_b, 7);
            treat_b := treat_b + 7;
            IPD_PART_AMT_LESS := Copy(treats, treat_b, 7);
            treat_b := treat_b + 7;
            insert_treat_record(getFeeNo, TREATITEM, BABYTREAT, OPD_DATE, CARD_COMP, IC_SEQ_NO, HOSP_ID, OPD_FEE_AMT, OPD_PART_AMT, IPD_FEE_AMT, IPD_PART_AMT_MORE, IPD_PART_AMT_LESS);
          end
          else
          begin
            Break;
          end;
        end;
      end
      else
      begin
        Result := treat_code;
      end;

      Result := 0;
    end
    else
    begin
      Result := ILL_code;
    end;
  except
    if ILL_code <> 0 then
    begin
      Result := ILL_code;
    end
    else
    begin
      Result := treat_code;
    end;
  end;
end;

procedure ic_data.Execute;
var
  ComRet, ILL_Ret, pre_code, preg_code, prev_code, Inoculate_code: Integer;//ComRet...comport傳回直,ILL_RET..慢處,pre_code..寫入慢處,preg_code...產檢,prev_code..預防保健;Inoculate_code..預防接種
  err_msg: string;
  temp_chr: string;
begin
  FreeOnTerminate := true;
  ErrStr:='';
  isExecute:=false;
  ILL_Ret := 0;
  preg_code := 0;
  prev_code := 0;
  Inoculate_code := 0;
  pre_code := 0;

  if Trim(getChrNo) <> '' then
  begin
    try
      csCloseCom();
      ComRet := csOpenCom(0);
      if ComRet = -1 then
      begin
        csCloseCom();
      end
      else
      begin

        IC_Insert_InFo.SpeedButton1.Caption := 'IC卡讀取進度 20%';
        IC_Insert_InFo.Refresh;
        IC_Insert_InFo.ProgressBar1.Position := 20;

        try
          begin
            insert_ic_med_warning_log('R', 'X', '', '', '', '', '', '', '', '', '', '', '', '', 'X', 'X', 'X'); //IC卡讀取LOG
          end
        except
        end;


        IC_Insert_InFo.SpeedButton1.Caption := 'IC卡讀取進度 35%';
        IC_Insert_InFo.Refresh;
        IC_Insert_InFo.ProgressBar1.Position := 35;


        if ILL_Ret = 0 then
        begin
          if write_right('3', '1', getFeeNo) = false then
          begin

            preg_code := get_preg(getFeeNo);
            if preg_code <> 0 then
            begin
              ErrStr:='取得產檢資料失敗';
              isExecute:=true;
              self.Terminate;
            end;

          end;
        end
        else
        begin
          preg_code := 0;
        end;


        //mainfrm.ProgressBar1.Position := 40;
        //mainfrm.Label5.Caption := 'IC卡讀取進度 40%';

        IC_Insert_InFo.SpeedButton1.Caption := 'IC卡讀取進度 40%';
        IC_Insert_InFo.Refresh;
        IC_Insert_InFo.ProgressBar1.Position := 40;


        if preg_code = 0 then
        begin
          if write_right('3', '2', getFeeNo) = false then
          begin
            prev_code := get_prev(getFeeNo);
            if prev_code <> 0 then
            begin
              ErrStr:='取得預防保健失敗';
              isExecute:=true;
              self.Terminate;
            end;
          end
          else
          begin
            prev_code := 0;
          end;
        end;

        if getOpdKind = 'B' then
        begin
          if prev_code = 0 then
          begin
            if write_right('4', '', getFeeNo) = false then
            begin
              Inoculate_code := get_Inoculate(getFeeNo);
              if Inoculate_code <> 0 then
              begin
                ErrStr:='取得預防接種資料失敗';
                isExecute:=true;
                self.Terminate;
              end;
            end
            else
            begin
              Inoculate_code := 0;
            end;
          end;
        end
        else
        begin
          Inoculate_code := 0;
        end;


        //mainfrm.ProgressBar1.Position := 50;
        //mainfrm.Label5.Caption := 'IC卡讀取進度 50%';

        IC_Insert_InFo.SpeedButton1.Caption := 'IC卡讀取進度 50%';
        IC_Insert_InFo.Refresh;
        IC_Insert_InFo.ProgressBar1.Position := 50;



        if write_right('2', '', getFeeNo) = false then
        begin
          if Inoculate_code = 0 then
          begin
            IC_Insert_InFo.SpeedButton1.Caption := 'IC卡讀取進度 55%';
            IC_Insert_InFo.Refresh;
            IC_Insert_InFo.ProgressBar1.Position := 55;


            pre_code := get_PRESCRIPTION(getChrNo, getFeeNo);

            //mainfrm.ProgressBar1.Position := 85;
            //mainfrm.Label5.Caption := 'IC卡讀取進度 85%';

            IC_Insert_InFo.SpeedButton1.Caption := 'IC卡讀取進度 85%';
            IC_Insert_InFo.Refresh;
            IC_Insert_InFo.ProgressBar1.Position := 85;

            if pre_code <> 0 then
            begin
              ErrStr:='取得過敏史資料失敗';
              isExecute:=true;
              self.Terminate;
            end;
          end;
        end
        else
        begin
          pre_code := 0;
        end;
      end;  

      if write_right('1', '', getFeeNo) = false then
        begin
          ILL_Ret := get_CRITICALILLNESS(getFeeNo, getChrNo); //重大傷病
          //Synchronize(call);
        end
        else
        begin
          ILL_Ret := 0;
          //Synchronize(call);
        end;
    except
      isExecute:=true;
    end;
  end;
  isExecute:=true;
end;

procedure ic_basic.Execute;
var
  ComRet, DC_V, HPC_V, IC_V: Integer;//ComRet...comport傳回直; DC_V....IDC認證傳回值;IC_V...IC卡回傳值; HPC_V...醫事人員PIN值;
  err_msg: string;
begin
  FreeOnTerminate := true;
  ErrStr:='';
  isExecute:=false;
  try
    csCloseCom();
    ComRet := csOpenCom(0);
    if ComRet = -1 then
    begin
      csCloseCom();
      err_msg := error_list(0, 4000);
      ErrStr:=err_msg;
      isExecute:=true;
    end
    else
    begin
      DC_V := IDC_CONNECT();  //SAM卡檢查
      if (DC_V <> 0) then
      begin
        csCloseCom();
        err_msg := error_list(0, DC_V); //傳入錯誤代碼
        ErrStr:=err_msg;
        isExecute:=true;
      end
      else
      begin
        HPC_V := HPC_check();   //醫事人員卡檢查
        HPC_V:=0;
        if HPC_V <> 0 then
        begin
          err_msg := error_list(0, HPC_V); //傳入錯誤代碼
          ErrStr:=err_msg;
          isExecute:=true;
        end
        else
        begin
          IC_V := IC_CHECK();//檢查IC卡

          if (IC_V > 2) then
          begin
            err_msg := error_list(0, IC_V); //傳入錯誤代碼
            ErrStr:=err_msg;
            csCloseCom();
            if (IntToStr(IC_V) = '9999') then
              ErrStr:=err_msg + #13 + '此ic卡非本人所有';
              isExecute:=true;
          end
          else
          begin
            csCloseCom();
            ic_data_thread := ic_data.Create(false);
          end;
        end;
      end;
    end;
  except
    csCloseCom();
    isExecute:=true;
  end;
end;

end.

