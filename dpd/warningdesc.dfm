inherited FrmWarningdesc: TFrmWarningdesc
  Left = 468
  Top = 66
  Caption = #36942#25935#34277#29289#38283#31435#35498#26126
  ClientHeight = 679
  ClientWidth = 799
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Top = 662
    Width = 799
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 313
    Width = 799
    Height = 304
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 133
      Width = 84
      Height = 14
      Caption = #20854#20182#29702#30001#20839#23481
    end
    object Memo1: TMemo
      Left = 0
      Top = 150
      Width = 799
      Height = 152
      Color = clGray
      Enabled = False
      TabOrder = 0
    end
    object RadioGroup1: TRadioGroup
      Left = 1
      Top = 1
      Width = 797
      Height = 128
      Align = alTop
      Caption = #38283#31435#35498#26126
      Items.Strings = (
        #19981#38283#31435
        #32147#30149#20154#30149#24773#21450#29992#34277#39080#38570#35413#20272#65292#21033#22823#26044#24330
        #32147#35657#23526#38750#36942#25935#21453#25033
        #20854#20182#29702#30001)
      TabOrder = 1
      OnClick = RadioGroup1Click
    end
  end
  object WebBrowser1: TWebBrowser [2]
    Left = 0
    Top = 0
    Width = 799
    Height = 313
    Align = alTop
    TabOrder = 2
    ControlData = {
      4C00000094520000592000000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 617
    Width = 799
    Height = 45
    Align = alBottom
    TabOrder = 3
    object BtnOK: TButton
      Left = 581
      Top = 9
      Width = 75
      Height = 27
      Caption = #30906#23450
      TabOrder = 0
      OnClick = BtnOKClick
    end
    object BtnCancel: TButton
      Left = 693
      Top = 9
      Width = 75
      Height = 27
      Caption = #21462#28040
      TabOrder = 1
      OnClick = BtnCancelClick
    end
  end
end
