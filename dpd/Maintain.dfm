inherited FrmMaintain: TFrmMaintain
  Left = 183
  Top = 104
  BorderIcons = [biSystemMenu]
  Caption = ''
  ClientHeight = 550
  ClientWidth = 879
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Top = 533
    Width = 879
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 879
    Height = 241
    Align = alTop
    Color = 16508624
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 211
      Width = 877
      Height = 29
      Align = alBottom
      BorderStyle = bsSingle
      Color = 16508624
      TabOrder = 0
      object Button1: TButton
        Left = 0
        Top = 0
        Width = 75
        Height = 25
        Caption = #20786#23384
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button3: TButton
        Left = 74
        Top = 0
        Width = 75
        Height = 25
        Caption = #26032#22686
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button2: TButton
        Left = 148
        Top = 0
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
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 877
      Height = 210
      Align = alClient
      Color = 16508624
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 70
        Height = 27
        Caption = #21729#32232':'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 56
        Width = 70
        Height = 27
        Caption = #22995#21517':'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 98
        Width = 70
        Height = 27
        Caption = #23494#30908':'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 48
        Top = 148
        Width = 126
        Height = 27
        Caption = #38626#32887#26085#26399':'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 232
        Top = 13
        Width = 126
        Height = 27
        Caption = #35686#31034#37329#38989':'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 232
        Top = 56
        Width = 126
        Height = 27
        Caption = #38459#26039#37329#38989':'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 600
        Top = 146
        Width = 126
        Height = 27
        Caption = #31185#21029#20195#30908':'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label8: TLabel
        Left = 504
        Top = 14
        Width = 98
        Height = 27
        Caption = #37291#24107#21029':'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 504
        Top = 54
        Width = 98
        Height = 27
        Caption = #36681#35386#21029':'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Ckb_Leave: TCheckBox
        Left = 25
        Top = 154
        Width = 17
        Height = 17
        TabOrder = 0
      end
      object Edt_ID: TEdit
        Left = 85
        Top = 19
        Width = 132
        Height = 31
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = Edt_IDChange
        OnKeyPress = FormKeyPress
      end
      object Edt_Name: TEdit
        Left = 85
        Top = 58
        Width = 132
        Height = 29
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Edt_PSW: TEdit
        Left = 85
        Top = 101
        Width = 132
        Height = 31
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object Edt_LeaveDate: TEdit
        Left = 173
        Top = 151
        Width = 132
        Height = 31
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object Edt_Amt1: TEdit
        Left = 357
        Top = 16
        Width = 132
        Height = 31
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object Edt_Amt2: TEdit
        Left = 357
        Top = 59
        Width = 132
        Height = 31
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object Edt_Dept: TEdit
        Left = 725
        Top = 148
        Width = 132
        Height = 31
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object Cmb_doc: TComboBox
        Left = 601
        Top = 16
        Width = 148
        Height = 28
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #27161#26999#39636
        Font.Style = []
        ItemHeight = 20
        ItemIndex = 0
        ParentFont = False
        TabOrder = 8
        Text = 'D_'#19968#33324#37291#24107
        Items.Strings = (
          'D_'#19968#33324#37291#24107
          'T_'#32317#37291#24107
          'V_'#20027#27835#37291#24107
          'A_'#32173#35703#31649#29702#32773)
      end
      object Cmb_Trans: TComboBox
        Left = 601
        Top = 56
        Width = 208
        Height = 28
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #27161#26999#39636
        Font.Style = []
        ItemHeight = 20
        ItemIndex = 0
        ParentFont = False
        TabOrder = 9
        Text = 'N_'#19981#21487#30003#22577#36681#35386#37291#24107
        Items.Strings = (
          'N_'#19981#21487#30003#22577#36681#35386#37291#24107
          'Y_'#21487#30003#22577#36681#35386#37291#24107)
      end
      object Ckb_DecDoc: TCheckBox
        Left = 324
        Top = 151
        Width = 121
        Height = 25
        Caption = #30003#22577#37291#24107
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object Ckb_PbmDoc: TCheckBox
        Left = 460
        Top = 151
        Width = 121
        Height = 25
        Caption = #21839#38988#37291#24107
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
    end
  end
  object HG_DOCList: THyperGrid [2]
    Left = 0
    Top = 241
    Width = 879
    Height = 292
    Align = alClient
    ColCount = 12
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 2
    TabOrder = 2
    OnDblClick = HG_DOCListDblClick
    OnSelectCell = HG_DOCListSelectCell
    Columns = <
      item
        Caption = #21729#32232
        Name = 'Column 1'
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #27161#26999#39636
        TitleFont.Style = []
        TitleParentFont = False
        ColumnFont.Charset = ANSI_CHARSET
        ColumnFont.Color = clWindowText
        ColumnFont.Height = -16
        ColumnFont.Name = #27161#26999#39636
        ColumnFont.Style = []
        ColumnParentFont = False
      end
      item
        Caption = #23494#30908
        Name = 'Column 2'
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #27161#26999#39636
        TitleFont.Style = []
        TitleParentFont = False
        ColumnFont.Charset = ANSI_CHARSET
        ColumnFont.Color = clWindowText
        ColumnFont.Height = -16
        ColumnFont.Name = #27161#26999#39636
        ColumnFont.Style = []
        ColumnParentFont = False
      end
      item
        Caption = #22995#21517
        Name = 'Column 3'
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #27161#26999#39636
        TitleFont.Style = []
        TitleParentFont = False
        ColumnFont.Charset = ANSI_CHARSET
        ColumnFont.Color = clWindowText
        ColumnFont.Height = -16
        ColumnFont.Name = #27161#26999#39636
        ColumnFont.Style = []
        ColumnParentFont = False
      end
      item
        Caption = #21487#21542#30003#22577
        Name = 'Column 4'
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #27161#26999#39636
        TitleFont.Style = []
        TitleParentFont = False
      end
      item
        Caption = #26159#21542#21839#38988
        Name = 'Column 5'
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #27161#26999#39636
        TitleFont.Style = []
        TitleParentFont = False
      end
      item
        Caption = #38626#32887#26085
        Name = 'Column 6'
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #27161#26999#39636
        TitleFont.Style = []
        TitleParentFont = False
        ColumnFont.Charset = ANSI_CHARSET
        ColumnFont.Color = clWindowText
        ColumnFont.Height = -16
        ColumnFont.Name = #27161#26999#39636
        ColumnFont.Style = []
        ColumnParentFont = False
      end
      item
        Caption = #35686#31034#37329#38989
        Name = 'Column 7'
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #27161#26999#39636
        TitleFont.Style = []
        TitleParentFont = False
        ColumnFont.Charset = ANSI_CHARSET
        ColumnFont.Color = clWindowText
        ColumnFont.Height = -16
        ColumnFont.Name = #27161#26999#39636
        ColumnFont.Style = []
        ColumnParentFont = False
      end
      item
        Caption = #38459#26039#37329#38989
        Name = 'Column 8'
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #27161#26999#39636
        TitleFont.Style = []
        TitleParentFont = False
        ColumnFont.Charset = ANSI_CHARSET
        ColumnFont.Color = clWindowText
        ColumnFont.Height = -16
        ColumnFont.Name = #27161#26999#39636
        ColumnFont.Style = []
        ColumnParentFont = False
      end
      item
        Caption = #31185#21029#20195#30908
        Name = 'Column 9'
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #27161#26999#39636
        TitleFont.Style = []
        TitleParentFont = False
        ColumnFont.Charset = ANSI_CHARSET
        ColumnFont.Color = clWindowText
        ColumnFont.Height = -16
        ColumnFont.Name = #27161#26999#39636
        ColumnFont.Style = []
        ColumnParentFont = False
      end
      item
        Caption = #37291#24107#21029
        Name = 'Column 10'
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #27161#26999#39636
        TitleFont.Style = []
        TitleParentFont = False
        ColumnFont.Charset = ANSI_CHARSET
        ColumnFont.Color = clWindowText
        ColumnFont.Height = -16
        ColumnFont.Name = #27161#26999#39636
        ColumnFont.Style = []
        ColumnParentFont = False
      end
      item
        Caption = #36681#35386#21029
        Name = 'Column 11'
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #27161#26999#39636
        TitleFont.Style = []
        TitleParentFont = False
        ColumnFont.Charset = ANSI_CHARSET
        ColumnFont.Color = clWindowText
        ColumnFont.Height = -16
        ColumnFont.Name = #27161#26999#39636
        ColumnFont.Style = []
        ColumnParentFont = False
      end
      item
        Caption = #20633#35387
        Name = 'Column 12'
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #27161#26999#39636
        TitleFont.Style = []
        TitleParentFont = False
        ColumnFont.Charset = ANSI_CHARSET
        ColumnFont.Color = clWindowText
        ColumnFont.Height = -16
        ColumnFont.Name = #27161#26999#39636
        ColumnFont.Style = []
        ColumnParentFont = False
      end>
    Headings = <>
    HyperOptions = [hgoptDrawFocusRectangle, hgoptHighlightSelection]
    AVisibleColumnCount = 12
    ColWidths = (
      64
      80
      100
      80
      80
      64
      80
      80
      80
      64
      64
      64)
    RowHeights = (
      20
      20)
  end
  inherited Timer2: TTimer
    Left = 656
    Top = 656
  end
end
