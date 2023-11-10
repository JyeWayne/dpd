inherited FrmNowUsedMed: TFrmNowUsedMed
  Tag = 9999
  Left = 460
  Top = 207
  Caption = #29694#22312#29992#34277
  ClientHeight = 514
  ClientWidth = 934
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  object Shape1: TShape [0]
    Left = 0
    Top = 0
    Width = 934
    Height = 25
    Align = alTop
    Brush.Color = 13303807
    ParentShowHint = False
    Pen.Color = clNavy
    Shape = stRoundRect
    ShowHint = False
  end
  object lab_nowused: TLabel [1]
    Left = 11
    Top = 3
    Width = 96
    Height = 16
    Caption = #38498#20839#30446#21069#29992#34277
    Color = 13303807
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #27161#26999#39636
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Shape2: TShape [2]
    Left = 0
    Top = 227
    Width = 934
    Height = 25
    Align = alTop
    Brush.Color = 12189647
    Pen.Color = clNavy
    Shape = stRoundRect
  end
  object lab_self: TLabel [3]
    Left = 11
    Top = 231
    Width = 256
    Height = 16
    Caption = #38498#22806#33258#20633#34277#21697'('#21547#20013#33609#34277#12289#20581#24247#39135#21697')'
    Color = 12189647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #27161#26999#39636
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  inherited MySBar: TStatusBar
    Top = 497
    Width = 934
  end
  object pan_nowused: TPanel [5]
    Left = 0
    Top = 25
    Width = 934
    Height = 202
    Align = alTop
    TabOrder = 1
    object sg_nowused: TStringGrid
      Left = 1
      Top = 26
      Width = 932
      Height = 175
      Align = alClient
      ColCount = 11
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      ScrollBars = ssVertical
      TabOrder = 0
      OnDblClick = sg_nowusedDblClick
      OnSelectCell = sg_nowusedSelectCell
      ColWidths = (
        57
        59
        419
        59
        59
        58
        60
        128
        0
        0
        0)
    end
    object hc_nowused: THeaderControl
      Left = 1
      Top = 1
      Width = 932
      Height = 25
      Enabled = False
      Sections = <
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #26085#26399
          Width = 60
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #20358#28304
          Width = 60
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #34277#21517
          Width = 420
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #27425#37327
          Width = 60
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #38971#29575
          Width = 60
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #22825#25976
          Width = 60
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #37291#24107
          Width = 60
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #26159#21542#27839#29992
          Width = 130
        end>
    end
    object cb_used: TComboBox
      Left = 782
      Top = 29
      Width = 128
      Height = 22
      ItemHeight = 14
      TabOrder = 2
      Text = #30149#24773#25913#35722#19981#36969#29992
      Visible = False
      OnChange = cb_usedChange
      OnExit = cb_usedChange
      Items.Strings = (
        #27839#29992
        #30149#24773#25913#35722#19981#36969#29992
        #29983#29702#29376#27841#19981#31337
        #20581#20445#26781#20214#19981#31526#21512
        #20854#20182)
    end
  end
  object pan_self: TPanel [6]
    Left = 0
    Top = 252
    Width = 934
    Height = 209
    Align = alTop
    TabOrder = 2
    object sg_self: TStringGrid
      Left = 1
      Top = 26
      Width = 932
      Height = 182
      Align = alClient
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
      ScrollBars = ssVertical
      TabOrder = 0
      OnDblClick = sg_selfDblClick
      OnDrawCell = sg_selfDrawCell
      OnKeyPress = sg_selfKeyPress
      OnKeyUp = sg_selfKeyUp
      OnSelectCell = sg_nowusedSelectCell
      ColWidths = (
        597
        78
        149
        79
        0)
    end
    object hc_self: THeaderControl
      Left = 1
      Top = 1
      Width = 932
      Height = 25
      Enabled = False
      Sections = <
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #34277#21517#35498#26126
          Width = 600
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #22635#34920#37291#24107
          Width = 80
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #22635#34920#26178#38291
          Width = 149
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #26159#21542#27839#29992
          Width = 80
        end>
    end
    object cb_used2: TComboBox
      Left = 831
      Top = 30
      Width = 79
      Height = 22
      ItemHeight = 14
      TabOrder = 2
      Text = #19981#27839#29992
      Visible = False
      OnChange = cb_usedChange
      OnExit = cb_usedChange
      Items.Strings = (
        #19981#27839#29992
        #27839#29992)
    end
  end
  object but_confirm: TBitBtn [7]
    Left = 530
    Top = 465
    Width = 106
    Height = 28
    Caption = #30906#23450
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = #27161#26999#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = but_confirmClick
  end
  object but_exit: TBitBtn [8]
    Left = 640
    Top = 465
    Width = 106
    Height = 28
    Caption = #26283#19981#35413#20272
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clPurple
    Font.Height = -16
    Font.Name = #27161#26999#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = but_exitClick
  end
  object butNoMed: TBitBtn [9]
    Left = 750
    Top = 465
    Width = 149
    Height = 28
    Caption = #30149#20154#30446#21069#28961#29992#34277
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = #27161#26999#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = butNoMedClick
  end
  inherited Timer2: TTimer
    Left = 1000
    Top = 576
  end
end
