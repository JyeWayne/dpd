object frm_calendar: Tfrm_calendar
  Left = 220
  Top = 149
  BorderStyle = bsNone
  Caption = 'Calender'
  ClientHeight = 383
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnMouseUp = FormMouseUp
  OnShow = FormShow
  PixelsPerInch = 106
  TextHeight = 13
  object SG_Month: TStringGrid
    Left = 0
    Top = 48
    Width = 322
    Height = 335
    Align = alClient
    ColCount = 7
    DefaultColWidth = 44
    DefaultRowHeight = 50
    FixedCols = 0
    RowCount = 7
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected]
    TabOrder = 0
    OnDblClick = SG_MonthDblClick
    OnDrawCell = SG_MonthDrawCell
    OnSelectCell = SG_MonthSelectCell
    ColWidths = (
      47
      44
      44
      44
      44
      44
      44)
    RowHeights = (
      24
      50
      50
      50
      50
      50
      50)
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 322
    Height = 48
    Align = alTop
    Color = 16749513
    TabOrder = 1
    OnMouseDown = FormMouseDown
    OnMouseMove = FormMouseMove
    OnMouseUp = FormMouseUp
    object lbl_y: TLabel
      Left = 122
      Top = 27
      Width = 8
      Height = 16
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #27161#26999#39636
      Font.Style = []
      ParentFont = False
    end
    object lbl_y_n: TLabel
      Left = 155
      Top = 27
      Width = 17
      Height = 16
      Caption = #24180
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #27161#26999#39636
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_m_n: TLabel
      Left = 187
      Top = 26
      Width = 17
      Height = 16
      Caption = #26376
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #27161#26999#39636
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_m: TLabel
      Left = 173
      Top = 25
      Width = 4
      Height = 19
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object btn_premonth: TButton
      Left = 40
      Top = 21
      Width = 75
      Height = 25
      Caption = #19978#19968#20491#26376
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #27161#26999#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btn_premonthClick
    end
    object btn_nextmonth: TButton
      Left = 210
      Top = 21
      Width = 75
      Height = 25
      Caption = #19979#19968#20491#26376
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #27161#26999#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btn_nextmonthClick
    end
    object p_menu: TPanel
      Left = 1
      Top = 1
      Width = 320
      Height = 17
      Align = alTop
      Caption = 'Calendar'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnMouseDown = FormMouseDown
      OnMouseMove = FormMouseMove
      OnMouseUp = FormMouseUp
      object img_close: TImage
        Left = 302
        Top = 2
        Width = 16
        Height = 14
        AutoSize = True
        Picture.Data = {
          07544269746D6170D6020000424DD60200000000000036000000280000001000
          00000E0000000100180000000000A00200000000000000000000000000000000
          0000404040404040404040404040404040404040404040404040404040404040
          404040404040404040404040404040404040FFFFFF8080808080808080808080
          8080808080808080808080808080808080808080808080808080808080808040
          4040FFFFFFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4808080404040FFFFFFC8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808040
          4040FFFFFFC8D0D4C8D0D4C8D0D4000000000000C8D0D4C8D0D4C8D0D4C8D0D4
          000000000000C8D0D4C8D0D4808080404040FFFFFFC8D0D4C8D0D4C8D0D4C8D0
          D4000000000000C8D0D4C8D0D4000000000000C8D0D4C8D0D4C8D0D480808040
          4040FFFFFFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000000000000000000000
          C8D0D4C8D0D4C8D0D4C8D0D4808080404040FFFFFFC8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4000000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808040
          4040FFFFFFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000000000000000000000
          C8D0D4C8D0D4C8D0D4C8D0D4808080404040FFFFFFC8D0D4C8D0D4C8D0D4C8D0
          D4000000000000C8D0D4C8D0D4000000000000C8D0D4C8D0D4C8D0D480808040
          4040FFFFFFC8D0D4C8D0D4C8D0D4000000000000C8D0D4C8D0D4C8D0D4C8D0D4
          000000000000C8D0D4C8D0D4808080404040FFFFFFC8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808040
          4040FFFFFFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4808080404040FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40
          4040}
        OnClick = img_closeClick
      end
    end
  end
end
