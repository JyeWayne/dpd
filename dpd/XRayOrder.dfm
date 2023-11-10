inherited FrmXRayOrder: TFrmXRayOrder
  Left = 318
  Top = 150
  Caption = 'FrmXRayOrder'
  ClientHeight = 680
  ClientWidth = 1003
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Top = 663
    Width = 1003
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 265
    Height = 663
    Align = alLeft
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object RadioGroup1: TRadioGroup
      Left = 0
      Top = 0
      Width = 265
      Height = 137
      Align = alTop
      Caption = #39006#22411
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #32048#26126#39636
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 137
      Width = 265
      Height = 490
      Align = alClient
      Caption = #38283#31435#38917#30446
      TabOrder = 1
      object SgPreOrder: TStringGrid
        Left = 2
        Top = 16
        Width = 261
        Height = 472
        Align = alClient
        ColCount = 7
        DefaultRowHeight = 21
        FixedCols = 0
        RowCount = 2
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = [fsBold]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        ParentFont = False
        TabOrder = 0
        OnDblClick = SgPreOrderDblClick
        ColWidths = (
          3
          3
          2
          266
          5
          5
          5)
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 627
      Width = 265
      Height = 36
      Align = alBottom
      TabOrder = 2
      object BitBtn1: TBitBtn
        Left = 176
        Top = 7
        Width = 66
        Height = 22
        Caption = #38626#38283
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
        Left = 102
        Top = 7
        Width = 66
        Height = 22
        Caption = #30906#35469
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
  object Panel2: TPanel [2]
    Left = 265
    Top = 0
    Width = 738
    Height = 663
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    ParentColor = True
    TabOrder = 2
    object Panel3: TPanel
      Left = 0
      Top = 109
      Width = 738
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object Label1: TLabel
        Left = 3
        Top = 7
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
      object Label2: TLabel
        Left = 211
        Top = 7
        Width = 80
        Height = 16
        Caption = #20381#38917#30446#21517#31281
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
      end
      object EdtFeeCode: TEdit
        Left = 98
        Top = 1
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
        OnKeyDown = EdtFeeNameKeyDown
      end
      object EdtFeeName: TEdit
        Left = 307
        Top = 1
        Width = 222
        Height = 28
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #26032#32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = EdtFeeNameChange
        OnKeyDown = EdtFeeNameKeyDown
      end
      object CheckBox1: TCheckBox
        Left = 643
        Top = 5
        Width = 82
        Height = 20
        Caption = #20381#39006#22411
        Checked = True
        Enabled = False
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 2
        Visible = False
      end
      object CheckBox2: TCheckBox
        Left = 534
        Top = 5
        Width = 81
        Height = 22
        Caption = #20381#37096#20301
        Checked = True
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 3
      end
    end
    object SGOrder: TStringGrid
      Left = 0
      Top = 137
      Width = 738
      Height = 526
      Align = alClient
      ColCount = 7
      DefaultRowHeight = 21
      FixedCols = 0
      RowCount = 2
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #32048#26126#39636
      Font.Style = [fsBold]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      ParentFont = False
      TabOrder = 1
      OnDblClick = SGOrderDblClick
      ColWidths = (
        2
        85
        92
        394
        2
        132
        2)
    end
    object GroupBox3: TGroupBox
      Left = 0
      Top = 0
      Width = 738
      Height = 109
      Align = alTop
      Caption = #37096#20301
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #32048#26126#39636
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object CBXPath: TCheckListBox
        Left = 2
        Top = 18
        Width = 734
        Height = 89
        Align = alClient
        BorderStyle = bsNone
        Columns = 3
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = [fsBold]
        ItemHeight = 20
        ParentColor = True
        ParentFont = False
        TabOrder = 0
        OnMouseDown = CBXPathMouseDown
      end
    end
  end
end
