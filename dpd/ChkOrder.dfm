inherited FrmChkOrder: TFrmChkOrder
  Left = 310
  Top = 114
  Caption = 'FrmChkOrder'
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox [1]
    Left = 0
    Top = 0
    Width = 939
    Height = 137
    Align = alTop
    Caption = #27298#26597#23460
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object CBRoom: TCheckListBox
      Left = 2
      Top = 18
      Width = 935
      Height = 117
      OnClickCheck = CBRoomClickCheck
      Align = alClient
      BorderStyle = bsNone
      Columns = 4
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #26032#32048#26126#39636
      Font.Style = [fsBold]
      ItemHeight = 20
      ParentColor = True
      ParentFont = False
      TabOrder = 0
      OnMouseDown = CBRoomMouseDown
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 137
    Width = 939
    Height = 35
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 2
    object Label1: TLabel
      Left = 9
      Top = 10
      Width = 80
      Height = 16
      Caption = #24555#36895#26597#35426' :'
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 101
      Top = 10
      Width = 80
      Height = 16
      Caption = #20381#38498#20839#20195#30908
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 309
      Top = 9
      Width = 80
      Height = 16
      Caption = #20381#27298#26597#21517#31281
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
    end
    object EdtFeeCode: TEdit
      Left = 199
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
      TabOrder = 0
      OnChange = EdtFeeCodeChange
      OnKeyDown = EdtFeeCodeKeyDown
    end
    object EdtFeeName: TEdit
      Left = 406
      Top = 4
      Width = 325
      Height = 28
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #26032#32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = EdtFeeNameChange
    end
    object CheckBox1: TCheckBox
      Left = 763
      Top = 8
      Width = 117
      Height = 19
      Caption = #38480#23450#27298#26597#23460
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 172
    Width = 939
    Height = 459
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 3
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 240
      Height = 457
      Align = alLeft
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 1
        Top = 422
        Width = 238
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        Color = clTeal
        ParentColor = False
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 238
        Height = 421
        Align = alClient
        Caption = 'Panel4'
        TabOrder = 0
        object SGPreOrder: TStringGrid
          Left = 1
          Top = 1
          Width = 236
          Height = 419
          Align = alClient
          DefaultRowHeight = 21
          FixedCols = 0
          RowCount = 2
          Font.Charset = CHINESEBIG5_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #32048#26126#39636
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
          ParentFont = False
          TabOrder = 0
          OnDblClick = SGPreOrderDblClick
          ColWidths = (
            4
            3
            3
            143
            59)
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 425
        Width = 238
        Height = 31
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object BitBtn1: TBitBtn
          Left = 86
          Top = 4
          Width = 66
          Height = 22
          Caption = #30906#23450
          Font.Charset = CHINESEBIG5_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #32048#26126#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 161
          Top = 4
          Width = 66
          Height = 22
          Caption = #38626#38283
          Font.Charset = CHINESEBIG5_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #32048#26126#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn2Click
        end
      end
    end
    object SGChkOrder: TStringGrid
      Left = 241
      Top = 1
      Width = 697
      Height = 457
      Align = alClient
      ColCount = 3
      FixedCols = 0
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #32048#26126#39636
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      ParentFont = False
      TabOrder = 1
      OnDblClick = SGChkOrderDblClick
      ColWidths = (
        502
        108
        136)
    end
  end
  inherited XPManifest1: TXPManifest
    Left = 872
    Top = 24
  end
end
