object DM: TDM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 710
  Top = 54
  Height = 344
  Width = 460
  object ADOLink: TADOConnection
    CommandTimeout = 3000000
    ConnectionTimeout = 3000000
    LoginPrompt = False
    Provider = 'OraOLEDB.Oracle.1'
    Left = 16
    Top = 8
  end
  object QrySearch: TADOQuery
    Connection = ADOLink
    BeforeOpen = QrySearchBeforeOpen
    Parameters = <>
    Left = 16
    Top = 72
  end
  object QrySubSearch: TADOQuery
    Connection = ADOLink
    BeforeOpen = QrySearchBeforeOpen
    Parameters = <>
    Left = 86
    Top = 72
  end
  object QrySearch3: TADOQuery
    Connection = ADOLink
    BeforeOpen = QrySearchBeforeOpen
    Parameters = <>
    Left = 160
    Top = 72
  end
  object QryTemp: TADOQuery
    Connection = ADOLink
    BeforeOpen = QrySearchBeforeOpen
    Parameters = <>
    Left = 16
    Top = 144
  end
  object QryInsert: TADOQuery
    Connection = ADOLink
    BeforeOpen = QrySearchBeforeOpen
    Parameters = <>
    Left = 86
    Top = 144
  end
  object QryUpdate: TADOQuery
    Connection = ADOLink
    BeforeOpen = QrySearchBeforeOpen
    Parameters = <>
    Left = 160
    Top = 144
  end
  object QrySelf: TADOQuery
    Connection = ADOLink
    BeforeOpen = QrySearchBeforeOpen
    Parameters = <>
    Left = 224
    Top = 144
  end
  object QryOrder: TADOQuery
    Connection = ADOLink
    BeforeOpen = QrySearchBeforeOpen
    Parameters = <>
    Left = 224
    Top = 72
  end
  object SPALL: TADOStoredProc
    Connection = ADOLink
    Parameters = <>
    Left = 288
    Top = 144
  end
  object QryExec: TADOQuery
    Connection = ADOLink
    Parameters = <>
    Left = 288
    Top = 72
  end
  object Med_Check: TADOStoredProc
    Connection = ADOLink
    Parameters = <>
    Left = 352
    Top = 72
  end
  object qryICD10: TADOQuery
    Connection = ADOLink
    Parameters = <>
    Left = 16
    Top = 200
  end
end
