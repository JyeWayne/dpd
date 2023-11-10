 select sum(qty_num) his_qty_num from opd_basic a,opd_fee b where 1=1 
 and b.fee_code in (
'F910070',
'F91007C',
'F910080',
'F91008C',
'F91008C')
and (
(instr(substr(b.position,1,2),'UL') > 0 or instr(substr(b.position,3,2),'UL') > 0 or instr(substr(b.position,5,2),'UL') > 0))
 and b.del_flag = 'N' and b.fee_no = a.fee_no and a.chr_no ='14272017' and a.dept_code in ('40','4042','4043','4044','4045','4046','4047','4048','4049','4099') 
 and ((a.opd_date between '1030925' and '1040323' and length(trim(a.opd_date))=6 ) or (a.opd_date between '1030925' and '1040323' and length(trim(a.opd_date))=7 ))
