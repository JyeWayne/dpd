inherited FrmHosPiceList: TFrmHosPiceList
  Tag = 9999
  Left = 164
  Top = 60
  BorderWidth = 4
  Caption = 'FrmHosPiceList'
  ClientHeight = 601
  ClientWidth = 808
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 106
  TextHeight = 15
  inherited MySBar: TStatusBar
    Top = 584
    Width = 808
  end
  object GroupBox1: TGroupBox [1]
    Left = 0
    Top = 0
    Width = 808
    Height = 104
    Align = alTop
    Caption = #22522#26412#36039#26009
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 34
      Top = 21
      Width = 48
      Height = 16
      Caption = #30149#27511#34399
    end
    object Label3: TLabel
      Left = 223
      Top = 21
      Width = 32
      Height = 16
      Caption = #22995#21517
    end
    object Label4: TLabel
      Left = 403
      Top = 21
      Width = 64
      Height = 16
      Caption = #20986#29983#26085#26399
    end
    object Label1: TLabel
      Left = 643
      Top = 21
      Width = 32
      Height = 16
      Caption = #24180#40801
    end
    object Label5: TLabel
      Left = 34
      Top = 47
      Width = 32
      Height = 16
      Caption = #24615#21029
    end
    object Label6: TLabel
      Left = 171
      Top = 47
      Width = 32
      Height = 16
      Caption = #22320#22336
    end
    object Label7: TLabel
      Left = 34
      Top = 73
      Width = 32
      Height = 16
      Caption = #38651#35441
    end
    object ComboBox1: TComboBox
      Left = 77
      Top = 43
      Width = 87
      Height = 24
      ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
      ItemHeight = 16
      TabOrder = 0
      Text = 'ComboBox1'
      Items.Strings = (
        '0_'#22899
        '1_'#30007)
    end
    object DBEdit1: TDBEdit
      Left = 86
      Top = 17
      Width = 129
      Height = 23
      DataField = 'chr_no'
      DataSource = DataSource2
      ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 266
      Top = 17
      Width = 129
      Height = 23
      DataField = 'pat_name'
      DataSource = DataSource2
      ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 509
      Top = 17
      Width = 130
      Height = 23
      DataField = 'Birth_Date'
      DataSource = DataSource2
      ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 206
      Top = 43
      Width = 575
      Height = 23
      DataField = 'ADDR_NAME1'
      DataSource = DataSource2
      ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 123
      Top = 69
      Width = 164
      Height = 23
      DataField = 'HOME_TEL_NO'
      DataSource = DataSource2
      ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
      TabOrder = 5
    end
    object DBEdit6: TDBEdit
      Left = 77
      Top = 69
      Width = 44
      Height = 23
      DataField = 'AREA_CODE1'
      DataSource = DataSource2
      ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
      TabOrder = 6
    end
    object Edit1: TEdit
      Left = 677
      Top = 17
      Width = 104
      Height = 23
      ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
      TabOrder = 7
    end
    object DBEdit7: TDBEdit
      Left = 471
      Top = 17
      Width = 36
      Height = 23
      DataField = 'AC_TYPE'
      DataSource = DataSource2
      ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
      TabOrder = 8
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 104
    Width = 808
    Height = 480
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object GroupBox2: TGroupBox
      Left = 0
      Top = 0
      Width = 155
      Height = 480
      Align = alLeft
      Caption = #27511#21490'LOG'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 18
        Width = 151
        Height = 460
        Align = alClient
        DataSource = DataSource1
        ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #32048#26126#39636
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'oper_date'
            Title.Caption = #32173#35703#26085#26399
            Width = 102
            Visible = True
          end>
      end
    end
    object Panel2: TPanel
      Left = 155
      Top = 0
      Width = 653
      Height = 480
      Align = alClient
      Color = clSilver
      TabOrder = 1
      object RadioGroup1: TRadioGroup
        Left = 1
        Top = 1
        Width = 646
        Height = 52
        Caption = #31805#23660#20154#21729
        Columns = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #26412#20154
          #23478#23660
          #20854#23427)
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object Button1: TButton
        Left = 557
        Top = 446
        Width = 81
        Height = 27
        Caption = #38626#38283
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 471
        Top = 446
        Width = 81
        Height = 27
        Caption = #38283#31435
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 300
        Top = 446
        Width = 80
        Height = 27
        Caption = #20316#24290
        TabOrder = 3
        OnClick = Button3Click
      end
      object GroupBox4: TGroupBox
        Left = 1
        Top = 215
        Width = 651
        Height = 225
        Align = alTop
        Caption = #20633#35387#35498#26126
        TabOrder = 4
        object Memo1: TMemo
          Left = 2
          Top = 17
          Width = 647
          Height = 206
          Align = alClient
          ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 651
        Height = 214
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 5
        object Label8: TLabel
          Left = 446
          Top = 9
          Width = 72
          Height = 15
          Caption = #31805#23660#20154' : '
          Visible = False
        end
        object Label9: TLabel
          Left = 461
          Top = 34
          Width = 56
          Height = 15
          Caption = #38364#20418' : '
          Visible = False
        end
        object Label14: TLabel
          Left = 17
          Top = 43
          Width = 128
          Height = 16
          Caption = #32025#26412#23433#23527#31805#23660#26085#26399
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = #32048#26126#39636
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 180
          Top = 70
          Width = 8
          Height = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -16
          Font.Name = #32048#26126#39636
          Font.Style = []
          ParentFont = False
        end
        object Edit7: TEdit
          Left = 514
          Top = 4
          Width = 130
          Height = 23
          ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
          TabOrder = 0
          Visible = False
        end
        object CheckBox1: TCheckBox
          Left = 17
          Top = 89
          Width = 173
          Height = 18
          Caption = ' '#24505#38500#26412#20221#23433#23527
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = #32048#26126#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object GroupBox3: TGroupBox
          Left = 43
          Top = 115
          Width = 558
          Height = 69
          TabOrder = 2
          object Label10: TLabel
            Left = 26
            Top = 17
            Width = 128
            Height = 15
            Caption = #32025#26412#24505#38500#23433#23527#26085#26399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -15
            Font.Name = #32048#26126#39636
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 318
            Top = 17
            Width = 32
            Height = 15
            Caption = #26178#38291
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -15
            Font.Name = #32048#26126#39636
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label12: TLabel
            Left = 26
            Top = 43
            Width = 64
            Height = 15
            Caption = #30906#35469#37291#24107
          end
          object DateTimePicker2: TDateTimePicker
            Left = 353
            Top = 14
            Width = 129
            Height = 21
            Date = 40008.466573530100000000
            Time = 40008.466573530100000000
            Enabled = False
            ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
            Kind = dtkTime
            TabOrder = 0
            Visible = False
          end
          object ComboBox2: TComboBox
            Left = 148
            Top = 40
            Width = 163
            Height = 23
            Enabled = False
            ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
            ItemHeight = 15
            TabOrder = 1
          end
          object DateTimePicker1: TDateTimePicker
            Left = 147
            Top = 13
            Width = 164
            Height = 21
            Date = 40008.689998726900000000
            Time = 40008.689998726900000000
            Enabled = False
            ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
            TabOrder = 2
          end
        end
        object DateTimePicker3: TDateTimePicker
          Left = 180
          Top = 43
          Width = 164
          Height = 21
          Date = 40009.636417280100000000
          Time = 40009.636417280100000000
          ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
          TabOrder = 3
        end
      end
      object BitBtn1: TBitBtn
        Left = 386
        Top = 446
        Width = 80
        Height = 27
        Caption = #20462#25913
        Enabled = False
        TabOrder = 6
        OnClick = BitBtn1Click
      end
    end
  end
  object Query1: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 202
    Top = 125
  end
  object Query2: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 242
    Top = 125
  end
  object Query3: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 282
    Top = 125
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 226
    Top = 162
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 274
    Top = 162
  end
end
