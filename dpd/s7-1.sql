 Select Send_cd_1 "組別",Send_cd_2 "檢體",Fee_code "院內代碼",Fee_name "項目名稱",Send_cd_3 "項目代碼",URG_FLAG "可急作" from ORDERITEM_BASIC Where ORDER_TYPE='L' And USE_STATUS='1' 
 And trim(SEND_CD_1) in ('E2')

 Order By Fee_name,Send_cd_1,Send_cd_2,Fee_code 
