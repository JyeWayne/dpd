inherited FrmOldOrderList: TFrmOldOrderList
  Left = 401
  Top = 31
  Caption = 'FrmOldOrderList'
  ClientWidth = 923
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Width = 923
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 249
    Height = 631
    Align = alLeft
    BorderWidth = 2
    TabOrder = 1
    object RadioGroup1: TRadioGroup
      Left = 3
      Top = 3
      Width = 243
      Height = 56
      Align = alTop
      Caption = #23601#37291#39006#21029
      Columns = 3
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clBlue
      Font.Height = -20
      Font.Name = #32048#26126#39636
      Font.Style = [fsBold]
      Items.Strings = (
        #38272#35386
        #24613#35386
        #20303#38498)
      ParentFont = False
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object Panel4: TPanel
      Left = 0
      Top = 69
      Width = 228
      Height = 121
      Hint = #38272#24613#35386
      BorderWidth = 1
      ParentColor = True
      TabOrder = 1
      Visible = False
      object DBGrid1: TDBGrid
        Left = 2
        Top = 2
        Width = 224
        Height = 117
        Align = alClient
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #32048#26126#39636
        TitleFont.Style = [fsBold]
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'thedate'
            Title.Caption = #30475#35386#26085
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'thedept'
            Title.Caption = #23601#37291#31185#21029
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Doc_name'
            Title.Caption = #20027#27835
            Visible = True
          end>
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 161
      Width = 232
      Height = 169
      BorderWidth = 1
      Caption = 'Panel5'
      ParentColor = True
      TabOrder = 2
      Visible = False
      object DBGrid2: TDBGrid
        Left = 144
        Top = 2
        Width = 86
        Height = 165
        Align = alRight
        DataSource = DataSource3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = CHINESEBIG5_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #32048#26126#39636
        TitleFont.Style = []
        OnCellClick = DBGrid2CellClick
        OnDblClick = DBGrid2DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'begin_date'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #32048#26126#39636
            Font.Style = []
            Title.Caption = #26085#26399
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = #32048#26126#39636
            Title.Font.Style = [fsBold]
            Width = 54
            Visible = True
          end>
      end
      object DBGrid3: TDBGrid
        Left = 2
        Top = 2
        Width = 142
        Height = 165
        Align = alClient
        DataSource = DataSource2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = CHINESEBIG5_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = #32048#26126#39636
        TitleFont.Style = []
        OnDblClick = DBGrid3DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'thedate'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #32048#26126#39636
            Font.Style = []
            Title.Caption = #20303#38498#26085
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = #32048#26126#39636
            Title.Font.Style = [fsBold]
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'thedept'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #32048#26126#39636
            Font.Style = []
            Title.Caption = #31185#21029
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = #32048#26126#39636
            Title.Font.Style = [fsBold]
            Width = 61
            Visible = True
          end>
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 249
    Top = 0
    Width = 674
    Height = 631
    Align = alClient
    TabOrder = 2
    object GroupBox3: TGroupBox
      Left = 1
      Top = 1
      Width = 672
      Height = 245
      Align = alTop
      TabOrder = 0
      object DBGrid4: TDBGrid
        Left = 2
        Top = 16
        Width = 668
        Height = 227
        Align = alClient
        DataSource = DataSource4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #32048#26126#39636
        TitleFont.Style = []
        OnDblClick = DBGrid4DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'thedesc'
            Title.Caption = #34277#21697#21517#31281
            Width = 359
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'theqty'
            Title.Caption = #27425#37327
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'thecir'
            Title.Caption = #38971#29575
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'theunit'
            Title.Caption = #21934#20301
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'med_days'
            Title.Caption = #22825#25976
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pay_flag'
            Title.Caption = #20581#20445
            Visible = True
          end>
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 246
      Width = 672
      Height = 36
      Align = alTop
      TabOrder = 1
      DesignSize = (
        672
        36)
      object BitBtn1: TBitBtn
        Left = 332
        Top = 6
        Width = 76
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #20840#36984
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 417
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #28165#38500
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object BitBtn3: TBitBtn
        Left = 502
        Top = 6
        Width = 76
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #24118#20837
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Left = 588
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #38626#38283
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = BitBtn4Click
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 282
      Width = 672
      Height = 348
      Align = alClient
      TabOrder = 2
      object StringGrid1: TStringGrid
        Left = 2
        Top = 16
        Width = 668
        Height = 330
        Align = alClient
        ColCount = 7
        DefaultRowHeight = 21
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        ColWidths = (
          68
          370
          67
          64
          64
          64
          64)
      end
    end
  end
  inherited Timer2: TTimer
    Left = 774
    Top = 194
  end
  inherited XPManifest1: TXPManifest
    Left = 864
    Top = 193
  end
  object QryOE: TADOQuery
    Parameters = <>
    Left = 16
    Top = 128
  end
  object QryI: TADOQuery
    Parameters = <>
    Left = 80
    Top = 288
  end
  object QryID: TADOQuery
    Parameters = <>
    Left = 168
    Top = 288
  end
  object DataSource1: TDataSource
    DataSet = QryOE
    Left = 48
    Top = 128
  end
  object DataSource2: TDataSource
    DataSet = QryI
    Left = 112
    Top = 288
  end
  object DataSource3: TDataSource
    DataSet = QryID
    Left = 200
    Top = 288
  end
  object DataSource4: TDataSource
    DataSet = QryMed
    Left = 834
    Top = 193
  end
  object QryMed: TADOQuery
    Parameters = <>
    Left = 804
    Top = 193
  end
end
