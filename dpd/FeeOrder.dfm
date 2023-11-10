inherited FrmFeeOrder: TFrmFeeOrder
  Left = 386
  Top = 86
  Caption = ''
  ClientHeight = 657
  ClientWidth = 930
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Top = 640
    Width = 930
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 241
    Height = 640
    Align = alLeft
    Color = 16508624
    TabOrder = 1
    object Panel4: TPanel
      Left = 1
      Top = 600
      Width = 239
      Height = 39
      Align = alBottom
      Color = 16508624
      TabOrder = 0
      object Button1: TButton
        Left = 36
        Top = 8
        Width = 75
        Height = 25
        Caption = #30906#35469
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 120
        Top = 8
        Width = 75
        Height = 25
        Caption = #38626#38283
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button2Click
      end
    end
    object SGFeeAdd: TStringGrid
      Left = 1
      Top = 1
      Width = 239
      Height = 599
      Align = alClient
      ColCount = 2
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #26032#32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnDblClick = SGFeeAddDblClick
      ColWidths = (
        2
        227)
    end
  end
  object Panel2: TPanel [2]
    Left = 241
    Top = 0
    Width = 689
    Height = 640
    Align = alClient
    Color = 16508624
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 687
      Height = 37
      Align = alTop
      BorderStyle = bsSingle
      Color = 16508624
      TabOrder = 0
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 112
        Height = 31
        Hint = 'F89000C_F89999C'
        Align = alLeft
        Caption = #35036#29273
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Panel5Click
      end
      object Panel6: TPanel
        Left = 113
        Top = 1
        Width = 112
        Height = 31
        Hint = 'F90000C_F90999C'
        Align = alLeft
        Caption = #29273#39635#30149
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Panel5Click
      end
      object Panel7: TPanel
        Left = 225
        Top = 1
        Width = 112
        Height = 31
        Hint = 'F91000C_F91999C'
        Align = alLeft
        Caption = #29273#21608#30149
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Panel5Click
      end
      object Panel8: TPanel
        Left = 337
        Top = 1
        Width = 112
        Height = 31
        Hint = 'F92000C_F92999C'
        Align = alLeft
        Caption = #21475#33108#22806#31185
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = Panel5Click
      end
      object Panel9: TPanel
        Left = 449
        Top = 1
        Width = 111
        Height = 31
        Align = alLeft
        Caption = #24120#29992#38917
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = Panel9Click
      end
    end
    object SGFee: TStringGrid
      Left = 1
      Top = 38
      Width = 687
      Height = 601
      Align = alClient
      ColCount = 4
      FixedCols = 0
      RowCount = 2
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #26032#32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnDblClick = SGFeeDblClick
      ColWidths = (
        94
        397
        88
        82)
    end
  end
  inherited Timer2: TTimer
    Left = 896
    Top = 656
  end
end
