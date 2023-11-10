inherited FrmIPDCertificate: TFrmIPDCertificate
  Tag = 9999
  Left = 4
  Caption = 'FrmIPDCertificate'
  ClientWidth = 1072
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Width = 1072
  end
  object GroupBox1: TGroupBox [1]
    Left = 0
    Top = 0
    Width = 1072
    Height = 108
    Hint = 'CHART  BASIC'
    Align = alTop
    Caption = #30149#20154#22522#26412#36039#26009
    Color = 10977592
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 20
      Top = 50
      Width = 54
      Height = 17
      Hint = 'Name :'
      Alignment = taRightJustify
      BiDiMode = bdRightToLeft
      Caption = #22995#21517' :'
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clOlive
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 2
      Top = 23
      Width = 72
      Height = 17
      Hint = 'Chart no:'
      Alignment = taRightJustify
      BiDiMode = bdRightToLeft
      Caption = #30149#27511#34399' :'
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clOlive
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label9: TLabel
      Left = 372
      Top = 23
      Width = 108
      Height = 17
      Hint = 'Date of birth'#65306
      Alignment = taRightJustify
      BiDiMode = bdRightToLeft
      Caption = #20986#29983#24180#26376#26085' :'
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clOlive
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 188
      Top = 23
      Width = 90
      Height = 17
      Hint = 'ID Card : '
      Alignment = taRightJustify
      BiDiMode = bdRightToLeft
      Caption = #36523#20998#35657#34399' :'
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clOlive
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 613
      Top = 23
      Width = 54
      Height = 17
      Hint = 'Sex :'
      BiDiMode = bdRightToLeft
      Caption = #24615#21029' :'
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clOlive
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label11: TLabel
      Tag = 777
      Left = 20
      Top = 77
      Width = 54
      Height = 17
      Hint = 'Place of birth'#65306
      Alignment = taRightJustify
      BiDiMode = bdRightToLeft
      Caption = #31821#36011' :'
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clOlive
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label16: TLabel
      Tag = 777
      Left = 224
      Top = 77
      Width = 54
      Height = 17
      Hint = 'Job :'
      Alignment = taRightJustify
      BiDiMode = bdRightToLeft
      Caption = #32887#26989' :'
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clOlive
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 188
      Top = 50
      Width = 90
      Height = 17
      Hint = 'hospitalized :'
      Alignment = taRightJustify
      BiDiMode = bdRightToLeft
      Caption = #20303#38498#26085#26399' :'
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clOlive
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label14: TLabel
      Left = 390
      Top = 50
      Width = 90
      Height = 17
      Hint = 'Department :'
      Alignment = taRightJustify
      BiDiMode = bdRightToLeft
      Caption = #20303#38498#31185#21029' :'
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clOlive
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object sextype: TLabel
      Left = 662
      Top = 22
      Width = 18
      Height = 19
      Caption = #30007
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object idno: TLabel
      Left = 278
      Top = 22
      Width = 92
      Height = 19
      Caption = 'A123456789'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object birthday: TLabel
      Left = 483
      Top = 22
      Width = 128
      Height = 19
      Caption = '93 '#24180' 10 '#26376' 25 '#26085
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object ipddate: TLabel
      Left = 278
      Top = 49
      Width = 128
      Height = 19
      Caption = '93 '#24180' 10 '#26376' 25 '#26085
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Ldept: TLabel
      Left = 579
      Top = 49
      Width = 56
      Height = 19
      Caption = 'Label15'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object chrno: TLabel
      Left = 80
      Top = 22
      Width = 39
      Height = 19
      Caption = 'chrno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Tag = 777
      Left = 75
      Top = 74
      Width = 118
      Height = 23
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #32048#26126#39636
      Font.Style = []
      ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
      MaxLength = 12
      ParentFont = False
      TabOrder = 0
    end
    object Edit2: TEdit
      Tag = 777
      Left = 278
      Top = 73
      Width = 123
      Height = 23
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #32048#26126#39636
      Font.Style = []
      ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
      MaxLength = 12
      ParentFont = False
      TabOrder = 1
    end
    object patname: TEdit
      Left = 75
      Top = 46
      Width = 119
      Height = 23
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 488
      Top = 48
      Width = 145
      Height = 25
      ItemHeight = 17
      TabOrder = 3
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 108
    Width = 1072
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #32048#26126#39636
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label8: TLabel
      Left = 478
      Top = 10
      Width = 90
      Height = 17
      Caption = #35657#26126#26360#21015#21360
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 614
      Top = 10
      Width = 18
      Height = 17
      Caption = #20221
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 291
      Top = 11
      Width = 72
      Height = 17
      Caption = #20986#38498#26085#26399
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
    end
    object BtnOk: TBitBtn
      Left = 790
      Top = 3
      Width = 113
      Height = 30
      Caption = #38928#35261'('#38283#31435')'
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnClose: TBitBtn
      Left = 911
      Top = 3
      Width = 88
      Height = 30
      Caption = #38626#38283
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnCloseClick
    end
    object Pagecount: TSpinEdit
      Left = 571
      Top = 7
      Width = 38
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = #32048#26126#39636
      Font.Style = []
      MaxValue = 100
      MinValue = 1
      ParentFont = False
      TabOrder = 2
      Value = 1
    end
    object BtnPgk: TBitBtn
      Left = 5
      Top = 3
      Width = 100
      Height = 30
      Caption = #24314#31435#26032#31684#26412
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtnPgkClick
    end
    object BtnUsePgk: TBitBtn
      Left = 108
      Top = 3
      Width = 173
      Height = 30
      Caption = #22871#29992#31684#26412#25110#30149#20154#35352#37636
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BtnUsePgkClick
    end
    object DateTimePrint: TDateTimePicker
      Left = 367
      Top = 7
      Width = 106
      Height = 23
      Date = 40541.660245949090000000
      Time = 40541.660245949090000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object BtnHISTreat: TBitBtn
      Left = 670
      Top = 3
      Width = 113
      Height = 30
      Caption = #23601#37291#26085#26399#35352#37636
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = BtnHISTreatClick
    end
  end
  object GroupBox4: TGroupBox [3]
    Left = 807
    Top = 145
    Width = 265
    Height = 486
    Hint = 'memo1'
    Align = alRight
    Caption = #29255#35486
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = #32048#26126#39636
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object ListBox1: TListBox
      Left = 2
      Top = 19
      Width = 261
      Height = 465
      Align = alClient
      Color = clSilver
      Columns = 1
      ItemHeight = 17
      TabOrder = 0
      OnDblClick = ListBox1DblClick
    end
  end
  object Panel2: TPanel [4]
    Left = 0
    Top = 145
    Width = 807
    Height = 486
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 4
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 805
      Height = 184
      Hint = 'DIAGNOSIS'
      Align = alTop
      Caption = #20663#30149#21517#31281
      Color = 10977592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object Memo1: TRichEdit
        Left = 2
        Top = 19
        Width = 801
        Height = 163
        Align = alClient
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        PlainText = True
        TabOrder = 0
        OnChange = Memo1Change
        OnEnter = Memo1Enter
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 185
      Width = 805
      Height = 300
      Hint = 'TREATMENT'
      Align = alClient
      Caption = #37291#24107#22225#35328
      Color = 10977592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object Memo2: TRichEdit
        Left = 2
        Top = 19
        Width = 801
        Height = 279
        Align = alClient
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        PlainText = True
        TabOrder = 0
        OnEnter = Memo2Enter
      end
    end
  end
  inherited XPManifest1: TXPManifest
    Left = 912
    Top = 16
  end
  object Query1: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    Left = 328
    Top = 166
  end
end
