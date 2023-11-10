//******************************************//
// 功能:資料存取
// 作者:XXX
// 初版日期:2011/12/31
// 2012/1/12 修改XXXXX
//
//******************************************//
unit SqlCenter;

interface

uses Classes, SysUtils;

  function sqlstr(s_no :integer):string;
  function getRegSqlStr(s_no :integer):string;
  function getSpSql(SpNo:Integer;var Paramter,PType,RType:TStrings):string;
  function getChkSqlStr(s_no :integer):string;
  function getUpdSql(s_no :integer):string;
  function getInsertSql(s_no :integer):string;
  function getDeleteSql(s_no :integer):string;
  function getLoadOrder(s_no :integer):string;
  function getPreOrderSql(s_no:integer):string;
  function getOldMedList(s_no:integer):string;
  function getDittoSql(s_no:integer):string;
  function getICSql(s_no:integer):string;
  function SetParamter(var Source:String; Paramter:String;Values : String):Boolean;

implementation

function getICSql(s_no:integer):string;
var
  tmpstr:string;
begin
  tmpstr:='';
  case s_no of
    1:
    begin
      tmpstr:=tmpstr+' select * from ic_error_list where ERROR_CODE=''$ERROR_CODE$'' ' ;
    end;
  end;
  Result:=tmpstr;
end;

function getDittoSql(s_no:integer):string;
var
  tmpstr:string;
begin
  tmpstr:='';

  case s_no of
    1:
    begin
      tmpstr:=tmpstr+' select A.opd_date "就醫日",(select trim(smpl_desc) from dept_basic where dept_code=A.dept_code) "科別", '+#13;
      tmpstr:=tmpstr+' (select trim(doc_name) from doc_basic where doc_code=A.doc_code) "醫師", ins_seq_no "卡序",fee_no '+#13;
      tmpstr:=tmpstr+' from opd_basic A where chr_no=''$CHR_NO$'' order by opd_date desc ';
    end;
    2:
    begin
      tmpstr:=tmpstr+' select sub_desc,obj_desc,plan_desc,sub_desc2,icd9_code1,icd9_code2,icd9_code3, '+#13;
      tmpstr:=tmpstr+' (select eng_simp_desc from icd9_basic where icd9_code=icd9_code1) icd9_desc1, '+#13;
      tmpstr:=tmpstr+' (select eng_simp_desc from icd9_basic where icd9_code=icd9_code2) icd9_desc2, '+#13;
      tmpstr:=tmpstr+' (select eng_simp_desc from icd9_basic where icd9_code=icd9_code3) icd9_desc3 '+#13;
      tmpstr:=tmpstr+' from opd_basic where fee_no=''$FEE_NO$'' ';
    end;
    3:
    begin
      tmpstr:=tmpstr+' select sdiag_code, (select eng_simp_desc from icd9_basic where icd9_code=sdiag_code) icd9_desc '+#13;
      tmpstr:=tmpstr+' from sdiag_detail where fee_no=''$FEE_NO$'' ';
    end;
    4:
    begin
      tmpstr:=tmpstr+' select med_code "院內代碼",(select fee_name from orderitem_basic where fee_code=med_code) "項目名稱",GRIND_FLAG "磨粉",UNIT_QTY "劑量",CIR_CODE "頻率", PATH_CODE "途徑",MED_DAYS "天數",TTL_QTY "總量",self_pay_flag "自費別" '+#13;
      tmpstr:=tmpstr+' from opd_med where fee_no=''$FEE_NO$'' '+#13;
    end;
    5:
    begin
      tmpstr:=tmpstr+' select A.fee_code "院內代碼",(select fee_name from orderitem_basic where fee_code=A.fee_code and ORDER_TYPE=''$ORDER_TYPE$'') "項目名稱", A.POSITION "部位", qty_num "數量", self_pay_flag "自費別" '+#13;
      tmpstr:=tmpstr+' from opd_fee A, ORDERITEM_BASIC B where trim(item_no) is null and B.ORDER_TYPE=''$ORDER_TYPE$'' and B.USE_STATUS=''1'' and B.FEE_CODE=A.FEE_CODE and (A.seq_no < ''$SEQ_NO1$'' or A.seq_no > ''$SEQ_NO2$'') and A.fee_no=''$FEE_NO$'' '+#13;
    end;
    6:
    begin
      tmpstr:=tmpstr+' Select B.Send_cd_1 "組別",B.Send_cd_2 "檢體",B.Fee_code "院內代碼",B.Fee_name "項目名稱",B.Send_cd_3 "項目代碼", A.qty_num "數量", A.self_pay_flag "自費別"  '+#13;
      tmpstr:=tmpstr+' from opd_fee A, ORDERITEM_BASIC B where B.ORDER_TYPE=''L'' and B.USE_STATUS=''1'' and B.FEE_CODE=A.FEE_CODE and A.fee_no=''$FEE_NO$'' '+#13;
      tmpstr:=tmpstr+' and Trim(SubStr(B.order_type,1,1))||Trim(B.SEND_CD_3)= a.item_no';//檢驗項目
    end;
    7:
    begin
      tmpstr:=tmpstr+' Select B.FEE_CODE "院內代碼",B.FEE_NAME "項目名稱", (select code_onename from COMPARE_CODE_BASIC where IPD_RELATED=''R2'' And Code_Two=Order_type and Code_one=Send_cd_1) "部位", B.SEND_CD_2 "流水號", A.qty_num "數量", A.self_pay_flag "自費別", '+#13;
      tmpstr:=tmpstr+' (select code_onename from COMPARE_CODE_BASIC where IPD_RELATED=''R1'' And RTrim(Code_one)=RTrim(Order_type)) "類型", '+#13;
      tmpstr:=tmpstr+' B.Send_cd_1, B.order_type from opd_fee A, ORDERITEM_BASIC B Where B.ORDER_TYPE in (SELECT RTrim(CODE_ONE) FROM COMPARE_CODE_BASIC WHERE IPD_RELATED=''R1'')'+' And B.USE_STATUS=''1'' and B.fee_code=A.fee_code and A.fee_no=''$FEE_NO$'' ';
      tmpstr:=tmpstr+' and Trim(SubStr(B.order_type,2,1))||Trim(B.SEND_CD_2)= a.item_no'; //放射項目
    end;
    8:
    begin
      //tmpstr:=tmpstr+' Select B.Fee_code "院內代碼",B.Fee_name "項目名稱", B.Send_Cd_1 "檢查室", A.qty_num "數量", A.self_pay_flag "自費別"'+#13;
      //tmpstr:=tmpstr+' from opd_fee A, ORDERITEM_BASIC B Where B.ORDER_TYPE = ''E'' '+' And B.USE_STATUS=''1'' and B.fee_code=A.fee_code and A.fee_no=''$FEE_NO$'' ';
      tmpstr:=tmpstr+' Select B.Fee_code "院內代碼",B.Fee_name "項目名稱", B.Send_Cd_1 "檢查室",';
      tmpstr:=tmpstr+'(select c.qty_num from opd_fee c where c.fee_no=''$FEE_NO$'' and c.fee_code=a.fee_code and lab_no=sche_no) as "數量",';
      tmpstr:=tmpstr+'(select c.self_pay_flag from opd_fee c where c.fee_no=''$FEE_NO$'' and c.fee_code=a.fee_code and lab_no=sche_no) as "自費別"';
      tmpstr:=tmpstr+' from Lab_sche a,ORDERITEM_BASIC B ';
      tmpstr:=tmpstr+' Where B.ORDER_TYPE = ''E''  And B.USE_STATUS=''1'' and B.fee_code=A.fee_code and  A.fee_no=''$FEE_NO$'' ';
      tmpstr:=tmpstr+' And  b.send_cd_1 = A.room_no  and b.fee_code=A.fee_code';
    end;
    9:
    begin
      tmpstr:=tmpstr+' select '''',A.opd_date "就醫日",(select trim(smpl_desc) from dept_basic where dept_code=A.dept_code) "科別", '+#13;
      tmpstr:=tmpstr+' (select trim(doc_name) from doc_basic where doc_code=A.doc_code) "醫師" '+#13;
      tmpstr:=tmpstr+' from opd_basic A where chr_no=''$CHR_NO$'' and dept_code like ''$DEPT_CODE$'' and opd_date between ''$OPD_DATE1$'' and ''$OPD_DATE2$'' order by opd_date desc ';
    end;
    10:
    begin
      tmpstr:=tmpstr+' select '''',A.ipd_date "住院日",A.cpd_date "出院日",(select trim(smpl_desc) from dept_basic where dept_code=A.gen_dept_code) "科別", '+#13;
      tmpstr:=tmpstr+' (select trim(doc_name) from doc_basic where doc_code=A.vs_doc_code) "醫師" '+#13;
      tmpstr:=tmpstr+' from ipd_basic A where A.chr_no=''$CHR_NO$'' and A.ipd_date between ''$IPD_DATE1$'' and ''$IPD_DATE2$'' order by A.ipd_date desc ';
    end;
    11:
      tmpstr := 'select a.*,(select eng_simp_desc from icd_code_basic where icd_code=a.icd9_code1) as icd9_desc1, '+
                '(select eng_simp_desc from icd_code_basic where icd_code=a.icd9_code2) as icd9_desc2, '+
                '(select eng_simp_desc from icd_code_basic where icd_code=a.icd9_code3) as icd9_desc3 from '+
                '(select sub_desc,obj_desc,plan_desc,sub_desc2, '+
                'case   '+
                '  when NVL(TRIM(icd10_code1),''0'') = ''0'' then (select icd_code from icd9_trans_icd10 where icd9_code=OPD_BASIC.icd9_code1 AND ROWNUM=1)  '+
                '  ELSE icd10_code1 END icd9_code1, '+
                'case  '+
                '  when NVL(TRIM(icd10_code2),''0'') = ''0'' then (select icd_code from icd9_trans_icd10 where icd9_code=OPD_BASIC.icd9_code2 AND ROWNUM=1)  '+
                '  ELSE icd10_code2 END icd9_code2, '+
                'case  '+
                '  when NVL(TRIM(icd10_code1),''0'') = ''0'' then (select icd_code from icd9_trans_icd10 where icd9_code=OPD_BASIC.icd9_code3 AND ROWNUM=1)  '+
                '  ELSE icd10_code3 END icd9_code3     '+
                ' from opd_basic where fee_no =''$FEE_NO$'') a ';
    12:
      tmpstr := 'select a.icd_code SDIAG_CODE,(select eng_simp_desc from icd_code_basic  where icd_code=a.icd_code and rownum=1) as icd9_desc '+
                'from order_icd_code a where a.fee_no =''$FEE_NO$'' and seq_no > 3 ';
  end;
  Result:=tmpstr;
end;

function getOldMedList(s_no:integer):string;
var
  tmpstr:string;
begin
  tmpstr:='';

  case s_no of
    1:
    begin
      tmpstr:=tmpstr+' Select o.opd_date as thedate,(select smpl_desc from dept_basic p where o.dept_code=p.dept_code) as thedept,doc_code,Fee_no '+#13;
      tmpstr:=tmpstr+' ,(select USER_name from USER_BASIC b where b.USER_ID=Trim(o.doc_Code)) Doc_name from opd_basic o where opd_kind=''$OPD_KIND$'' and chr_no=''$CHR_NO$'' Order by o.opd_date desc ';
    end;
    2:
    begin
      tmpstr:=tmpstr+' Select o.ipd_date as thedate,(select smpl_desc from dept_basic p where o.gen_dept_code=p.dept_code) as thedept,vs_doc_code,Fee_no '+#13;
      tmpstr:=tmpstr+' from ipd_basic o where ipd_flag<>''D'' and  chr_no=''$CHR_NO$'' Order by o.ipd_date desc ';
    end;
    3:
    begin
      tmpstr:=tmpstr+' select o.med_code ,m.Fee_Name as thedesc,o.unit_qty as theqty,o.cir_code as thecir,o.unit_desc as theunit,o.med_days, Decode(o.self_pay_flag,''N'',''Y'',''N'') as pay_flag,o.path_code  from opd_med o,OrderItem_Basic m '+#13;
      tmpstr:=tmpstr+' where opd_date=''$OPD_DATE$'' and chr_no=''$CHR_NO$'' and o.med_code=m.FEE_code and o.fee_no=''$FEE_NO$'' Order by o.SEQ_NO ';
    end;
    4:
    begin
      tmpstr:=tmpstr+' SELECT DECODE(UD_TYPE,''R'',''長期'',''S'',''STAT'',''P'',''PRN'',''D'',''出院帶藥'',UD_TYPE) ud_type,med_code,med_desc as thedesc,ud_dose as theqty ,ud_cir as thecir,ud_unit as theunit,''''  as med_days, UD_QTY,pay_flag,ud_path as path_code  from ud_order '+#13;
      tmpstr:=tmpstr+' where Begin_date=''$BEGIN_DATE$'' and chr_no=''$CHR_NO$'' ';
    end;
    5:
    begin
      tmpstr:=tmpstr+' select distinct u.begin_date from ud_order u,ipd_basic i where u.fee_no=''$FEE_NO$'' and i.ipd_date=''$IPD_DATE$'' order by u.begin_date desc ';
    end;
  end;
  Result:=tmpstr;
end;

function getPreOrderSql(s_no:integer):string;
var
  tmpstr:string;
begin
  tmpstr:='';
  case s_no of
    1:
    begin
      tmpstr:=tmpstr+' Select * from OrderItem_Basic where Fee_code=''$FEE_CODE$'' And ORDER_TYPE =''$ORDER_TYPE$'' And USE_STATUS_O=''1'' ';
    end;
    2:
    begin
      tmpstr:=tmpstr+' Select Send_cd_1 "組別",Send_cd_2 "檢體",Fee_code "院內代碼",Fee_name "項目名稱",Send_cd_3 "項目代碼",URG_FLAG "可急作" from ORDERITEM_BASIC Where ORDER_TYPE=''L'' And USE_STATUS=''1'' ';
    end;
    3:
    begin
      tmpstr:=tmpstr+' Order By Fee_name,Send_cd_1,Send_cd_2,Fee_code ';
    end;
    4:
    begin
      tmpstr:=tmpstr+' Select Fee_name "檢查名稱",Fee_code "院內代碼", Send_Cd_1 "檢查室" from ORDERITEM_BASIC Where ORDER_TYPE=''E'' And USE_STATUS=''1'' ';
    end;
    5:
    begin
      tmpstr:=tmpstr+' Select Code_one,code_onename from COMPARE_CODE_BASIC where IPD_RELATED=''R1'' ';
    end;
    6:
    begin
      tmpstr:=tmpstr+' Select ORDER_TYPE,(select code_onename from COMPARE_CODE_BASIC where IPD_RELATED=''R1'' And RTrim(Code_one)=RTrim(Order_type)) "類型", '+#13;
      tmpstr:=tmpstr+' FEE_CODE "院內代碼",FEE_NAME "項目名稱", SEND_CD_1,(select code_onename from COMPARE_CODE_BASIC where IPD_RELATED=''R2'' And Code_Two=Order_type and Code_one=Send_cd_1) "部位", SEND_CD_2 "流水號" ' +#13;
      tmpstr:=tmpstr+' from ORDERITEM_BASIC Where ORDER_TYPE IN (SELECT RTrim(CODE_ONE) FROM COMPARE_CODE_BASIC WHERE IPD_RELATED=''R1'')'+' And USE_STATUS=''1'' ';
    end;
    7:
    begin
      tmpstr:=tmpstr+' Order By ORDER_TYPE,FEE_CODE,SEND_CD_1,Fee_name ';
    end;
    8:
    begin
      tmpstr:=tmpstr+' Select * from COMPARE_CODE_BASIC where IPD_RELATED=''R2'' and Code_Two=''$CODE_TWO$'' ';
    end;
    9:
    begin
      tmpstr:=tmpstr+' select fee_code "代碼",fee_desc "醫囑內容",ins_pay_uamt "健保費用",self_pay_uamt "自費費用" from orderitem_basic where fee_code between ''$FEE_CODE1$'' and ''$FEE_CODE2$'' and use_status=''1'' order by fee_code ';
    end;
    10:
    begin
      tmpstr:=tmpstr+' select A.fee_code "代碼",A.fee_desc "醫囑內容",A.ins_pay_uamt "健保費用",A.self_pay_uamt "自費費用" from orderitem_basic A,den_often B where trim(A.fee_code) = trim(B.fee_code) and A.use_status=''1'' order by A.fee_code ';
    end;
  end;
  Result:=tmpstr;
end;

function sqlstr(s_no :integer):string;
begin
  case s_no of
    //icd10
    0:
      Result := 'SELECT ICD_CODE as ICD9_CODE,CHN_FULL_DESC,ENG_FULL_DESC,CHN_SIMP_DESC,ENG_SIMP_DESC,slow_flag,first_flag,inf_flag,'''' as icd9toicd10,'''' as choose_flag '+
                'from ICD_CODE_BASIC '+
                'WHERE  ';
    1:
      Result := 'select b.ICD_CODE as ICD9_CODE,b.CHN_FULL_DESC ,b.ENG_FULL_DESC,b.CHN_SIMP_DESC,b.ENG_SIMP_DESC,b.slow_flag,b.first_flag,b.inf_flag,'+
                'a.icd9_code as icd9toicd10,'''' as choose_flag from icd9_trans_icd10 a, icd_code_basic b '+
                'where trim(a.icd_code) = b.icd_code and a.icd9_code = ''$IDC9_CODE$'' and b.icd_system = ''C'' and b.eff_flag=''Y'' $DEPT_CODE$';
    11: //判斷科別是否有資料
      Result := 'SELECT count(*) ROWCT from icd9_trans_icd10 WHERE icd9_code = ''$IDC9_CODE$'' and dept_code=''$DEPT_CODE$'' ';
    2:  //寫入ICD10
      Result := 'insert into ORDER_ICD_CODE(order_kind,order_type,fee_no,seq_no,icd_code,icd_system,upd_oper,upd_date,upd_time,icd_trans_code,opd_date)'+
                'values(''$ORDER_KIND$'',''$ORDER_TYPE$'',''$FEE_NO$'',''$SEQ_NO$'',''$ICD_CODE$'',''$ICD_SYSTEM$'',''$UPD_OPER$'',''$UPD_DATE$'''+
                ',''$UPD_TIME$'',''$ICD_TRANS_CODE$'',''$OPD_DATE$'')';
    3:  //取ICD10記錄
      Result := 'SELECT a.ICD_CODE as ICD9_CODE,b.CHN_FULL_DESC,b.ENG_FULL_DESC,b.CHN_SIMP_DESC,b.ENG_SIMP_DESC,b.slow_flag,b.first_flag,a.icd_trans_code as icd9toicd10,'''' as choose_flag '+
                'from order_icd_code a left join icd_code_basic b on a.icd_code=b.icd_code '+
                'where fee_no=''$FEE_NO$'' and opd_date=''$OPD_DATE$''';
    31:  //取delete記錄
      Result := 'delete from ORDER_ICD_CODE where fee_no=''$FEE_NO$'' and opd_date=''$OPD_DATE$''';
    32:  //取ICD10醫師常用
      Result := 'SELECT a.ICD_CODE ,ENG_FULL_DESC,CHN_FULL_DESC,CHN_SIMP_DESC,ENG_SIMP_DESC,slow_flag,first_flag,b.icd9_code ,'''' as choose_flag,sex_type,INF_FLAG,AGE_TYPE,RARE_FLAG '+
                'from icd_dept_doc_basic b left join ICD_CODE_BASIC a on trim(b.icd_code)=trim(a.icd_code) where b.doc_code=''$DOC_CODE$'' and b.sour_type=''O''';
    33:  //取ICD10科常用
      Result := 'SELECT a.ICD_CODE,ENG_FULL_DESC,CHN_FULL_DESC,CHN_SIMP_DESC,ENG_SIMP_DESC,slow_flag,first_flag,b.icd9_code ,'''' as choose_flag,sex_type,INF_FLAG,AGE_TYPE,RARE_FLAG '+
                'from icd_dept_basic b left join ICD_CODE_BASIC a on trim(b.icd_code)=trim(a.icd_code) where b.dept_code =''$DEPT_CODE$'' and b.sour_type=''O''';
    34:
      Result := 'select b.ICD_CODE as ICD9_CODE,b.CHN_FULL_DESC,b.ENG_FULL_DESC,b.CHN_SIMP_DESC,b.ENG_SIMP_DESC,b.slow_flag,b.first_flag,a.icd9_code as icd9toicd10,'''' as choose_flag,b.inf_flag '+
                'from icd_code_basic b left join icd9_trans_icd10 a on trim(a.icd_code) = b.icd_code '+
                'where b.icd_code =''$IDC_CODE$'' ';
    35: //icd10快速搜尋
      Result := 'select a.icd_group1||a.chn_name1||a.eng_name1 AS ALLA,a.icd_group1 as icd_group,a.chn_name1,a.eng_name1 as eng_name from icd10_search_basic a group by a.icd_group1,a.chn_name1,a.eng_name1 order by a.icd_group1';
    36:                                                                                                             //'P'
      Result := 'select a.icd_group2||a.chn_name2||a.eng_name2 AS ALLA,a.icd_group2 as icd_group,a.chn_name2,a.eng_name2 as eng_name,a.icd_q1 from icd10_search_basic a '+
                'where a.icd_group1 =''$ICD_GROUP$''  group by a.icd_group2,a.chn_name2,a.eng_name2,a.icd_q1 order by a.icd_group2';
    37:                                                                                                             //'P09'  ,a.ok_no
      Result := 'select a.icd_group3||a.chn_name3||a.eng_name3 AS ALLA,a.icd_group3 as icd_group,a.chn_name3,a.eng_name3 as eng_name,a.icd_q2 from icd10_search_basic a '+
                'where a.icd_group2 =''$ICD_GROUP$''  group by a.icd_group3,a.chn_name3,a.eng_name3,a.icd_q2 order by a.icd_group3';
    38:                                                                                                             //'X1' ,a.ok_no
      Result := 'select a.icd_group4||a.chn_name4||a.eng_name4 AS ALLA,a.icd_group4 as icd_group,a.chn_name4,a.eng_name4 as eng_name,a.icd_q3 from icd10_search_basic a '+
                'where a.icd_group3 =''$ICD_GROUP$''  group by a.icd_group4,a.chn_name4,a.eng_name4,a.icd_q3 order by a.icd_group4';
    39:                                                                                                             //'X10'  ,a.ok_no
      Result := 'select a.icd_group5||a.chn_name5||a.eng_name5 AS ALLA,a.icd_group5 as icd_group,a.chn_name5,a.eng_name5 as eng_name,a.icd_q4 from icd10_search_basic a '+
                'where a.icd_group4 =''$ICD_GROUP$''  group by a.icd_group5,a.chn_name5,a.eng_name5,a.icd_q4 order by a.icd_group5';
    40:                                                                                                             //'X101' ,a.ok_no
      Result := 'select a.icd_group6||a.chn_name6||a.eng_name6 AS ALLA,a.icd_group6 as icd_group,a.chn_name6,a.eng_name6 as eng_name,a.icd_q5 from icd10_search_basic a '+
                'where a.icd_group5 =''$ICD_GROUP$''  group by a.icd_group6,a.chn_name6,a.eng_name6,a.icd_q5 order by a.icd_group6';
    41:                                                                                                             //'X101XXA'  ,a.ok_no
      Result := 'select a.icd_group7||a.chn_name7||a.eng_name7 AS ALLA,a.icd_group7 as icd_group,a.chn_name7,a.eng_name7 as eng_name,a.icd_q6 from icd10_search_basic a '+
                'where a.icd_group6 =''$ICD_GROUP$''  group by a.icd_group7,a.chn_name7,a.eng_name7,a.icd_q6 order by a.icd_group7';
    42:                                                                                                             //'W3181'  ,a.ok_no
      Result := 'select a.icd_group8||a.chn_name8||a.eng_name8 AS ALLA,a.icd_group8 as icd_group,a.chn_name8,a.eng_name8 as eng_name,a.icd_q7 from icd10_search_basic a '+
                'where a.icd_group7 =''$ICD_GROUP$''  group by a.icd_group8,a.chn_name8,a.eng_name8,a.icd_q7 order by a.icd_group8';
    43:                                                                                                             //'W34010'
      Result := 'select a.icd_group9||a.chn_name9||a.eng_name9 AS ALLA,a.icd_group9 as icd_group,a.chn_name9,a.eng_name9 as eng_name from icd10_search_basic a where a.icd_group8 = ''$ICD_GROUP$''  group by a.icd_group9,a.chn_name9,a.eng_name9 order by a.icd_group9';

    //icd9
    4:
      Result := 'SELECT ICD9_CODE,CHN_FULL_DESC,ENG_FULL_DESC,CHN_SIMP_DESC,ENG_SIMP_DESC,slow_flag,first_flag '+
                'FROM ICD9_BASIC  '+
                'WHERE SUBSTR(ENG_FULL_DESC,1,1)<>''*'' and op_flag=''N'' and final_flag=''Y'' ';
    5:
       Result :='select fee_code,fee_name,unit_qty,ins_flag,INS_PAY_UAMT,SELF_PAY_UAMT from orderitem_basic '+
                'where order_type=''F'' and use_status_O =''1'' ';
    6:
       Result :='select fee_code,fee_name,unit_qty,ins_flag,INS_PAY_UAMT,SELF_PAY_UAMT from orderitem_basic '+
                'where order_type=''S'' and use_status_O =''1'' ';
    28:
       Result :='select kind "類別",' +
                  '(select code_desc from code_dtl where code_type = ''0B'' and trim(code_no) = kind) as "類別說明",comm_desc "說明",decode(TRIM(stage),''1'',''輕'',''2'',''中'',''3'',''重'','' '') as "等級" from chr_spec where chr_no=''$chr_no$'' ';
    29:
       Result := 'insert into chr_spec(chr_no,kind,comm_desc,stage,msg_flag,impl_date,end_date,upd_oper,upd_date,upd_time,source) '+
                'values(''$chr_no$'',''$kind$'',''$comm_desc$'',''$stage$'',''$msg_flag$'',''$impl_date$'',''$end_date$'',''$upd_oper$'',''$upd_date$'',''$upd_time$'',''$source$'')';
    30:
       Result := 'select * from chr_spec where chr_no=''$chr_no$'' ';
  end;
end;

function getRegSqlStr(s_no :integer):string;
var
  tmpstr:string;
begin                                                             
  tmpstr:=' SELECT lpad(rownum,3,''0'') as SEQ_NO,D.* ' + #10#13;
  tmpstr:=tmpstr+' FROM(SELECT a.opd_kind as opd_kind,a.SEQ_NO as REG_SEQ_NO, a.OPD_DATE as OPD_DATE,a.DEPT_CODE as DEPT_CODE,decode(b.sex_type,''0'',''女'',''1'',''男'',''不明'') as SEX,b.sex_type,  ' + #10#13;
  tmpstr:=tmpstr+' (select smpl_desc from dept_basic where dept_code=a.DEPT_CODE) DEPT_DESC, ' + #10#13;
  tmpstr:=tmpstr+' a.DEPT_ROOM as DEPT_ROOM,a.DOC_CODE as DOC_CODE,(select doc_name from dental_doc_basic where doc_code=a.doc_code) DOC_NAME,a.ROOM_DESC as ROOM_DESC,a.SHIFT_NO as SHIFT_NO,b.AC_TYPE as AC_TYPE, ' + #10#13;
  tmpstr:=tmpstr+' a.CHR_NO as CHR_NO,(case when instr(b.id_no,''@'') > 0  then substr(b.id_no,2,length(trim(b.id_no))-1) else trim(b.id_no) end) as ID_NO,a.FEE_NO as FEE_NO,b.PAT_NAME as PAT_NAME,a.PAT_ID as PAT_ID,b.birth_date as BIRTH_DATE, ' + #10#13;
  tmpstr:=tmpstr+' (CASE WHEN (a.ORDER_STATUS = ''1'') THEN ''暫存'' ELSE DECODE(a.OPD_STATUS,''1'',''未到診'',''2'',''已報到'',''3'',''完診'',''4'',''批完價'',''5'',''批完價'') END) OPD_STATUS, ' + #10#13;
  tmpstr:=tmpstr+' a.DISC_CODE as DISC_CODE,OPD_STATUS OPD_STATUSCODE,ORDER_STATUS,decode(a.FV_RV,''F'',''初診'',''複診'') FV_RV, decode(a.pat_id,''1'',''健保'',''自費'') pat_desc,b.death_flag, ' + #10#13;
  tmpstr:=tmpstr+' (select idl_date from tbl_dental_idl where fee_no=a.fee_no and del_flag=''N'') idl_date, ' + #10#13;
  tmpstr:=tmpstr+' (select idl_fee_code from tbl_dental_idl where fee_no=a.fee_no and del_flag=''N'') idl_fee_code, ' + #10#13;
  tmpstr:=tmpstr+' (select idl_position from tbl_dental_idl where fee_no=a.fee_no and del_flag=''N'') idl_position, ' + #10#13;
  tmpstr:=tmpstr+' (select ins_seq_no from tbl_dental_idl where fee_no=a.fee_no and del_flag=''N'') idl_ins_seq_no, ' + #10#13;
  tmpstr:=tmpstr+' (select idl_fee_no from tbl_dental_idl where fee_no=a.fee_no and del_flag=''N'') idl_fee_no, ' + #10#13;
  tmpstr:=tmpstr+' (select D.doc_name from dental_doc_basic D, opd_basic1 E where D.doc_code=E.ins_doc and E.fee_no=A.fee_no and E.opd_date=A.opd_date) DEC_Name, ' + #10#13;
  tmpstr:=tmpstr+' (select D.doc_name from dental_doc_basic D, opd_basic1 E where D.doc_code=E.feat_doc and E.fee_no=A.fee_no and E.opd_date=A.opd_date) FAT_Name, ' + #10#13;
  tmpstr:=tmpstr+' (select D.doc_name from dental_doc_basic D, opd_basic1 E where D.doc_code=E.exe_doc and E.fee_no=A.fee_no and E.opd_date=A.opd_date) EXE_Name, ' + #10#13;
  tmpstr:=tmpstr+' (select diag_flag from opd_basic1 where fee_no=A.fee_no and opd_date=A.opd_date) DiagFlag, ' + #10#13;
  tmpstr:=tmpstr+' (select ins_doc from opd_basic1 where fee_no=A.fee_no and opd_date=A.opd_date) dec_doc, ' + #10#13;
  tmpstr:=tmpstr+' (select feat_doc from opd_basic1 where fee_no=A.fee_no and opd_date=A.opd_date) fat_doc, ' + #10#13;
  tmpstr:=tmpstr+' (select exe_doc from opd_basic1 where fee_no=A.fee_no and opd_date=A.opd_date) exe_doc, ' + #10#13;
  tmpstr:=tmpstr+' (select pain_score from opd_basic1 where fee_no=A.fee_no and opd_date=A.opd_date) pain_score, ' + #10#13;
  // move to load patient 
  // tmpstr:=tmpstr+' nvl((select weight from v_weight where chr_no=a.chr_no and upd_date_time = (select max(upd_date_time) from v_weight where chr_no=a.chr_no)),''0'') bt, ' + #10#13;
  tmpstr:=tmpstr+' Nvl((select trim(D.code_desc)||''_''||trim(D.code_no) from V_PART_CODE D, opd_basic E where CODE_SOURCE IN (''D'',''T'') and D.code_no=E.part_code and E.fee_no=A.fee_no and E.opd_date=A.opd_date),';
  tmpstr:=tmpstr+' (select trim(D.code_desc)||''_''||trim(D.code_no) from V_PART_CODE D, opd_basic E where CODE_SOURCE IN (''D'',''T'') and D.code_no=E.part_code and E.fee_no=A.fee_no and E.opd_date=A.opd_date)) part_desc, ' + #10#13;
  tmpstr:=tmpstr+' (select trim(D.code_desc)||''_''||trim(D.code_no) from V_CASE_TYPE D, opd_basic1 E where CODE IN (''D'',''T'') and D.code_no=E.case_type and E.fee_no=A.fee_no and E.opd_date=A.opd_date) case_desc, ' + #10#13;
  tmpstr:=tmpstr+' (select trim(D.code_desc)||''_''||trim(D.code_no) from V_ORDER_TYPE D, opd_basic1 E where D.code_no=E.pay_type and E.fee_no=A.fee_no and E.opd_date=A.opd_date) pay_desc, ' + #10#13;
  tmpstr:=tmpstr+' decode((select count(*) from opd_warning2 where med_code is not null and  chr_no=a.chr_no and stop_flag=''N''),''0'','' '',''*有過敏記錄*'') Allergic, ' + #10#13;
  tmpstr:=tmpstr+' (select ins_seq_no from opd_basic1 where fee_no=A.fee_no and opd_date=A.opd_date) ins_seq_no, ' + #10#13;
  tmpstr:=tmpstr+' round(((sysdate-to_date(b.birth_date+19110000,''YYYYMMDD'')) / 365),0) age, ' + #10#13;
  tmpstr:=tmpstr+' nvl((select ''Y'' from dpd_checkin where OPD_KIND=A.OPD_KIND and OPD_DATE=A.OPD_DATE and DEPT_CODE=A.DEPT_CODE and SHIFT_NO=A.SHIFT_NO and DEPT_ROOM=A.DEPT_ROOM and DOC_CODE=A.DOC_CODE and SEQ_NO=A.SEQ_NO ),''N'') DPDCI, ' + #10#13;
  tmpstr:=tmpstr+' (case when nvl((select ''Y'' from dpd_checkin where OPD_KIND=A.OPD_KIND and OPD_DATE=A.OPD_DATE and DEPT_CODE=A.DEPT_CODE and SHIFT_NO=A.SHIFT_NO and DEPT_ROOM=A.DEPT_ROOM and DOC_CODE=A.DOC_CODE and SEQ_NO=A.SEQ_NO ),''N'') = ''Y'' then  '+ #10#13;
  tmpstr:=tmpstr+' ''等候時間：''||(select Round((decode(order_time,null,sysdate,to_date(opd_date+19110000||order_time,''YYYYMMDDHH24MI'')) - to_date(opd_date+19110000||chkin_time,''YYYYMMDDHH24MI''))*24*60,0) '+ #10#13;
  tmpstr:=tmpstr+' from dpd_checkin where OPD_KIND=A.OPD_KIND and OPD_DATE=A.OPD_DATE and DEPT_CODE=A.DEPT_CODE and SHIFT_NO=A.SHIFT_NO and DEPT_ROOM=A.DEPT_ROOM and DOC_CODE=A.DOC_CODE and SEQ_NO=A.SEQ_NO ) ||''分鐘''  '+ #10#13;
  tmpstr:=tmpstr+' else  ''''  end) Wait, ';
  tmpstr:=tmpstr+' (select count(*) from opd_his h,dpd_all_order d where h.fee_no=d.fee_no and h.fee_code=d.fee_code and h.seq_no=d.order_seq ';
  tmpstr:=tmpstr+' and h.cncl_flag=''N'' and h.dc_type=''C'' and d.dc_flag=''N'' and h.self_pay_flag in(''N'',''G'') and nvl(trim(h.order_sign),''0'')=''0'' and d.fee_no=a.fee_no and h.opd_date=a.opd_date) ICSIGN ';
  case (s_no) of
    0:
    begin
      tmpstr:=tmpstr+' FROM REG_BASIC a, chr_Basic b ' + #10#13;
      tmpstr:=tmpstr+' where (a.chr_no not in(select chr_no from tbl_dental_appointment where chr_no=a.chr_no and seq_no=a.seq_no and shift_no=a.shift_no and doc_code=a.doc_code and dept_room=a.dept_room and dept_code=a.dept_code and app_date=a.opd_date)) and ' + #10#13;
      tmpstr:=tmpstr+' (a.doc_code like ''$DOC_CODE$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.chr_no=b.chr_no) and ' + #10#13;
      tmpstr:=tmpstr+' (a.OPD_KIND in ($OPD_KIND$)) and ' + #10#13;
      tmpstr:=tmpstr+' (a.OPD_DATE = ''$OPD_DATE$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.SHIFT_NO = ''$SHIFT_NO$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.CNCL_FLAG=''N'') and ' + #10#13;
      tmpstr:=tmpstr+' (rtrim(a.reserve_flag)<>''6'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.Dept_CODE IN ($DEPT_CODE$)) ' + #10#13;
      tmpstr:=tmpstr+' order by a.order_status,a.SEQ_NO) D ' + #10#13;

    end;
    1:
    begin
      tmpstr:=tmpstr+' FROM REG_BASIC a, chr_Basic b ' + #10#13;
      tmpstr:=tmpstr+' WHERE (a.chr_no=b.chr_no) and ' + #10#13;
      tmpstr:=tmpstr+' (a.doc_code like ''$DOC_CODE$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.OPD_KIND in ($OPD_KIND$)) and ' + #10#13;
      tmpstr:=tmpstr+' (a.chr_no = ''$CHR_NO$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.CNCL_FLAG=''N'') and ' + #10#13;
      tmpstr:=tmpstr+' (rtrim(a.reserve_flag)<>''6'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.Dept_CODE IN ($DEPT_CODE$)) ' + #10#13;
      tmpstr:=tmpstr+' order by concat(a.upd_date,a.upd_time) desc) D ' + #10#13;
    end;
    2:
    begin
      tmpstr:=tmpstr+' FROM REG_BASIC a, chr_Basic b, tbl_dental_appointment c ' + #10#13;
      tmpstr:=tmpstr+' WHERE (a.chr_no = b.chr_no) and ' + #10#13;
      tmpstr:=tmpstr+' (C.app_doc_code like ''$DOC_CODE$'') and ' + #10#13;
      tmpstr:=tmpstr+' (c.app_dept_code = ''$app_dept_code$'') and ' + #10#13;
      tmpstr:=tmpstr+' (c.chr_no=a.chr_no) and ' + #10#13;
      tmpstr:=tmpstr+' (c.seq_no=a.seq_no) and ' + #10#13;
      tmpstr:=tmpstr+' (c.shift_no=a.shift_no) and ' + #10#13;
      tmpstr:=tmpstr+' (c.doc_code=a.doc_code) and ' + #10#13;
      tmpstr:=tmpstr+' (c.dept_room=a.dept_room) and ' + #10#13;
      tmpstr:=tmpstr+' (c.dept_code=a.dept_code) and ' + #10#13;
      tmpstr:=tmpstr+' (c.app_date=a.opd_date) and ' + #10#13;
      tmpstr:=tmpstr+' (a.OPD_KIND in ($OPD_KIND$)) and ' + #10#13;
      tmpstr:=tmpstr+' (a.OPD_DATE = ''$OPD_DATE$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.SHIFT_NO= ''$SHIFT_NO$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.CNCL_FLAG=''N'') and ' + #10#13;
      tmpstr:=tmpstr+' (rtrim(a.reserve_flag)<>''6'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.Dept_CODE IN ($DEPT_CODE$)) ' + #10#13;
      tmpstr:=tmpstr+' order by a.SEQ_NO) D ' + #10#13;
    end;
    3:
    begin
      tmpstr:=tmpstr+' FROM REG_BASIC a, chr_Basic b ' + #10#13;
      tmpstr:=tmpstr+' WHERE (a.chr_no=b.chr_no) and ' + #10#13;
      tmpstr:=tmpstr+' (a.doc_code like ''$DOC_CODE$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.OPD_KIND in ($OPD_KIND$)) and ' + #10#13;
      tmpstr:=tmpstr+' (a.chr_no = ''$CHR_NO$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.opd_date = ''$OPD_DATE$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.shift_no = ''$SHIFT_NO$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.CNCL_FLAG=''N'') and ' + #10#13;
      tmpstr:=tmpstr+' (rtrim(a.reserve_flag)<>''6'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.Dept_CODE IN ($DEPT_CODE$)) ' + #10#13;
      tmpstr:=tmpstr+' order by concat(a.upd_date,a.upd_time) desc) D ' + #10#13;
    end;
    4:
    begin
      tmpstr:=tmpstr+' FROM REG_BASIC a, chr_Basic b ' + #10#13;
      tmpstr:=tmpstr+' WHERE (a.chr_no=b.chr_no) and ' + #10#13;
      tmpstr:=tmpstr+' (a.doc_code like ''$DOC_CODE$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.OPD_KIND in ($OPD_KIND$)) and ' + #10#13;
      tmpstr:=tmpstr+' (a.id_no = ''$ID_NO$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.opd_date = ''$OPD_DATE$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.shift_no = ''$SHIFT_NO$'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.CNCL_FLAG=''N'') and ' + #10#13;
      tmpstr:=tmpstr+' (rtrim(a.reserve_flag)<>''6'') and ' + #10#13;
      tmpstr:=tmpstr+' (a.Dept_CODE IN ($DEPT_CODE$)) ' + #10#13;
      tmpstr:=tmpstr+' order by concat(a.upd_date,a.upd_time) desc) D ' + #10#13;
    end;
    5:
    begin
      tmpstr:=tmpstr+' FROM REG_BASIC a, chr_Basic b ' + #10#13;
      tmpstr:=tmpstr+' where b.chr_no=a.chr_no ' + #10#13;
      tmpstr:=tmpstr+' AND a.fee_no=''$FEE_NO$'' ';
      tmpstr:=tmpstr+' AND a.OPD_KIND in ($OPD_KIND$)';
      tmpstr:=tmpstr+' AND a.CNCL_FLAG=''N'' ';
      tmpstr:=tmpstr+' AND a.shift_no = ''$SHIFT_NO$'' ';
      tmpstr:=tmpstr+' AND a.Dept_CODE IN ($DEPT_CODE$) ';
      tmpstr:=tmpstr+' AND a.opd_date = ''$OPD_DATE$'') D ';
    end;
  end;

  Result:=tmpstr;
end;
      
function getSpSql(SpNo:Integer;var Paramter,PType,RType:TStrings):string;
begin
  case (SpNo) of
    1:
    begin
      Paramter.Add('NoType');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('OperID');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('ltype');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('no');
      PType.Add('1');
      RType.Add('2');
      Result:='SP_GETNO';
    end;
    2:
    begin
      Paramter.Add('LS_OPD_DATE');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('LS_CHR_NO');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('LS_DEPT_CODE');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('LS_DOC_CODE');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('LS_SHIFT_NO');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('LS_SEQ_NO');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('LS_FEE_NO');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('LS_PAT_ID');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('LS_OPD_STATUS');
      PType.Add('1');
      RType.Add('1');
      Result:='SP_MODIFY_REG';
    end;
    3:
    begin
      Paramter.Add('as_fee_no');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_chr_no');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_opd_date');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('av_rtn_code');
      PType.Add('1');
      RType.Add('2');
      Paramter.Add('av_rtn_mssg');
      PType.Add('1');
      RType.Add('2');
      Result:='sp_lendchr';
    end;
    4:
    begin
      Paramter.Add('as_fee_no');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_seq');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_type');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_rtn_code');
      PType.Add('1');
      RType.Add('2');
      Paramter.Add('as_rtn_msg');
      PType.Add('1');
      RType.Add('2');
      Result:='SP_OrderExtend';
    end;
    5:
    begin
      Paramter.Add('as_opd_date');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_chr_no');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_dept_code');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_doc_code');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_shift_no');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_fee_no');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_pat_id');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_opd_status');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_order_status');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_oper_id');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_dept_room');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('as_seq_no');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('av_rtn_code');
      PType.Add('1');
      RType.Add('2');
      Paramter.Add('av_rtn_mssg');
      PType.Add('1');
      RType.Add('2');
      Result:='sp_modify_reg';
    end;
    6:
    begin
      Paramter.Add('av_diagnosedate');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('av_fee_no');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('av_rtn_code');
      PType.Add('1');
      RType.Add('2');
      Paramter.Add('av_rtn_mssg');
      PType.Add('1');
      RType.Add('2');
      Result:='p_ic_basic_unget';
    end;
    7:
    begin
      Paramter.Add('As_Source');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('As_Code');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('Av_Rtn_Case');
      PType.Add('1');
      RType.Add('2');
      Paramter.Add('Av_Rtn_Part');
      PType.Add('1');
      RType.Add('2');
      Paramter.Add('Av_Msg');
      PType.Add('1');
      RType.Add('2');
      Result:='p_Check_Type';
    end;
    8:
    begin
      Paramter.Add('v_chr_no');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('v_opd_date');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('v_fee_no');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('v_order_type');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('v_case_type');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('v_part_code');
      PType.Add('1');
      RType.Add('1');
      Paramter.Add('v_pay_flag');
      PType.Add('1');
      RType.Add('1');
      Result:='pkg_opdauto.P_opdauto';
    end;
  end;
end;

function getChkSqlStr(s_no :integer):string;
var
  tmpstr:string;
begin
  tmpstr:='';
  case (s_no) of
    1:
    begin
      tmpstr:=tmpstr+' select fee_no,cncl_flag from reg_basic ' + #10#13;
      tmpstr:=tmpstr+' where opd_date = ''$OPD_DATE$'' ' + #10#13;
      tmpstr:=tmpstr+' and shift_no = ''$SHIFT_NO$'' ' + #10#13;
      tmpstr:=tmpstr+' and chr_no = ''$CHR_NO$'' ' + #10#13;
      tmpstr:=tmpstr+' and seq_no = ''$SEQ_NO$'' ' + #10#13;
      tmpstr:=tmpstr+' and dept_code = ''$DEPT_CODE$'' ' + #10#13;
      tmpstr:=tmpstr+' and dept_room = ''$DEPT_ROOM$'' ';
    end;
    2:
    begin
      tmpstr:=tmpstr+' SELECT TTL_DAYS,DUR_DAYS,DUR_CNT,DAY_CNT ' + #10#13;
      tmpstr:=tmpstr+' FROM CIR_BASIC WHERE CIR_CODE=''$CODE$'' ' + #10#13;
    end;
    3:
    begin
      tmpstr:=tmpstr+' select count(*) num from opd_basic1 where opd_kind = ''$OPD_KIND$'' and  opd_date=''$OPD_DATE$'' and dept_code=''$DEPT_CODE$'' and ' + #10#13;
      tmpstr:=tmpstr+' shift_no=''$SHIFT_NO$'' and dept_room=''$DEPT_ROOM$'' and fee_no=''$FEE_NO$'' and seq_no=''$SEQ_NO$'' and chr_no=''$CHR_NO$'' ';
    end;
    4:
    begin
      tmpstr:=tmpstr+' SELECT death_flag FROM CHR_BASIC WHERE CHR_NO = ''$CHR_NO$'' and death_flag=''Y'' ';
    end;
    5:
    begin
      tmpstr:=tmpstr+' Select * from opd_fee A, reg_basic B where A.fee_code=''$FEE_CODE$'' and A.fee_no=B.fee_no  and B.opd_date = ''$OPD_DATE$'' and B.chr_no = ''$CHR_NO$'' ';
    end;
    6:
    begin
      tmpstr:=tmpstr+' select nvl(max(seq_no),''10009'') max_seq_no,nvl(decode(trim(max(sheet_no)),max(fee_no),'''',max(sheet_no)),(to_char(sysdate,''YYYYMMDD'')-19110000)||''000'') max_sheet_no,nvl(max(to_number(seq)),''0'') max_seq ';
      tmpstr:=tmpstr+' from dpd_all_order where fee_no=''$FEE_NO$'' and order_date=''$OPD_DATE$'' ';
    end;
    7:
    begin
      tmpstr:=tmpstr+' select * from dental_doc_basic where doc_code=''$DOC_CODE$''  and pswd_desc=''$PSWD_DESC$'' ';
    end;
    8:
    begin
      tmpstr:=tmpstr+' select * from epd_so1 where dept_code=''$DEPT_CODE$'' and trim(doc_code)=''$DOCCODE$'' and item_no=''$ITEMNO$'' and trim(class_desc)=''$CLASSDESC$'' ';
    end;
    9:
    begin
      tmpstr:=tmpstr+' select max(class_code) as max_code from epd_so1 where dept_code=''$DEPT_CODE$'' and item_no=''$ITEMNO$'' and doc_code=''$DOCCODE$'' ';
    end;
    10:
    begin
      tmpstr:=tmpstr+' select * from epd_often where dept_code=''$DEPT_CODE$'' and trim(doc_code)=''$DOC_CODE$'' and item_no=''$ITEM_NO$'' and trim(class_code)=''$CLASS_CODE$'' and trim(fee_code)= ''$FEE_CODE$''  ';
    end;
    11:
    begin
      tmpstr:=tmpstr+' select trim(CLASS_DESC) 處置代碼, CLASS_CODE from epd_so1 where dept_code=''$DEPT_CODE$'' and doc_code=''$DOC_CODE$'' and item_no=''$ITEM_NO$'' order by trim(CLASS_DESC) ';
    end;
    12:
    begin
        tmpstr:=tmpstr+' select count(*) as cnt from EPD_OFTEN where DEPT_CODE=''$DEPT_CODE$'' and ITEM_no=''$ITEM_NO$'' and FEE_CODE=''$FEE_CODE$'' and doc_code=''$DOC_CODE$'' ';
    end;
    13:
    begin
      tmpstr:=tmpstr+' select DOC_CODE 醫師代碼,FEE_CODE 藥品代碼,FEE_DESC 藥品名稱,GRIND_FLAG 磨粉別,UNIT_QTY 劑量,CIR_CODE 頻率,MED_DAYS 日份,TTL_QTY 總量 from EPD_OFTEN where Item_No=''$ITEM_NO$'' AND class_code=''0000'' AND DOC_CODE=''$DOC_CODE$'' ORDER BY  FEE_CODE';
    end;
    14:
    begin
      tmpstr:=tmpstr+' select * from epd_often where dept_code=''$DEPT_CODE$'' and trim(doc_code)=''$DOC_CODE$'' and item_no=''$ITEM_NO$'' and fee_code= ''$FEE_CODE$'' order by seq_no ';
    end;
    15:
    begin
      tmpstr:=tmpstr+' SELECT * FROM TBL_DENTAL_IDL WHERE FEE_NO=''$FEE_NO$'' ';
    end;
    16:
    begin
      tmpstr:=tmpstr+' select * from dental_doc_basic where remark=''0'' and dec_doc=''$DEC_DOC$'' and doc_code $OPERATE$ ''$DOC_CODE$'' and VS_TS <> ''A'' ';
    end;
    17:
    begin
      tmpstr:=tmpstr+' select ins_amt from tbl_dental_doc_insamt where doc_code=''$DOC_CODE$'' ';
    end;
    18:
    begin
      tmpstr:=tmpstr+' select count(*) qty from opd_basic B where B.pat_id=''1'' and B.hia_doc=''$HIA_DOC$'' and B.dept_code in ($DEPT_CODE$) and B.opd_date=''$OPD_DATE$'' and B.opd_kind in($OPD_KIND$) ';
    end;
    19:
    begin
      tmpstr:=tmpstr+' select * from dental_doc_basic where remark=''0'' and doc_code $OPERATE$ ''$DOC_CODE$'' and dept_code like ''$DEPT_CODE$'' and VS_TS <> ''A'' ';
    end;
    20:
    begin
      tmpstr:=tmpstr+' select fee_no from IC_CRITICALILLNESS where fee_no=''$FEE_NO$'' union select fee_no from ICTREATMENT_RECORD where fee_no=''$FEE_NO$'' ';
    end;
    21:
    begin
      tmpstr:=tmpstr+' select * from IC_PRESCRIPTION where fee_no=''$FEE_NO$'' ';
    end;
    22:
    begin
      tmpstr:=tmpstr+' select * from IC_Preg_Prev where fee_no=''$FEE_NO$'' and Prevent_kind=''$PREVENT_KIND$'' ';
    end;
    23:
    begin
      tmpstr:=tmpstr+' select * from IC_InoculateData  where fee_no=''$FEE_NO$'' ';
    end;
    24:
    begin
      tmpstr:=tmpstr+' select fee_no from IC_allergy where fee_no=''$FEE_NO$'' ';
    end;
    25:
    begin
      tmpstr:=tmpstr+' select * from ic_treat_temp where fee_no=''$FEE_NO$'' and del_flag = ''N'' ';
    end;
    26:
    begin
      tmpstr:=tmpstr+' Select * from hospice_basic where CHR_NO=''$CHR_NO$'' and can_cd=''N'' ';
    end;
    27:
    begin
      tmpstr:=tmpstr+' Select * from DNR_BASIC where CHR_NO=''$CHR_NO$'' and can_cd=''N'' ';
    end;
    28:
    begin
      tmpstr:=tmpstr+' select * from pain_score where fee_no=''$FEE_NO$'' ';
    end;
    29:
    begin
      tmpstr:=tmpstr+' select * from ic_treat_dtl where fee_no=''$FEE_NO$'' and fee_code=''$FEE_CODE$'' and ok_flag = ''F'' ';
    end;
    30:
    begin
      tmpstr:=tmpstr+' Select count(*) as cnt from ORDERITEM_BASIC where fee_code=''$FEE_CODE$'' and order_type=''L'' and URG_FLAG=''Y'' and Send_cd_3=''$SEND_CD_3$'' ';
    end;
    31:
    begin
      tmpstr:=tmpstr+' select sum(qty_num) his_qty_num from opd_basic a,opd_fee b where 1=1 ';
    end;
    32:
    begin
      tmpstr:=tmpstr+' and b.del_flag = ''N'' and b.fee_no = a.fee_no and a.chr_no =''$CHR_NO$'' and a.dept_code in ($DEPT_CODE$) ';
    end;
    33:
    begin
      tmpstr:=tmpstr+' select sum(qty_num) his_qty_num from opd_basic a,opd_fee b where 1=1 and b.del_flag=''N'' ';
    end;
    34:
    begin
      tmpstr:=tmpstr+' and b.fee_no = a.fee_no and a.chr_no = ''$CHR_NO$'' and a.dept_code in ($DEPT_CODE$) ';
    end;
    35:
    begin
      tmpstr:=tmpstr+' select shift_no from tbl_dpd_doc_sch where del_flag=''N'' and doc_code=''$DOC_CODE$'' and job_date=''$JOB_DATE$'' order by shift_no ';
    end;
    36:
    begin
      tmpstr:=tmpstr+' select APP_NO,(select trim(pat_name) from chr_basic where chr_no=A.chr_no) chr_name, decode(A.conf_flag,''Y'',''已掛號'','''') conf_desc '+#13;
      tmpstr:=tmpstr+' ,A.app_time,trim(A.treat_time) treat_time, trim(remark) remark from tbl_dental_appointment A where A.app_doc_code=''$APP_DOC_CODE$'' '+#13;
      tmpstr:=tmpstr+' and A.app_date=''$APP_DATE$'' and A.del_flag=''N'' order by A.app_time, A.chr_no ';
    end;
    37:
    begin
      tmpstr:=tmpstr+' select to_char(to_date(A.job_date+19110000,''YYYYMMDD''),''D'') weekday,trim(A.job_date) day,(select trim(doc_name) from dental_doc_basic where doc_code=A.doc_code) doc_name,(trim(A.doc_code)) doc_sch from tbl_dpd_doc_sch A '+#13;
      tmpstr:=tmpstr+' where A.job_date in ($JOB_DATE$) and doc_code in ($DOC_CODE$) and del_flag=''N'' group by A.job_date,A.doc_code order by A.job_date ';
    end;
    38:
    begin
      tmpstr:=tmpstr+' select (decode(shift_no,''1'',''早診：'',decode(shift_no,''2'',''午診：'',''晚診：''))||trim(dept_code)) shift_dept '+#13;
      tmpstr:=tmpstr+' from tbl_dpd_doc_sch A where A.job_date=''$JOB_DATE$'' and doc_code =''$DOC_CODE$'' and del_flag=''N'' order by shift_no ';
    end;
    39:
    begin
      tmpstr:=tmpstr+' select trim(A.app_time) app_time,trim(A.treat_time) treat_time,trim(A.remark) remark, (select trim(code_desc) from code_dtl where code_type=''ZZ'' and code_no=A.app_dept_code) app_dept_desc, '+#13;
      tmpstr:=tmpstr+' (select trim(pat_name)||''-''||chr_no from chr_basic where chr_no=A.chr_no) chr_name, '+#13;
      tmpstr:=tmpstr+' (select trim(doc_name)||''-''||trim(doc_code) from dental_doc_basic where doc_code=A.app_doc_code) doc_desc '+#13;
      tmpstr:=tmpstr+' from tbl_dental_appointment A where A.chr_no=''$CHR_NO$'' and A.app_date=''$APP_DATE$''and del_flag=''N'' '+#13;
    end;
    40:
    begin
      tmpstr:=tmpstr+' select trim(A.app_date) app_date from tbl_dental_appointment A where A.chr_no=''$CHR_NO$'' and $APP_DATE$ and A.del_flag=''N'' group by A.app_date order by A.app_date ';
    end;
    41:
    begin
      tmpstr:=tmpstr+' select * from tbl_dental_appointment A where A.app_doc_code=''$APP_DOC_CODE$'' and A.app_date=''$APP_DATE$'' and del_flag=''N'' and A.shift_no like ''$SHIFT_NO$'' ';
    end;
    42:
    begin
      tmpstr:=tmpstr+' select A.app_no,A.chr_no,A.app_doc_code,A.APP_TIME,A.APP_DATE,A.treat_time,A.remark,A.SHIFT_NO, '+#13;
      tmpstr:=tmpstr+' (select trim(doc_name) from dental_doc_basic where doc_code=A.app_doc_code) doc_name, '+#13;
      tmpstr:=tmpstr+' (select trim(code_no)||''-''||trim(code_desc) from code_dtl where code_type=''ZZ'' and code_no=A.app_dept_code) app_dept_desc '+#13;
      tmpstr:=tmpstr+' from tbl_dental_appointment A where A.app_time=''$APP_TIME$'' and A.chr_no=''$CHR_NO$'' and A.app_date=''$APP_DATE$'' '+#13;
    end;
    43:
    begin
      tmpstr:=tmpstr+' select * from chr_basic where chr_no=''$CHR_NO$'' ';
    end;
    44:
    begin
      tmpstr:=tmpstr+' select * from tbl_dental_appointment where chr_no=''$CHR_NO$'' and app_doc_code=''$APP_DOC_CODE$'' and app_date=''$APP_DATE$'' and app_time=''$APP_TIME$'' and del_flag=''N'' ';
    end;
    45:
    begin
      tmpstr:=tmpstr+' select nvl(max(app_no),0) max_no from tbl_dental_appointment where app_date=''$APP_DATE$'' ';
    end;
    46:
    begin
      tmpstr:=tmpstr+' select chr_no, pat_name, HOME_TEL_NO from chr_basic where trim(merg_chr) is null and id_no=''$ID_NO$'' '+#13;
      tmpstr:=tmpstr+' and substr(chr_no,length(chr_no),1) not in (''A'',''B'',''C'',''D'',''E'',''F'',''G'',''H'',''I'',''J'',''K'',''L'',''M'',''N'',''O'',''P'',''Q'',''R'',''S'',''T'',''U'',''V'',''W'',''X'',''Y'',''Z'') ';
    end;
    47:
    begin
      tmpstr:=tmpstr+' select decode((select doc_code from tbl_dpd_doc_sch where shift_no=''$SHIFT_NO$'' '+#13;
      tmpstr:=tmpstr+' and job_date=''$JOB_DATE$'' and doc_code=A.doc_code and del_flag=''N''),A.doc_code,''V'','''') flag,trim(A.doc_name), '+#13;
      tmpstr:=tmpstr+' (case when (select B.doc_code from tbl_dpd_doc_sch B where B.shift_no=''$SHIFT_NO$'' '+#13;
      tmpstr:=tmpstr+' and B.job_date=''$B.JOB_DATE$'' and B.doc_code=A.doc_code) is null then '+#13;
      tmpstr:=tmpstr+' (select trim(C.code_no)||''-''||trim(C.code_desc) from code_dtl C where C.code_type=''ZZ'' and C.code_no=A.dept_code) else '+#13;
      tmpstr:=tmpstr+' (select trim(C.code_no)||''-''||C.code_desc from tbl_dpd_doc_sch B, code_dtl C where C.code_type=''ZZ'' and C.code_no=B.dept_code and B.shift_no=''$SHIFT_NO$'' '+#13;
      tmpstr:=tmpstr+' and B.job_date=''$B.JOB_DATE$'' and B.doc_code=A.doc_code) end) dept_code, '+#13;
      tmpstr:=tmpstr+' A.doc_code,decode((select doc_code from tbl_dpd_doc_sch where shift_no=''$SHIFT_NO$'' '+#13;
      tmpstr:=tmpstr+' and job_date=''$JOB_DATE$'' and doc_code=A.doc_code),A.doc_code,''1'','''') already '+#13;
      tmpstr:=tmpstr+' from dental_doc_basic A where A.remark=''0'' and A.doc_code not in (''97492'',''DENT'',''DENT1'') and trim(dept_code) <> '' '' '+#13;
      tmpstr:=tmpstr+' order by A.dept_code ';
    end;
    48:
    begin
      tmpstr:=tmpstr+' select (select doc_name from dental_doc_basic where doc_code=A.doc_code) doc_name, '+#13;
      tmpstr:=tmpstr+' (select trim(code_no)||''-''||trim(code_desc) from code_dtl where code_type=''ZZ'' and code_no=A.dept_code) dept_name '+#13;
      tmpstr:=tmpstr+' from tbl_dpd_doc_sch A where A.job_date=''$JOB_DATE$'' and A.shift_no=''$SHIFT_NO$'' and del_flag=''N'' '+#13;
      tmpstr:=tmpstr+' order by A.dept_code,A.doc_code ';
    end;
    49:
    begin
      tmpstr:=tmpstr+' SELECT A.doc_name,(SELECT trim(code_no)||''-''||trim(code_desc) FROM code_dtl WHERE code_type=''ZZ'' and code_no=A.dept_code) dept_desc, A.doc_code '+#13;
      tmpstr:=tmpstr+' From dental_doc_basic A WHERE A.remark=''0'' AND A.doc_code NOT IN (''97492'',''DENT'',''DENT1'') ORDER BY A.doc_code ';
    end;
    50:
    begin
      tmpstr:=tmpstr+' select A.job_date,(select trim(code_no)||''-''||trim(code_desc) from code_dtl where code_type=''ZZ'' and code_no=A.dept_code) dept_desc, '+#13;
      tmpstr:=tmpstr+' decode(A.shift_no,''1'',''早診'',decode(A.shift_no,''2'',''午診'',''晚診'')) shift_desc, '+#13;
      tmpstr:=tmpstr+' (select trim(doc_name)||''-''||trim(doc_code) from dental_doc_basic where doc_code=A.doc_code) doc_desc '+#13;
      tmpstr:=tmpstr+' from tbl_dpd_doc_sch A where $JOB_DATE$ and A.dept_code in ($DEPT_CODE$) and del_flag=''N'' order by job_date,dept_desc,shift_desc ';
    end;
    51:
    begin
      tmpstr:=tmpstr+' select trim(doc_code)||''-''||trim(doc_name) doc_item '+#13;
      tmpstr:=tmpstr+' from dental_doc_basic where remark=''0'' and doc_code not in (''97492'',''DENT1'',''DENT'') '+#13;
      tmpstr:=tmpstr+' and dept_code=''$DEPT_CODE$'' order by doc_code ';
    end;
    52:
    begin
      tmpstr:=tmpstr+' select '''',A.chr_no,(select trim(pat_name) from chr_basic where chr_no=A.chr_no) pat_name,A.app_no '+#13;
      tmpstr:=tmpstr+' from tbl_dental_appointment A where A.app_doc_code=''$APP_DOC_CODE$'' and A.app_date=''$APP_DATE$'' '+#13;
      tmpstr:=tmpstr+' and A.app_time=''$APP_TIME$'' and A.del_flag=''N'' ';
    end;
    53:
    begin
      tmpstr:=tmpstr+' select (select trim(code_no)||''-''||trim(code_desc) from code_dtl where code_type=''ZZ'' and code_no=dept_code) dept_desc '+#13;
      tmpstr:=tmpstr+' from tbl_dpd_doc_sch where doc_code=''$DOC_CODE$'' and job_date=''$JOB_DATE$'' and shift_no=''$SHIFT_NO$'' and del_flag=''N'' ';
    end;
    54:
    begin
      tmpstr:=tmpstr+' select dept_code,dept_room,doc_code,shift_no,seq_no,chr_no from tbl_dental_appointment '+#13;
      tmpstr:=tmpstr+' where App_doc_code=''$APP_DOC_CODE$'' and conf_flag=''Y'' and App_date=''$APP_DATE$'' and App_time=''$APP_TIME$'' and App_no like ''$APP_NO$'' ';
    end;
    55:
    begin
      tmpstr:=tmpstr+' select lpad(rownum,3,''0'') num,B.* from ( '+#13;
      tmpstr:=tmpstr+' Select  (select trim(doc_name) from dental_doc_basic where doc_code=A.app_doc_code) doc_name, decode(shift_no,''1'',''早診'',decode(shift_no,''2'',''午診'',''晚診'')) shift_desc, '+#13;
      tmpstr:=tmpstr+' (select trim(code_no)||''-''||trim(code_desc) from code_dtl where code_type=''ZZ'' and code_no=A.app_dept_code) dept_desc, '+#13;
      tmpstr:=tmpstr+' A.app_date,A.app_time,A.treat_time,A.remark, '+#13;
      tmpstr:=tmpstr+' (select trim(pat_name) from chr_basic where chr_no=A.chr_no) chr_name, trim(A.chr_no) chr_no '+#13;
      tmpstr:=tmpstr+' from tbl_dental_appointment A where A.app_date between $APP_DATE$ and del_flag=''N'' '+#13;
    end;
    56:
    begin
      tmpstr:=tmpstr+' select A.App_no,A.app_doc_code,A.APP_TIME,A.APP_DATE,A.SHIFT_NO,A.chr_no,treat_time,(select trim(doc_name) from dental_doc_basic where doc_code=A.app_doc_code) doc_name, '+#13;
      tmpstr:=tmpstr+' (select trim(code_no)||''-''||trim(code_desc) from code_dtl where code_type=''ZZ'' and code_no=A.app_dept_code) app_dept_desc, A.remark '+#13;
      tmpstr:=tmpstr+' from tbl_dental_appointment A where A.App_time=''$APP_TIME$'' and A.app_doc_code=''$APP_DOC_CODE$'' and A.app_date= ''$APP_DATE$'' and A.del_flag=''N'' and A.App_no like ''$APP_NO$'' ';
    end;
    57:
    begin
      tmpstr:=tmpstr+' select nvl(self_pay_uamt,''0'') item_amt from orderitem_basic where fee_code = ''$FEE_CODE$'' ';
    end;
    58:
    begin
      tmpstr:=tmpstr+' select trim(code_desc)||''_''||trim(code_no) code_desc from V_PART_CODE WHERE CODE_SOURCE IN (''D'',''T'') and trim(code_no) like ''$CODE_NO$'' ';
    end;
    59:
    begin
      tmpstr:=tmpstr+' select trim(code_desc)||''_''||trim(code_no) code_desc from V_CASE_TYPE WHERE CODE IN (''D'',''T'') and trim(code_no) like ''$CODE_NO$'' ';
    end;
    60:
    begin
      tmpstr:=tmpstr+' select trim(code_desc)||''_''||trim(code_no) code_desc from V_ORDER_TYPE WHERE trim(code_no) like ''$CODE_NO$'' ';
    end;
    61:
    begin
      tmpstr:=tmpstr+' select A.fee_code "代碼",A.fee_name "名稱",decode(A.self_pay_flag,''Y'',''健保'',''自費'') "費用類別",''100'' "成數",A.ttl_qty "數量", '+#13;
	    tmpstr:=tmpstr+' nvl((select self_pay_uamt from orderitem_basic where fee_code=A.fee_code and rownum=1),''0'') "自費價", '+#13;
	    tmpstr:=tmpstr+' decode(A.self_pay_flag,''N'',A.ttl_qty*nvl((select self_pay_uamt from orderitem_basic where fee_code=A.fee_code and rownum=1),''0''),''0'') "自費總價", '+#13;
	    tmpstr:=tmpstr+' nvl((select ins_pay_uamt from orderitem_basic where fee_code=A.fee_code and rownum=1),''0'') "健保價", '+#13;
	    tmpstr:=tmpstr+' decode(A.self_pay_flag,''Y'',A.ttl_qty*nvl((select ins_pay_uamt from orderitem_basic where fee_code=A.fee_code and rownum=1),''0''),''0'') "健保總價" '+#13;
      tmpstr:=tmpstr+' from dpd_all_order A where A.so_flag $OPERATOR$ (''M'') and A.del_flag=''N'' and A.dc_flag=''N'' and A.fee_no=''$FEE_NO$'' order by so_flag ';
    end;
    62:
    begin
      tmpstr:=tmpstr+' select print_flag from first_treatment_western where chr_no=''$CHR_NO$'' ';
    end;
    63:
    begin
      tmpstr:=tmpstr+' select F_IPD_MED_CHECK( ''$CHR_NO$'',''$MED_CODE$'',''$FEE_NO$'',''$OPD_DATE$'',''$SELF_PAY_FLAG$'',''$TTL_QTY$'' ) as AA from dual';
    end;
    64:
    begin
      tmpstr:=tmpstr+' select A.OPD_DATE,A.PAT_NAME,(select smpl_desc from dept_basic where dept_code=A.DEPT_CODE) dept_desc,A.fee_no '+#13;
      tmpstr:=tmpstr+' from opd_basic A,lab_list B where B.fee_no=A.fee_no and A.chr_no=''$CHR_NO$'' group by A.OPD_DATE,A.PAT_NAME,A.DEPT_CODE,A.fee_no ';
    end;
    65:
    begin
      tmpstr:=tmpstr+' select * from lab_list where fee_no=''$FEE_NO$'' ';
    end;
    66:
    begin
      tmpstr:=tmpstr+' select ic_date||ic_time icDT,ic_seq_no from ic_treat_temp where fee_no=''$FEE_NO$'' and del_flag=''N'' ';
    end;
    67:
    begin
      tmpstr:=tmpstr+' select A.fee_code "診斷碼",A.fee_desc "英文名稱",(select CHN_FULL_DESC from icd9_basic WHERE SUBSTR(ENG_FULL_DESC,1,1)<>''*'' and op_flag=''N'' and final_flag=''Y'' AND ICD9_CODE=A.fee_code ) "中文名稱"  '+#13;
      tmpstr:=tmpstr+' from EPD_OFTEN A where A.Item_No=''$ITEM_NO$'' AND class_code=''0000'' AND A.DOC_CODE=''$DOC_CODE$'' ';
    end;
    68:
    begin
      tmpstr:=tmpstr+' select * from DPD_CHECKIN where opd_kind=''$OPD_KIND$'' and opd_date=''$OPD_DATE$'' and dept_code=''$DEPT_CODE$'' '+#13;
      tmpstr:=tmpstr+' and shift_no=''$SHIFT_NO$'' and dept_room=''$DEPT_ROOM$'' and doc_code=''$DOC_CODE$'' and seq_no=''$SEQ_NO$'' ';
    end;
    69:
    begin
      tmpstr:=tmpstr+' select tech_code, decode(substr(tech_code,1,1),''2'',''O'',''F'',''F'',''M'') child_type from fee_child where fee_code=''$FEE_CODE$'' order by child_type ';
    end;
    70:
    begin
      tmpstr:=tmpstr+' select opd_date,dept_code,dept_room,login_time,logout_time from opd_seq where opd_kind in($OPD_KIND$) and opd_date=''$OPD_DATE$'' and f_get_hia_dept(dept_code) like ''40%'' and shift_no=''$SHIFT_NO$'' and doc_code=''$DOC_CODE$'' ';
    end;
    71:
    begin
      tmpstr:=tmpstr+' select max(to_number(seq_no)) seq from tbl_sohp_record where fee_no=''$FEE_NO$'' ';
    end;
    72:
    begin
      tmpstr:=tmpstr+' select to_char(sysdate,''YYYYMMDD HH24:MI'')p_time,dept_code,dept_room,trim(room_desc) room_desc, decode(shift_no,''1'',''早診'',''2'',''午診'',''晚診'') shift_desc, ((select trim(doc_name) from dental_doc_basic where doc_code=opd_seq.doc_code)||doc_code) doc_name  ' +#13;
      tmpstr:=tmpstr+' from opd_seq where opd_date=''$OPD_DATE$'' and shift_no=''$SHIFT_NO$'' and doc_code=''$DOC_CODE$'' ';
    end;
    73:
    begin
      tmpstr:=tmpstr+' select seq_no,trim(pat_name) pat_name, chr_no, decode(opd_status,''1'',''待'',''2'',''待'',''3'',''完'',''4'',''完'',''5'',''完'') status ' +#13;
      tmpstr:=tmpstr+' from reg_basic where chr_no is not null and dept_code=''$DEPT_CODE$'' and dept_room=''$DEPT_ROOM$'' and opd_date=''$OPD_DATE$'' and shift_no=''$SHIFT_NO$'' and doc_code=''$DOC_CODE$'' and CNCL_FLAG=''N'' ';
    end;
    74:
    begin
      tmpstr:=tmpstr+' select trim(code_desc),trim(code_no) from code_dtl where code_type=''$CODE_TYPE$'' ';
    end;
    75:
    begin
      tmpstr:=tmpstr+' select * from orderitem_basic where order_type in (''T1'',''T2'',''T3'') and trim(send_cd_1) = ''$SEND_CD_1$'' and send_cd_2 like ''$SEND_CD_2$%'' and rownum=1 ';
    end;
    76:
    begin
      tmpstr:=tmpstr+' select count(*)+1 cnt from opd_basic where opd_date < ''$OPD_DATE$'' and  chr_no=''$CHR_NO$'' and ins_seq_no=''$INS_SEQ_NO$'' and ins_seq_no2=''$INS_SEQ_NO2$'' ';
    end;
    77:
    begin
      tmpstr:=tmpstr+' select ins_seq_no2,pain_score from opd_basic where fee_no=''$FEE_NO$'' ';
    end;
    78:
    begin
      tmpstr:=tmpstr+' select trim(code_no) codeno,trim(code_desc) codedesc from code_dtl where code_type=''ZZ'' ORDER BY 2 DESC ';
    end;
    79:
    begin
      tmpstr:=tmpstr+' select nvl((select weight from v_weight where chr_no=''$CHR_NO$'' and upd_date_time = (select max(upd_date_time) from v_weight where chr_no=''$CHR_NO$'')),''0'') bt from dual ';
    end;
    80:
    begin
      tmpstr:=tmpstr+' select round(sysdate-to_date(opd_date+19110000,''YYYYMMDD'')) day from opd_basic where chr_no=''$CHR_NO$'' and ins_seq_no=''$INS_SEQ_NO$''  ';
      tmpstr:=tmpstr+' and opd_date=(select max(opd_date) from opd_basic where chr_no=''$CHR_NO$'' and opd_date <> ''$OPD_DATE$'' and ins_seq_no=''$INS_SEQ_NO$'') ';
    end;
    81:
    begin
      tmpstr:=tmpstr+' select count(*) as count from chr_identities where fee_no=''$FEE_NO$'' ';
    end;
    82:
    begin
      tmpstr:=tmpstr+' select ins_feecode from orderitem_basic where fee_code = ''$FEE_CODE$'' and order_type=''F'' ';
    end;
    83:
    begin
      //tmpstr:=tmpstr+' select round(sysdate-to_date(opd_date+19110000,''YYYYMMDD'')) day from opd_basic where chr_no=''$CHR_NO$'' and ins_seq_no=''$INS_SEQ_NO$''  '+;
      tmpstr:=tmpstr+' select substr(to_number(to_char(add_months(to_date(opd_date+19110000,''YYYYMMDD''),5),''YYYYMMDD'')-19110000),1,5) day from opd_basic where chr_no=''$CHR_NO$'' and ins_seq_no=''$INS_SEQ_NO$''  ';
      tmpstr:=tmpstr+' and opd_date=(select max(opd_date) from opd_basic where chr_no=''$CHR_NO$'' and opd_date <> ''$OPD_DATE$'' and ins_seq_no=''$INS_SEQ_NO$'') ';
    end;
    84:
    begin
      tmpstr:=tmpstr+'select chr_no,count(chr_no) as times from opd_basic b where opd_kind=''O'' and opd_date like ''$YM$%'' and dept_code like ''$DEPT_CODE$%''  and fee_no<> ''$NOWFEE_NO$'' and chr_no=''$CHR_NO$'' ';
      tmpstr:=tmpstr+'and not exists (select fee_no from opd_basic a where a.fee_no=b.fee_no and opd_kind=''O'' and opd_date like ''$YM$%'' and dept_code like ''$DEPT_CODE$%'' ';
      tmpstr:=tmpstr+'and (INSTR(replace(icd10_code1,''.'','''')||replace(icd10_code2,''.'','''')||replace(icd10_code3,''.'','''')||replace(icd10_code4,''.'','''')||replace(icd10_code5,''.'',''''),''C944'')>0 or ';
      tmpstr:=tmpstr+'INSTR(replace(icd10_code1,''.'','''')||replace(icd10_code2,''.'','''')||replace(icd10_code3,''.'','''')||replace(icd10_code4,''.'','''')||replace(icd10_code5,''.'',''''),''C946'')>0 or ';
      tmpstr:=tmpstr+'INSTR(replace(icd10_code1,''.'','''')||replace(icd10_code2,''.'','''')||replace(icd10_code3,''.'','''')||replace(icd10_code4,''.'','''')||replace(icd10_code5,''.'',''''),''D66'')>0  or ';
      tmpstr:=tmpstr+'INSTR(replace(icd10_code1,''.'','''')||replace(icd10_code2,''.'','''')||replace(icd10_code3,''.'','''')||replace(icd10_code4,''.'','''')||replace(icd10_code5,''.'',''''),''D67'')=1 or ';
      tmpstr:=tmpstr+'INSTR(replace(icd10_code1,''.'','''')||replace(icd10_code2,''.'','''')||replace(icd10_code3,''.'','''')||replace(icd10_code4,''.'','''')||replace(icd10_code5,''.'',''''),''D681'')=1 or ';
      tmpstr:=tmpstr+'INSTR(replace(icd10_code1,''.'','''')||replace(icd10_code2,''.'','''')||replace(icd10_code3,''.'','''')||replace(icd10_code4,''.'','''')||replace(icd10_code5,''.'',''''),''D682'')=1 or ';
      tmpstr:=tmpstr+'INSTR(replace(icd10_code1,''.'','''')||replace(icd10_code2,''.'','''')||replace(icd10_code3,''.'','''')||replace(icd10_code4,''.'','''')||replace(icd10_code5,''.'',''''),''Q35'')=1 or ';
      tmpstr:=tmpstr+'INSTR(replace(icd10_code1,''.'','''')||replace(icd10_code2,''.'','''')||replace(icd10_code3,''.'','''')||replace(icd10_code4,''.'','''')||replace(icd10_code5,''.'',''''),''Q36'')=1 or ';
      tmpstr:=tmpstr+'INSTR(replace(icd10_code1,''.'','''')||replace(icd10_code2,''.'','''')||replace(icd10_code3,''.'','''')||replace(icd10_code4,''.'','''')||replace(icd10_code5,''.'',''''),''Q37'')=1 or ';
      tmpstr:=tmpstr+'replace(icd10_code1,''.'','''') between ''C00'' and ''C96'' or ';
      tmpstr:=tmpstr+'replace(icd10_code2,''.'','''') between ''C00'' and ''C96'' or ';
      tmpstr:=tmpstr+'replace(icd10_code3,''.'','''') between ''C00'' and ''C96'' or ';
      tmpstr:=tmpstr+'replace(icd10_code4,''.'','''') between ''C00'' and ''C96'' or ';
      tmpstr:=tmpstr+'replace(icd10_code5,''.'','''') between ''C00'' and ''C96'')) group by chr_no';
    end;
    85:
    begin
      //口腔黏膜檢查改為判斷年度
      tmpstr:=tmpstr+' select decode(trim(max(opd_date)),'''','''',max(opd_date)+20000) opd_date from opd_basic where chr_no=''$CHR_NO$'' and opd_date <> ''$OPD_DATE$'' and ins_seq_no=''$INS_SEQ_NO$'' ';
    end;
  end;
  Result:=tmpstr;
end;

function getLoadOrder(s_no :integer):string;
var
  tmpstr:string;
begin
  tmpstr:='';
  case (s_no) of
    1:
    begin
      tmpstr:=tmpstr+' Select ''O'',Seq_No,'''',FEE_CODE,FEE_NAME,QTY_NUM,UNIT_DESC,CIR_CODE,PATH_CODE,SELF_PAY_FLAG,URG_FLAG,MEMO_DESC,LAB_NO,exper_type,order_type,Order_Seq,exper_class,Order_status ' + #10#13;
      tmpstr:=tmpstr+' from DPD_ALL_ORDER where Fee_no=''$FEE_NO$'' and SO_FLAG=''$SO_FLAG$'' and ((DC_FLAG <>''Y'') or (DC_FLAG ='''')) and ((DEL_FLAG <>''Y'') or (DEL_FLAG ='''')) Order by Seq_No ';
    end;
    2:
    begin
      tmpstr:=tmpstr+' select NOTE1, NOTE2, H, FEE_CONTEN from opd_basic1 where opd_date=''$OPD_DATE$'' and fee_no=''$FEE_NO$'' ';
    end;
    3:
    begin
      tmpstr:=tmpstr+' Select decode(trim(SHEET_NO),trim(FEE_NO),''N'',''O''),Seq_No,'''',FEE_CODE,FEE_NAME,QTY_NUM,UNIT_DESC,CIR_CODE,PATH_CODE,ORDER_DAYS,TTL_QTY,SELF_PAY_FLAG,GRIND_FLAG,MEMO_DESC,(select FEE_TTL_QTY from orderitem_basic where fee_code=DPD_ALL_ORDER.fee_code), ' + #10#13;
      tmpstr:=tmpstr+' so_flag,Order_Seq,Order_Text from DPD_ALL_ORDER where Fee_no=''$FEE_NO$'' and SO_FLAG=''$SO_FLAG$'' and ((DC_FLAG <>''Y'') or (DC_FLAG ='''')) and ((DEL_FLAG <>''Y'') or (DEL_FLAG ='''')) Order by Seq_No ';
    end;
    4:
    begin
      //20140214排除病理項目資料學承 
      //tmpstr:=tmpstr+' Select decode(trim(SHEET_NO),trim(FEE_NO),''N'',''O''),Seq_No,'''',FEE_CODE,FEE_NAME,PART_CODE,QTY_NUM,SELF_PAY_FLAG,MEMO_DESC,so_flag,Order_Seq,Order_Text ' + #10#13;
      //tmpstr:=tmpstr+' from DPD_ALL_ORDER where Fee_no=''$FEE_NO$'' and SO_FLAG=''$SO_FLAG$'' and ((DC_FLAG <>''Y'') or (DC_FLAG ='''')) and ((DEL_FLAG <>''Y'') or (DEL_FLAG ='''')) Order by Seq_No ';
      tmpstr:=tmpstr+' Select decode(trim(SHEET_NO),trim(FEE_NO),''N'',''O''),Seq_No,'''',FEE_CODE,FEE_NAME,PART_CODE,QTY_NUM,SELF_PAY_FLAG,MEMO_DESC,so_flag,Order_Seq,Order_Text ' + #10#13;
      tmpstr:=tmpstr+' from DPD_ALL_ORDER where Fee_no=''$FEE_NO$'' and SO_FLAG=''$SO_FLAG$'' and ((DC_FLAG <>''Y'') or (DC_FLAG ='''')) and ((DEL_FLAG <>''Y'') or (DEL_FLAG ='''')) ';
      tmpstr:=tmpstr+' and order_type<>''PA'' Order by Seq_No';
      //tmpstr:=tmpstr+' and not exists(select sheet_no from opd_path where fee_no=''$FEE_NO$'' and sheet_no=dpd_all_order.sheet_no) Order by Seq_No ';
    end;
    5:
    begin
      tmpstr:=tmpstr+' select B.ICD9_CODE,B.CHN_SIMP_DESC,B.ENG_SIMP_DESC,B.slow_flag from OPD_BASIC1 A, ICD9_BASIC B where B.icd9_code=A.icd9_code1 and A.fee_no=''$FEE_NO$'' and A.opd_date=''$OPD_DATE$'' union all '  + #13;
      tmpstr:=tmpstr+' select B.ICD9_CODE,B.CHN_SIMP_DESC,B.ENG_SIMP_DESC,B.slow_flag from OPD_BASIC1 A, ICD9_BASIC B where B.icd9_code=A.icd9_code2 and A.fee_no=''$FEE_NO$'' and A.opd_date=''$OPD_DATE$'' union all '  + #13;
      tmpstr:=tmpstr+' select B.ICD9_CODE,B.CHN_SIMP_DESC,B.ENG_SIMP_DESC,B.slow_flag from OPD_BASIC1 A, ICD9_BASIC B where B.icd9_code=A.icd9_code3 and A.fee_no=''$FEE_NO$'' and A.opd_date=''$OPD_DATE$'' union all '  + #13;
      tmpstr:=tmpstr+' select B.ICD9_CODE,B.CHN_SIMP_DESC,B.ENG_SIMP_DESC,B.slow_flag from OPD_BASIC1 A, ICD9_BASIC B where B.icd9_code=A.icd9_code4 and A.fee_no=''$FEE_NO$'' and A.opd_date=''$OPD_DATE$'' union all '  + #13;
      tmpstr:=tmpstr+' select B.ICD9_CODE,B.CHN_SIMP_DESC,B.ENG_SIMP_DESC,B.slow_flag from OPD_BASIC1 A, ICD9_BASIC B where B.icd9_code=A.icd9_code5 and A.fee_no=''$FEE_NO$'' and A.opd_date=''$OPD_DATE$'' union all '  + #13;
      tmpstr:=tmpstr+' select B.ICD9_CODE,B.CHN_SIMP_DESC,B.ENG_SIMP_DESC,B.slow_flag from OPD_BASIC1 A, ICD9_BASIC B where B.icd9_code=A.icd9_code6 and A.fee_no=''$FEE_NO$'' and A.opd_date=''$OPD_DATE$'' union all '  + #13;
      tmpstr:=tmpstr+' select B.ICD9_CODE,B.CHN_SIMP_DESC,B.ENG_SIMP_DESC,B.slow_flag from OPD_BASIC1 A, ICD9_BASIC B where B.icd9_code=A.icd9_code7 and A.fee_no=''$FEE_NO$'' and A.opd_date=''$OPD_DATE$'' union all '  + #13;
      tmpstr:=tmpstr+' select B.ICD9_CODE,B.CHN_SIMP_DESC,B.ENG_SIMP_DESC,B.slow_flag from OPD_BASIC1 A, ICD9_BASIC B where B.icd9_code=A.icd9_code8 and A.fee_no=''$FEE_NO$'' and A.opd_date=''$OPD_DATE$'' union all '  + #13;
      tmpstr:=tmpstr+' select B.ICD9_CODE,B.CHN_SIMP_DESC,B.ENG_SIMP_DESC,B.slow_flag from OPD_BASIC1 A, ICD9_BASIC B where B.icd9_code=A.icd9_code9 and A.fee_no=''$FEE_NO$'' and A.opd_date=''$OPD_DATE$'' union all '  + #13;
      tmpstr:=tmpstr+' select B.ICD9_CODE,B.CHN_SIMP_DESC,B.ENG_SIMP_DESC,B.slow_flag from OPD_BASIC1 A, ICD9_BASIC B where B.icd9_code=A.icd9_code10 and A.fee_no=''$FEE_NO$'' and A.opd_date=''$OPD_DATE$'' '  + #13;
    end;
    6:
    begin
      tmpstr:=tmpstr+' select B.fee_no,(case when length(trim(B.opd_date)) = 6 then '+#13;
      tmpstr:=tmpstr+' concat(concat(concat(substr(B.opd_date,1,2),''/''),concat(substr(B.opd_date,3,2),''/'')),substr(B.opd_date,5,2)) else '+#13;
      tmpstr:=tmpstr+' concat(concat(concat(substr(B.opd_date,1,3),''/''),concat(substr(B.opd_date,4,2),''/'')),substr(B.opd_date,6,2)) end) opd_date,B.fee_code,B.position,C.fee_name,C.INS_FEECODE,A.INS_SEQ_NO,A.ins_seq_no2, '+#13;
      tmpstr:=tmpstr+' (Select trim(user_name) from user_basic where user_id=A.doc_code) doc_name ';
      tmpstr:=tmpstr+' from opd_basic A,opd_fee B,orderitem_basic C where C.ORDER_TYPE=''F'' and C.fee_code=B.fee_code and B.position is not null and B.del_flag = ''N'' and B.fee_no=A.fee_no '+#13;
      tmpstr:=tmpstr+' and A.opd_kind in($OPD_KIND$) and A.ins_seq_no like ''$INS_SEQ_NO$%'' and A.dept_code in ($DEPT_CODE$) and A.chr_no=''$CHR_NO$'' and A.opd_date between ''$OPD_DATE1$'' and ''$OPD_DATE2$'''+#13;
      tmpstr:=tmpstr+' union '+#13;
      tmpstr:=tmpstr+' select FEE_NO,(case when length(trim(opd_date)) = 6 then '+#13;
      tmpstr:=tmpstr+' concat(concat(concat(substr(opd_date,1,2),''/''),concat(substr(opd_date,3,2),''/'')),substr(opd_date,5,2)) else '+#13;
      tmpstr:=tmpstr+' concat(concat(concat(substr(opd_date,1,3),''/''),concat(substr(opd_date,4,2),''/'')),substr(opd_date,6,2)) end) opd_date,'' '','' '','' '','' '',ins_seq_no,ins_seq_no2, '+#13;
      tmpstr:=tmpstr+' (Select trim(user_name) from user_basic where user_id=doc_code) doc_name '+#13;
      tmpstr:=tmpstr+' from opd_basic '+#13;
      tmpstr:=tmpstr+' where not exists (select * from opd_fee where fee_no=opd_basic.fee_no and position is not null and del_flag = ''N'') '+#13;
      tmpstr:=tmpstr+' and opd_kind in($OPD_KIND$) and ins_seq_no like ''$INS_SEQ_NO$%'' and dept_code in ($DEPT_CODE$) and chr_no=''$CHR_NO$'' and opd_date between ''$OPD_DATE1$'' and ''$OPD_DATE2$'' '+#13;
      tmpstr:=tmpstr+' order by OPD_DATE desc '+#13;
    end;
    7:
    begin
      tmpstr:=tmpstr+' select trim(max(TO_NUMBER(opd_date))) max_date,trim(min(TO_NUMBER(opd_date))) min_date from opd_basic where opd_kind in($OPD_KIND$) and dept_code in ($DEPT_CODE$) and chr_no=''$CHR_NO$'' ';
    end;
    8:
    begin
      tmpstr:=tmpstr+' select sub_desc,obj_desc,plan_desc,sub_desc2,icd9_code1,icd9_code2,icd9_code3 from opd_basic where dept_code like ''$DEPT_CODE$%'' and chr_no=''$CHR_NO$'' '+#13;
      tmpstr:=tmpstr+' and opd_date=(select max(opd_date) from opd_basic where dept_code like ''$DEPT_CODE$%'' and chr_no=''$CHR_NO$'') ';
    end;
  end;
  Result:=tmpstr;
end;

function getDeleteSql(s_no :integer):string;
var
  tmpstr:string;
begin
  tmpstr:='';
  case (s_no) of
    1:
    begin
      tmpstr:=tmpstr+' Delete tbl_dpd_doc_sch where job_date=''$JOB_DATE$'' ';
    end;
    2:
    begin
      tmpstr:=tmpstr+' Delete tbl_dpd_doc_sch where job_date=''$JOB_DATE$'' and shift_no=''$SHIFT_NO$'' ';
    end;
    3:
    begin
      tmpstr:=tmpstr+' delete from  EPD_OFTEN where Item_No=''$ITEM_NO$'' AND FEE_CODE=''$FEE_CODE$'' AND DOC_CODE=''$DOC_CODE$'' ';
    end;
    4:
    begin
      tmpstr:=tmpstr+' delete from  chr_identities where fee_No=''$FEE_NO$'' ';
    end;
  end;
  Result:=tmpstr;
end;

function getInsertSql(s_no :integer):string;
var
  tmpstr:string;
begin
  tmpstr:='';
  case (s_no) of
    1:
    begin
      tmpstr:=tmpstr+' Insert into OPD_BASIC1(OPD_KIND,OPD_DATE,DEPT_CODE,SHIFT_NO,DEPT_ROOM,DOC_CODE,SEQ_NO,CHR_NO,FEE_NO,PAT_ID, ' + #13;
      tmpstr:=tmpstr+' INS_SEQ_NO,PROG_FLAG,ICD9_CODE1,ICD9_CODE2,ICD9_CODE3,ICD9_CODE4,ICD9_CODE5,ICD9_DESC1,ICD9_DESC2,ICD9_DESC3,ICD9_DESC4,ICD9_DESC5, ' + #13;
      tmpstr:=tmpstr+' DIAG_FLAG,PAT_NAME,DISC_CODE,MED_TYPE,CASE_TYPE,PART_CODE,PAY_TYPE,MED_DAYS,NOTE1,NOTE2,UPD_OPER,UPD_DATE,UPD_TIME,ORDER_FLAG, ' + #13;
      tmpstr:=tmpstr+' MED_NO,PRINT_FLAG,UPD_IP,EXE_DOC,INS_DOC,FEAT_DOC,FEE_CONTEN,VOTE_TYPE,H,PAIN_SCORE, ' + #13;
      tmpstr:=tmpstr+' ICD9_CODE6,ICD9_CODE7,ICD9_CODE8,ICD9_CODE9,ICD9_CODE10,ICD9_DESC6,ICD9_DESC7,ICD9_DESC8,ICD9_DESC9,ICD9_DESC10,ICD10_CODE1,ICD10_CODE2,ICD10_CODE3,ICD10_CODE4,ICD10_CODE5,first_date,first_ins_seq_no,hosp_in) ' + #13;
      tmpstr:=tmpstr+' Values(''$OPD_KIND$'',''$OPD_DATE$'',''$DEPT_CODE$'',''$SHIFT_NO$'',''$DEPT_ROOM$'',''$DOC_CODE$'',''$SEQ_NO$'',''$CHR_NO$'',''$FEE_NO$'',''$PAT_ID$'',''$INS_SEQ_NO$'', ' + #13;
      tmpstr:=tmpstr+' ''$PROG_FLAG$'',''$ICD9_CODE1$'',''$ICD9_CODE2$'',''$ICD9_CODE3$'',''$ICD9_CODE4$'',''$ICD9_CODE5$'',''$ICD9_DESC1$'',''$ICD9_DESC2$'',''$ICD9_DESC3$'',''$ICD9_DESC4$'',''$ICD9_DESC5$'', ' + #13;
      tmpstr:=tmpstr+' ''$DIAG_FLAG$'',''$PAT_NAME$'',''$DISC_CODE$'',''$MED_TYPE$'',''$CASE_TYPE$'',''$PART_CODE$'',''$PAY_TYPE$'',''$MED_DAYS$'',''$NOTE1$'',''$NOTE2$'',''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'',''$ORDER_FLAG$'', ' + #13;
      tmpstr:=tmpstr+' ''$MED_NO$'',''$PRINT_FLAG$'',''$UPD_IP$'',''$EXE_DOC$'',''$INS_DOC$'',''$FEAT_DOC$'',''$FEE_CONTEN$'',''$VOTE_TYPE$'',''$H$'',''$PAIN_SCORE$'', ' + #13;
      tmpstr:=tmpstr+' ''$ICD9_CODE6$'',''$ICD9_CODE7$'',''$ICD9_CODE8$'',''$ICD9_CODE9$'',''$ICD9_CODE10$'',''$ICD9_DESC6$'',''$ICD9_DESC7$'',''$ICD9_DESC8$'',''$ICD9_DESC9$'',''$ICD9_DESC10$'',';
      tmpstr:=tmpstr+' ''$ICD10_CODE1$'',''$ICD10_CODE2$'',''$ICD10_CODE3$'',''$ICD10_CODE4$'',''$ICD10_CODE5$'',''$FIRST_DATE$'',''$FIRST_INS_SEQ_NO$'',''$HOSP_IN$'') ' ;
    end;
    2:
    begin  
      tmpstr:=tmpstr+' Insert into dpd_all_order(SHEET_NO,SEQ,ORDER_TEXT,SEQ_NO,FEE_NO,ORDER_DATE,ORDER_TIME,SO_FLAG,FEE_CODE,FEE_NAME,ORDER_DOC,EXEC_DOC,ORDER_TYPE,ORDER_DAYS, ' + #10#13;
      tmpstr:=tmpstr+' QTY_NUM,UNIT_DESC,CIR_CODE,PATH_CODE,SELF_PAY_FLAG,URG_FLAG,DC_FLAG,UPD_OPER,UPD_DATE,UPD_TIME,LAB_NO,MEMO_DESC,PROG_FLAG,PRINT_FLAG, ' + #10#13;
      tmpstr:=tmpstr+' ARRG_FLAG,DEL_FLAG,Exper_type,Exper_class,Part_code,GRIND_FLAG,PAY_FLAG,TTL_QTY,ORDER_SEQ,TRANS_FLAG,PRINT_FLAG_2,ORDER_STATUS) '  + #10#13;
      tmpstr:=tmpstr+' Values(''$SHEET_NO$'',''$SEQ$'',''$ORDER_TEXT$'',''$SEQ_NO$'',''$FEE_NO$'',''$ORDER_DATE$'',''$ORDER_TIME$'',''$SO_FLAG$'',''$FEE_CODE$'',''$FEE_NAME$'',''$ORDER_DOC$'',''$EXEC_DOC$'',''$ORDER_TYPE$'',''$ORDER_DAYS$'', ' + #10#13;
      tmpstr:=tmpstr+' ''$QTY_NUM$'',''$UNIT_DESC$'',''$CIR_CODE$'',''$PATH_CODE$'',''$SELF_PAY_FLAG$'',''$URG_FLAG$'',''$DC_FLAG$'',''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'',''$LAB_NO$'',''$MEMO_DESC$'',''$PROG_FLAG$'',''$PRINT_FLAG$'', ' + #10#13;
      tmpstr:=tmpstr+' ''$ARRG_FLAG$'',''$DEL_FLAG$'',''$Exper_type$'',''$Exper_class$'',''$Part_code$'',''$GRIND_FLAG$'',''$PAY_FLAG$'',''$TTL_QTY$'',''$ORDER_SEQ$'', '  + #10#13;
      tmpstr:=tmpstr+' nvl((select trans_flag from dpd_all_order where seq_no=''$SEQ_NO_OLD$'' and fee_code=''$FEE_CODE$'' and fee_no=''$FEE_NO$''),''N''),' + #10#13;
      tmpstr:=tmpstr+' nvl((select PRINT_FLAG_2 from dpd_all_order where seq_no=''$SEQ_NO_OLD$'' and fee_code=''$FEE_CODE$'' and fee_no=''$FEE_NO$''),''N''),' + #10#13;
      tmpstr:=tmpstr+' nvl((select ORDER_STATUS from dpd_all_order where seq_no=''$SEQ_NO_OLD$'' and fee_code=''$FEE_CODE$'' and fee_no=''$FEE_NO$''),''N'') )' + #10#13;
    end;
    3:
    begin
      tmpstr:=tmpstr+' insert into epd_so1(DEPT_CODE,DOC_CODE,ITEM_NO,CLASS_CODE,CLASS_DESC) ' + #10#13;
      tmpstr:=tmpstr+' values(''$DEPT_CODE$'',''$DOC_CODE$'',''$ITEM_NO$'',''$CLASS_CODE$'',''$CLASS_DESC$'') ';
    end;
    4:
    begin
      tmpstr:=tmpstr+' insert into epd_often(DEPT_CODE,DOC_CODE,ITEM_NO,CLASS_CODE,FEE_CODE,FEE_DESC,UPD_OPER,UPD_DATE,UPD_TIME,SEQ_NO) '+ #10#13;
      tmpstr:=tmpstr+' values(''$DEPT_CODE$'',''$DOC_CODE$'',''$ITEM_NO$'',''$CLASS_CODE$'',''$FEE_CODE$'',''$FEE_DESC$'',''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'',''$SEQ_NO$'') ';
    end;
    5:
    begin
      tmpstr:=tmpstr+' insert into epd_often(DEPT_CODE,DOC_CODE,ITEM_NO,CLASS_CODE,FEE_CODE,FEE_DESC,UNIT_QTY,CIR_CODE,PATH_CODE,MED_DAYS,GRIND_FLAG,TTL_QTY,UPD_OPER,UPD_DATE,UPD_TIME,SEQ_NO) ' + #13;
      tmpstr:=tmpstr+' values(''$DEPT_CODE$'',''$DOC_CODE$'',''$ITEM_NO$'',''$CLASS_CODE$'',''$FEE_CODE$'',''$FEE_DESC$'',''$UNIT_QTY$'',''$CIR_CODE$'',''$PATH_CODE$'',''$MED_DAYS$'',''$GRIND_FLAG$'',''$TTL_QTY$'',''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'',''$SEQ_NO$'') ';
    end;
    6:
    begin
      tmpstr:=tmpstr+' insert into tbl_sohp_record(FEE_NO,SEQ_NO,S,O,P,H) ';
      tmpstr:=tmpstr+' values( ''$FEE_NO$'',''$SEQ_NO$'',''$S$'',''$O$'',''$P$'',''$H$'' )';
    end;
    7:
    begin
      tmpstr:=tmpstr+' insert into tbl_dental_idl(OPD_DATE,FEE_NO,CHR_NO,IDL_DATE,IDL_FEE_CODE,IDL_POSITION,INS_SEQ_NO,UPD_OPER,UPD_DATE,UPD_TIME,IDL_FEE_NO,DEL_FLAG) '+#13;
      tmpstr:=tmpstr+' values (''$OPD_DATE$'',''$FEE_NO$'',''$CHR_NO$'',''$IDL_DATE$'',''$IDL_FEE_CODE$'',''$IDL_POSITION$'',''$INS_SEQ_NO$'',''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'',''$IDL_FEE_NO$'',''$DEL_FLAG$'' ) ';
    end;
    8:
    begin
      tmpstr:=tmpstr+' insert into ic_med_warning_log (SOURCE_KIND,WARNING_KIND,CHR_NO,SEX_TYPE,AGE,FEE_NO,DEPT_CODE,OPD_DATE1,INS_MED_CODE1,PER_QTY1,CIR_CODE1,MED_DAYS1,PATH_CODE1,SELF_PAY_FLAG,DOC_CODE1, '+#13;
      tmpstr:=tmpstr+' OPD_DATE2,INS_MED_CODE2,PER_QTY2,CIR_CODE2,MED_DAYS2,PATH_CODE2,HOSP_CODE2,DDI_SEQ,PREG_CATE,PREG_SEQ,DR_ACTION,ALERT_DATE,ALERT_TIME,UPD_DATE,UPD_TIME,UPD_OPER) '+#13;
      tmpstr:=tmpstr+' values(''$SOURCE_KIND$'',''$WARNING_KIND$'',''$CHR_NO$'',''$SEX_TYPE$'',''$AGE$'',''$FEE_NO$'',''$DEPT_CODE$'',''$OPD_DATE1$'',''$INS_MED_CODE1$'',''$PER_QTY1$'',''$CIR_CODE1$'',''$MED_DAYS1$'',''$PATH_CODE1$'',''$SELF_PAY_FLAG$'',''$DOC_CODE1$'',''$OPD_DATE2$'', '+#13;
      tmpstr:=tmpstr+' ''$INS_MED_CODE2$'',''$PER_QTY2$'',''$CIR_CODE2$'',''$MED_DAYS2$'',''$PATH_CODE2$'',''$HOSP_CODE2$'',''$DDI_SEQ$'',''$PREG_CATE$'',''$PREG_SEQ$'',''$DR_ACTION$'',''$ALERT_DATE$'',''$ALERT_TIME$'',''$UPD_DATE$'',''$UPD_TIME$'',''$UPD_OPER$'') ';
    end;
    9:
    begin
      tmpstr:=tmpstr+' insert into IC_Preg_Prev(FEE_NO,ID_NO,Prevent_kind,Prevent_mark,OPD_DATE,hosp_code,preg_code,upd_oper,upd_date,upd_time) '+#13;
      tmpstr:=tmpstr+' values(''$FEE_NO$'',''$ID_NO$'',''$Prevent_kind$'',''$Prevent_mark$'',''$OPD_DATE$'',''$hosp_code$'',''$preg_code$'',''$upd_oper$'',''$upd_date$'',''$upd_time$'') ';
    end;
    10:
    begin
      tmpstr:=tmpstr+' insert into IC_InoculateData(FEE_NO,OPD_DATE,Inoculate_kind,Inoculate_date,HOSP_CODE,Inoculate_no,upd_oper,upd_date,upd_time) '+#13;
      tmpstr:=tmpstr+' values(''$FEE_NO$'',''$OPD_DATE$'',''$Inoculate_kind$'',''$Inoculate_date$'',''$HOSP_CODE$'',''$Inoculate_no$'',''$upd_oper$'',''$upd_date$'',''$upd_time$'') ';
    end;
    11:
    begin
      tmpstr:=tmpstr+' insert into IC_allergy (FEE_NO,ID_NO,OPD_DATE,CHR_NO,allergy1,allergy2,allergy3,UPD_OPER,UPD_DATE,UPD_TIME) '+#13;
      tmpstr:=tmpstr+' values(''$FEE_NO$'',''$ID_NO$'',''$OPD_DATE$'',''$CHR_NO$'',''$allergy1$'',''$allergy2$'',''$allergy3$'',''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'') ';
    end;
    12:
    begin
      tmpstr:=tmpstr+' insert into IC_PRESCRIPTION(FEE_NO,OPD_DATE,ORDER_KIND,INS_FEE_CODE,PART_CODE,PATH_CODE,MED_DAYS,TTL_QTY,MARK_CODE,CHR_NO) '+#13;
      tmpstr:=tmpstr+' values(''$FEE_NO$'',''$OPD_DATE$'',''$ORDER_KIND$'',''$INS_FEE_CODE$'',''$PART_CODE$'',''$PATH_CODE$'',''$MED_DAYS$'',''$TTL_QTY$'',''$MARK_CODE$'',''$CHR_NO$'') ';
    end;
    13:
    begin
      tmpstr:=tmpstr+' insert into IC_CRITICALILLNESS(FEE_NO,CRITICAL_CODE,BEGIN_DATE,END_DATE,CHR_NO) '+#13;
      tmpstr:=tmpstr+' values(''$FEE_NO$'',''$CRITICAL_CODE$'',''$BEGIN_DATE$'',''$END_DATE$'',''$CHR_NO$'') ';
    end;
    14:
    begin
      tmpstr:=tmpstr+' insert into IC_CURE_RECORD (fee_no,id_no,OPD_DATE,A_CODE1,A_CODE2,A_CODE3,A_CODE4,A_CODE5,A_CODE6,upd_oper,upd_date,upd_time) '+#13;
      tmpstr:=tmpstr+' values(''$FEE_NO$'',''$ID_NO$'',''$OPD_DATE$'',''$A_CODE1$'',''$A_CODE2$'',''$A_CODE3$'',''$A_CODE4$'',''$A_CODE5$'',''$A_CODE6$'',''$upd_oper$'',''$upd_date$'',''$upd_time$'') ';
    end;
    15:
    begin
      tmpstr:=tmpstr+' insert into ICTREATMENT_RECORD (FEE_NO,TREATITEM,BABYTREAT,OPD_DATE,CARD_COMP,IC_SEQ_NO,HOSP_ID,OPD_FEE_AMT,OPD_PART_AMT, '+#13;
      tmpstr:=tmpstr+' IPD_FEE_AMT,IPD_PART_AMT_MORE,IPD_PART_AMT_LESS,UPD_OPER,UPD_DATE,UPD_TIME) ';
      tmpstr:=tmpstr+' values(''$FEE_NO$'',''$TREATITEM$'',''$BABYTREAT$'',''$OPD_DATE$'',''$CARD_COMP$'',''$IC_SEQ_NO$'',''$HOSP_ID$'',''$OPD_FEE_AMT$'',''$OPD_PART_AMT$'', '+#13;
      tmpstr:=tmpstr+' ''$IPD_FEE_AMT$'',''$IPD_PART_AMT_MORE$'',''$IPD_PART_AMT_LESS$'',''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'') ';
    end;
    16:
    begin
      tmpstr:=tmpstr+' insert into IC_ERROR_LOG(ERROR_KIND,OPD_DATE,OPD_TIME,CHR_NO,FEE_NO,ERROR_CODE,DOC_CODE,upd_oper,upd_date,upd_time) '+#13;
      tmpstr:=tmpstr+' values(''$ERROR_KIND$'',''$OPD_DATE$'',''$OPD_TIME$'',''$CHR_NO$'',''$FEE_NO$'',''$ERROR_CODE$'',''$DOC_CODE$'',''$upd_oper$'',''$upd_date$'',''$upd_time$'') ';
    end;
    17:
    begin
      tmpstr:=tmpstr+' insert into ic_treat_dtl (SOUR_TYPE,FEE_NO,IC_DATE,IC_TIME,TREATITEM,CARD_NO,CHR_NO,ID_NO,FEE_TYPE,FEE_CODE,MED_LOCATION,MED_METHOD,MED_DAYS,MED_TTL_QTY,MED_INS_SEQ_NO,UPD_OPER,UPD_DATE,UPD_TIME,SEQ_NO,OK_FLAG,HOS_CODE,signature) '+#13;
      tmpstr:=tmpstr+' values(''$SOUR_TYPE$'',''$FEE_NO$'',''$IC_DATE$'',''$IC_TIME$'',''$TREATITEM$'',''$CARD_NO$'',''$CHR_NO$'',''$ID_NO$'',''$FEE_TYPE$'',''$FEE_CODE$'',''$MED_LOCATION$'',''$MED_METHOD$'',''$MED_DAYS$'',''$MED_TTL_QTY$'',''$MED_INS_SEQ_NO$'' '+#13;
      tmpstr:=tmpstr+' ,''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'',''$SEQ_NO$'',''$OK_FLAG$'',''$HOS_CODE$'',''$signature$'') ';
    end;
    18:
    begin
      tmpstr:=tmpstr+' insert into ic_treat_temp(sour_type,fee_no,chr_no,ic_date,ic_time,del_flag,card_comp,card_no,sam_code, '+#13;
      tmpstr:=tmpstr+' treatitem,ic_seq_no,signature01,signature02,sche_flag,err_flow_code,error_flag, '+#13;
      tmpstr:=tmpstr+' error_code,upload_flag,ok_flag,upload_datetime,babytreat,babyseq,parent_chr_no, '+#13;
      tmpstr:=tmpstr+' ttl_amt,part_amt,part_amt1,upd_oper,upd_date,upd_time,outer_flag,baby_birth, '+#13;
      tmpstr:=tmpstr+' baby_birth_num,id_no,cncl_flag,diag_seq,birthday) '+#13;
      tmpstr:=tmpstr+' values(''$sour_type$'',''$fee_no$'',''$chr_no$'',''$ic_date$'',''$ic_time$'',''$del_flag$'',''$card_comp$'',''$card_no$'', '+#13;
      tmpstr:=tmpstr+' ''$sam_code$'',''$treatitem$'',''$ic_seq_no$'',''$signature01$'',''$signature02$'',''$sche_flag$'',''$err_flow_code$'', '+#13;
      tmpstr:=tmpstr+' ''$error_flag$'',''$error_code$'',''$upload_flag$'',''$ok_flag$'',''$upload_datetime$'',''$babytreat$'',''$babyseq$'', '+#13;
      tmpstr:=tmpstr+' ''$parent_chr_no$'',''$ttl_amt$'',''$part_amt$'',''$part_amt1$'',''$upd_oper$'',''$upd_date$'',''$upd_time$'', '+#13;
      tmpstr:=tmpstr+' ''$outer_flag$'',''$baby_birth$'',''$baby_birth_num$'',''$id_no$'',''$cncl_flag$'',''$diag_seq$'',''$birthday$'') '+#13;
    end;
    19:
    begin
      tmpstr:=tmpstr+' insert into DPD_CHECKIN (OPD_KIND,OPD_DATE,DEPT_CODE,SHIFT_NO,DEPT_ROOM,DOC_CODE,SEQ_NO,FEE_NO,CHKIN_TIME) '+#13;
      tmpstr:=tmpstr+' values (''$OPD_KIND$'',''$OPD_DATE$'',''$DEPT_CODE$'',''$SHIFT_NO$'',''$DEPT_ROOM$'',''$DOC_CODE$'',''$SEQ_NO$'',''$FEE_NO$'',''$CHKIN_TIME$'') '+#13;
    end;
    20:
    begin
      tmpstr:=tmpstr+' insert into tbl_dental_appointment(APP_NO,APP_DOC_CODE,APP_DATE,APP_TIME,TREAT_TIME,APP_DEPT_CODE,SHIFT_NO,CHR_NO,UPD_OPER,UPD_DATE,UPD_TIME,REMARK) '+#13;
      tmpstr:=tmpstr+' values(''$APP_NO$'',''$APP_DOC_CODE$'',''$APP_DATE$'',''$APP_TIME$'',''$TREAT_TIME$'',''$APP_DEPT_CODE$'',''$SHIFT_NO$'',''$CHR_NO$'',''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'',''$remark$'') ';
    end;
    21:
    begin
      tmpstr:=tmpstr+' Insert into tbl_dpd_doc_sch '+#13;
      tmpstr:=tmpstr+' select DOC_CODE,''$CJOB_DATE$'',shift_no,DEPT_CODE,''N'',''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'' ' + #13;
      tmpstr:=tmpstr+' from tbl_dpd_doc_sch where job_date=''$SJOB_DATE$'' and del_flag=''N'' ';
    end;
    22:
    begin
      tmpstr:=tmpstr+' Insert into tbl_dpd_doc_sch '+#13;
      tmpstr:=tmpstr+' select DOC_CODE,''$CJOB_DATE$'',''$SHIFT_NO$'',DEPT_CODE,''N'',''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'' ' + #13;
      tmpstr:=tmpstr+' from tbl_dpd_doc_sch where job_date=''$SJOB_DATE$'' and shift_no=''$SSHIFT_NO$'' and del_flag=''N'' ';
    end;
    23:
    begin
      tmpstr:=tmpstr+' insert into tbl_dpd_doc_sch(DOC_CODE,JOB_DATE,SHIFT_NO,DEPT_CODE,DEL_FLAG,UPD_OPER,UPD_DATE,UPD_TIME) '+#13;
      tmpstr:=tmpstr+' values(''$DOC_CODE$'',''$JOB_DATE$'',''$SHIFT_NO$'',''$DEPT_CODE$'',''$DEL_FLAG$'',''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'')';
    end;
    24:
    begin
      tmpstr:=tmpstr+' INSERT INTO first_treatment_western (CHR_NO,FIRST_DATE,UNMEASURE_H_W,HIGH,WEIGHT,TEMPERATURE,SYSTOLIC_PRESSURE,DIASTOLIC_PRESSURE,SPHYGMUS,PREGNANCY,DATA_SOURCE, '+#13;
      tmpstr:=tmpstr+' DATA_SOURCE_OTHER_DESC,YIELD,YIELD_WEEK,BORN_WEIGHT,ADMISSION_FLAG,ADMISSION_TIMES,ADMISSION_HOSP,MEDICINE_FLAG,MEDICINE_HB_Y,MEDICINE_HB_MED,MEDICINE_HB_DESC, '+#13;
      tmpstr:=tmpstr+' MEDICINE_H_Y,MEDICINE_H_MED,MEDICINE_H_DESC,MEDICINE_S_Y,MEDICINE_S_MED,MEDICINE_S_DESC,MEDICINE_B_Y,MEDICINE_B_MED,MEDICINE_B_DESC,MEDICINE_OTHER_1,MEDICINE_OTHER_2, '+#13;
      tmpstr:=tmpstr+' MEDICINE_OTHER_3,MEDICINE_OTHER_DESC,SURGERY_FLAG,SURGERY_DESC,ALG_MED,ALG_MED_DESC,ALG_FOOD,ALG_FOOD_DESC,ALG_BLOOD,ALG_BLOOD_DESC,TRAVEL_HISTORY,TRAVEL_HISTORY_DESC, '+#13;
      tmpstr:=tmpstr+' FAMILY_HISTORY_1,FAMILY_HISTORY_2,FAMILY_HISTORY_3,FAMILY_HISTORY_4,FAMILY_HISTORY_5,FAMILY_HISTORY_6,FAMILY_HISTORY_7,FAMILY_HISTORY_8,FAMILY_HISTORY_9,FAMILY_HISTORY_10, '+#13;
      tmpstr:=tmpstr+' FAMILY_HISTORY_11,FAMILY_HISTORY_12,PROFESSIONAL,AREA_F,AREA_S,AREA_OTHER,LIVE,SUPPORT,SUPPORT_M,CARE_MASTER,CARE_MASTER_DESC,ASSESSMENT_P_1,ASSESSMENT_P_2, '+#13;
      tmpstr:=tmpstr+' ASSESSMENT_P_3,ASSESSMENT_P_4,ASSESSMENT_P_5,ASSESSMENT_P_6,ASSESSMENT_P_7,ASSESSMENT_P_DESC,ASSESSMENT_N_1,ASSESSMENT_N_2,ASSESSMENT_N_3,ASSESSMENT_N_4,CONSCIOUSNESS, '+#13;
      tmpstr:=tmpstr+' CONJUNTIVA,SCLERA,THROAT,TONSILS_DESC,NODE,NODE_DESC,THYROID,THYROID_DESC,CHEST,CHEST_DESC,HEART_R,HEART_R_DESC,HEART_M,HEART_M_DESC,ABD,ABD_R_DESC,ABD_T_DESC, '+#13;
      tmpstr:=tmpstr+' BOWEL_SOUND,HEPATOMEGALY_DESC,SPLENOMEGALY_DESC,EXTREMITIES,EXTRE_C,EXTRE_E,EXTRE_P,NEUROLOGICAL_SIGN,AN_NEUROLOGICAL_SIGN,UPD_OPER,UPD_DATE,UPD_TIME,ADMISSION_REASON, '+#13;
      tmpstr:=tmpstr+' ABD_SOFT,ABD_FLAT,ABD_DISTENSION,ABD_RIGID,ABD_TENDERNESS,REH_FLAG,REH_1,REH_2,REH_3,REH_4,REH_5,REH_6,CONSCIOUSNESS_DESC,PRINT_FLAG,SMOKE_FLAG,ARECA_FLAG, '+#13;
      tmpstr:=tmpstr+' BC_HEPATITIS_FLAG,HEALTH_OTHER_DESC,PASSIVE_SMOKE_FLG,PASSIVE_SMOKE_1,PASSIVE_SMOKE_2,PASSIVE_SMOKE_3,PASSIVE_SMOKE_DESC,ALCOHOL_FLAG) '+#13;
      tmpstr:=tmpstr+' VALUES (''$CHR_NO$'',''$FIRST_DATE$'',''$UNMEASURE_H_W$'',''$HIGH$'',''$WEIGHT$'',''$TEMPERATURE$'',''$SYSTOLIC_PRESSURE$'',''$DIASTOLIC_PRESSURE$'',''$SPHYGMUS$'',''$PREGNANCY$'',''$DATA_SOURCE$'', '+#13;
      tmpstr:=tmpstr+' ''$DATA_SOURCE_OTHER_DESC$'',''$YIELD$'',''$YIELD_WEEK$'',''$BORN_WEIGHT$'',''$ADMISSION_FLAG$'',''$ADMISSION_TIMES$'',''$ADMISSION_HOSP$'',''$MEDICINE_FLAG$'',''$MEDICINE_HB_Y$'',''$MEDICINE_HB_MED$'',''$MEDICINE_HB_DESC$'', '+#13;
      tmpstr:=tmpstr+' ''$MEDICINE_H_Y$'',''$MEDICINE_H_MED$'',''$MEDICINE_H_DESC$'',''$MEDICINE_S_Y$'',''$MEDICINE_S_MED$'',''$MEDICINE_S_DESC$'',''$MEDICINE_B_Y$'',''$MEDICINE_B_MED$'',''$MEDICINE_B_DESC$'',''$MEDICINE_OTHER_1$'',''$MEDICINE_OTHER_2$'', '+#13;
      tmpstr:=tmpstr+' ''$MEDICINE_OTHER_3$'',''$MEDICINE_OTHER_DESC$'',''$SURGERY_FLAG$'',''$SURGERY_DESC$'',''$ALG_MED$'',''$ALG_MED_DESC$'',''$ALG_FOOD$'',''$ALG_FOOD_DESC$'',''$ALG_BLOOD$'',''$ALG_BLOOD_DESC$'',''$TRAVEL_HISTORY$'',''$TRAVEL_HISTORY_DESC$'', '+#13;
      tmpstr:=tmpstr+' ''$FAMILY_HISTORY_1$'',''$FAMILY_HISTORY_2$'',''$FAMILY_HISTORY_3$'',''$FAMILY_HISTORY_4$'',''$FAMILY_HISTORY_5$'',''$FAMILY_HISTORY_6$'',''$FAMILY_HISTORY_7$'',''$FAMILY_HISTORY_8$'',''$FAMILY_HISTORY_9$'',''$FAMILY_HISTORY_10$'', '+#13;
      tmpstr:=tmpstr+' ''$FAMILY_HISTORY_11$'',''$FAMILY_HISTORY_12$'',''$PROFESSIONAL$'',''$AREA_F$'',''$AREA_S$'',''$AREA_OTHER$'',''$LIVE$'',''$SUPPORT$'',''$SUPPORT_M$'',''$CARE_MASTER$'',''$CARE_MASTER_DESC$'',''$ASSESSMENT_P_1$'',''$ASSESSMENT_P_2$'', '+#13;
      tmpstr:=tmpstr+' ''$ASSESSMENT_P_3$'',''$ASSESSMENT_P_4$'',''$ASSESSMENT_P_5$'',''$ASSESSMENT_P_6$'',''$ASSESSMENT_P_7$'',''$ASSESSMENT_P_DESC$'',''$ASSESSMENT_N_1$'',''$ASSESSMENT_N_2$'',''$ASSESSMENT_N_3$'',''$ASSESSMENT_N_4$'',''$CONSCIOUSNESS$'', '+#13;
      tmpstr:=tmpstr+' ''$CONJUNTIVA$'',''$SCLERA$'',''$THROAT$'',''$TONSILS_DESC$'',''$NODE$'',''$NODE_DESC$'',''$THYROID$'',''$THYROID_DESC$'',''$CHEST$'',''$CHEST_DESC$'',''$HEART_R$'',''$HEART_R_DESC$'',''$HEART_M$'',''$HEART_M_DESC$'',''$ABD$'',''$ABD_R_DESC$'', '+#13;
      tmpstr:=tmpstr+' ''$ABD_T_DESC$'',''$BOWEL_SOUND$'',''$HEPATOMEGALY_DESC$'',''$SPLENOMEGALY_DESC$'',''$EXTREMITIES$'',''$EXTRE_C$'',''$EXTRE_E$'',''$EXTRE_P$'',''$NEUROLOGICAL_SIGN$'',''$AN_NEUROLOGICAL_SIGN$'',''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'', '+#13;
      tmpstr:=tmpstr+' ''$ADMISSION_REASON$'',''$ABD_SOFT$'',''$ABD_FLAT$'',''$ABD_DISTENSION$'',''$ABD_RIGID$'',''$ABD_TENDERNESS$'',''$REH_FLAG$'',''$REH_1$'',''$REH_2$'',''$REH_3$'',''$REH_4$'',''$REH_5$'',''$REH_6$'',''$CONSCIOUSNESS_DESC$'',''$PRINT_FLAG$'',''$SMOKE_FLAG$'', '+#13;
      tmpstr:=tmpstr+' ''$ARECA_FLAG$'',''$BC_HEPATITIS_FLAG$'',''$HEALTH_OTHER_DESC$'',''$PASSIVE_SMOKE_FLG$'',''$PASSIVE_SMOKE_1$'',''$PASSIVE_SMOKE_2$'',''$PASSIVE_SMOKE_3$'',''$PASSIVE_SMOKE_DESC$'',''$ALCOHOL_FLAG$'') ';
    end;
    25:
    begin
      tmpstr:=tmpstr+' Insert Into Use_Opd_log(Fee_no,Source_type,Computer_name,Computer_ip,Upd_oper,Upd_date,Upd_time,Version,Column1) '+#13;
      tmpstr:=tmpstr+' values(''$Fee_no$'',''$Source_type$'',''$Computer_name$'',''$Computer_ip$'',''$Upd_oper$'',''$Upd_date$'',''$Upd_time$'',''$Version$'',''$Column1$'') ';
    end;
    26:
    begin
      tmpstr:=tmpstr+' INSERT INTO medical_certificate (ORDER_KIND,SOUR_KIND,PAT_NAME,CHR_NO,SEX_TYPE,ID_NO,BIRTH_DATE,BIRTH_PLACE,OPD_DATE,DEPT_DESC,WORKS,DIAGNOSIS,TREATMENT,DOC_CODE,OPER_ID,OPER_DATE,OPER_TIME)' +#13;
      tmpstr:=tmpstr+' VALUES(''$ORDER_KIND$'',''$SOUR_KIND$'',''$PAT_NAME$'',''$CHR_NO$'',''$SEX_TYPE$'',''$ID_NO$'',''$BIRTH_DATE$'',''$BIRTH_PLACE$'',''$OPD_DATE$'',''$DEPT_DESC$'',''$WORKS$'',''$DIAGNOSIS$'',''$TREATMENT$'',''$DOC_CODE$'',''$OPER_ID$'',''$OPER_DATE$'',''$OPER_TIME$'')';
    end;
    27:
    begin
      tmpstr:=tmpstr+' INSERT INTO chr_identities (chr_no,Fee_no,low_income,disabled,aborigine,UPD_OPER,UPD_DATE,UPD_TIME,CHR_AREA)' +#13;
      tmpstr:=tmpstr+' VALUES(''$CHR_NO$'',''$FEE_NO$'',''$LOW_INCOME$'',''$disabled$'',''$aborigine$'',''$UPD_OPER$'',''$UPD_DATE$'',''$UPD_TIME$'',''$CHR_AREA$'')';
    end;
  end;
  Result:=tmpstr;
end;

function getUpdSql(s_no :integer):string;
var
  tmpstr:string;
begin
  tmpstr:='';
  case (s_no) of
    1:
    begin
      tmpstr:=tmpstr+' Update OPD_BASIC1 set MED_TYPE=''$MED_TYPE$'',CASE_TYPE=''$CASE_TYPE$'',PART_CODE=''$PART_CODE$'',PAY_TYPE=''$PAY_TYPE$'',MED_DAYS=''$MED_DAYS$'',Pat_id=''$PAT_ID$'',MED_NO=''$MED_NO$'',INS_SEQ_NO=''$INS_SEQ_NO$'', ' ;
      tmpstr:=tmpstr+' PRINT_FLAG=(nvl(print_flag,''0'')+1),ICD9_CODE1=''$ICD9_CODE1$'',ICD9_CODE2=''$ICD9_CODE2$'',ICD9_CODE3=''$ICD9_CODE3$'',ICD9_CODE4=''$ICD9_CODE4$'',ICD9_CODE5=''$ICD9_CODE5$'',' ;
      tmpstr:=tmpstr+' DIAG_FLAG=''$DIAG_FLAG$'',ICD9_CODE6=''$ICD9_CODE6$'',ICD9_CODE7=''$ICD9_CODE7$'',ICD9_CODE8=''$ICD9_CODE8$'',ICD9_CODE9=''$ICD9_CODE9$'',ICD9_CODE10=''$ICD9_CODE10$'',' ;
      tmpstr:=tmpstr+' ICD9_DESC1=''$ICD9_DESC1$'',ICD9_DESC2=''$ICD9_DESC2$'',ICD9_DESC3=''$ICD9_DESC3$'',ICD9_DESC4=''$ICD9_DESC4$'',ICD9_DESC5=''$ICD9_DESC5$'',' ;
      tmpstr:=tmpstr+' ICD9_DESC6=''$ICD9_DESC6$'',ICD9_DESC7=''$ICD9_DESC7$'',ICD9_DESC8=''$ICD9_DESC8$'',ICD9_DESC9=''$ICD9_DESC9$'',ICD9_DESC10=''$ICD9_DESC10$'',' ;
      tmpstr:=tmpstr+' ICD10_CODE1=''$ICD10_CODE1$'',ICD10_CODE2=''$ICD10_CODE2$'',ICD10_CODE3=''$ICD10_CODE3$'',ICD10_CODE4=''$ICD10_CODE4$'',ICD10_CODE5=''$ICD10_CODE5$'',';
      tmpstr:=tmpstr+' NOTE1=''$NOTE1$'',NOTE2=''$NOTE2$'',H=''$H$'',FEE_CONTEN=''$FEE_CONTEN$'',PAIN_SCORE=''$PAIN_SCORE$'',UPD_OPER=''$UPD_OPER$'',UPD_DATE=''$UPD_DATE$'',UPD_TIME=''$UPD_TIME$'',ORDER_FLAG=''$ORDER_FLAG$'', ' ;
      tmpstr:=tmpstr+' INS_DOC=''$INS_DOC$'',FEAT_DOC=''$FEAT_DOC$'',VOTE_TYPE=''$VOTE_TYPE$'',FIRST_DATE=''$FIRST_DATE$'',FIRST_INS_SEQ_NO=''$FIRST_INS_SEQ_NO$'',HOSP_IN=''$HOSP_IN$'' ' ;
      tmpstr:=tmpstr+' Where OPD_DATE=''$OPD_DATE$'' AND FEE_NO=''$FEE_NO$''';
    end;
    2:
    begin
      tmpstr:=tmpstr+' update dpd_all_order set dc_flag=''Y'', dc_date=''$DC_DATE$'', dc_time=''$DC_TIME$'', dc_oper=''$DC_OPER$'' where fee_no=''$FEE_NO$'' and order_date=''$ORDER_DATE$'' and so_flag = ''$SO_FLAG$'' ';
    end;
    3:
    begin
      tmpstr:=tmpstr+' update dpd_all_order set dc_flag=''Y'', del_flag=''Y'', dc_date=''$DC_DATE$'', dc_time=''$DC_TIME$'', dc_oper=''$DC_OPER$'' where fee_no=''$FEE_NO$'' and order_date=''$ORDER_DATE$'' and so_flag=''$SO_FLAG$'' and fee_code=''$FEE_CODE$'' and seq_no=''$SEQ_NO$'' ';
    end;
    4:
    begin
      //111.01.07 shh ITe 11138 modify 雙和新密碼認證機制  原table 壓入密碼  不判斷原先密碼
      //tmpstr:=tmpstr+' update dental_doc_basic set pswd_desc=''$PSW_DESC$'', upd_oper=''$UPD_OPER$'', upd_date=''$UPD_DATE$'', upd_time=''$UPD_TIME$'' where doc_code=''$DOC_CODE$'' and pswd_desc=''$OLDPSW_DESC$'' ';
      tmpstr:=tmpstr+' update dental_doc_basic set pswd_desc=''$PSW_DESC$'', upd_oper=''$UPD_OPER$'', upd_date=''$UPD_DATE$'', upd_time=''$UPD_TIME$'' where doc_code=''$DOC_CODE$''  ';
    end;
    5:
    begin
      tmpstr:=tmpstr+' delete epd_often where dept_code=''$DEPT_CODE$'' and trim(doc_code)=''$DOC_CODE$'' and trim(class_code)=''$CLASS_CODE$'' and trim(fee_code)= ''$FEE_CODE$'' ';
    end;
    6:
    begin
      tmpstr:=tmpstr+' delete epd_so1 where dept_code=''$DEPT_CODE$'' and trim(doc_code)=''$DOC_CODE$'' and trim(class_code)=''$CLASS_CODE$'' and trim(class_desc)= ''$CLASS_DESC$'' ';
    end;
    7:
    begin
      tmpstr:=tmpstr+' update tbl_dental_idl set idl_date =''$IDL_DATE$'', idl_fee_code =''$IDL_FEE_CODE$'', IDL_POSITION =''$IDL_POSITION$'', INS_SEQ_NO =''$INS_SEQ_NO$'', IDL_FEE_NO =''$IDL_FEE_NO$'', DEL_FLAG=''N'' where fee_no =''$FEE_NO$'' ';
    end;
    8:
    begin
      tmpstr:=tmpstr+' Update tbl_dental_appointment set del_flag=''Y'', upd_oper=''$UPD_OPER$'', upd_date=''$UPD_DATE$'', upd_time=''$UPD_TIME$'' where app_no=''$APP_NO$'' ';
    end;
    9:
    begin
      tmpstr:=tmpstr+' Update tbl_dental_appointment set TREAT_TIME=''$TREAT_TIME$'', REMARK=''$REMARK$'', upd_oper=''$UPD_OPER$'', upd_date=''$UPD_DATE$'', upd_time=''$UPD_TIME$'' where app_no=''$APP_NO$'' and app_doc_code=''$APP_DOC_CODE$'' and app_date=''$APP_DATE$'' ';
    end;
    10:
    begin
      tmpstr:=tmpstr+' update tbl_dpd_doc_sch set dept_code=''$DEPT_CODE$'', del_flag=''$DEL_FLAG$'', upd_oper=''$UPD_OPER$'', upd_date=''$UPD_DATE$'', upd_time=''$UPD_TIME$'' where doc_code=''$DOC_CODE$'' and job_date=''$JOB_DATE$'' and shift_no=''$SHIFT_NO$'' ';
    end;
    11:
    begin
      tmpstr:=tmpstr+' update dental_doc_basic set dept_code=''$DEPT_CODE$'' where doc_code=''$DOC_CODE$'' ';
    end;
    12:
    begin
      tmpstr:=tmpstr+' Update reg_basic set cncl_flag=''Y'', reg_oper=''$REG_OPER$'', upd_date=''$UPD_DATE$'', upd_time=''$UPD_TIME$'' '+#13;
      tmpstr:=tmpstr+' where opd_date=''$OPD_DATE$'' and opd_kind=''O'' and dept_code=''$DEPT_CODE$'' and dept_room=''$DEPT_ROOM$'' and doc_code=''$DOC_CODE$'' and shift_no=''$SHIFT_NO$'' and seq_no=''$SEQ_NO$'' and chr_no=''$CHR_NO$'' ';
    end;
    13:
    begin
      tmpstr:=tmpstr+' Update tbl_dental_appointment set del_flag=''Y'', upd_oper=''$UPD_OPER$'', upd_date=''$UPD_DATE$'', upd_time=''$UPD_TIME$'' '+#13;
      tmpstr:=tmpstr+' where App_doc_code=''$APP_DOC_CODE$'' and App_date=''$APP_DATE$'' and App_time=''$APP_TIME$'' and App_no like ''$APP_NO$'' ';
    end;
    14:
    begin
      tmpstr:=tmpstr+' Update tbl_dental_appointment set App_time=''$NAPP_TIME$'', upd_oper=''$UPD_OPER$'', upd_date=''$UPD_DATE$'', upd_time=''$UPD_TIME$'' '+#13;
      tmpstr:=tmpstr+' where App_doc_code=''$APP_DOC_CODE$'' and App_date=''$APP_DATE$'' and App_time=''$APP_TIME$'' and App_no like ''$APP_NO$'' ';
    end;
    15:
    begin
      tmpstr:=tmpstr+' Update opd_basic1 set ins_seq_no='''', upd_date=''$UPD_DATE$'', upd_time=''$UPD_TIME$'', upd_oper=''$UPD_OPER$''  where fee_no=''$FEE_NO$'' ';
    end;
    16:
    begin
      tmpstr:=tmpstr+' Update ic_treat_temp set del_flag=''Y'', upd_date=''$UPD_DATE$'', upd_time=''$UPD_TIME$'', upd_oper=''$UPD_OPER$'' where fee_no=''$FEE_NO$'' and del_flag=''N'' ';
    end;
    17:
    begin
      tmpstr:=tmpstr+' Update ic_treat_dtl set ok_flag=''D'', upd_date=''$UPD_DATE$'', upd_time=''$UPD_TIME$'', upd_oper=''$UPD_OPER$''  where fee_no=''$FEE_NO$'' and ok_flag=''F'' ';
    end;
    18:
    begin
      tmpstr:=tmpstr+' update DPD_CHECKIN set order_time=''$ORDER_TIME$'' where opd_kind=''$OPD_KIND$'' and opd_date=''$OPD_DATE$'' and dept_code=''$DEPT_CODE$'' '+#13;
      tmpstr:=tmpstr+' and shift_no=''$SHIFT_NO$'' and dept_room=''$DEPT_ROOM$'' and doc_code=''$DOC_CODE$'' and seq_no=''$SEQ_NO$'' ';
    end;
    19:
    begin
      tmpstr:=tmpstr+' update tbl_dental_idl set del_flag=''Y'' where fee_no = ''$FEE_NO$'' ';
    end;
    20:
    begin
      tmpstr:=tmpstr+' update opd_basic1 set first_date='''', first_ins_seq_no='''', part_code=''$PART_CODE$'' where fee_no=''$FEE_NO$'' ';
    end;
    21:
    begin
      tmpstr:=tmpstr+' update opd_basic1 set ins_seq_no=''$INS_SEQ_NO$'' where fee_no=''$FEE_NO$'' ';
    end;
  end;
  Result:=tmpstr;
end;

function SetParamter(var Source:String; Paramter:String;Values : String):Boolean;
begin
  Try
    Values := StringReplace(Values,'''','''''',[rfReplaceAll]);
    Source := StringReplace(Source,Paramter,Values,[rfReplaceAll]);
    Result := True;
  except
    Result := False;
  end;
end;

end.


