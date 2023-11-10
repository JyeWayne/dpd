inherited FrmSpec: TFrmSpec
  Tag = 9999
  Left = 276
  Top = 130
  Caption = #29305#27530#35387#35352
  ClientHeight = 414
  ClientWidth = 713
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Top = 397
    Width = 713
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 713
    Height = 57
    Align = alTop
    Caption = #25552'  '#31034'  '#35338'  '#24687
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 280
    Width = 713
    Height = 117
    Align = alBottom
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = #27161#26999#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 63
      Height = 17
      Caption = #35498' '#26126' :'
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 88
      Top = 12
      Width = 521
      Height = 26
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 87
      Top = 64
      Width = 75
      Height = 34
      Caption = #9675
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #27161#26999#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 183
      Top = 64
      Width = 75
      Height = 34
      Caption = #9679
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #27161#26999#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 347
      Top = 64
      Width = 75
      Height = 34
      Caption = #9734
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #27161#26999#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 435
      Top = 64
      Width = 75
      Height = 34
      Caption = #9733
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #27161#26999#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 584
      Top = 64
      Width = 83
      Height = 34
      Caption = #38364#38281
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn5Click
    end
  end
  object Panel3: TPanel [3]
    Left = 0
    Top = 57
    Width = 713
    Height = 223
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 3
    object StringGrid1: TStringGrid
      Left = 0
      Top = 0
      Width = 713
      Height = 223
      Align = alClient
      ColCount = 4
      FixedCols = 0
      RowCount = 2
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ColWidths = (
        70
        96
        461
        64)
    end
  end
end
