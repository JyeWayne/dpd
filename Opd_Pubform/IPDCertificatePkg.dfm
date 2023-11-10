inherited FrmIPDCertificatePkg: TFrmIPDCertificatePkg
  Left = 113
  Top = 153
  Caption = 'FrmIPDCertificatePkg'
  ClientHeight = 600
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 106
  TextHeight = 15
  inherited MySBar: TStatusBar
    Top = 583
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 198
    Height = 583
    Align = alLeft
    Caption = 'Panel2'
    TabOrder = 1
    object StringGrid1: TStringGrid
      Left = 1
      Top = 190
      Width = 196
      Height = 392
      Align = alClient
      ColCount = 1
      FixedCols = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = #32048#26126#39636
      Font.Style = [fsBold]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ParentFont = False
      TabOrder = 0
      OnClick = StringGrid1Click
      ColWidths = (
        157)
    end
    object RadioGroup1: TRadioGroup
      Left = 1
      Top = 1
      Width = 196
      Height = 189
      Align = alTop
      Caption = #35531#36984#25799
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #27161#26999#39636
      Font.Style = []
      Items.Strings = (
        #37291#24107#20491#20154#31684#26412
        #31185#31684#26412
        #30149#20154#27511#21490#35352#37636)
      ParentFont = False
      TabOrder = 1
      OnClick = RadioGroup1Click
    end
    object ComboBox1: TComboBox
      Left = 9
      Top = 62
      Width = 181
      Height = 26
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = #27161#26999#39636
      Font.Style = []
      ItemHeight = 18
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnChange = ComboBox1Change
    end
    object ComboBox2: TComboBox
      Left = 9
      Top = 118
      Width = 181
      Height = 26
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = #27161#26999#39636
      Font.Style = []
      ItemHeight = 18
      ParentFont = False
      TabOrder = 3
      Visible = False
      OnChange = ComboBox2Change
    end
  end
  object Panel4: TPanel [2]
    Left = 198
    Top = 0
    Width = 808
    Height = 583
    Align = alClient
    Caption = 'Panel4'
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 806
      Height = 197
      Align = alTop
      Caption = #20663#30149#21517#31281
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Memo1: TMemo
        Left = 2
        Top = 23
        Width = 802
        Height = 172
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Sg1: TStringGrid
      Left = 111
      Top = 223
      Width = 216
      Height = 128
      ColCount = 3
      FixedCols = 0
      TabOrder = 1
      Visible = False
    end
    object Sg2: TStringGrid
      Left = 326
      Top = 224
      Width = 215
      Height = 129
      ColCount = 3
      FixedCols = 0
      TabOrder = 2
      Visible = False
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 198
      Width = 806
      Height = 341
      Align = alClient
      Caption = #37291#24107#22225#35328
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Memo2: TMemo
        Left = 2
        Top = 23
        Width = 802
        Height = 316
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 539
      Width = 806
      Height = 43
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 4
      object BtnClose: TBitBtn
        Left = 626
        Top = 5
        Width = 93
        Height = 29
        Caption = #38626#38283
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BtnCloseClick
      end
      object BtnDel: TBitBtn
        Left = 527
        Top = 5
        Width = 93
        Height = 29
        Caption = #21034#38500#31684#26412
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = BtnDelClick
      end
      object BtnUse: TBitBtn
        Left = 432
        Top = 5
        Width = 89
        Height = 29
        Caption = #22871#29992
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BtnUseClick
      end
    end
  end
end
