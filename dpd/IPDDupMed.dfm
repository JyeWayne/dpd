inherited FrmIPDDupMed: TFrmIPDDupMed
  Tag = 9999
  Left = 450
  Top = 59
  Caption = 'FrmIPDDupMed'
  ClientWidth = 800
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Width = 800
  end
  object Panel4: TPanel [1]
    Left = 0
    Top = 0
    Width = 800
    Height = 631
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    Caption = 'Panel4'
    Color = 10977592
    TabOrder = 1
    object Panel3: TPanel
      Left = 4
      Top = 4
      Width = 792
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 12
      Color = clNavy
      TabOrder = 0
      object Panel5: TPanel
        Left = 12
        Top = 12
        Width = 768
        Height = 33
        Align = alClient
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = #37325'  '#35206'  '#29992'  '#34277'  '#35686'  '#31034
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -21
        Font.Name = #32048#26126#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      Left = 4
      Top = 555
      Width = 792
      Height = 72
      Align = alBottom
      BevelOuter = bvNone
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object but1: TBitBtn
        Tag = 6
        Left = 8
        Top = 8
        Width = 329
        Height = 25
        Hint = '1'
        Caption = #25105#27794#27880#24847#21040' , '#22238#21435#20462#25913#37291#22225
        TabOrder = 0
        OnClick = but1Click
      end
      object but3: TBitBtn
        Left = 344
        Top = 8
        Width = 441
        Height = 25
        Hint = '2'
        Caption = #25105#30693#36947#21487#33021#26377#39080#38570#65292#20294#30446#21069#24773#27841#19979#20173#24517#38920#20351#29992#65292#30906#23450#38283#31435
        TabOrder = 1
        OnClick = but1Click
      end
      object but4: TBitBtn
        Tag = 6
        Left = 8
        Top = 40
        Width = 777
        Height = 25
        Hint = '3'
        Caption = #25913#28858#33258#36027
        TabOrder = 2
        OnClick = but1Click
      end
    end
    object RichEdit1: TRichEdit
      Left = 4
      Top = 61
      Width = 792
      Height = 494
      Align = alClient
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
end
