inherited FrmDitto: TFrmDitto
  Left = 268
  Top = 164
  Caption = ''
  ClientHeight = 691
  ClientWidth = 963
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Top = 674
    Width = 963
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 963
    Height = 72
    Align = alTop
    Color = 16508624
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 216
      Height = 70
      Align = alLeft
      BorderStyle = bsSingle
      Color = 16508624
      TabOrder = 0
      object Label2: TLabel
        Left = 27
        Top = 39
        Width = 42
        Height = 20
        Caption = #22995#21517
        Font.Charset = ANSI_CHARSET
        Font.Color = clBackground
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 5
        Top = 8
        Width = 63
        Height = 20
        Caption = #30149#27511#34399
        Font.Charset = ANSI_CHARSET
        Font.Color = clBackground
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtChrNo: TEdit
        Tag = 999
        Left = 75
        Top = 6
        Width = 128
        Height = 25
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = EdtChrNoKeyDown
      end
      object EdtPatName: TEdit
        Tag = 999
        Left = 75
        Top = 36
        Width = 128
        Height = 28
        Font.Charset = ANSI_CHARSET
        Font.Color = clBackground
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 217
      Top = 1
      Width = 745
      Height = 70
      Align = alClient
      Color = 16508624
      TabOrder = 1
      object AddS: TCheckBox
        Left = 14
        Top = 39
        Width = 96
        Height = 17
        Caption = 'Subjective'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object AddO: TCheckBox
        Left = 118
        Top = 39
        Width = 93
        Height = 17
        Caption = 'Objective'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object AddICD: TCheckBox
        Left = 435
        Top = 8
        Width = 56
        Height = 17
        Caption = #35386#26039
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object AddAll: TCheckBox
        Left = 364
        Top = 39
        Width = 59
        Height = 17
        Caption = #20840#37096
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object Button1: TButton
        Left = 629
        Top = 6
        Width = 83
        Height = 25
        Caption = #30906#35469
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = Button1Click
      end
      object AddMed: TCheckBox
        Left = 14
        Top = 7
        Width = 59
        Height = 17
        Caption = #34277#21697
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object AddFee: TCheckBox
        Left = 84
        Top = 7
        Width = 57
        Height = 17
        Caption = #34389#32622
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object AddLab: TCheckBox
        Left = 154
        Top = 8
        Width = 57
        Height = 17
        Caption = #27298#39511
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object AddMtrl: TCheckBox
        Left = 224
        Top = 8
        Width = 61
        Height = 17
        Caption = #34907#26448
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object AddChk: TCheckBox
        Left = 364
        Top = 8
        Width = 57
        Height = 17
        Caption = #27298#26597
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object AddXRay: TCheckBox
        Left = 294
        Top = 8
        Width = 57
        Height = 17
        Caption = #25918#23556
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object Button2: TButton
        Left = 629
        Top = 38
        Width = 83
        Height = 25
        Caption = #38626#38283
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnClick = Button2Click
      end
      object AddP: TCheckBox
        Left = 294
        Top = 39
        Width = 57
        Height = 17
        Caption = 'MX'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object AddH: TCheckBox
        Left = 224
        Top = 39
        Width = 65
        Height = 17
        Caption = 'History'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
      object Button3: TButton
        Left = 533
        Top = 6
        Width = 83
        Height = 25
        Caption = #27298#39511#22577#21578
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 533
        Top = 38
        Width = 83
        Height = 25
        Caption = #20303#38498#36039#26009
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 435
        Top = 35
        Width = 60
        Height = 25
        Caption = #30149#25688
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        OnClick = Button5Click
      end
    end
  end
  object SGOpd: TStringGrid [2]
    Tag = 777
    Left = 0
    Top = 72
    Width = 273
    Height = 602
    Align = alLeft
    Color = 13369085
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = SGOpdDblClick
    OnDblClick = SGOpdDblClick
    OnDrawCell = SGOpdDrawCell
    ColWidths = (
      63
      64
      64
      64
      64)
  end
  object Panel4: TPanel [3]
    Left = 273
    Top = 72
    Width = 690
    Height = 602
    Align = alClient
    Color = 16508624
    TabOrder = 3
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 688
      Height = 127
      Align = alTop
      Color = 16508624
      TabOrder = 0
      object Edit1: TEdit
        Left = 10
        Top = 5
        Width = 51
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '999.99'
      end
      object Edit2: TEdit
        Left = 62
        Top = 5
        Width = 176
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = 'Edit2'
      end
      object Edit3: TEdit
        Left = 239
        Top = 5
        Width = 51
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = '999.99'
      end
      object Edit4: TEdit
        Left = 291
        Top = 5
        Width = 173
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = 'Edit2'
      end
      object Edit5: TEdit
        Left = 466
        Top = 5
        Width = 51
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = '999.99'
      end
      object Edit6: TEdit
        Left = 518
        Top = 5
        Width = 167
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = 'Edit2'
      end
      object Edit7: TEdit
        Left = 10
        Top = 35
        Width = 51
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = '999.99'
      end
      object Edit8: TEdit
        Left = 62
        Top = 35
        Width = 176
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Text = 'Edit2'
      end
      object Edit9: TEdit
        Left = 239
        Top = 35
        Width = 51
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = '999.99'
      end
      object Edit10: TEdit
        Left = 291
        Top = 35
        Width = 173
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Text = 'Edit2'
      end
      object Edit11: TEdit
        Left = 466
        Top = 35
        Width = 51
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Text = '999.99'
      end
      object Edit12: TEdit
        Left = 518
        Top = 35
        Width = 167
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        Text = 'Edit2'
      end
      object Edit13: TEdit
        Left = 10
        Top = 65
        Width = 51
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        Text = '999.99'
      end
      object Edit14: TEdit
        Left = 62
        Top = 65
        Width = 176
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
        Text = 'Edit2'
      end
      object Edit15: TEdit
        Left = 239
        Top = 65
        Width = 51
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
        Text = '999.99'
      end
      object Edit16: TEdit
        Left = 291
        Top = 65
        Width = 173
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
        Text = 'Edit2'
      end
      object Edit17: TEdit
        Left = 466
        Top = 65
        Width = 51
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
        Text = '999.99'
      end
      object Edit18: TEdit
        Left = 518
        Top = 65
        Width = 167
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
        Text = 'Edit2'
      end
      object Edit19: TEdit
        Left = 10
        Top = 94
        Width = 51
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
        Text = '999.99'
      end
      object Edit20: TEdit
        Left = 62
        Top = 94
        Width = 176
        Height = 27
        Color = 13369085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
        Text = 'Edit2'
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 128
      Width = 688
      Height = 219
      Align = alTop
      Color = 16508624
      TabOrder = 1
      object Panel8: TPanel
        Left = 1
        Top = 1
        Width = 175
        Height = 217
        Align = alLeft
        Color = 16508624
        TabOrder = 0
        object Panel11: TPanel
          Left = 1
          Top = 1
          Width = 173
          Height = 21
          Align = alTop
          BorderStyle = bsSingle
          Caption = 'History'
          Color = 16508624
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object H: TMemo
          Left = 1
          Top = 22
          Width = 173
          Height = 194
          Align = alClient
          Color = 13369085
          ReadOnly = True
          TabOrder = 1
        end
      end
      object Panel9: TPanel
        Left = 176
        Top = 1
        Width = 177
        Height = 217
        Align = alLeft
        Color = 16508624
        TabOrder = 1
        object Panel10: TPanel
          Left = 1
          Top = 1
          Width = 175
          Height = 21
          Align = alTop
          BorderStyle = bsSingle
          Caption = 'Subjective'
          Color = 16508624
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object S: TMemo
          Left = 1
          Top = 22
          Width = 175
          Height = 194
          Align = alClient
          Color = 13369085
          ReadOnly = True
          TabOrder = 1
        end
      end
      object Panel12: TPanel
        Left = 353
        Top = 1
        Width = 171
        Height = 217
        Align = alLeft
        Color = 16508624
        TabOrder = 2
        object Panel13: TPanel
          Left = 1
          Top = 1
          Width = 169
          Height = 21
          Align = alTop
          BorderStyle = bsSingle
          Caption = 'Objective'
          Color = 16508624
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object O: TMemo
          Left = 1
          Top = 22
          Width = 169
          Height = 194
          Align = alClient
          Color = 13369085
          ReadOnly = True
          TabOrder = 1
        end
      end
      object Panel14: TPanel
        Left = 524
        Top = 1
        Width = 162
        Height = 217
        Align = alLeft
        Color = 16508624
        TabOrder = 3
        object Panel15: TPanel
          Left = 1
          Top = 1
          Width = 160
          Height = 21
          Align = alTop
          BorderStyle = bsSingle
          Caption = 'MX'
          Color = 16508624
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object P: TMemo
          Left = 1
          Top = 22
          Width = 160
          Height = 194
          Align = alClient
          Color = 13369085
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 347
      Width = 688
      Height = 254
      Align = alClient
      Color = 16508624
      TabOrder = 2
      object PageControl2: TPageControl
        Left = 1
        Top = 1
        Width = 686
        Height = 252
        ActivePage = TabSheet1
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet3: TTabSheet
          Caption = #29992#34277
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
          object SGMed: TStringGrid
            Left = 0
            Top = 0
            Width = 678
            Height = 224
            Align = alClient
            Color = 13369085
            ColCount = 9
            FixedCols = 0
            RowCount = 1
            FixedRows = 0
            TabOrder = 0
            ColWidths = (
              66
              191
              64
              64
              64
              64
              64
              64
              64)
          end
        end
        object TabSheet4: TTabSheet
          Caption = #34389#32622
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ImageIndex = 1
          ParentFont = False
          object SGFee: TStringGrid
            Left = 0
            Top = 0
            Width = 679
            Height = 226
            Align = alClient
            Color = 13369085
            ColCount = 4
            FixedCols = 0
            RowCount = 1
            FixedRows = 0
            TabOrder = 0
            ColWidths = (
              121
              419
              81
              78)
          end
        end
        object TabSheet5: TTabSheet
          Caption = #27298#39511
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ImageIndex = 2
          ParentFont = False
          object SGLab: TStringGrid
            Left = 0
            Top = 0
            Width = 678
            Height = 224
            Align = alClient
            Color = 13369085
            ColCount = 7
            FixedCols = 0
            RowCount = 2
            TabOrder = 0
            ColWidths = (
              64
              65
              99
              240
              91
              74
              72)
          end
        end
        object TabSheet1: TTabSheet
          Caption = #34907#26448
          ImageIndex = 5
          object SGMtrl: TStringGrid
            Left = 0
            Top = 0
            Width = 678
            Height = 214
            Align = alClient
            Color = 13369085
            ColCount = 4
            FixedCols = 0
            RowCount = 1
            FixedRows = 0
            TabOrder = 0
            ColWidths = (
              121
              419
              81
              78)
          end
        end
        object TabSheet2: TTabSheet
          Caption = #25918#23556
          ImageIndex = 4
          object SGXRay: TStringGrid
            Left = 0
            Top = 0
            Width = 678
            Height = 224
            Align = alClient
            Color = 13369085
            ColCount = 9
            FixedCols = 0
            RowCount = 1
            FixedRows = 0
            TabOrder = 0
            ColWidths = (
              83
              312
              99
              76
              68
              59
              2
              2
              3)
          end
        end
        object TabSheet8: TTabSheet
          Caption = #27298#26597
          ImageIndex = 5
          object SGChk: TStringGrid
            Left = 0
            Top = 0
            Width = 678
            Height = 224
            Align = alClient
            Color = 13369085
            FixedCols = 0
            RowCount = 1
            FixedRows = 0
            TabOrder = 0
            ColWidths = (
              96
              392
              83
              64
              64)
          end
        end
      end
    end
  end
  inherited XPManifest1: TXPManifest
    Top = 72
  end
end
