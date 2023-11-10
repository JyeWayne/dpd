unit MyUser;

interface
uses
Sysutils;
type RReg = record
  opd_kind,opd_date,fee_no,dept_code,dept_desc,dept_room,doc_code,doc_id,doc_dept_code,doc_name,shift_no,seq_no,opd_status,order_status,opd_status_desc: String;
  doc_code1,doc_name1,doc_code2,doc_name2,doc_code3,doc_name3,ic_seq_no,idl_date,idl_fee_code,idl_position,idl_card_no,idl_fee_no,doc_psw,room_desc,ppat_id: String;
  part_desc,case_desc,pay_desc,dec_flag,pain_score,body_weight,first_date,first_ins_seq_no,diag_flag,vspsw:string;
end;
type Rpat = record
  chr_no,pat_name,id_no,ac_type,birth_date,sex,age,m_age,weight,high,addl,tel,warn,disc_code: String;
end;
type TReg = Class
private
  myReg : RReg;
public
  procedure Clear;
  property  OpdKind : String read myReg.Opd_Kind write myReg.Opd_Kind;
  property OpdDate : String read myReg.opd_date write myReg.opd_date;
  property FeeNo : String read myReg.fee_no write myReg.fee_no;
  property DeptCode : String read myReg.dept_code write myReg.dept_code;
  property DeptDesc : String read myReg.dept_desc write myReg.dept_desc;
  property DeptRoom : String read myReg.dept_room write myReg.dept_room;
  property DocCode : String read myReg.doc_code write myReg.doc_code;
  property DocId : String read myReg.doc_id write myReg.doc_id;
  property DocDeptCode : String read myReg.doc_dept_code write myReg.doc_dept_code;
  property DocName : String read myReg.doc_name write myReg.doc_name;
  property ShiftNo : String read myReg.shift_no write myReg.shift_no;
  property SeqNo : String read myReg.seq_no write myReg.seq_no;
  property OpdStatus : String read myReg.Opd_Status write myReg.Opd_Status;
  property OrderStatus : String read myReg.Order_Status write myReg.Order_Status;
  property DocCode1 : String read myReg.doc_code1 write myReg.doc_code1;
  property DocName1 : String read myReg.doc_name1 write myReg.doc_name1;
  property DocCode2 : String read myReg.doc_code2 write myReg.doc_code2;
  property DocName2 : String read myReg.doc_name2 write myReg.doc_name2;
  property DocCode3 : String read myReg.doc_code3 write myReg.doc_code3;
  property DocName3 : String read myReg.doc_name3 write myReg.doc_name3;
  property IcSeqNo : String read myReg.ic_seq_no write myReg.ic_seq_no;
  property IdlDate : String read myReg.idl_date write myReg.idl_date;
  property IdlFeeCode : String read myReg.idl_fee_code write myReg.idl_fee_code;
  property IdlPosition : String read myReg.idl_position write myReg.idl_position;
  property IdlCardNo : String read myReg.idl_card_no write myReg.idl_card_no;
  property IdlFeeNo : String read myReg.idl_fee_no write myReg.idl_fee_no;
  property DiagFlag : String read myReg.diag_flag write myReg.diag_flag;
  property DOCPSW : String read myReg.doc_psw write myReg.doc_psw;
  property ROOMDESC : String read myReg.room_desc write myReg.room_desc;
  property PPATID : String read myReg.ppat_id write myReg.ppat_id;
  property OPDSTATUSDESC : String read myReg.opd_status_desc write myReg.opd_status_desc;
  property PARTDESC : String read myReg.part_desc write myReg.part_desc;
  property CASEDESC : String read myReg.case_desc write myReg.case_desc;
  property PAYDESC : String read myReg.pay_desc write myReg.pay_desc;
  property DECFLAG : String read myReg.dec_flag write myReg.dec_flag;
  property PainScore : String read myReg.pain_score write myReg.pain_score;
  property BodyWeight : String read myReg.body_weight write myReg.body_weight;
  property FirstDate : String read myReg.first_date write myReg.first_date;
  property FirstInsSeqNo : String read myReg.first_ins_seq_no write myReg.first_ins_seq_no;
  property vspsw : String read myReg.vspsw write myReg.vspsw;
end;
type TPat = Class
private
  myPat : Rpat;
public
  Procedure Clear;
  property ChrNo : String Read myPat.chr_no write myPat.chr_no;
  property PatName : String Read myPat.pat_name write myPat.pat_name;
  property IdNo : String Read myPat.id_no write myPat.id_no;
  property AcType : String Read myPat.ac_type write myPat.ac_type;
  property BirthDate : String Read myPat.birth_date write myPat.birth_date;
  property Sex : String Read myPat.sex write myPat.sex;
  property Age : String Read myPat.age write myPat.age;
  property MAge : String Read myPat.m_age write myPat.m_age;
  property Weight : String Read myPat.weight write myPat.weight;
  property High : String Read myPat.high write myPat.high;
  property Addl : String Read myPat.addl write myPat.addl;
  property Tel : String Read myPat.tel write myPat.tel;
  property Warn : String Read myPat.warn write myPat.warn;
  property DiscCode : String read myPat.disc_code write myPat.disc_code;
end;




implementation

uses Commfunc;

procedure TReg.Clear;
begin
  myReg.Opd_Kind:='';
  myReg.opd_date:='';
  myReg.fee_no:='';
  myReg.dept_code:='';
  myReg.dept_desc:='';
  myReg.dept_room:='';
  myReg.doc_code:='';
  myReg.doc_id:='';
  myReg.doc_dept_code:='';
  myReg.doc_name:='';
  myReg.shift_no:='';
  myReg.seq_no:='';
  myReg.doc_code1:='';
  myReg.doc_name1:='';
  myReg.doc_code2:='';
  myReg.doc_name2:='';
  myReg.doc_code3:='';
  myReg.doc_name3:='';
  myReg.ic_seq_no:='';
  myReg.idl_date:='';
  myReg.idl_fee_code:='';
  myReg.idl_position:='';
  myReg.idl_card_no:='';
  myReg.room_desc:='';
  myReg.doc_psw:='';
  myreg.ppat_id :='';
  myreg.case_desc :='';
  myreg.part_desc :='';
  myreg.pay_desc :='';
  myreg.pain_score :='';
  myreg.body_weight :='';
  myreg.first_date := '';
  myreg.first_ins_seq_no := '';
end;

procedure TPat.Clear;
begin
  myPat.chr_no:='';
  myPat.pat_name:='';
  myPat.id_no:='';
  myPat.ac_type:='';
  myPat.birth_date:='';
  myPat.sex:='';
  myPat.age:='';
  myPat.m_age:='';
  myPat.weight:='';
  myPat.high:='';
  myPat.addl:='';
  myPat.tel:='';
  myPat.warn:='';
  myPat.disc_code:='';
end;

end.
