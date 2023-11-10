inherited FrmLagReport: TFrmLagReport
  Left = 351
  Top = 139
  Caption = #27298#39511#22577#21578#26597#35426
  ClientHeight = 744
  ClientWidth = 1002
  OldCreateOrder = True
  PixelsPerInch = 106
  TextHeight = 15
  inherited MySBar: TStatusBar
    Top = 727
    Width = 1002
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 1002
    Height = 77
    Align = alTop
    Color = 16508624
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 232
      Height = 75
      Align = alLeft
      BorderStyle = bsSingle
      Color = 16508624
      TabOrder = 0
      object Label2: TLabel
        Left = 29
        Top = 42
        Width = 46
        Height = 21
        Caption = #22995#21517
        Font.Charset = ANSI_CHARSET
        Font.Color = clBackground
        Font.Height = -21
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 5
        Top = 9
        Width = 69
        Height = 21
        Caption = #30149#27511#34399
        Font.Charset = ANSI_CHARSET
        Font.Color = clBackground
        Font.Height = -21
        Font.Name = #27161#26999#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtChrNo: TEdit
        Tag = 999
        Left = 80
        Top = 6
        Width = 138
        Height = 26
        Enabled = False
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object EdtPatName: TEdit
        Tag = 999
        Left = 80
        Top = 39
        Width = 138
        Height = 26
        Enabled = False
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 233
      Top = 1
      Width = 768
      Height = 75
      Align = alClient
      Color = 16508624
      TabOrder = 1
      object Button2: TButton
        Left = 665
        Top = 41
        Width = 89
        Height = 27
        Caption = #38626#38283
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button2Click
      end
    end
  end
  object SGOpd: TStringGrid [2]
    Tag = 777
    Left = 0
    Top = 77
    Width = 233
    Height = 650
    Align = alLeft
    Color = 13369085
    ColCount = 4
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 2
    ColWidths = (
      63
      64
      64
      64)
  end
  object Memo1: TMemo [3]
    Left = 233
    Top = 77
    Width = 769
    Height = 650
    Align = alClient
    TabOrder = 3
  end
end
