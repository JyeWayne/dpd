inherited FrmPatInf: TFrmPatInf
  Tag = 9999
  Left = 170
  Top = 163
  AlphaBlendValue = 200
  BorderIcons = [biSystemMenu]
  Caption = 'FrmPatInf'
  ClientHeight = 388
  ClientWidth = 898
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Top = 371
    Width = 898
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 393
    Height = 371
    Align = alLeft
    BevelOuter = bvLowered
    BorderWidth = 4
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 5
      Top = 5
      Width = 383
      Height = 113
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #32048#26126#39636
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 18
        Top = 17
        Width = 54
        Height = 17
        Caption = #30149#27511#34399
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 89
        Top = 17
        Width = 72
        Height = 17
        Caption = #30149#24739#22995#21517
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 174
        Top = 17
        Width = 72
        Height = 17
        Caption = #36523#20998#35657#34399
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 271
        Top = 17
        Width = 72
        Height = 17
        Caption = #20986#29983#26085#26399
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 18
        Top = 60
        Width = 36
        Height = 17
        Caption = #34880#22411
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 81
        Top = 61
        Width = 72
        Height = 17
        Caption = #21021#35386#26085#26399
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 158
        Top = 61
        Width = 108
        Height = 17
        Caption = #26368#36817#35079#35386#26085#26399
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 271
        Top = 61
        Width = 72
        Height = 17
        Caption = #34277#29289#36942#25935
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 54
        Top = 61
        Width = 18
        Height = 17
        Caption = 'RH'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object CHR_NO: TLabel
        Tag = 777
        Left = 18
        Top = 38
        Width = 54
        Height = 17
        Caption = 'CHR_NO'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object PAT_NAME: TLabel
        Tag = 777
        Left = 89
        Top = 38
        Width = 72
        Height = 17
        Caption = 'PAT_NAME'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object ID_NO: TLabel
        Tag = 777
        Left = 174
        Top = 38
        Width = 45
        Height = 17
        Caption = 'ID_NO'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object BIRTH_DATE: TLabel
        Tag = 777
        Left = 272
        Top = 38
        Width = 90
        Height = 17
        Caption = 'BIRTH_DATE'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object RH_TYPE: TLabel
        Tag = 777
        Left = 54
        Top = 86
        Width = 63
        Height = 17
        Caption = 'RH_TYPE'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object BLOOD_TYPE: TLabel
        Tag = 777
        Left = 24
        Top = 86
        Width = 90
        Height = 17
        Caption = 'BLOOD_TYPE'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clRed
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object FST_OPD_DATE: TLabel
        Tag = 777
        Left = 81
        Top = 86
        Width = 108
        Height = 17
        Caption = 'FST_OPD_DATE'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object RECE_OPD_DATE: TLabel
        Tag = 777
        Left = 158
        Top = 86
        Width = 117
        Height = 17
        Caption = 'RECE_OPD_DATE'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object ALLI_FLAG: TLabel
        Tag = 777
        Left = 271
        Top = 86
        Width = 81
        Height = 17
        Caption = 'ALLI_FLAG'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 118
      Width = 383
      Height = 144
      Align = alTop
      TabOrder = 1
      object Label9: TLabel
        Left = 18
        Top = 14
        Width = 72
        Height = 17
        Caption = #23478#35041#38651#35441
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 160
        Top = 14
        Width = 72
        Height = 17
        Caption = #20844#21496#38651#35441
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 18
        Top = 56
        Width = 36
        Height = 17
        Caption = #21312#34399
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 75
        Top = 56
        Width = 72
        Height = 17
        Caption = #36890#35338#20303#22336
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 18
        Top = 98
        Width = 36
        Height = 17
        Caption = #21312#34399
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 75
        Top = 96
        Width = 72
        Height = 17
        Caption = #25142#31821#22320#22336
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object AREA_CODE1: TLabel
        Tag = 777
        Left = 18
        Top = 35
        Width = 90
        Height = 17
        Caption = 'AREA_CODE1'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object AREA_CODE2: TLabel
        Tag = 777
        Left = 160
        Top = 35
        Width = 90
        Height = 17
        Caption = 'AREA_CODE2'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object ZIP_CODE1: TLabel
        Tag = 777
        Left = 18
        Top = 77
        Width = 81
        Height = 17
        Caption = 'ZIP_CODE1'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object ADDR_NAME1: TLabel
        Tag = 777
        Left = 75
        Top = 77
        Width = 90
        Height = 17
        Caption = 'ADDR_NAME1'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object ZIP_CODE2: TLabel
        Tag = 777
        Left = 18
        Top = 119
        Width = 39
        Height = 18
        AutoSize = False
        Caption = 'ZIP_CODE2'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object ADDR_NAME2: TLabel
        Tag = 777
        Left = 75
        Top = 119
        Width = 90
        Height = 17
        Caption = 'ADDR_NAME2'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object HOME_TEL_NO: TLabel
        Tag = 777
        Left = 58
        Top = 35
        Width = 99
        Height = 17
        Caption = 'HOME_TEL_NO'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object OFFICE_TEL_NO: TLabel
        Tag = 777
        Left = 199
        Top = 35
        Width = 117
        Height = 17
        Caption = 'OFFICE_TEL_NO'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
    end
    object GroupBox3: TGroupBox
      Left = 5
      Top = 262
      Width = 383
      Height = 104
      Align = alClient
      TabOrder = 2
      object Label17: TLabel
        Left = 18
        Top = 13
        Width = 90
        Height = 17
        Caption = #32202#24613#36899#32097#20154
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 109
        Top = 13
        Width = 90
        Height = 17
        Caption = #36899#32097#20154#38651#35441
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 18
        Top = 55
        Width = 36
        Height = 17
        Caption = #21312#34399
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 75
        Top = 55
        Width = 90
        Height = 17
        Caption = #36899#32097#20154#20303#22336
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object CONT_NAME: TLabel
        Tag = 777
        Left = 18
        Top = 36
        Width = 81
        Height = 17
        Caption = 'CONT_NAME'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object CONT_AREA_CODE: TLabel
        Tag = 777
        Left = 109
        Top = 36
        Width = 126
        Height = 17
        Caption = 'CONT_AREA_CODE'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object CONT_ZIP_CODE: TLabel
        Tag = 777
        Left = 18
        Top = 79
        Width = 117
        Height = 17
        Caption = 'CONT_ZIP_CODE'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object CONT_ADDR: TLabel
        Tag = 777
        Left = 83
        Top = 79
        Width = 81
        Height = 17
        Caption = 'CONT_ADDR'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object CONT_TEL_NO: TLabel
        Tag = 777
        Left = 154
        Top = 36
        Width = 99
        Height = 17
        Caption = 'CONT_TEL_NO'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object SGTemp: TStringGrid [2]
    Left = 174
    Top = 317
    Width = 204
    Height = 50
    DefaultColWidth = 48
    DefaultRowHeight = 12
    FixedCols = 0
    RowCount = 2
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object Panel2: TPanel [3]
    Left = 393
    Top = 0
    Width = 288
    Height = 371
    Align = alLeft
    BevelOuter = bvLowered
    BorderWidth = 4
    TabOrder = 3
    object GroupBox4: TGroupBox
      Left = 5
      Top = 5
      Width = 278
      Height = 90
      Align = alTop
      Caption = #36523#39640#12289#39636#37325
      Color = clSilver
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #27161#26999#39636
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object Label4: TLabel
        Left = 16
        Top = 32
        Width = 38
        Height = 17
        Caption = #36523#39640
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clNavy
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 62
        Width = 38
        Height = 17
        Caption = #39636#37325
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clMaroon
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 136
        Top = 32
        Width = 20
        Height = 17
        Caption = 'cm'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clNavy
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 136
        Top = 62
        Width = 20
        Height = 17
        Caption = 'Kg'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clMaroon
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TEdit
        Tag = 1
        Left = 56
        Top = 28
        Width = 72
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #32048#26126#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Edit2: TEdit
        Tag = 1
        Left = 56
        Top = 58
        Width = 72
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -15
        Font.Name = #32048#26126#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object CheckBox1: TCheckBox
        Left = 160
        Top = 31
        Width = 57
        Height = 17
        Caption = #38928#20540
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clNavy
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object CheckBox2: TCheckBox
        Left = 160
        Top = 61
        Width = 57
        Height = 17
        Caption = #38928#20540
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clMaroon
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object GroupBox5: TGroupBox
      Left = 5
      Top = 95
      Width = 278
      Height = 119
      Align = alTop
      Caption = #39636#28331#12289#33032#25615#12289#34880#22739
      Color = clGray
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #27161#26999#39636
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object Label24: TLabel
        Left = 16
        Top = 29
        Width = 38
        Height = 17
        Caption = #39636#28331
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 136
        Top = 25
        Width = 9
        Height = 17
        Caption = 'o'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 144
        Top = 29
        Width = 10
        Height = 17
        Caption = 'C'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlue
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 16
        Top = 92
        Width = 38
        Height = 17
        Caption = #33032#25615
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 136
        Top = 92
        Width = 40
        Height = 17
        Caption = '/min'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label29: TLabel
        Left = 16
        Top = 61
        Width = 38
        Height = 17
        Caption = #34880#22739
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label30: TLabel
        Left = 136
        Top = 61
        Width = 10
        Height = 17
        Caption = '/'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label31: TLabel
        Left = 221
        Top = 61
        Width = 40
        Height = 17
        Caption = 'mmHg'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit3: TEdit
        Tag = 1
        Left = 56
        Top = 25
        Width = 72
        Height = 26
        TabOrder = 0
      end
      object Edit4: TEdit
        Left = 56
        Top = 88
        Width = 72
        Height = 26
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 56
        Top = 57
        Width = 72
        Height = 26
        TabOrder = 1
      end
      object Edit6: TEdit
        Left = 144
        Top = 57
        Width = 72
        Height = 26
        TabOrder = 2
      end
    end
    object GroupBox6: TGroupBox
      Left = 5
      Top = 214
      Width = 278
      Height = 91
      Align = alTop
      Caption = #38957#22285#12289#33136#22285
      Color = clBtnFace
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #27161#26999#39636
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      object Label32: TLabel
        Left = 16
        Top = 28
        Width = 38
        Height = 17
        Caption = #38957#22285
      end
      object Label33: TLabel
        Left = 16
        Top = 57
        Width = 38
        Height = 17
        Caption = #33136#22285
      end
      object Label34: TLabel
        Left = 136
        Top = 28
        Width = 20
        Height = 17
        Caption = 'cm'
      end
      object Label35: TLabel
        Left = 136
        Top = 57
        Width = 20
        Height = 17
        Caption = 'cm'
      end
      object Edit7: TEdit
        Tag = 1
        Left = 56
        Top = 24
        Width = 72
        Height = 26
        TabOrder = 0
      end
      object Edit8: TEdit
        Tag = 1
        Left = 56
        Top = 53
        Width = 72
        Height = 26
        TabOrder = 1
      end
    end
    object BitBtn1: TBitBtn
      Left = 112
      Top = 336
      Width = 75
      Height = 25
      Caption = #26356#26032
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #27161#26999#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 200
      Top = 336
      Width = 75
      Height = 25
      Caption = #38626#38283
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = #27161#26999#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 24
      Top = 336
      Width = 75
      Height = 25
      Caption = #28165#31354
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clBlue
      Font.Height = -20
      Font.Name = #27161#26999#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn3Click
    end
  end
  object Panel3: TPanel [4]
    Left = 681
    Top = 0
    Width = 217
    Height = 371
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderWidth = 4
    Caption = 'Panel3'
    TabOrder = 4
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 207
      Height = 361
      Align = alClient
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = #32048#26126#39636
      TitleFont.Style = [fsBold]
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'UPD_DATE'
          Title.Caption = #22635#23531#26085#26399
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -15
          Title.Font.Name = #27161#26999#39636
          Title.Font.Style = [fsBold]
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SOUR_AP'
          Title.Caption = #22635#23531#31995#32113
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -15
          Title.Font.Name = #27161#26999#39636
          Title.Font.Style = [fsBold]
          Width = 74
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 801
    Top = 128
  end
  object Query1: TADOQuery
    Connection = DM.ADOLink
    AfterScroll = Query1AfterScroll
    Parameters = <>
    Left = 697
    Top = 72
  end
end