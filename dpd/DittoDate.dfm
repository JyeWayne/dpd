inherited FrmDittoDate: TFrmDittoDate
  Left = 384
  Top = 114
  Caption = #23601#35386#26085#26399#26597#35426
  ClientHeight = 608
  ClientWidth = 389
  OldCreateOrder = True
  PixelsPerInch = 106
  TextHeight = 15
  inherited MySBar: TStatusBar
    Top = 591
    Width = 389
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 389
    Height = 35
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 80
      Top = 4
      Width = 11
      Height = 22
      Caption = '~'
      Color = 13419696
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Button1: TButton
      Left = 300
      Top = 4
      Width = 85
      Height = 27
      Caption = #24118#20837#37291#22225
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #26032#32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object CheckBox1: TCheckBox
      Left = 235
      Top = 9
      Width = 60
      Height = 18
      Caption = #26412#31185
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object mask_begday: TMaskEdit
      Left = 2
      Top = 4
      Width = 76
      Height = 25
      Color = 13419696
      EditMask = '###/##/##;0;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #26032#32048#26126#39636
      Font.Style = []
      ImeMode = imClose
      MaxLength = 9
      ParentFont = False
      TabOrder = 2
    end
    object mask_endday: TMaskEdit
      Left = 94
      Top = 4
      Width = 81
      Height = 25
      Color = 13419696
      EditMask = '###/##/##;0;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #26032#32048#26126#39636
      Font.Style = []
      ImeMode = imClose
      MaxLength = 9
      ParentFont = False
      TabOrder = 3
    end
    object Button2: TButton
      Left = 180
      Top = 4
      Width = 44
      Height = 27
      Caption = #26597#35426
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #26032#32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object SGOpd: TStringGrid [2]
    Tag = 777
    Left = 0
    Top = 35
    Width = 389
    Height = 309
    Align = alTop
    Color = 13369085
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = SGOpdClick
    OnDrawCell = SGOpdDrawCell
    ColWidths = (
      27
      88
      131
      85)
  end
  object SGIPD: TStringGrid [3]
    Tag = 777
    Left = 0
    Top = 344
    Width = 389
    Height = 247
    Align = alClient
    Color = 13369085
    FixedCols = 0
    RowCount = 2
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = SGOpdClick
    OnDrawCell = SGOpdDrawCell
    ColWidths = (
      27
      88
      91
      122
      64)
  end
end
