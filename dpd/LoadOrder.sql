 Select ORDER_TYPE,(select code_onename from COMPARE_CODE_BASIC where IPD_RELATED='R1' And RTrim(Code_one)=RTrim(Order_type)) "����", 
 FEE_CODE "�|���N�X",FEE_NAME "���ئW��", SEND_CD_1,(select code_onename from COMPARE_CODE_BASIC where IPD_RELATED='R2' And Code_Two=Order_type and Code_one=Send_cd_1) "����", SEND_CD_2 "�y����" 
 from ORDERITEM_BASIC Where ORDER_TYPE IN (SELECT RTrim(CODE_ONE) FROM COMPARE_CODE_BASIC WHERE IPD_RELATED='R1') And USE_STATUS='1' 
 and Order_type='X1'
 Order By ORDER_TYPE,FEE_CODE,SEND_CD_1,Fee_name 
