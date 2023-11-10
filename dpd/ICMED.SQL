select substr(opd_date,1,7) as opd_Date,trim(alisec_desc) as alise_desc,trim(ins_med_desc) as med_desc,path_code,
       med_days,ttl_qty,DECODE(order_kind,'1','非長期','2','長期','A','取消','B','取消',order_kind) as order_kind 
from( 
  select distinct a.opd_date,b.alisec_desc,b.ins_med_desc,a.path_code,a.med_days,a.ttl_qty,a.order_kind 
  from IC_PRESCRIPTION a,NHI_MED b 
  where a.fee_no in(select fee_no from reg_basic where chr_no ='07230057' and fee_no is not null 
                    and (to_date(opd_date+19110000,'YYYYMMDD') > (to_date(1050229+19110000,'YYYYMMDD')-1)) 
          union all select fee_no from ipd_basic where chr_no='07230057') and 
        ORDER_KIND in('1','2','A','B') and 
        a.ins_fee_code=b.ins_med_code 
        and a.opd_date > '1040229000000') 
order by to_number(opd_date) desc
