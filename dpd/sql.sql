 SELECT lpad(rownum,3,'0') as SEQ_NO,D.* 

 FROM(SELECT a.opd_kind as opd_kind,a.SEQ_NO as REG_SEQ_NO, a.OPD_DATE as OPD_DATE,a.DEPT_CODE as DEPT_CODE,decode(b.sex_type,'0','女','1','男','不明') as SEX,b.sex_type,  

 (select smpl_desc from dept_basic where dept_code=a.DEPT_CODE) DEPT_DESC, 

 a.DEPT_ROOM as DEPT_ROOM,a.DOC_CODE as DOC_CODE,(select doc_name from dental_doc_basic where doc_code=a.doc_code) DOC_NAME,a.ROOM_DESC as ROOM_DESC,a.SHIFT_NO as SHIFT_NO,b.AC_TYPE as AC_TYPE, 

 a.CHR_NO as CHR_NO,(case when instr(b.id_no,'@') > 0  then substr(b.id_no,2,length(trim(b.id_no))-1) else trim(b.id_no) end) as ID_NO,a.FEE_NO as FEE_NO,b.PAT_NAME as PAT_NAME,a.PAT_ID as PAT_ID,b.birth_date as BIRTH_DATE, 

 (CASE WHEN (a.ORDER_STATUS = '1') THEN '暫存' ELSE DECODE(a.OPD_STATUS,'1','未到診','2','已報到','3','完診','4','批完價','5','批完價') END) OPD_STATUS, 

 a.DISC_CODE as DISC_CODE,OPD_STATUS OPD_STATUSCODE,ORDER_STATUS,decode(a.FV_RV,'F','初診','複診') FV_RV, decode(a.pat_id,'1','健保','自費') pat_desc,b.death_flag, 

 (select idl_date from tbl_dental_idl where fee_no=a.fee_no and del_flag='N') idl_date, 

 (select idl_fee_code from tbl_dental_idl where fee_no=a.fee_no and del_flag='N') idl_fee_code, 

 (select idl_position from tbl_dental_idl where fee_no=a.fee_no and del_flag='N') idl_position, 

 (select ins_seq_no from tbl_dental_idl where fee_no=a.fee_no and del_flag='N') idl_ins_seq_no, 

 (select idl_fee_no from tbl_dental_idl where fee_no=a.fee_no and del_flag='N') idl_fee_no, 

 (select D.doc_name from dental_doc_basic D, opd_basic1 E where D.doc_code=E.ins_doc and E.fee_no=A.fee_no and E.opd_date=A.opd_date) DEC_Name, 

 (select D.doc_name from dental_doc_basic D, opd_basic1 E where D.doc_code=E.feat_doc and E.fee_no=A.fee_no and E.opd_date=A.opd_date) FAT_Name, 

 (select D.doc_name from dental_doc_basic D, opd_basic1 E where D.doc_code=E.exe_doc and E.fee_no=A.fee_no and E.opd_date=A.opd_date) EXE_Name, 

 (select diag_flag from opd_basic1 where fee_no=A.fee_no and opd_date=A.opd_date) DiagFlag, 

 (select ins_doc from opd_basic1 where fee_no=A.fee_no and opd_date=A.opd_date) dec_doc, 

 (select feat_doc from opd_basic1 where fee_no=A.fee_no and opd_date=A.opd_date) fat_doc, 

 (select exe_doc from opd_basic1 where fee_no=A.fee_no and opd_date=A.opd_date) exe_doc, 

 (select pain_score from opd_basic1 where fee_no=A.fee_no and opd_date=A.opd_date) pain_score, 

 Nvl((select trim(D.code_desc)||'_'||trim(D.code_no) from V_PART_CODE D, opd_basic E where CODE_SOURCE IN ('D','T') and D.code_no=E.part_code and E.fee_no=A.fee_no and E.opd_date=A.opd_date), (select trim(D.code_desc)||'_'||trim(D.code_no) from V_PART_CODE D, opd_basic E where CODE_SOURCE IN ('D','T') and D.code_no=E.part_code and E.fee_no=A.fee_no and E.opd_date=A.opd_date)) part_desc, 

 (select trim(D.code_desc)||'_'||trim(D.code_no) from V_CASE_TYPE D, opd_basic1 E where CODE IN ('D','T') and D.code_no=E.case_type and E.fee_no=A.fee_no and E.opd_date=A.opd_date) case_desc, 

 (select trim(D.code_desc)||'_'||trim(D.code_no) from V_ORDER_TYPE D, opd_basic1 E where D.code_no=E.pay_type and E.fee_no=A.fee_no and E.opd_date=A.opd_date) pay_desc, 

 decode((select count(*) from opd_warning2 where med_code is not null and  chr_no=a.chr_no and stop_flag='N'),'0',' ','*有過敏記錄*') Allergic, 

 (select ins_seq_no from opd_basic1 where fee_no=A.fee_no and opd_date=A.opd_date) ins_seq_no, 

 round(((sysdate-to_date(b.birth_date+19110000,'YYYYMMDD')) / 365),0) age, 

 nvl((select 'Y' from dpd_checkin where OPD_KIND=A.OPD_KIND and OPD_DATE=A.OPD_DATE and DEPT_CODE=A.DEPT_CODE and SHIFT_NO=A.SHIFT_NO and DEPT_ROOM=A.DEPT_ROOM and DOC_CODE=A.DOC_CODE and SEQ_NO=A.SEQ_NO ),'N') DPDCI, 

 (case when nvl((select 'Y' from dpd_checkin where OPD_KIND=A.OPD_KIND and OPD_DATE=A.OPD_DATE and DEPT_CODE=A.DEPT_CODE and SHIFT_NO=A.SHIFT_NO and DEPT_ROOM=A.DEPT_ROOM and DOC_CODE=A.DOC_CODE and SEQ_NO=A.SEQ_NO ),'N') = 'Y' then  

 '等候時間：'||(select Round((decode(order_time,null,sysdate,to_date(opd_date+19110000||order_time,'YYYYMMDDHH24MI')) - to_date(opd_date+19110000||chkin_time,'YYYYMMDDHH24MI'))*24*60,0) 

 from dpd_checkin where OPD_KIND=A.OPD_KIND and OPD_DATE=A.OPD_DATE and DEPT_CODE=A.DEPT_CODE and SHIFT_NO=A.SHIFT_NO and DEPT_ROOM=A.DEPT_ROOM and DOC_CODE=A.DOC_CODE and SEQ_NO=A.SEQ_NO ) ||'分鐘'  

 else  ''  end) Wait,  (select count(*) from opd_his h,dpd_all_order d where h.fee_no=d.fee_no and h.fee_code=d.fee_code and h.seq_no=d.order_seq  and h.cncl_flag='N' and h.dc_type='C' and d.dc_flag='N' and h.self_pay_flag in('N','G') and nvl(trim(h.order_sign),'0')='0' and d.fee_no=a.fee_no and h.opd_date=a.opd_date) ICSIGN  FROM REG_BASIC a, chr_Basic b 

 where (a.chr_no not in(select chr_no from tbl_dental_appointment where chr_no=a.chr_no and seq_no=a.seq_no and shift_no=a.shift_no and doc_code=a.doc_code and dept_room=a.dept_room and dept_code=a.dept_code and app_date=a.opd_date)) and 

 (a.doc_code like '50001%') and 

 (a.chr_no=b.chr_no) and 

 (a.OPD_KIND in ('O','T')) and 

 (a.OPD_DATE = '1120221') and 

 (a.SHIFT_NO = '1') and 

 (a.CNCL_FLAG='N') and 

 (rtrim(a.reserve_flag)<>'6') and 

 (a.Dept_CODE IN ('40','4042','4043','4044','4045','4046','4047','4048','4049','4050','4051','4052','4053','4054','4099','4055','4056')) 

 order by a.order_status,a.SEQ_NO) D 

