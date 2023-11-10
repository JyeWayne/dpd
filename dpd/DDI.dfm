inherited FrmDDI: TFrmDDI
  Left = 287
  Top = 41
  Caption = 'FrmDDI'
  ClientHeight = 609
  ClientWidth = 803
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Top = 592
    Width = 803
  end
  object Panel4: TPanel [1]
    Left = 0
    Top = 0
    Width = 800
    Height = 585
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
        Caption = 'Drug Interaction Alert'
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
      Top = 445
      Width = 792
      Height = 136
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
        Hint = '01'
        Caption = #25105#27794#27880#24847#21040' , '#22238#21435#20462#25913#37291#22225
        TabOrder = 0
        OnClick = but1Click
      end
      object but2: TBitBtn
        Tag = 6
        Left = 8
        Top = 40
        Width = 329
        Height = 25
        Hint = '02'
        Caption = #25105#19981#30693#26377#27492#20132#20114#20316#29992' , '#22238#21435#20462#25913#29992#34277
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 8
        Top = 72
        Width = 329
        Height = 25
        Hint = '06'
        Caption = #25105#21051#24847#21033#29992#27492#20132#20114#20316#29992#22686#21152#33256#24202#25928#26524#65292#32380#32396'....'
        TabOrder = 2
      end
      object but3: TBitBtn
        Left = 344
        Top = 8
        Width = 441
        Height = 25
        Hint = '03'
        Caption = #25105#19981#35469#28858#26377#27492#20132#20114#20316#29992' , '#32380#32396'...'
        TabOrder = 3
      end
      object but4: TBitBtn
        Left = 344
        Top = 40
        Width = 441
        Height = 25
        Hint = '04'
        Caption = #21487#33021#26377#27492#20132#20114#20316#29992' , '#20294#22312#27492#24773#27841#20043#19979#26412#37291#22225#20173#26159#24517#35201#30340' , '#32380#32396' ...'
        TabOrder = 4
      end
      object but5: TBitBtn
        Left = 344
        Top = 72
        Width = 441
        Height = 25
        Hint = '05'
        Caption = #25105#22826#24537#20102' , '#36339#36942' ! '#32380#32396' ...'
        TabOrder = 5
      end
      object but7: TBitBtn
        Left = 8
        Top = 104
        Width = 777
        Height = 25
        Hint = '07'
        Caption = #21487#33021#26377#27492#20132#20114#20316#29992#65292#20294#21137#37327#24050#32147#35519#25972#65292#21487#32380#32396#20351#29992#65292#32380#32396'....'
        TabOrder = 6
      end
    end
    object RichEdit1: TRichEdit
      Left = 4
      Top = 61
      Width = 792
      Height = 384
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
