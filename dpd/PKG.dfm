inherited FrmPKG: TFrmPKG
  Left = 560
  Top = 121
  BorderStyle = bsSingle
  Caption = #35373#31435#22871#39184
  ClientHeight = 704
  ClientWidth = 1016
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnMouseUp = FormMouseUp
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Top = 687
    Width = 1016
  end
  object PageControl1: TPageControl [1]
    Left = 0
    Top = 0
    Width = 1016
    Height = 649
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -20
    Font.Name = #27161#26999#39636
    Font.Style = []
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #23494#30908#20462#25913
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 611
        Align = alClient
        Color = 15516857
        TabOrder = 0
        object Label1: TLabel
          Left = 370
          Top = 24
          Width = 112
          Height = 28
          Caption = #35722#26356#23494#30908
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -28
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 200
          Top = 168
          Width = 231
          Height = 21
          Caption = #33290#23494#30908'(old password):'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 200
          Top = 216
          Width = 231
          Height = 21
          Caption = #26032#23494#30908'(new password):'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 200
          Top = 260
          Width = 220
          Height = 21
          Caption = #30906#35469#26032#23494#30908'(confirm):'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 200
          Top = 130
          Width = 187
          Height = 21
          Caption = #37291#24107#20195#30908' user ID:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object User: TLabel
          Left = 424
          Top = 132
          Width = 40
          Height = 20
          Caption = 'User'
          Color = 15516857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object User_N: TLabel
          Left = 519
          Top = 132
          Width = 121
          Height = 24
          AutoSize = False
          Caption = 'NAME'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 144
          Top = 328
          Width = 377
          Height = 20
          AutoSize = False
          Caption = #27880#24847#20107#38917':1.'#23494#30908#38263#24230#35531#21247#36229#36942#21313#30908
          Color = 15516857
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label8: TLabel
          Left = 234
          Top = 365
          Width = 573
          Height = 20
          AutoSize = False
          Caption = '2.'#23494#30908#21487#28858#20219#24847#20043#32068#21512'('#19981#21487#28858#31354#20540'),'#35531#35352#24471#24744#36664#20837#26178#30340#22823#23567#23531
          Color = 15516857
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object BitBtn2: TBitBtn
          Left = 668
          Top = 261
          Width = 125
          Height = 28
          Caption = #30906#35469'(Send)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn2Click
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF000000
            000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF0000000000000000000000000000000000000000000000000000000000FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
            FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
            0000000000000000000000000000000000000000FF000000FF000000FF000000
            FF00000000000000000000000000000000000000000000000000FF00FF000000
            00007B7B7B007B7B7B0000000000FF00FF00FF00FF000000FF000000FF00FF00
            FF00FF00FF00000000007B7B7B007B7B7B0000000000FF00FF00FF00FF000000
            0000000000000000000000000000FF00FF00FF00FF000000FF000000FF00FF00
            FF00FF00FF0000000000000000000000000000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            000000000000000000000000000000000000FF00FF000000FF000000FF00FF00
            FF0000000000000000000000000000000000000000000000000000000000FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
            FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
            0000000000000000000000000000000000000000FF000000FF000000FF000000
            FF00000000000000000000000000000000000000000000000000FF00FF000000
            00007B7B7B007B7B7B0000000000FF00FF00FF00FF000000FF000000FF00FF00
            FF00FF00FF00000000007B7B7B007B7B7B0000000000FF00FF00FF00FF000000
            0000000000000000000000000000FF00FF00FF00FF000000FF000000FF00FF00
            FF00FF00FF0000000000000000000000000000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000007B7B7B007B7B7B000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object BitBtn3: TBitBtn
          Left = 801
          Top = 261
          Width = 132
          Height = 28
          Caption = #37325#35373'(Rset)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn3Click
          Glyph.Data = {
            EE000000424DEE000000000000007600000028000000100000000F0000000100
            0400000000007800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F8F8F8F8F8F8
            F8F88F8F0F8F8F8F8F8FF8F00800F8F8F8F88F0E0F8F0F8F8F8F000E00000000
            F8F880EE07770F8F8F8FF0EE077708F8F8F880EE07770F8F0F8FF0EE077708F0
            08F880EE07770F00000FF0EE077708F008F880EE07770F8F0F8FF000777708F8
            F8F8800777770F8F8F8FF000000008F8F8F8}
        end
        object Edit1: TEdit
          Left = 496
          Top = 173
          Width = 121
          Height = 28
          Color = clInfoBk
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ImeMode = imClose
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 2
        end
        object Edit2: TEdit
          Left = 496
          Top = 216
          Width = 121
          Height = 28
          Color = clInfoBk
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ImeMode = imClose
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 3
        end
        object Edit3: TEdit
          Left = 496
          Top = 256
          Width = 121
          Height = 28
          Color = clInfoBk
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ImeMode = imClose
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 4
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'S O A MX'#37291#20196
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 611
        Align = alClient
        Color = 15516857
        TabOrder = 0
        object PageControl2: TPageControl
          Left = 1
          Top = 1
          Width = 1006
          Height = 609
          ActivePage = TabSheet4
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = #27161#26999#39636
          Font.Style = [fsBold]
          ParentFont = False
          Style = tsFlatButtons
          TabOrder = 0
          OnChange = PageControl2Change
          object TabSheet4: TTabSheet
            Caption = #26032#22686
            ImageIndex = 1
            DesignSize = (
              998
              570)
            object Label7: TLabel
              Left = 5
              Top = 4
              Width = 260
              Height = 20
              Caption = #26032#22686#34389#32622#20195#30908':('#20363#22914'F89001C)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 8
              Top = 536
              Width = 463
              Height = 21
              Caption = '*'#27599#19968#34892#38480#23450'128'#23383'('#31354#26684#65292#31526#34399#20063#31639#19968#20491#23383#27597')'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = #27161#26999#39636
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 5
              Top = 493
              Width = 80
              Height = 20
              Caption = #35386#26039#20195#30908
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 676
              Top = 64
              Width = 70
              Height = 20
              Caption = 'MX '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label14: TLabel
              Left = 5
              Top = 64
              Width = 150
              Height = 20
              Caption = 'Subjective '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label15: TLabel
              Left = 349
              Top = 64
              Width = 140
              Height = 20
              Caption = 'Objective '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object edt_fee_code: TEdit
              Left = 6
              Top = 28
              Width = 177
              Height = 30
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              MaxLength = 12
              ParentFont = False
              TabOrder = 0
            end
            object BitBtn1: TBitBtn
              Left = 908
              Top = 530
              Width = 74
              Height = 28
              Anchors = [akRight, akBottom]
              Caption = #26032#22686
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = BitBtn1Click
              Glyph.Data = {
                26050000424D26050000000000003604000028000000100000000F0000000100
                080000000000F000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                0707070707070707070707070707070704040404040404040407070707070707
                04FFFFFFFFFFFFFF040707070707070704FF0000000000FF0407000000000000
                04FFFFFFFFFFFFFF040700FFFFFFFFFF04FF0000000000FF040700FF00000000
                04FFFFFFFFFFFFFF040700FFFFFFFFFF04FF0000FF040404040700FF00000000
                04FFFFFFFF04FF04070700FFFFFFFFFF04FFFFFFFF040407070700FF0000FF00
                0404040404040707070700FFFFFFFF00FF00070707070707070700FFFFFFFF00
                0007070707070707070700000000000007070707070707070707070707070707
                07070707070707070707}
            end
            object memo_fee_desc: TMemo
              Left = 674
              Top = 88
              Width = 321
              Height = 393
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 2
            end
            object edt_icd9: TEdit
              Left = 87
              Top = 488
              Width = 98
              Height = 30
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              TabOrder = 3
            end
            object memo_s_d: TMemo
              Left = 4
              Top = 88
              Width = 319
              Height = 393
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 4
            end
            object memo_o_d: TMemo
              Left = 338
              Top = 88
              Width = 319
              Height = 393
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 5
            end
          end
          object TabSheet5: TTabSheet
            Caption = #20462#25913
            ImageIndex = 2
            DesignSize = (
              998
              570)
            object Label11: TLabel
              Left = 143
              Top = 5
              Width = 80
              Height = 20
              Caption = #35386#26039#20195#30908
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 8
              Top = 536
              Width = 463
              Height = 21
              Caption = '*'#27599#19968#34892#38480#23450'128'#23383'('#31354#26684#65292#31526#34399#20063#31639#19968#20491#23383#27597')'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = #27161#26999#39636
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label17: TLabel
              Left = 148
              Top = 41
              Width = 150
              Height = 20
              Caption = 'Subjective '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 436
              Top = 41
              Width = 140
              Height = 20
              Caption = 'Objective '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label19: TLabel
              Left = 726
              Top = 41
              Width = 70
              Height = 20
              Caption = 'MX '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object memo_fee_desc_update: TMemo
              Left = 721
              Top = 63
              Width = 276
              Height = 458
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 0
            end
            object BitBtn5: TBitBtn
              Left = 908
              Top = 530
              Width = 87
              Height = 28
              Anchors = [akRight, akBottom]
              Caption = #20462#25913
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = BitBtn5Click
              Glyph.Data = {
                26050000424D26050000000000003604000028000000100000000F0000000100
                080000000000F000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                0707070707070707070707070707070704040404040404040407070707070707
                04FFFFFFFFFFFFFF040707070707070704FF0000000000FF0407000000000000
                04FFFFFFFFFFFFFF040700FFFFFFFFFF04FF0000000000FF040700FF00000000
                04FFFFFFFFFFFFFF040700FFFFFFFFFF04FF0000FF040404040700FF00000000
                04FFFFFFFF04FF04070700FFFFFFFFFF04FFFFFFFF040407070700FF0000FF00
                0404040404040707070700FFFFFFFF00FF00070707070707070700FFFFFFFF00
                0007070707070707070700000000000007070707070707070707070707070707
                07070707070707070707}
            end
            object edt_icd9_upd: TEdit
              Left = 225
              Top = 0
              Width = 98
              Height = 30
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              TabOrder = 3
            end
            object memo_s_d_update: TMemo
              Left = 145
              Top = 63
              Width = 276
              Height = 458
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 4
            end
            object memo_o_d_update: TMemo
              Left = 433
              Top = 63
              Width = 276
              Height = 458
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 5
            end
            object SGPKGUpd1: TStringGrid
              Left = 0
              Top = 0
              Width = 140
              Height = 521
              ColCount = 2
              FixedCols = 0
              RowCount = 1
              FixedRows = 0
              TabOrder = 1
              OnClick = SGPKGUpd1DblClick
            end
          end
          object TabSheet6: TTabSheet
            Caption = #21034#38500
            ImageIndex = 3
            DesignSize = (
              998
              570)
            object Label12: TLabel
              Left = 143
              Top = 5
              Width = 80
              Height = 20
              Caption = #35386#26039#20195#30908
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label20: TLabel
              Left = 726
              Top = 41
              Width = 70
              Height = 20
              Caption = 'MX '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label21: TLabel
              Left = 436
              Top = 41
              Width = 140
              Height = 20
              Caption = 'Objective '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label22: TLabel
              Left = 148
              Top = 41
              Width = 150
              Height = 20
              Caption = 'Subjective '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object memo_fee_desc_del: TMemo
              Left = 721
              Top = 63
              Width = 276
              Height = 458
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 0
            end
            object BitBtn6: TBitBtn
              Left = 908
              Top = 530
              Width = 79
              Height = 28
              Anchors = [akRight, akBottom]
              Caption = #21034#38500
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = BitBtn6Click
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333FF33333333333330003333333333333777333333333333
                300033FFFFFF3333377739999993333333333777777F3333333F399999933333
                3300377777733333337733333333333333003333333333333377333333333333
                3333333333333333333F333333333333330033333F33333333773333C3333333
                330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
                993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
                333333377F33333333FF3333C333333330003333733333333777333333333333
                3000333333333333377733333333333333333333333333333333}
              NumGlyphs = 2
            end
            object edt_icd9_del: TEdit
              Left = 225
              Top = 0
              Width = 98
              Height = 30
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              TabOrder = 2
            end
            object memo_s_d_del: TMemo
              Left = 145
              Top = 63
              Width = 276
              Height = 458
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 3
            end
            object memo_o_d_del: TMemo
              Left = 433
              Top = 63
              Width = 276
              Height = 458
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 4
            end
            object SGPKGDel1: TStringGrid
              Left = 0
              Top = 0
              Width = 140
              Height = 521
              ColCount = 2
              FixedCols = 0
              RowCount = 1
              FixedRows = 0
              TabOrder = 5
              OnClick = SGPKGDel1Click
            end
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #24120#29992#34277#21697
      ImageIndex = 2
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 611
        Align = alClient
        Color = 15516857
        TabOrder = 0
        DesignSize = (
          1008
          611)
        object Label23: TLabel
          Left = 80
          Top = 504
          Width = 41
          Height = 18
          AutoSize = False
          Caption = #20195#30908
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 488
          Top = 504
          Width = 121
          Height = 20
          AutoSize = False
          Caption = #23416#21517'/'#25104#20221#21517
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 62
          Top = 556
          Width = 39
          Height = 21
          AutoSize = False
          Caption = #30952#31881
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 137
          Top = 556
          Width = 41
          Height = 22
          AutoSize = False
          Caption = #21137#37327
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 312
          Top = 557
          Width = 41
          Height = 20
          AutoSize = False
          Caption = #38971#29575
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 201
          Top = 555
          Width = 41
          Height = 22
          AutoSize = False
          Caption = #22825#25976
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 440
          Top = 557
          Width = 41
          Height = 22
          AutoSize = False
          Caption = #32317#37327
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 8
          Top = 8
          Width = 340
          Height = 20
          Caption = #35201#21034#38500#20491#20154#24120#29992#34277#21697#35531#22312#34277#21697#20195#30908#36984#21462
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object ComboBox2: TComboBox
          Left = 62
          Top = 581
          Width = 43
          Height = 28
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ImeMode = imClose
          ItemHeight = 20
          ParentFont = False
          TabOrder = 0
          Text = 'N'
          Items.Strings = (
            'Y'
            'N')
        end
        object Edit9: TEdit
          Left = 128
          Top = 581
          Width = 57
          Height = 28
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ImeMode = imClose
          ParentFont = False
          TabOrder = 1
          OnChange = Edit9Change
        end
        object Edit11: TEdit
          Left = 192
          Top = 581
          Width = 57
          Height = 28
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ImeMode = imClose
          ParentFont = False
          TabOrder = 2
          OnChange = Edit9Change
        end
        object Edit12: TEdit
          Left = 432
          Top = 581
          Width = 57
          Height = 28
          Color = 10153983
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ImeMode = imClose
          ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object ComboBox3: TComboBox
          Left = 272
          Top = 581
          Width = 121
          Height = 28
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ImeMode = imClose
          ItemHeight = 20
          ParentFont = False
          TabOrder = 4
          OnChange = Edit9Change
          OnKeyPress = ComboBox3KeyPress
          Items.Strings = (
            'STAT'
            'QID'
            'Q6H'
            'Q8H'
            'Q12H'
            'BID'
            'TID'
            'AC'
            'BID AC'
            'BID PC'
            'HS'
            'PC'
            'PRN'
            'Q1H'
            'Q2H'
            'Q4H'
            'QD'
            'QOD'
            'AC0.5H'
            'AC1.5H'
            'AC15M'
            'AC1H'
            'AC2H'
            'AC30M'
            'ASORDER'
            'BID&HS'
            'BIW'
            'HS PRN'
            'PC0.5H'
            'PC1.5H'
            'PC15M'
            'PC1H'
            'PC2H'
            'PC30M'
            'Q15MN'
            'Q1M'
            'Q20MN'
            'Q2D'
            'Q2M'
            'Q2W'
            'Q30MN'
            'Q3H'
            'Q3M'
            'Q3W'
            'Q4H PRN'
            'Q4M'
            'Q4W'
            'Q5H'
            'Q6H PRN'
            'Q6M'
            'Q8H PRN'
            'QAM&HS'
            'QAM&PM'
            'QD AC'
            'QD PC'
            'QD&HS'
            'QDAM'
            'QDHS'
            'QDPM'
            'QID AC'
            'QID PC'
            'QN'
            'QPM&HS'
            'QW'
            'TID AC'
            'TID AC&HS'
            'TID PC'
            'TID WITHMEAL'
            'TID&HS'
            'TIW'
            'Q3D')
        end
        object BitBtn8: TBitBtn
          Left = 496
          Top = 581
          Width = 70
          Height = 28
          Anchors = [akRight, akBottom]
          Caption = #26032#22686
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = BitBtn8Click
          Glyph.Data = {
            26050000424D26050000000000003604000028000000100000000F0000000100
            080000000000F000000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
            A400000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
            0707070707070707070707070707070704040404040404040407070707070707
            04FFFFFFFFFFFFFF040707070707070704FF0000000000FF0407000000000000
            04FFFFFFFFFFFFFF040700FFFFFFFFFF04FF0000000000FF040700FF00000000
            04FFFFFFFFFFFFFF040700FFFFFFFFFF04FF0000FF040404040700FF00000000
            04FFFFFFFF04FF04070700FFFFFFFFFF04FFFFFFFF040407070700FF0000FF00
            0404040404040707070700FFFFFFFF00FF00070707070707070700FFFFFFFF00
            0007070707070707070700000000000007070707070707070707070707070707
            07070707070707070707}
        end
        object Edit42: TEdit
          Left = 16
          Top = 528
          Width = 169
          Height = 28
          ImeMode = imClose
          TabOrder = 6
          OnKeyDown = Edit42KeyDown
          OnKeyPress = Edit42KeyPress
          OnKeyUp = Edit42KeyUp
        end
        object Edit43: TEdit
          Left = 208
          Top = 528
          Width = 777
          Height = 28
          ImeMode = imClose
          TabOrder = 7
          OnKeyDown = Edit42KeyDown
          OnKeyPress = FormKeyPress
          OnKeyUp = Edit43KeyUp
        end
        object SGMed: TStringGrid
          Left = 1
          Top = 32
          Width = 1004
          Height = 465
          ColCount = 8
          FixedCols = 0
          RowCount = 1
          FixedRows = 0
          TabOrder = 9
          OnClick = SGMedClick
          ColWidths = (
            94
            127
            360
            82
            70
            81
            61
            67)
        end
        object PanelMed: TPanel
          Left = 0
          Top = 308
          Width = 1006
          Height = 188
          TabOrder = 8
          Visible = False
          object DBCGMed: TDBCtrlGrid
            Left = 1
            Top = 1
            Width = 488
            Height = 186
            Align = alLeft
            DataSource = DsMed
            PanelHeight = 31
            PanelWidth = 471
            TabOrder = 0
            RowCount = 6
            SelectedColor = clAqua
            object Bevel1: TBevel
              Left = 0
              Top = 0
              Width = 66
              Height = 31
              Align = alLeft
              Shape = bsRightLine
            end
            object DBText2: TDBText
              Left = 67
              Top = 0
              Width = 390
              Height = 12
              DataField = 'Fee_Name'
              DataSource = DsMed
              Font.Charset = CHINESEBIG5_CHARSET
              Font.Color = clMaroon
              Font.Height = -13
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = DBText1Click
            end
            object DBText1: TDBText
              Left = 2
              Top = 0
              Width = 60
              Height = 12
              DataField = 'Fee_code'
              DataSource = DsMed
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = DBText1Click
            end
            object DBText3: TDBText
              Left = 68
              Top = 16
              Width = 395
              Height = 12
              DataField = 'Fee_desc'
              DataSource = DsMed
              Font.Charset = CHINESEBIG5_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = #32048#26126#39636
              Font.Style = []
              ParentFont = False
              OnClick = DBText1Click
            end
            object Label52: TLabel
              Left = 2
              Top = 16
              Width = 28
              Height = 12
              Caption = 'Labe'
              Font.Charset = CHINESEBIG5_CHARSET
              Font.Color = clRed
              Font.Height = -12
              Font.Name = #32048#26126#39636
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = DBText1Click
            end
          end
          object Panel41: TPanel
            Left = 489
            Top = 1
            Width = 516
            Height = 186
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 2
            TabOrder = 1
            object Panel42: TPanel
              Left = 2
              Top = 165
              Width = 512
              Height = 19
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              object Label53: TLabel
                Left = 7
                Top = 0
                Width = 64
                Height = 15
                Caption = #20351#29992#29376#24907
                Font.Charset = CHINESEBIG5_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = #32048#26126#39636
                Font.Style = []
                ParentFont = False
              end
              object Label54: TLabel
                Left = 182
                Top = 0
                Width = 30
                Height = 13
                Caption = #20581#20445
                Font.Charset = CHINESEBIG5_CHARSET
                Font.Color = 16384
                Font.Height = -13
                Font.Name = #32048#26126#39636
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label55: TLabel
                Left = 308
                Top = 0
                Width = 30
                Height = 13
                Caption = #33258#36027
                Font.Charset = CHINESEBIG5_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = #32048#26126#39636
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText4: TDBText
                Left = 217
                Top = 0
                Width = 57
                Height = 15
                DataField = 'INS_PAY_UAMT'
                Font.Charset = CHINESEBIG5_CHARSET
                Font.Color = 16384
                Font.Height = -13
                Font.Name = #32048#26126#39636
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText5: TDBText
                Left = 343
                Top = 0
                Width = 57
                Height = 15
                DataField = 'SELF_PAY_UAMT'
                Font.Charset = CHINESEBIG5_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = #32048#26126#39636
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText6: TDBText
                Left = 70
                Top = 0
                Width = 57
                Height = 15
                DataField = 'USE_STATUS_DESC'
              end
            end
            object DBMemo1: TDBMemo
              Left = 2
              Top = 2
              Width = 512
              Height = 163
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              Color = clBtnFace
              DataField = 'INS_RULE'
              DataSource = DsMed
              Font.Charset = CHINESEBIG5_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #32048#26126#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
        object Edit4: TEdit
          Left = 400
          Top = 580
          Width = 17
          Height = 28
          TabOrder = 10
          Visible = False
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'S O A MX'#22871#39184
      ImageIndex = 3
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 611
        Align = alClient
        Color = 15516857
        TabOrder = 0
        object PageControl3: TPageControl
          Left = 1
          Top = 1
          Width = 1006
          Height = 609
          ActivePage = TabSheet8
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = #27161#26999#39636
          Font.Style = [fsBold]
          ParentFont = False
          Style = tsFlatButtons
          TabOrder = 0
          OnChange = PageControl3Change
          object TabSheet8: TTabSheet
            Caption = #26032#22686
            ImageIndex = 1
            DesignSize = (
              998
              570)
            object Label31: TLabel
              Left = 5
              Top = 4
              Width = 170
              Height = 20
              Caption = #22871#39184#21517#31281'('#20363#22914'RCF)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label32: TLabel
              Left = 8
              Top = 536
              Width = 463
              Height = 21
              Caption = '*'#27599#19968#34892#38480#23450'128'#23383'('#31354#26684#65292#31526#34399#20063#31639#19968#20491#23383#27597')'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = #27161#26999#39636
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label33: TLabel
              Left = 5
              Top = 493
              Width = 80
              Height = 20
              Caption = #35386#26039#20195#30908
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label34: TLabel
              Left = 679
              Top = 65
              Width = 70
              Height = 20
              Caption = 'MX '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label35: TLabel
              Left = 343
              Top = 65
              Width = 140
              Height = 20
              Caption = 'Objective '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label36: TLabel
              Left = 7
              Top = 65
              Width = 150
              Height = 20
              Caption = 'Subjective '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object edt_pkg_name: TEdit
              Left = 6
              Top = 28
              Width = 177
              Height = 30
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              MaxLength = 12
              ParentFont = False
              TabOrder = 0
            end
            object memo_pkg_mx_new: TMemo
              Left = 674
              Top = 88
              Width = 321
              Height = 393
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 1
            end
            object edt_pkd_icd9_new: TEdit
              Left = 87
              Top = 488
              Width = 98
              Height = 30
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
              ParentFont = False
              TabOrder = 2
            end
            object memo_pkg_s_d_new: TMemo
              Left = 4
              Top = 88
              Width = 319
              Height = 393
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 3
            end
            object memo_pkg_o_d_new: TMemo
              Left = 338
              Top = 88
              Width = 319
              Height = 393
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 4
            end
            object BitBtn7: TBitBtn
              Left = 908
              Top = 530
              Width = 72
              Height = 28
              Anchors = [akRight, akBottom]
              Caption = #26032#22686
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnClick = BitBtn7Click
              Glyph.Data = {
                26050000424D26050000000000003604000028000000100000000F0000000100
                080000000000F000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                0707070707070707070707070707070704040404040404040407070707070707
                04FFFFFFFFFFFFFF040707070707070704FF0000000000FF0407000000000000
                04FFFFFFFFFFFFFF040700FFFFFFFFFF04FF0000000000FF040700FF00000000
                04FFFFFFFFFFFFFF040700FFFFFFFFFF04FF0000FF040404040700FF00000000
                04FFFFFFFF04FF04070700FFFFFFFFFF04FFFFFFFF040407070700FF0000FF00
                0404040404040707070700FFFFFFFF00FF00070707070707070700FFFFFFFF00
                0007070707070707070700000000000007070707070707070707070707070707
                07070707070707070707}
            end
          end
          object TabSheet9: TTabSheet
            Caption = #20462#25913
            ImageIndex = 2
            DesignSize = (
              998
              570)
            object Label37: TLabel
              Left = 143
              Top = 5
              Width = 80
              Height = 20
              Caption = #35386#26039#20195#30908
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label38: TLabel
              Left = 8
              Top = 536
              Width = 463
              Height = 21
              Caption = '*'#27599#19968#34892#38480#23450'128'#23383'('#31354#26684#65292#31526#34399#20063#31639#19968#20491#23383#27597')'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = #27161#26999#39636
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label39: TLabel
              Left = 726
              Top = 41
              Width = 70
              Height = 20
              Caption = 'MX '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label40: TLabel
              Left = 436
              Top = 41
              Width = 140
              Height = 20
              Caption = 'Objective '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label41: TLabel
              Left = 148
              Top = 41
              Width = 150
              Height = 20
              Caption = 'Subjective '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object memo_pkg_mx_upd: TMemo
              Left = 721
              Top = 63
              Width = 276
              Height = 458
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 0
            end
            object edt_pkd_icd9_upd: TEdit
              Left = 225
              Top = 0
              Width = 98
              Height = 30
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              TabOrder = 1
            end
            object memo_pkg_s_d_upd: TMemo
              Left = 145
              Top = 63
              Width = 276
              Height = 458
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 2
            end
            object memo_pkg_o_d_upd: TMemo
              Left = 433
              Top = 63
              Width = 276
              Height = 458
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 3
            end
            object SGPKGUpd2: TStringGrid
              Left = 0
              Top = 0
              Width = 140
              Height = 521
              ColCount = 2
              FixedCols = 0
              RowCount = 1
              FixedRows = 0
              TabOrder = 4
              OnClick = SGPKGUpd2Click
            end
            object BitBtn9: TBitBtn
              Left = 908
              Top = 530
              Width = 72
              Height = 28
              Anchors = [akRight, akBottom]
              Caption = #20462#25913
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnClick = BitBtn9Click
              Glyph.Data = {
                26050000424D26050000000000003604000028000000100000000F0000000100
                080000000000F000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                0707070707070707070707070707070704040404040404040407070707070707
                04FFFFFFFFFFFFFF040707070707070704FF0000000000FF0407000000000000
                04FFFFFFFFFFFFFF040700FFFFFFFFFF04FF0000000000FF040700FF00000000
                04FFFFFFFFFFFFFF040700FFFFFFFFFF04FF0000FF040404040700FF00000000
                04FFFFFFFF04FF04070700FFFFFFFFFF04FFFFFFFF040407070700FF0000FF00
                0404040404040707070700FFFFFFFF00FF00070707070707070700FFFFFFFF00
                0007070707070707070700000000000007070707070707070707070707070707
                07070707070707070707}
            end
          end
          object TabSheet10: TTabSheet
            Caption = #21034#38500
            ImageIndex = 3
            DesignSize = (
              998
              570)
            object Label42: TLabel
              Left = 143
              Top = 5
              Width = 80
              Height = 20
              Caption = #35386#26039#20195#30908
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label43: TLabel
              Left = 726
              Top = 41
              Width = 70
              Height = 20
              Caption = 'MX '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label44: TLabel
              Left = 436
              Top = 41
              Width = 140
              Height = 20
              Caption = 'Objective '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object Label45: TLabel
              Left = 148
              Top = 41
              Width = 150
              Height = 20
              Caption = 'Subjective '#20839#23481
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
            end
            object memo_pkg_mx_del: TMemo
              Left = 721
              Top = 63
              Width = 276
              Height = 458
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 0
            end
            object edt_pkd_icd9_del: TEdit
              Left = 225
              Top = 0
              Width = 98
              Height = 30
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              TabOrder = 1
            end
            object memo_pkg_s_d_del: TMemo
              Left = 145
              Top = 63
              Width = 276
              Height = 458
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 2
            end
            object memo_pkg_o_d_del: TMemo
              Left = 433
              Top = 63
              Width = 276
              Height = 458
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Times New Roman'
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 3
            end
            object SGPKGDel2: TStringGrid
              Left = 0
              Top = 0
              Width = 140
              Height = 521
              ColCount = 2
              FixedCols = 0
              RowCount = 1
              FixedRows = 0
              TabOrder = 4
              OnClick = SGPKGDel2Click
            end
            object BitBtn10: TBitBtn
              Left = 908
              Top = 530
              Width = 72
              Height = 28
              Anchors = [akRight, akBottom]
              Caption = #21034#38500
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -20
              Font.Name = #27161#26999#39636
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnClick = BitBtn10Click
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333FF33333333333330003333333333333777333333333333
                300033FFFFFF3333377739999993333333333777777F3333333F399999933333
                3300377777733333337733333333333333003333333333333377333333333333
                3333333333333333333F333333333333330033333F33333333773333C3333333
                330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
                993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
                333333377F33333333FF3333C333333330003333733333333777333333333333
                3000333333333333377733333333333333333333333333333333}
              NumGlyphs = 2
            end
          end
        end
      end
    end
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 649
    Width = 1016
    Height = 38
    Align = alBottom
    Color = 15516857
    TabOrder = 2
    object Button1: TButton
      Left = 931
      Top = 9
      Width = 75
      Height = 26
      Caption = #38626#38283
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #27161#26999#39636
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  inherited Timer2: TTimer
    Left = 842
    Top = 656
  end
  inherited XPManifest1: TXPManifest
    Left = 811
    Top = 656
  end
  object DsMed: TDataSource
    Left = 872
    Top = 656
  end
end
