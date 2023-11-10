inherited FrmOftemMed: TFrmOftemMed
  Left = -3
  Top = 32
  Caption = 'FrmOftemMed'
  ClientHeight = 668
  ClientWidth = 991
  Font.Height = -19
  OldCreateOrder = True
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnMouseUp = FormMouseUp
  PixelsPerInch = 96
  TextHeight = 19
  inherited MySBar: TStatusBar
    Top = 651
    Width = 991
  end
  object CheckBox2: TCheckBox [1]
    Left = 123
    Top = 5
    Width = 105
    Height = 25
    Caption = #37291#24107#24120#29992
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = CheckBox1Click
  end
  object CheckBox1: TCheckBox [2]
    Left = 3
    Top = 5
    Width = 105
    Height = 25
    Caption = #29273#31185#24120#29992
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = CheckBox1Click
  end
  object SGMed: TStringGrid [3]
    Left = 2
    Top = 31
    Width = 983
    Height = 618
    ColCount = 8
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 3
    OnDblClick = SGMedDblClick
    ColWidths = (
      3
      101
      328
      97
      109
      105
      107
      101)
  end
  object Button1: TButton [4]
    Left = 909
    Top = 3
    Width = 75
    Height = 25
    Caption = #38626#38283
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  inherited Timer2: TTimer
    Left = 422
  end
end
