inherited FrmDPDCI: TFrmDPDCI
  Left = 187
  Top = 0
  Align = alClient
  BorderIcons = [biSystemMenu]
  Caption = #29273#31185#37291#20196#22577#21040#31995#32113
  ClientHeight = 704
  ClientWidth = 1018
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited MySBar: TStatusBar
    Top = 687
    Width = 1018
  end
  object Panel4: TPanel [1]
    Left = 0
    Top = 0
    Width = 1018
    Height = 103
    Align = alTop
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 915
      Height = 101
      Align = alLeft
      BevelInner = bvLowered
      BevelWidth = 3
      Color = 16508624
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 20
        Width = 72
        Height = 16
        Caption = #30475#35386#26085#26399':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object BegDay: TSpeedButton
        Left = 182
        Top = 14
        Width = 35
        Height = 29
        Cursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
          F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
          F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
          F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
          F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
          F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
          F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
          333337FFFFFFFF77333330000000000333333777777777733333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = BegDayClick
      end
      object mask_begday: TMaskEdit
        Left = 82
        Top = 14
        Width = 97
        Height = 24
        EditMask = '###/##/##;0;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ImeMode = imClose
        MaxLength = 9
        ParentFont = False
        TabOrder = 0
      end
      object G_condition: TGroupBox
        Left = 229
        Top = 6
        Width = 676
        Height = 87
        TabOrder = 1
        object Label5: TLabel
          Left = 122
          Top = 16
          Width = 64
          Height = 16
          Caption = #30149#27511#34399#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
        end
        object edt_chr_no: TEdit
          Left = 184
          Top = 10
          Width = 95
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = #27161#26999#39636
          Font.Style = []
          ImeMode = imClose
          MaxLength = 8
          ParentFont = False
          TabOrder = 0
        end
        object rdo_chr: TRadioButton
          Left = 10
          Top = 16
          Width = 107
          Height = 17
          Caption = #30149#27511#34399#26597#35426
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #27161#26999#39636
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = rdo_chrClick
        end
        object rdg_app: TRadioGroup
          Left = 8
          Top = 34
          Width = 662
          Height = 50
          Caption = #32004#35386
          Columns = 5
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          ItemIndex = 9
          Items.Strings = (
            'OD'
            'GP '
            'ORP'
            'OR'
            'OS'
            'PD'
            'PS'
            'E'
            'P'
            'NO')
          ParentFont = False
          TabOrder = 2
          OnClick = rdg_appClick
        end
      end
      object RG_Shift_No: TRadioGroup
        Left = 12
        Top = 47
        Width = 205
        Height = 43
        Caption = #35386#21029
        Columns = 3
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #19978#21320
          #19979#21320
          #26202#19978)
        ParentFont = False
        TabOrder = 2
        OnClick = Addparams
      end
    end
    object TPanel
      Left = 916
      Top = 1
      Width = 101
      Height = 101
      Align = alClient
      BevelInner = bvLowered
      BevelWidth = 3
      Color = 16508624
      TabOrder = 1
      object BtnConfirm: TButton
        Left = 7
        Top = 10
        Width = 87
        Height = 25
        Caption = #30906#35469
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #32048#26126#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 103
    Width = 1018
    Height = 584
    Align = alClient
    Color = 16508624
    TabOrder = 2
    object DBCG_PatLst: TDBCtrlGrid
      Left = 1
      Top = 1
      Width = 1016
      Height = 582
      Align = alClient
      DataSource = ADORegD
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #26032#32048#26126#39636
      Font.Style = []
      PanelHeight = 58
      PanelWidth = 999
      ParentFont = False
      TabOrder = 0
      RowCount = 10
      SelectedColor = 13172680
      OnPaintPanel = DBCG_PatLstPaintPanel
      object Label2: TLabel
        Left = 4
        Top = 5
        Width = 40
        Height = 16
        Caption = #22995#21517':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Pat_Name: TDBText
        Left = 46
        Top = 5
        Width = 105
        Height = 17
        DataField = 'pat_name'
        DataSource = ADORegD
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        OnClick = Pat_NameClick
      end
      object Label3: TLabel
        Left = 164
        Top = 5
        Width = 56
        Height = 16
        Caption = #30149#27511#34399':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Chr_No: TDBText
        Left = 223
        Top = 5
        Width = 90
        Height = 17
        DataField = 'chr_no'
        DataSource = ADORegD
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 320
        Top = 5
        Width = 40
        Height = 16
        Caption = #24615#21029':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object SexType: TDBText
        Left = 363
        Top = 5
        Width = 27
        Height = 17
        DataField = 'Sex'
        DataSource = ADORegD
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 432
        Top = 5
        Width = 40
        Height = 16
        Caption = #24180#40801':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Age: TDBText
        Left = 475
        Top = 5
        Width = 27
        Height = 17
        DataField = 'age'
        DataSource = ADORegD
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 528
        Top = 5
        Width = 56
        Height = 16
        Caption = #36523#20221#21029':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object pat_desc: TDBText
        Left = 587
        Top = 5
        Width = 51
        Height = 17
        DataField = 'pat_desc'
        DataSource = ADORegD
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 816
        Top = 5
        Width = 72
        Height = 16
        Caption = #23601#37291#29376#24907':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Opd_Status: TDBText
        Left = 887
        Top = 5
        Width = 77
        Height = 17
        DataField = 'opd_status'
        DataSource = ADORegD
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 688
        Top = 5
        Width = 56
        Height = 16
        Caption = #21021#35079#35386':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object FV_RV: TDBText
        Left = 747
        Top = 5
        Width = 59
        Height = 17
        DataField = 'fv_rv'
        DataSource = ADORegD
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
      end
      object Shape1: TShape
        Left = 0
        Top = 51
        Width = 999
        Height = 7
        Align = alBottom
        Pen.Style = psClear
      end
      object Panel2: TPanel
        Left = 42
        Top = 25
        Width = 67
        Height = 24
        Caption = #22577#21040
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #27161#26999#39636
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Pat_NameClick
      end
    end
  end
  inherited Timer2: TTimer
    Left = 912
    Top = 656
  end
  object ADORegQ: TADOQuery
    Connection = DM.ADOLink
    Parameters = <>
    SQL.Strings = (
      'SELECT lpad(rownum,3,'#39'0'#39') as SEQ_NO,D.*'
      
        'FROM(SELECT a.opd_kind as opd_kind,a.SEQ_NO as REG_SEQ_NO, a.OPD' +
        '_DATE as OPD_DATE,a.DEPT_CODE as DEPT_CODE,decode(b.sex_type,'#39'0'#39 +
        ','#39#22899#39','#39'1'#39','#39#30007#39','#39#19981#26126#39') as SEX_TYPE,'
      
        '(select smpl_desc from dept_basic where dept_code=a.DEPT_CODE) D' +
        'EPT_DESC,'
      
        'a.DEPT_ROOM as DEPT_ROOM,a.DOC_CODE as DOC_CODE,(select doc_name' +
        ' from doc_basic where doc_code=a.doc_code) DOC_NAME,a.ROOM_DESC ' +
        'as ROOM_DESC,a.SHIFT_NO as SHIFT_NO,b.AC_TYPE as AC_TYPE,'
      
        'a.CHR_NO as CHR_NO,b.ID_NO as ID_NO,a.FEE_NO as FEE_NO,b.PAT_NAM' +
        'E as PAT_NAME,a.PAT_ID as PAT_ID,b.birth_date as BIRTH_DATE,'
      
        'a.INS_SEQ_NO as INS_SEQ_NO,DECODE(a.OPD_STATUS, '#39'0'#39','#39'  '#26283#23384#39','#39'1'#39','#39 +
        #26410#21040#35386#39','#39'2'#39','#39#24050#22577#21040#39','#39'6'#39','#39#23436#35386#39','#39'3'#39','#39#25209#23436#20729#39') OPD_STATUS,'
      'a.DISC_CODE as DISC_CODE,OPD_STATUS OPD_STATUSCODE,'
      
        '(select idl_date from tbl_dental_idl where fee_no=a.fee_no) idl_' +
        'date,'
      
        '(select idl_fee_code from tbl_dental_idl where fee_no=a.fee_no) ' +
        'idl_fee_code,'
      
        '(select idl_position from tbl_dental_idl where fee_no=a.fee_no) ' +
        'idl_position,'
      
        '(select ins_seq_no from tbl_dental_idl where fee_no=a.fee_no) id' +
        'l_ins_seq_no,'
      
        '(select D.doc_name from dental_doc_basic D, opd_basic1 E where D' +
        '.doc_code=E.ins_doc and E.fee_no=A.fee_no and E.opd_date=A.opd_d' +
        'ate) DEC_Name,'
      
        '(select D.doc_name from dental_doc_basic D, opd_basic1 E where D' +
        '.doc_code=E.feat_doc and E.fee_no=A.fee_no and E.opd_date=A.opd_' +
        'date) FAT_Name,'
      
        'decode((select count(*) from opd_warning2 where chr_no=a.chr_no ' +
        'and stop_flag='#39'N'#39'),'#39'0'#39','#39#39','#39'*'#26377#36942#25935#35352#37636'*'#39') Allergic,'
      
        'round(((sysdate-to_date(b.birth_date+19110000,'#39'YYYYMMDD'#39')) / 365' +
        '),0) age  '
      'FROM REG_BASIC a, chr_Basic b'
      
        'where (a.chr_no not in(select chr_no from tbl_dental_appointment' +
        ' where chr_no=a.chr_no and seq_no=a.seq_no and shift_no=a.shift_' +
        'no and doc_code=a.doc_code and dept_room=a.dept_room and dept_co' +
        'de=a.dept_code and app_date=a.opd_date)) and'
      '(a.chr_no=b.chr_no) and'
      '(a.OPD_KIND in ('#39'O'#39')) and'
      '(a.OPD_DATE between '#39'1000901'#39' and '#39'1000901'#39') and'
      '(a.SHIFT_NO='#39'2'#39') and'
      '(a.CNCL_FLAG='#39'N'#39') and'
      '(rtrim(a.reserve_flag)<>'#39'6'#39') and '
      '(a.Dept_CODE IN ('#39'3900'#39','#39'3910'#39'))'
      'order by concat(a.upd_date,a.upd_time)) D')
    Left = 988
    Top = 103
  end
  object ADORegD: TDataSource
    DataSet = ADORegQ
    Left = 960
    Top = 103
  end
end
