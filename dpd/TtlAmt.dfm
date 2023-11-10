inherited FrmTtlAmt: TFrmTtlAmt
  Left = 228
  Top = 43
  Caption = #30149#20154#35442#27425#23601#37291#26126#32048
  ClientHeight = 670
  OldCreateOrder = True
  PixelsPerInch = 106
  TextHeight = 15
  inherited MySBar: TStatusBar
    Top = 653
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 1006
    Height = 44
    Align = alTop
    Caption = #37291' '#20196' '#38917' '#30446' '#37329' '#38989
    Color = 16508624
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = #27161#26999#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 610
    Width = 1006
    Height = 43
    Align = alBottom
    Color = 16508624
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = #27161#26999#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Button1: TButton
      Left = 763
      Top = 11
      Width = 80
      Height = 27
      Caption = #38364#38281
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object SGMed: TStringGrid [3]
    Left = 0
    Top = 44
    Width = 1006
    Height = 284
    Align = alClient
    ColCount = 9
    FixedCols = 0
    RowCount = 2
    TabOrder = 3
    ColWidths = (
      86
      281
      64
      64
      64
      64
      64
      64
      92)
  end
  object SGFee: TStringGrid [4]
    Left = 0
    Top = 328
    Width = 1006
    Height = 282
    Align = alBottom
    ColCount = 9
    FixedCols = 0
    RowCount = 2
    TabOrder = 4
    ColWidths = (
      86
      281
      64
      64
      64
      64
      64
      64
      92)
  end
end
