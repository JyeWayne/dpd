inherited FrmPubDNRList: TFrmPubDNRList
  Tag = 9999
  Top = 42
  BorderWidth = 4
  Caption = 'FrmPubDNRList'
  ClientHeight = 594
  ClientWidth = 930
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 106
  TextHeight = 15
  inherited MySBar: TStatusBar
    Top = 577
    Width = 930
  end
  object GroupBox1: TGroupBox [1]
    Left = 0
    Top = 0
    Width = 930
    Height = 121
    Align = alTop
    Caption = #22522#26412#36039#26009
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 26
      Top = 28
      Width = 48
      Height = 16
      Caption = #30149#27511#34399
    end
    object Label3: TLabel
      Left = 223
      Top = 28
      Width = 32
      Height = 16
      Caption = #22995#21517
    end
    object Label1: TLabel
      Left = 403
      Top = 28
      Width = 64
      Height = 16
      Caption = #20986#29983#26085#26399
    end
    object Label6: TLabel
      Left = 651
      Top = 28
      Width = 32
      Height = 16
      Caption = #24180#40801
    end
    object Label8: TLabel
      Left = 43
      Top = 59
      Width = 32
      Height = 16
      Caption = #24615#21029
    end
    object Label9: TLabel
      Left = 180
      Top = 59
      Width = 32
      Height = 16
      Caption = #22320#22336
    end
    object Label10: TLabel
      Left = 43
      Top = 90
      Width = 32
      Height = 16
      Caption = #38651#35441
    end
    object Label13: TLabel
      Left = 763
      Top = 28
      Width = 16
      Height = 16
      Caption = #27506
    end
    object ComboBox1: TComboBox
      Left = 86
      Top = 55
      Width = 87
      Height = 24
      Enabled = False
      ItemHeight = 16
      TabOrder = 0
      Text = 'ComboBox1'
      Items.Strings = (
        '0_'#22899
        '1_'#30007)
    end
    object DBEdit1: TDBEdit
      Left = 86
      Top = 24
      Width = 129
      Height = 23
      DataField = 'chr_no'
      DataSource = DSPat
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 266
      Top = 24
      Width = 129
      Height = 23
      DataField = 'pat_name'
      DataSource = DSPat
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 509
      Top = 24
      Width = 130
      Height = 23
      DataField = 'Birth_Date'
      DataSource = DSPat
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 223
      Top = 55
      Width = 558
      Height = 23
      DataField = 'ADDR_NAME1'
      DataSource = DSPat
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 132
      Top = 86
      Width = 164
      Height = 23
      DataField = 'HOME_TEL_NO'
      DataSource = DSPat
      TabOrder = 5
    end
    object DBEdit6: TDBEdit
      Left = 86
      Top = 86
      Width = 44
      Height = 23
      DataField = 'AREA_CODE1'
      DataSource = DSPat
      TabOrder = 6
    end
    object EdtAge: TEdit
      Left = 686
      Top = 24
      Width = 69
      Height = 23
      TabOrder = 7
    end
    object DBEdit7: TDBEdit
      Left = 471
      Top = 24
      Width = 36
      Height = 23
      DataField = 'AC_TYPE'
      DataSource = DSPat
      TabOrder = 8
    end
  end
  object GroupBox2: TGroupBox [2]
    Left = 0
    Top = 121
    Width = 198
    Height = 456
    Align = alLeft
    Caption = #27511#21490'LOG'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 18
      Width = 194
      Height = 436
      Align = alClient
      DataSource = DSLog
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = #32048#26126#39636
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'oper_date'
          Title.Caption = #32173#35703#26085#26399
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KK'
          Title.Caption = #29376#24907
          Visible = True
        end>
    end
  end
  object Panel2: TPanel [3]
    Left = 198
    Top = 121
    Width = 732
    Height = 456
    Align = alClient
    Color = clSilver
    TabOrder = 3
    object RadioGroup1: TRadioGroup
      Left = 1
      Top = 1
      Width = 646
      Height = 52
      Caption = #31805#23660#20154#21729
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = #32048#26126#39636
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        #26412#20154
        #23478#23660
        #20854#23427)
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 342
      Width = 730
      Height = 71
      Align = alTop
      Caption = #20633#35387#35498#26126
      TabOrder = 1
      Visible = False
      object Memo1: TMemo
        Left = 2
        Top = 17
        Width = 726
        Height = 52
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 248
      Width = 730
      Height = 94
      Align = alTop
      Caption = 'DNR'#32025#26412#25764#38500#36039#26009
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      Visible = False
      object Label4: TLabel
        Left = 14
        Top = 26
        Width = 120
        Height = 16
        Caption = #32025#26412#25764#38500'DNR'#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 309
        Top = 26
        Width = 32
        Height = 16
        Caption = #26178#38291
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label12: TLabel
        Left = 14
        Top = 55
        Width = 64
        Height = 16
        Caption = #30906#35469#37291#24107
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
      end
      object DateTimePicker2: TDateTimePicker
        Left = 343
        Top = 21
        Width = 130
        Height = 24
        Date = 40008.466573530100000000
        Time = 40008.466573530100000000
        Enabled = False
        Kind = dtkTime
        TabOrder = 0
        Visible = False
      end
      object ComboBox2: TComboBox
        Left = 154
        Top = 50
        Width = 139
        Height = 24
        Enabled = False
        ItemHeight = 16
        TabOrder = 1
      end
      object DateTimePicker1: TDateTimePicker
        Left = 154
        Top = 21
        Width = 139
        Height = 24
        Date = 40008.689998726900000000
        Time = 40008.689998726900000000
        Enabled = False
        TabOrder = 2
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 163
      Width = 730
      Height = 85
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      BorderWidth = 4
      Color = clGray
      TabOrder = 3
      object Label16: TLabel
        Left = 29
        Top = 20
        Width = 287
        Height = 18
        Caption = #35531#26597'DNR'#32025#26412','#20197#30906#23450#19981#24613#25937#30340#38917#30446
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clOlive
        Font.Height = -18
        Font.Name = #32048#26126#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 29
        Top = 45
        Width = 372
        Height = 18
        Caption = #35531#23450#26399#33287#30149#20154#25110#23478#23660#30906#23450'DNR'#20839#23481#21450#20854#26178#25928#24615
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clOlive
        Font.Height = -18
        Font.Name = #32048#26126#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 730
      Height = 162
      Align = alTop
      BevelOuter = bvLowered
      BorderWidth = 8
      Color = clSilver
      TabOrder = 4
      object Label5: TLabel
        Left = 436
        Top = 15
        Width = 72
        Height = 15
        Caption = #31805#23660#20154' : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label7: TLabel
        Left = 451
        Top = 42
        Width = 56
        Height = 15
        Caption = #38364#20418' : '
        Visible = False
      end
      object Label14: TLabel
        Left = 26
        Top = 40
        Width = 120
        Height = 16
        Caption = #32025#26412'DNR'#31805#23660#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 28
        Top = 72
        Width = 8
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
      end
      object Edit7: TEdit
        Left = 505
        Top = 11
        Width = 129
        Height = 23
        TabOrder = 0
        Visible = False
      end
      object CheckBox1: TCheckBox
        Left = 26
        Top = 111
        Width = 129
        Height = 19
        Caption = ' '#25764#38500#26412#20221'DNR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object DateTimePicker3: TDateTimePicker
        Left = 163
        Top = 36
        Width = 164
        Height = 21
        Date = 40009.636417280100000000
        Time = 40009.636417280100000000
        TabOrder = 2
      end
    end
    object BitBtn2: TBitBtn
      Left = 266
      Top = 420
      Width = 112
      Height = 27
      Caption = #20316#24290'DNR'#35352#37636
      TabOrder = 5
      OnClick = BitBtn2Click
    end
    object BitBtn1: TBitBtn
      Left = 386
      Top = 420
      Width = 112
      Height = 27
      Caption = #20462#25913'DNR'#36039#26009
      TabOrder = 6
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 506
      Top = 420
      Width = 112
      Height = 27
      Caption = #26032#38283#31435'DNR'
      TabOrder = 7
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 626
      Top = 420
      Width = 80
      Height = 27
      Caption = #38626#38283
      TabOrder = 8
      OnClick = BitBtn4Click
    end
  end
  object DSPat: TDataSource
    DataSet = QryPat
    Left = 304
    Top = 96
  end
  object DSLog: TDataSource
    DataSet = QryLog
    Left = 416
    Top = 96
  end
  object QryPat: TADOQuery
    Parameters = <>
    Left = 336
    Top = 96
  end
  object QryLog: TADOQuery
    Parameters = <>
    Left = 448
    Top = 96
  end
  object Query3: TADOQuery
    Parameters = <>
    Left = 528
    Top = 96
  end
end
