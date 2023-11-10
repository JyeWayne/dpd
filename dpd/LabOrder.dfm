inherited FrmLabOrder: TFrmLabOrder
  Left = 239
  Top = 60
  Caption = 'FrmLabOrder'
  ClientHeight = 601
  ClientWidth = 979
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Top = 584
    Width = 979
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 148
    Width = 979
    Height = 436
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 231
      Height = 434
      Align = alLeft
      BorderWidth = 3
      ParentColor = True
      TabOrder = 0
      object SGPreOrder: TStringGrid
        Left = 4
        Top = 4
        Width = 223
        Height = 261
        Align = alTop
        DefaultRowHeight = 21
        FixedCols = 0
        RowCount = 2
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #26032#32048#26126#39636
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        ParentFont = False
        TabOrder = 0
        OnDblClick = SGPreOrderDblClick
        ColWidths = (
          2
          2
          2
          220
          64)
      end
      object GroupBox3: TGroupBox
        Left = 4
        Top = 265
        Width = 223
        Height = 118
        Align = alClient
        Caption = #35498#26126
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object mymemo: TMemo
          Left = 2
          Top = 18
          Width = 219
          Height = 98
          Align = alClient
          TabOrder = 0
        end
      end
      object Panel6: TPanel
        Left = 4
        Top = 383
        Width = 223
        Height = 47
        Align = alBottom
        TabOrder = 2
        object BitBtn1: TBitBtn
          Left = 150
          Top = 12
          Width = 66
          Height = 22
          Caption = #38626#38283
          Font.Charset = CHINESEBIG5_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #26032#32048#26126#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 75
          Top = 12
          Width = 66
          Height = 22
          Caption = #30906#23450
          Font.Charset = CHINESEBIG5_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #26032#32048#26126#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn2Click
        end
      end
    end
    object SGLabOrder: TStringGrid
      Left = 232
      Top = 1
      Width = 746
      Height = 434
      Align = alClient
      ColCount = 6
      DefaultRowHeight = 21
      FixedCols = 0
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #26032#32048#26126#39636
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      ParentFont = False
      TabOrder = 1
      OnDblClick = SGLabOrderDblClick
      OnDrawCell = SGLabOrderDrawCell
      ColWidths = (
        74
        80
        78
        483
        3
        64)
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 0
    Width = 979
    Height = 148
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    Caption = 'Panel3'
    ParentColor = True
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 3
      Top = 3
      Width = 229
      Height = 142
      Align = alLeft
      Caption = #32068#21029
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = #32048#26126#39636
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object CBLabGroup: TCheckListBox
        Left = 2
        Top = 18
        Width = 225
        Height = 122
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #26032#32048#26126#39636
        Font.Style = []
        ItemHeight = 20
        ParentColor = True
        ParentFont = False
        TabOrder = 0
        OnClick = CBLabGroupClick
        OnMouseDown = CBLabGroupMouseDown
      end
    end
    object Panel5: TPanel
      Left = 232
      Top = 3
      Width = 744
      Height = 142
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel5'
      ParentColor = True
      TabOrder = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 744
        Height = 111
        Align = alClient
        Caption = #27298#39636
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object CBLabSample: TCheckListBox
          Left = 2
          Top = 18
          Width = 740
          Height = 91
          Align = alClient
          BorderStyle = bsNone
          Color = 16508624
          Columns = 4
          Font.Charset = CHINESEBIG5_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #26032#32048#26126#39636
          Font.Style = []
          ItemHeight = 20
          ParentFont = False
          TabOrder = 0
          OnClick = CBLabSampleClick
          OnMouseDown = CBLabGroupMouseDown
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 111
        Width = 744
        Height = 31
        Align = alBottom
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        object Label2: TLabel
          Left = 1
          Top = 7
          Width = 64
          Height = 16
          Caption = #38498#20839#20195#30908
          Font.Charset = CHINESEBIG5_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #26032#32048#26126#39636
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 186
          Top = 7
          Width = 64
          Height = 16
          Caption = #38917#30446#21517#31281
          Font.Charset = CHINESEBIG5_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #26032#32048#26126#39636
          Font.Style = []
          ParentFont = False
        end
        object CheckBox1: TCheckBox
          Left = 458
          Top = 7
          Width = 85
          Height = 20
          Caption = #20381#32068#21029
          Font.Charset = CHINESEBIG5_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #26032#32048#26126#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object CheckBox2: TCheckBox
          Left = 537
          Top = 7
          Width = 85
          Height = 20
          Caption = #20381#27298#39636
          Font.Charset = CHINESEBIG5_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #26032#32048#26126#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object EdtFeeCode: TEdit
          Left = 77
          Top = 4
          Width = 106
          Height = 28
          CharCase = ecUpperCase
          Font.Charset = CHINESEBIG5_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #26032#32048#26126#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = EdtFeeCodeChange
          OnKeyDown = EdtFeeCodeKeyDown
        end
        object EdtFeeName: TEdit
          Left = 264
          Top = 4
          Width = 188
          Height = 28
          Font.Charset = CHINESEBIG5_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #26032#32048#26126#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = EdtFeeNameChange
          OnKeyDown = EdtFeeCodeKeyDown
        end
        object CheckBox3: TCheckBox
          Left = 620
          Top = 8
          Width = 114
          Height = 17
          Caption = #21487#24613#20316#38917#30446
          Font.Charset = CHINESEBIG5_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #26032#32048#26126#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = CheckBox3Click
        end
      end
    end
  end
  inherited XPManifest1: TXPManifest
    Left = 832
    Top = 8
  end
end
