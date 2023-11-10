inherited FrmOftenIcd: TFrmOftenIcd
  Left = 215
  Top = 113
  Caption = #24120#29992#35386#26039
  ClientHeight = 666
  ClientWidth = 989
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  object Shape1: TShape [0]
    Left = 0
    Top = 0
    Width = 989
    Height = 73
    Align = alTop
    Brush.Color = 15591928
    Pen.Color = 12615808
    Pen.Width = 2
  end
  object Shape2: TShape [1]
    Left = 8
    Top = 104
    Width = 25
    Height = 25
  end
  inherited MySBar: TStatusBar
    Top = 649
    Width = 989
  end
  object PageControl1: TPageControl [3]
    Left = 0
    Top = 73
    Width = 989
    Height = 576
    ActivePage = TabSheet2
    Align = alClient
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #24494#36575#27491#40657#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'ICD-9'
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #24494#36575#27491#40657#39636
      Font.Style = []
      ParentFont = False
      object SGICD: TStringGrid
        Left = 0
        Top = 0
        Width = 981
        Height = 543
        Align = alClient
        ColCount = 3
        FixedCols = 0
        RowCount = 2
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnDblClick = SGICDDblClick
        ColWidths = (
          73
          429
          452)
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'ICD-10'
      ImageIndex = 1
      object Shape3: TShape
        Left = 0
        Top = 0
        Width = 981
        Height = 30
        Align = alTop
        Brush.Color = 12615680
        Pen.Style = psClear
      end
      object DBCtrlGrid1: TDBCtrlGrid
        Left = 0
        Top = 32
        Width = 981
        Height = 510
        DataSource = DtSICD10
        PanelHeight = 51
        PanelWidth = 964
        TabOrder = 0
        RowCount = 10
        object DBText1: TDBText
          Left = 3
          Top = 3
          Width = 59
          Height = 17
          DataField = 'icd9_code'
          DataSource = DtSICD10
          OnClick = DBText1Click
        end
        object DBText2: TDBText
          Left = 72
          Top = 3
          Width = 71
          Height = 17
          DataField = 'ICD_CODE'
          DataSource = DtSICD10
          OnClick = DBText1Click
        end
        object DBText3: TDBText
          Left = 152
          Top = 3
          Width = 483
          Height = 17
          DataField = 'CHN_FULL_DESC'
          DataSource = DtSICD10
          OnClick = DBText1Click
        end
        object DBText5: TDBText
          Left = 644
          Top = 3
          Width = 38
          Height = 17
          Alignment = taCenter
          DataField = 'sex_type'
          DataSource = DtSICD10
          OnClick = DBText1Click
        end
        object DBText6: TDBText
          Left = 698
          Top = 3
          Width = 43
          Height = 17
          Alignment = taCenter
          DataField = 'INF_FLAG'
          DataSource = DtSICD10
          OnClick = DBText1Click
        end
        object DBText7: TDBText
          Left = 752
          Top = 3
          Width = 57
          Height = 17
          Alignment = taCenter
          DataField = 'AGE_TYPE'
          DataSource = DtSICD10
          OnClick = DBText1Click
        end
        object DBText8: TDBText
          Left = 826
          Top = 3
          Width = 65
          Height = 17
          Alignment = taCenter
          DataField = 'RARE_FLAG'
          DataSource = DtSICD10
          OnClick = DBText1Click
        end
        object DBText9: TDBText
          Left = 900
          Top = 3
          Width = 59
          Height = 17
          Alignment = taCenter
          DataField = 'slow_flag'
          DataSource = DtSICD10
          OnClick = DBText1Click
        end
        object Shape4: TShape
          Left = 151
          Top = 26
          Width = 805
          Height = 23
          Brush.Color = 15591928
        end
        object DBText4: TDBText
          Left = 152
          Top = 29
          Width = 804
          Height = 17
          DataField = 'ENG_FULL_DESC'
          DataSource = DtSICD10
          Transparent = True
          OnClick = DBText1Click
        end
      end
      object StaticText1: TStaticText
        Left = 4
        Top = 4
        Width = 60
        Height = 22
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = 'ICD-9'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #24494#36575#27491#40657#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object StaticText2: TStaticText
        Left = 69
        Top = 4
        Width = 76
        Height = 22
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = 'ICD-10'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #24494#36575#27491#40657#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object StaticText3: TStaticText
        Left = 150
        Top = 4
        Width = 486
        Height = 22
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #30142#30149#21517#31281
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #24494#36575#27491#40657#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object StaticText4: TStaticText
        Left = 641
        Top = 4
        Width = 44
        Height = 22
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #24615#21029
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #24494#36575#27491#40657#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object StaticText5: TStaticText
        Left = 690
        Top = 4
        Width = 53
        Height = 22
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #20659#26579#30149
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #24494#36575#27491#40657#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object StaticText6: TStaticText
        Left = 748
        Top = 4
        Width = 68
        Height = 22
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #24180#40801#38480#21046
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #24494#36575#27491#40657#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object StaticText7: TStaticText
        Left = 821
        Top = 4
        Width = 70
        Height = 22
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #32597#35211#30142#30149
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #24494#36575#27491#40657#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
      object StaticText8: TStaticText
        Left = 896
        Top = 4
        Width = 62
        Height = 22
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #24930#24615#30149
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #24494#36575#27491#40657#39636
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'ICD10 '#25628#23563
      ImageIndex = 2
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 981
        Height = 543
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object DBCtrlGrid2: TDBCtrlGrid
          Left = 0
          Top = 0
          Width = 196
          Height = 526
          Align = alLeft
          DataSource = DtSICD10SHE1
          PanelHeight = 87
          PanelWidth = 179
          TabOrder = 0
          RowCount = 6
          OnPaintPanel = DBCtrlGrid2PaintPanel
          object DBMemo1: TDBMemo
            Left = 3
            Top = 3
            Width = 173
            Height = 81
            BevelWidth = 2
            Color = 14475765
            DataField = 'ALLA'
            DataSource = DtSICD10SHE1
            TabOrder = 0
            OnClick = DBMemo1Click
          end
        end
        object DBCtrlGrid4: TDBCtrlGrid
          Left = 391
          Top = 0
          Width = 196
          Height = 522
          DataSource = DtSICD10SHE3
          PanelHeight = 87
          PanelWidth = 179
          TabOrder = 1
          RowCount = 6
          OnPaintPanel = DBCtrlGrid2PaintPanel
          object DBMemo3: TDBMemo
            Left = 3
            Top = 3
            Width = 173
            Height = 81
            Color = 14475765
            DataField = 'ALLA'
            DataSource = DtSICD10SHE3
            TabOrder = 0
            OnClick = DBMemo1Click
          end
        end
        object DBCtrlGrid5: TDBCtrlGrid
          Left = 587
          Top = 0
          Width = 196
          Height = 522
          DataSource = DtSICD10SHE4
          PanelHeight = 87
          PanelWidth = 179
          TabOrder = 2
          RowCount = 6
          OnPaintPanel = DBCtrlGrid2PaintPanel
          object DBMemo4: TDBMemo
            Left = 3
            Top = 3
            Width = 173
            Height = 81
            Color = 14475765
            DataField = 'ALLA'
            DataSource = DtSICD10SHE4
            TabOrder = 0
            OnClick = DBMemo1Click
          end
        end
        object DBCtrlGrid3: TDBCtrlGrid
          Left = 195
          Top = 0
          Width = 196
          Height = 522
          DataSource = DtSICD10SHE2
          PanelHeight = 87
          PanelWidth = 179
          TabOrder = 3
          RowCount = 6
          OnPaintPanel = DBCtrlGrid2PaintPanel
          object DBMemo2: TDBMemo
            Left = 3
            Top = 3
            Width = 173
            Height = 81
            Color = 14475765
            DataField = 'ALLA'
            DataSource = DtSICD10SHE2
            TabOrder = 0
            OnClick = DBMemo1Click
          end
        end
        object DBCtrlGrid6: TDBCtrlGrid
          Left = 784
          Top = 0
          Width = 196
          Height = 522
          DataSource = DtSICD10SHE5
          PanelHeight = 87
          PanelWidth = 179
          TabOrder = 4
          RowCount = 6
          OnPaintPanel = DBCtrlGrid2PaintPanel
          object DBMemo5: TDBMemo
            Left = 3
            Top = 3
            Width = 173
            Height = 81
            Color = 14475765
            DataField = 'ALLA'
            DataSource = DtSICD10SHE5
            TabOrder = 0
            OnClick = DBMemo1Click
          end
        end
        object DBCtrlGrid7: TDBCtrlGrid
          Left = 980
          Top = 0
          Width = 196
          Height = 522
          DataSource = DtSICD10SHE6
          PanelHeight = 87
          PanelWidth = 179
          TabOrder = 5
          RowCount = 6
          OnPaintPanel = DBCtrlGrid2PaintPanel
          object DBMemo6: TDBMemo
            Left = 3
            Top = 3
            Width = 173
            Height = 81
            Color = 14475765
            DataField = 'ALLA'
            DataSource = DtSICD10SHE6
            TabOrder = 0
            OnClick = DBMemo1Click
          end
        end
        object DBCtrlGrid8: TDBCtrlGrid
          Left = 1176
          Top = 0
          Width = 196
          Height = 522
          DataSource = DtSICD10SHE7
          PanelHeight = 87
          PanelWidth = 179
          TabOrder = 6
          RowCount = 6
          OnPaintPanel = DBCtrlGrid2PaintPanel
          object DBMemo7: TDBMemo
            Left = 3
            Top = 3
            Width = 173
            Height = 81
            Color = 14475765
            DataField = 'ALLA'
            DataSource = DtSICD10SHE7
            TabOrder = 0
            OnClick = DBMemo1Click
          end
        end
        object DBCtrlGrid9: TDBCtrlGrid
          Left = 1372
          Top = 0
          Width = 196
          Height = 522
          DataSource = DtSICD10SHE8
          PanelHeight = 87
          PanelWidth = 179
          TabOrder = 7
          RowCount = 6
          OnPaintPanel = DBCtrlGrid2PaintPanel
          object DBMemo8: TDBMemo
            Left = 3
            Top = 3
            Width = 173
            Height = 81
            Color = 14475765
            DataField = 'ALLA'
            DataSource = DtSICD10SHE8
            TabOrder = 0
            OnClick = DBMemo1Click
          end
        end
        object DBCtrlGrid10: TDBCtrlGrid
          Left = 1568
          Top = 0
          Width = 196
          Height = 522
          DataSource = DtSICD10SHE9
          PanelHeight = 87
          PanelWidth = 179
          TabOrder = 8
          RowCount = 6
          OnPaintPanel = DBCtrlGrid2PaintPanel
          object DBMemo9: TDBMemo
            Left = 3
            Top = 3
            Width = 173
            Height = 81
            Color = 14475765
            DataField = 'ALLA'
            DataSource = DtSICD10SHE9
            TabOrder = 0
            OnClick = DBMemo1Click
          end
        end
      end
    end
  end
  object CheckBox1: TCheckBox [4]
    Left = 163
    Top = 25
    Width = 105
    Height = 25
    Caption = #29273#31185#24120#29992
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = #24494#36575#27491#40657#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox [5]
    Left = 19
    Top = 25
    Width = 105
    Height = 25
    Caption = #37291#24107#24120#29992
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = #24494#36575#27491#40657#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = CheckBox2Click
  end
  object Button1: TButton [6]
    Left = 863
    Top = 23
    Width = 83
    Height = 30
    Caption = #38626#38283
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24494#36575#27491#40657#39636
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object DtSICD10: TDataSource
    DataSet = ADOQuery1
    Left = 732
    Top = 30
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 788
    Top = 30
  end
  object DtSICD10SHE1: TDataSource
    DataSet = ADOQuery2
    Left = 92
    Top = 238
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 132
    Top = 238
  end
  object ADOQuery3: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 132
    Top = 278
  end
  object DtSICD10SHE2: TDataSource
    DataSet = ADOQuery3
    Left = 92
    Top = 278
  end
  object DtSICD10SHE3: TDataSource
    DataSet = ADOQuery4
    Left = 92
    Top = 318
  end
  object ADOQuery4: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 132
    Top = 318
  end
  object ADOQuery5: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 132
    Top = 350
  end
  object DtSICD10SHE4: TDataSource
    DataSet = ADOQuery5
    Left = 92
    Top = 350
  end
  object ADOQuery6: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 132
    Top = 390
  end
  object DtSICD10SHE5: TDataSource
    DataSet = ADOQuery6
    Left = 92
    Top = 390
  end
  object DtSICD10SHE6: TDataSource
    DataSet = ADOQuery7
    Left = 92
    Top = 430
  end
  object ADOQuery7: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 132
    Top = 430
  end
  object DtSICD10SHE7: TDataSource
    DataSet = ADOQuery8
    Left = 92
    Top = 470
  end
  object ADOQuery8: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 132
    Top = 470
  end
  object DtSICD10SHE8: TDataSource
    DataSet = ADOQuery9
    Left = 92
    Top = 502
  end
  object ADOQuery9: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 132
    Top = 502
  end
  object DtSICD10SHE9: TDataSource
    DataSet = ADOQuery10
    Left = 92
    Top = 542
  end
  object ADOQuery10: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 132
    Top = 542
  end
end
