inherited FrmWarning: TFrmWarning
  Left = 32
  Top = 11
  Caption = 'FrmWarning'
  ClientHeight = 730
  ClientWidth = 1008
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Top = 713
    Width = 1008
  end
  object PageControl1: TPageControl [1]
    Left = 0
    Top = 0
    Width = 1008
    Height = 713
    ActivePage = TabSheet2
    Align = alClient
    TabHeight = 27
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #36942#25935#32000#37636
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #32048#26126#39636
      Font.Style = []
      ParentFont = False
      object WebBrowser1: TWebBrowser
        Left = 0
        Top = 0
        Width = 1000
        Height = 676
        Align = alClient
        TabOrder = 0
        ControlData = {
          4C0000005A670000DE4500000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26032#22686','#20462#25913','#21034#38500
      ImageIndex = 1
      object DBCtrlGrid1: TDBCtrlGrid
        Left = 783
        Top = 0
        Width = 217
        Height = 676
        Align = alRight
        Color = clGray
        DataSource = DataSource1
        PanelHeight = 67
        ParentColor = False
        TabOrder = 0
        RowCount = 10
        OnClick = DBCtrlGrid1Click
        object Label1: TLabel
          Left = 4
          Top = 8
          Width = 64
          Height = 15
          Caption = #30331#37636#26085#26399
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = #32048#26126#39636
          Font.Style = []
          ParentFont = False
          OnClick = DBCtrlGrid1Click
        end
        object Label2: TLabel
          Left = 5
          Top = 30
          Width = 48
          Height = 15
          Caption = #34277#21697#21517
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = #32048#26126#39636
          Font.Style = []
          ParentFont = False
          OnClick = DBCtrlGrid1Click
        end
        object DBText1: TDBText
          Left = 56
          Top = 30
          Width = 137
          Height = 17
          DataField = 'MED_DESC'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -13
          Font.Name = #32048#26126#39636
          Font.Style = []
          ParentFont = False
          OnClick = DBCtrlGrid1Click
        end
        object Label5: TLabel
          Left = 5
          Top = 54
          Width = 48
          Height = 15
          Caption = #23416'  '#21517
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = #32048#26126#39636
          Font.Style = []
          ParentFont = False
          OnClick = DBCtrlGrid1Click
        end
        object DBText2: TDBText
          Left = 56
          Top = 54
          Width = 137
          Height = 17
          DataField = 'ALISE_DESC'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -13
          Font.Name = #32048#26126#39636
          Font.Style = []
          ParentFont = False
          OnClick = DBCtrlGrid1Click
        end
        object Label7: TLabel
          Left = 5
          Top = 76
          Width = 64
          Height = 15
          Caption = 'ATC code'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = #32048#26126#39636
          Font.Style = []
          ParentFont = False
          OnClick = DBCtrlGrid1Click
        end
        object DBText3: TDBText
          Left = 75
          Top = 77
          Width = 137
          Height = 17
          DataField = 'ATC_CODE'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -13
          Font.Name = #32048#26126#39636
          Font.Style = []
          ParentFont = False
          OnClick = DBCtrlGrid1Click
        end
        object DBEdit1: TDBEdit
          Left = 70
          Top = 3
          Width = 121
          Height = 22
          DataField = 'UPD_DATE'
          DataSource = DataSource1
          TabOrder = 0
          OnClick = DBCtrlGrid1Click
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 783
        Height = 676
        Align = alClient
        Caption = #36942#25935#36039#26009
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object Panel1: TPanel
          Left = 2
          Top = 633
          Width = 779
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #32048#26126#39636
          Font.Style = []
          ParentColor = True
          ParentFont = False
          TabOrder = 0
          object BtnClose: TBitBtn
            Left = 566
            Top = 8
            Width = 75
            Height = 25
            Caption = #38626#38283
            TabOrder = 0
            OnClick = BtnCloseClick
          end
          object BtnModify: TBitBtn
            Left = 406
            Top = 8
            Width = 75
            Height = 25
            Caption = #20462#25913
            Enabled = False
            TabOrder = 1
            OnClick = BtnModifyClick
          end
          object btnDel: TBitBtn
            Left = 486
            Top = 8
            Width = 75
            Height = 25
            Caption = #21034#38500
            Enabled = False
            TabOrder = 2
            OnClick = btnDelClick
          end
          object btnNew: TBitBtn
            Left = 326
            Top = 8
            Width = 75
            Height = 25
            Caption = #26032#22686
            TabOrder = 3
            OnClick = btnNewClick
          end
          object BtnClear: TBitBtn
            Left = 245
            Top = 8
            Width = 75
            Height = 25
            Caption = #28165#38500
            TabOrder = 4
            OnClick = BtnClearClick
          end
          object CheckBox1: TCheckBox
            Left = 40
            Top = 16
            Width = 97
            Height = 17
            Caption = #33290#36039#26009
            TabOrder = 5
            Visible = False
            OnClick = CheckBox1Click
          end
        end
        object Panel2: TPanel
          Left = 2
          Top = 18
          Width = 779
          Height = 615
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvSpace
          BevelWidth = 4
          ParentBackground = True
          ParentColor = True
          TabOrder = 1
          object GroupBox3: TGroupBox
            Left = 8
            Top = 89
            Width = 763
            Height = 120
            Align = alTop
            Caption = #31532#20108#38917#65306#30151#29376#25944#36848#25110#20854#20182#27880#24847#20107#38917
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = #32048#26126#39636
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Memo1: TMemo
              Left = 2
              Top = 17
              Width = 759
              Height = 101
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #32048#26126#39636
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object GroupBox4: TGroupBox
            Left = 8
            Top = 417
            Width = 401
            Height = 190
            Align = alLeft
            Caption = #38750#34277#21697#36942#25935#35352#37636
            Color = clSilver
            Font.Charset = CHINESEBIG5_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = #27161#26999#39636
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            object edtAlg1: TEdit
              Left = 14
              Top = 32
              Width = 331
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -16
              Font.Name = #32048#26126#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtAlg2: TEdit
              Left = 14
              Top = 64
              Width = 331
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -16
              Font.Name = #32048#26126#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object edtAlg3: TEdit
              Left = 14
              Top = 96
              Width = 331
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -16
              Font.Name = #32048#26126#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object btnAlg: TBitBtn
              Left = 302
              Top = 131
              Width = 75
              Height = 25
              Caption = #23384#27284
              TabOrder = 3
              OnClick = btnAlgClick
            end
            object BitBtn2: TBitBtn
              Left = 14
              Top = 131
              Width = 91
              Height = 25
              Caption = #28961#34277#29289#36942#25935
              TabOrder = 4
              OnClick = BitBtn2Click
            end
          end
          object DBGrid1: TDBGrid
            Left = 8
            Top = 89
            Width = 817
            Height = 200
            DataSource = DataSource2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #32048#26126#39636
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clNavy
            TitleFont.Height = -16
            TitleFont.Name = #32048#26126#39636
            TitleFont.Style = [fsBold]
            Visible = False
            OnDrawColumnCell = DBGrid1DrawColumnCell
            OnDblClick = DBGrid1DblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'FEE_CODE'
                Title.Caption = #34277#21697#20195#30908
                Width = 86
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FEE_NAME'
                Title.Caption = #34277#21697#21517
                Width = 215
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FEE_DESC'
                Title.Caption = #23416#21517
                Width = 223
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MED_TYPE'
                Title.Caption = #34277#29702#20998#39006
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ATC_CODE'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'USE_TYPE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -13
                Font.Name = #32048#26126#39636
                Font.Style = []
                Title.Caption = #20379#34277#21542
                Width = 70
                Visible = True
              end>
          end
          object GroupBox2: TGroupBox
            Left = 8
            Top = 8
            Width = 763
            Height = 81
            Align = alTop
            Caption = #31532#19968#38917' : '#34277#29289#36942#25935'/'#19981#33391#21453#25033#38917#30446
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = #32048#26126#39636
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object Label3: TLabel
              Left = 8
              Top = 24
              Width = 64
              Height = 15
              Caption = #34277#21697#20195#30908
            end
            object Label6: TLabel
              Left = 96
              Top = 24
              Width = 48
              Height = 15
              Caption = #34277#21697#21517
            end
            object Label8: TLabel
              Left = 272
              Top = 24
              Width = 32
              Height = 15
              Caption = #23416#21517
            end
            object Label9: TLabel
              Left = 440
              Top = 24
              Width = 64
              Height = 15
              Caption = #34277#29702#20998#39006
            end
            object Label4: TLabel
              Left = 519
              Top = 24
              Width = 64
              Height = 15
              Caption = 'ATC CODE'
            end
            object FEE_CODE: TEdit
              Left = 8
              Top = 48
              Width = 81
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = #32048#26126#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = FEE_CODEChange
              OnKeyDown = FEE_CODEKeyDown
            end
            object FEE_DESC: TEdit
              Left = 263
              Top = 48
              Width = 177
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = #32048#26126#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = FEE_DESCChange
              OnKeyDown = FEE_CODEKeyDown
            end
            object ALISE_DESC: TEdit
              Left = 91
              Top = 48
              Width = 170
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = #32048#26126#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnChange = ALISE_DESCChange
              OnKeyDown = FEE_CODEKeyDown
            end
            object med_type: TEdit
              Left = 439
              Top = 48
              Width = 77
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = #32048#26126#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object OPD_DATE: TEdit
              Left = 240
              Top = 16
              Width = 33
              Height = 23
              TabOrder = 4
              Visible = False
            end
            object ATC_CODE: TEdit
              Left = 518
              Top = 48
              Width = 83
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = #32048#26126#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
          end
          object GroupBox5: TGroupBox
            Left = 8
            Top = 369
            Width = 763
            Height = 48
            Align = alTop
            Color = clSilver
            Font.Charset = CHINESEBIG5_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = #27161#26999#39636
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
            object CheckBox2: TCheckBox
              Left = 16
              Top = 23
              Width = 193
              Height = 17
              Caption = #27492#34277#29289#19981#21487#20351#29992
              Font.Charset = CHINESEBIG5_CHARSET
              Font.Color = clRed
              Font.Height = -16
              Font.Name = #27161#26999#39636
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              Visible = False
            end
          end
          object GroupBox6: TGroupBox
            Left = 8
            Top = 209
            Width = 763
            Height = 160
            Align = alTop
            Caption = #31532#19977#38917#65306#20132#21449#36942#25935#27298#26680
            Color = clSilver
            Font.Charset = CHINESEBIG5_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = #27161#26999#39636
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
            object drug_inter1: TCheckBox
              Left = 8
              Top = 19
              Width = 617
              Height = 20
              Hint = 'N'
              Caption = 'NSAIDs '#39006'       '#65306#34277#29702#20998#39006'02020??? ['#25490#38500'02020100'#12289'02020600'#12289'02021000]'
              Font.Charset = CHINESEBIG5_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object drug_inter2: TCheckBox
              Left = 8
              Top = 43
              Width = 553
              Height = 20
              Hint = 'N'
              Caption = 'Penicillin '#39006'   '#65306#34277#29702#20998#39006'100101??'
              Font.Charset = CHINESEBIG5_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object drug_inter3: TCheckBox
              Left = 8
              Top = 67
              Width = 569
              Height = 20
              Hint = 'N'
              Caption = 'Cephalosporin '#39006#65306#34277#29702#20998#39006'100102??'
              Font.Charset = CHINESEBIG5_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object drug_inter6: TCheckBox
              Left = 8
              Top = 139
              Width = 633
              Height = 20
              Hint = 'N'
              Caption = 
                'Anticonvulsant'#39006#65306'ATC code-N03A ['#25490#38500'N03AG(Depakin)'#12289'N03AX(Keppra'#12289'Top' +
                'amax)]'
              Font.Charset = CHINESEBIG5_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object drug_inter5: TCheckBox
              Left = 8
              Top = 115
              Width = 505
              Height = 20
              Hint = 'N'
              Caption = 'Sulfonamide '#39006#21450'COX-2 inhibitor'#65306#34277#29702#20998#39006' 10010900'#12289'02021000'
              Font.Charset = CHINESEBIG5_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object drug_inter4: TCheckBox
              Left = 8
              Top = 91
              Width = 545
              Height = 20
              Hint = 'N'
              Caption = 'Tetracycline '#39006' '#65306#34277#29702#20998#39006'10010700'
              Font.Charset = CHINESEBIG5_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
          end
        end
      end
    end
  end
  object Panel3: TPanel [2]
    Left = 1088
    Top = -1
    Width = 132
    Height = 28
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 105
      Top = 1
      Width = 25
      Height = 25
      Cancel = True
      ModalResult = 2
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object DataSource1: TDataSource
    Left = 700
    Top = 185
  end
  object DataSource2: TDataSource
    DataSet = DM.QrySearch3
    Left = 382
    Top = 332
  end
end
