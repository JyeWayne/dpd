 Select Send_cd_1 "�էO",Send_cd_2 "����",Fee_code "�|���N�X",Fee_name "���ئW��",Send_cd_3 "���إN�X",URG_FLAG "�i��@" from ORDERITEM_BASIC Where ORDER_TYPE='L' And USE_STATUS='1' 
 And trim(SEND_CD_1) in ('E2')

 Order By Fee_name,Send_cd_1,Send_cd_2,Fee_code 
