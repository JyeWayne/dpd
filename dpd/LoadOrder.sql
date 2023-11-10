 Select ORDER_TYPE,(select code_onename from COMPARE_CODE_BASIC where IPD_RELATED='R1' And RTrim(Code_one)=RTrim(Order_type)) "類型", 
 FEE_CODE "院內代碼",FEE_NAME "項目名稱", SEND_CD_1,(select code_onename from COMPARE_CODE_BASIC where IPD_RELATED='R2' And Code_Two=Order_type and Code_one=Send_cd_1) "部位", SEND_CD_2 "流水號" 
 from ORDERITEM_BASIC Where ORDER_TYPE IN (SELECT RTrim(CODE_ONE) FROM COMPARE_CODE_BASIC WHERE IPD_RELATED='R1') And USE_STATUS='1' 
 and Order_type='X1'
 Order By ORDER_TYPE,FEE_CODE,SEND_CD_1,Fee_name 
