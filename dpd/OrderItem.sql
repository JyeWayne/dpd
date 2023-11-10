Select OrderItem_basic.*,(select Code_oneName from COMPARE_CODE_BASIC where IPD_RELATED='C1' and RTrim(Code_one) = RTrim(Send_Cd_1)) "ÀË¬d«Ç"
from OrderItem_basic where RTRIM(order_type)='E' and UPPER(fee_code) like 'F%' and Use_STATUS_O='1' Order by  SEND_CD_1,Fee_code,Fee_Desc,Fee_Name
