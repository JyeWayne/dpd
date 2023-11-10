 select decode((select doc_code from tbl_dpd_doc_sch where shift_no='1' 
 and ((job_date='1030701') or (job_date='1030701')) and doc_code=A.doc_code and del_flag='N'),A.doc_code,'V','') flag,trim(A.doc_name), 
 (case when (select B.doc_code from tbl_dpd_doc_sch B where B.shift_no='1' 
 and ((B.job_date='1030701') or (B.job_date='1030701')) and B.doc_code=A.doc_code) is null then 
 (select trim(C.code_no)||'-'||trim(C.code_desc) from code_dtl C where C.code_type='ZZ' and C.code_no=A.dept_code) else 
 (select trim(C.code_no)||'-'||C.code_desc from tbl_dpd_doc_sch B, code_dtl C where C.code_type='ZZ' and C.code_no=B.dept_code and B.shift_no='1' 
 and ((B.job_date='1030701') or (B.job_date='1030701')) and B.doc_code=A.doc_code) end) dept_code, 
 A.doc_code,decode((select doc_code from tbl_dpd_doc_sch where shift_no='1' 
 and ((job_date='1030701') or (job_date='1030701')) and doc_code=A.doc_code),A.doc_code,'1','') already 
 from dental_doc_basic A where A.remark='0' and A.doc_code not in ('97492','DENT','DENT1') and trim(dept_code) <> ' ' 
 order by A.dept_code 
