unit ic_information_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Db, DBTables, Grids, DBGrids, ExtCtrls, Buttons,
  ADODB;

type
  TIC_information_frm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label26: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label27: TLabel;
    Label28: TLabel;
    TabSheet5: TTabSheet;
    DBGrid4: TDBGrid;
    TabSheet6: TTabSheet;
    DBGrid5: TDBGrid;
    DataSource5: TDataSource;
    TabSheet7: TTabSheet;
    DataSource6: TDataSource;
    StringGrid1: TStringGrid;
    SpeedButton20: TSpeedButton;
    SpeedButton18: TSpeedButton;
    TabSheet8: TTabSheet;
    DBGrid6: TDBGrid;
    DataSource7: TDataSource;
    TabSheet9: TTabSheet;
    Label29: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label33: TLabel;
    TabSheet10: TTabSheet;
    DataSource8: TDataSource;
    DBGrid7: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    TabSheet11: TTabSheet;
    DBGrid8: TDBGrid;
    Button3: TButton;
    DataSource9: TDataSource;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Query1: TADOQuery;
    Query2: TADOQuery;
    Query5: TADOQuery;
    Query8: TADOQuery;
    Query3: TADOQuery;
    Query6: TADOQuery;
    Query9: TADOQuery;
    Query7: TADOQuery;
    Query4: TADOQuery;
    Query10: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Edit2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Edit3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IC_information_frm: TIC_information_frm;
  m_string: string;
  md_string: string;
function cervix_age_check(opd_date, birth_Date: string): Boolean;

implementation

uses ShellApi, Global, ICFunction, Commfunc, Chdate, DBDM;

{$R *.DFM}

procedure TIC_information_frm.FormShow(Sender: TObject);
var
  opd_date, acode1, acode2, acode3, acode4, acode5, acode6: string;
  tempfee_no,Subtraction_date :string;
  i: Integer;
begin
  Subtraction_date := IntToStr((StrToInt64(trim(getOpdDate))+19100000)-19110000);
  if StrToInt(copy(Subtraction_date,1,length(Subtraction_date)-4)) < 100 then
    Subtraction_date := '0'+Subtraction_date;
  PageControl1.Pages[0].Caption := '病人基本資料';
  PageControl1.Pages[1].Caption := '重大傷病';
  PageControl1.Pages[2].Caption := '藥品資訊';
  PageControl1.Pages[3].Caption := '重大醫令';
  PageControl1.Pages[4].Caption := '其它醫令';
  PageControl1.Pages[5].Caption := '預防保健記錄';
  PageControl1.Pages[6].Caption := '健兒接種記錄';
  PageControl1.Pages[7].Caption := '就診記錄';
  PageControl1.Pages[8].Caption := '過敏記錄';
  PageControl1.Pages[9].Caption := '產檢記錄';
  PageControl1.Pages[10].Caption := '子宮頸抹片';
  //PageControl1.ActivePageIndex:=0;

  if trim(ICFunction.card_no)<> '' then
    Label30.Caption := getOpdDate+'日讀取IC健保卡資料'
  else
    Label30.Caption := '非最新的IC健保卡紀錄資料';
  label14.Caption := icfunction.card_no;
  label15.Caption := icfunction.pat_name;
  label16.Caption := icfunction.id_no;
  label17.Caption := icfunction.birth_date;
  label18.Caption := '';

  if icfunction.sex = 'M' then
  begin
    label18.Caption := '男';
  end;

  if icfunction.sex = 'F' then
  begin
    label18.Caption := '女';
  end;

  label19.Caption := icfunction.get_date;
  label20.Caption := icfunction.card_flag;
  label21.Caption := icfunction.pat_code;
  try
    begin
      if icfunction.pat_mark > '0' then
      begin
        case StrToInt(icfunction.pat_mark) of
          1:
            label22.Caption := '低收入戶';
          2:
            label22.Caption := '無職業的榮民';
          3:
            label22.Caption := '一般身分';
          8:
            label22.Caption := '災民';
        end;
      end
      else
      begin
        label22.Caption := '';
      end;
    end
  except
    label22.Caption := '一般身分';
  end;

  label23.Caption := icfunction.card_end_date;
  label24.Caption := icfunction.use_count;
  label25.Caption := icfunction.new_born_birth;
  label26.Caption := icfunction.new_born_flag;

  if (icfunction.Donate_flag = 'O') or (Trim(icfunction.Donate_flag) = '') then
  begin
    if Trim(label28.Caption) = '' then
    begin
      label28.Caption := '未讀卡';
    end
    else
    begin
      label28.Caption := '不同意器官捐贈，亦不同意安寧緩和';
    end;
  end
  else
  begin
    try
      begin
        if (icfunction.Donate_flag > '0') and (icfunction.Donate_flag <> 'N') then
        begin
          case StrToInt(icfunction.Donate_flag) of
            1:
              label28.Caption := '同意器官捐贈，但不同意安寧緩和';
            2:
              label28.Caption := '同意安寧緩和醫療';
            3:
              label28.Caption := '同意不實施心肺復甦術';
            4:
              label28.Caption := '同意器官捐贈、同意安寧緩和醫療、同意不實施心肺復甦術';
            5:
              label28.Caption := '同意器官捐贈、同意安寧緩和醫療';
            6:
              label28.Caption := '同意器官捐贈、同意不實施心肺復甦術';
            7:
              label28.Caption := '同意安寧緩和醫療、同意不實施心肺復甦術';
          end;
        end
        else
        begin
          label28.Caption := '未註記';
        end;
      end
    except
      label28.Caption := '未註記';
    end;
  end;


  query1.SQL.Clear;                                                                                                                //fee_no
  query1.SQL.Add('select distinct b.icd9_code,b.eng_simp_desc,a.begin_date,a.end_date from IC_CRITICALILLNESS a,icd9_basic b where chr_no=' + QuotedStr(trim(getChrNo)));
  query1.SQL.Add(   ' and a.CRITICAL_CODE=b.a_code and b.urg_flag=''Y'' and end_date >='+QuotedStr(trim(getOpdDate)));
  //sql_time_log('1','重大傷病');
  query1.Open;
  //sql_time_log('2','重大傷病');
  if query1.RecordCount > 0 then
    PageControl1.Pages[1].Caption := '*重大傷病';


  query2.Close;
  query2.SQL.Clear;
//  query2.SQL.Add('select substr(a.opd_date,1,7) as opd_Date,trim(b.alisec_desc) as alise_desc,trim(b.ins_med_desc) as med_desc,a.path_code,a.med_days,a.ttl_qty,DECODE(a.order_kind,''1'',''非長期'',''2'',''長期'',''A'',''取消'',''B'',''取消'',a.order_kind) as order_kind ');
//  query2.SQL.Add('from IC_PRESCRIPTION a,NHI_MED b where a.fee_no a.fee_no=' + QuotedStr(mainfrm.fee_no1.Text) + ' and ORDER_KIND in(''1'',''2'',''A'',''B'') and a.ins_fee_code=b.ins_med_code order by to_number(a.opd_date) desc');
  query2.SQL.Add('select substr(opd_date,1,7) as opd_Date,trim(alisec_desc) as alise_desc,trim(ins_med_desc) as med_desc,path_code,');
  query2.SQL.Add('       med_days,ttl_qty,DECODE(order_kind,''1'',''非長期'',''2'',''長期'',''A'',''取消'',''B'',''取消'',order_kind) as order_kind ');
  query2.SQL.Add('from( ');
  query2.SQL.Add('  select distinct a.opd_date,b.alisec_desc,b.ins_med_desc,a.path_code,a.med_days,a.ttl_qty,a.order_kind ');
  query2.SQL.Add('  from IC_PRESCRIPTION a,NHI_MED b ');
  query2.SQL.Add('  where a.fee_no in(select fee_no from reg_basic where chr_no ='+ QuotedStr(trim(getChrNo))+' and fee_no is not null ');
  query2.SQL.Add('                    and (to_date(opd_date+19110000,''YYYYMMDD'') > (to_date('+trim(getOpdDate)+'+19110000,''YYYYMMDD'')-1)) '); //19100000為了減一年用 20110510
  query2.SQL.Add('          union all select fee_no from ipd_basic where chr_no='+ QuotedStr(trim(getChrNo))+') and ');
  query2.SQL.Add('        ORDER_KIND in(''1'',''2'',''A'',''B'') and ');
  query2.SQL.Add('        a.ins_fee_code=b.ins_med_code ');
  query2.SQL.Add('        and a.opd_date > '+QuotedStr(Subtraction_date+'000000')+') ');
  query2.SQL.Add('order by to_number(opd_date) desc');
  query2.SQL.SaveToFile('ICMED.SQL');
  //sql_time_log('1','藥品資訊'+Query2.SQL.Text);
  query2.Open;
  //sql_time_log('2','藥品資訊');
  if query2.RecordCount > 0 then
    PageControl1.Pages[2].Caption := '*藥品資訊';


  query3.Close;
  query3.SQL.Clear;
 // query3.SQL.Add('select substr(a.opd_date,1,7) as opd_Date,b.fee_desc,DECODE(rtrim(ltrim(a.part_code)),''A'',''頭至頸部'',''B'',''胸部'',''C'',''腹部'',''D'',''脊椎'',''E'',''上下肢'',a.part_code) as part_code,a.ttl_qty,DECODE(a.order_kind,''5'','''',''E'',''取消'',a.order_kind) as order_kind ');
 // query3.SQL.Add('from IC_PRESCRIPTION a,fee_basic b where fee_no in(select fee_no from opd_basic where chr_no ='+ QuotedStr(trim(opd_pat.chr_no)) +') and ORDER_KIND in(''5'',''E'') and a.ins_fee_code=b.ins_fee_code order by to_number(a.opd_date) desc');
  query3.SQL.Add('select substr(opd_date,1,7) as opd_Date,fee_desc,');
  query3.SQL.Add('       case when substr(opd_date,1,7) >= ''0980930'' then ');
  query3.SQL.Add('       DECODE(trim(part_code),''A'',''頸部'',''B'',''胸部'',''C'',''上腹部'',''D'',''脊椎'',''E'',''肢部'',''F'',''頭頸部'',');
  query3.SQL.Add('                              ''G'',''胸部及上腹部'',''H'',''頭部'',''I'',''上腹部及骨盆腔'',''J'',''胸椎'',''K'',''腰椎'',');
  query3.SQL.Add('                              ''M'',''骨骼肌肉系統'',''N'',''頸椎'',''O'',''其他'',''P'',''骨盆腔'',''Q'',''臂神經血管叢'',');
  query3.SQL.Add('                              ''S'',''MRS(磁振頻譜)'',''T'',''MRA(磁振血管攝影)'',''U'',''胸部'',''V'',''心血管系統'',part_code)');
  query3.SQL.Add('       else DECODE(trim(part_code),''A'',''頭至頸部'',''B'',''胸部'',''C'',''腹部'',''D'',''脊椎'',''E'',''上下肢'',part_code) end as part_code ');
  query3.SQL.Add('       ,ttl_qty,DECODE(order_kind,''5'','''',''E'',''取消'',order_kind) as order_kind ');
  query3.SQL.Add('from (select distinct a.opd_date,b.fee_desc,a.part_code,a.ttl_qty,a.order_kind ');
  query3.SQL.Add('        from IC_PRESCRIPTION a,fee_basic b ');
  query3.SQL.Add('        where fee_no in(select fee_no from reg_basic where chr_no ='+ QuotedStr(trim(getChrNo))+' and fee_no is not null ');
  query3.SQL.Add('                    and (to_date(opd_date+19110000,''YYYYMMDD'') > (to_date('+trim(getOpdDate)+'+19110000,''YYYYMMDD'')-1)) ');
  query3.SQL.Add('          union all select fee_no from ipd_basic where chr_no='+ QuotedStr(trim(getChrNo))+') and ');
  query3.SQL.Add('              ORDER_KIND in(''5'',''E'') and ');
  query3.SQL.Add('              a.ins_fee_code=b.ins_fee_code ');
  query3.SQL.Add('        order by to_number(a.opd_date) desc)');
  //sql_time_log('1','重大醫令'+query3.SQL.Text);
  query3.Open;
  //sql_time_log('2','重大醫令');
  if query3.RecordCount > 0 then
    PageControl1.Pages[3].Caption := '*重大醫令';


  query4.Close;
  query4.SQL.Clear;
  //query4.SQL.Add('select substr(a.opd_date,1,7) as opd_Date,b.fee_desc,a.path_code,a.med_days,a.ttl_qty,DECODE(a.order_kind,''3'',''診療'',''4'',''特殊材料'',''C'',''取消'',''D'',''取消'',a.order_kind) as order_kind from IC_PRESCRIPTION a,fee_basic b where a.fee_no=' + QuotedStr(mainfrm.fee_no1.Text) + ' and ORDER_KIND in(''3'',''4'',''C'',''D'') and a.ins_fee_code=b.ins_fee_code order by to_number(a.opd_date) desc');
  query4.SQL.Add('select substr(opd_date,1,7) as opd_Date,fee_desc,path_code,med_days,ttl_qty,');
  query4.SQL.Add('      DECODE(order_kind,''3'',''診療'',''4'',''特殊材料'',''C'',''取消'',''D'',''取消'',order_kind) as order_kind ');
  query4.SQL.Add('from( ');
  query4.SQL.Add('select distinct a.opd_date,b.fee_desc,a.path_code,a.med_days,a.ttl_qty,a.order_kind ');
  query4.SQL.Add('from IC_PRESCRIPTION a,fee_basic b ');
  query4.SQL.Add('where a.fee_no in(select fee_no from reg_basic where chr_no ='+ QuotedStr(trim(getChrNo))+' and fee_no is not null ');
  query4.SQL.Add('                    and (to_date(opd_date+19110000,''YYYYMMDD'') > (to_date('+trim(getOpdDate)+'+19110000,''YYYYMMDD'')-1)) ');
  query4.SQL.Add('          union all select fee_no from ipd_basic where chr_no='+ QuotedStr(trim(getChrNo))+') and ');
  query4.SQL.Add('      ORDER_KIND in(''3'',''4'',''C'',''D'') and ');
  query4.SQL.Add('      a.ins_fee_code=b.ins_fee_code) ');
  query4.SQL.Add('order by to_number(opd_date) desc');
  //sql_time_log('1','其它醫令:'+query4.SQL.Text);
  query4.Open;
  //sql_time_log('2','其它醫令');
  if query4.RecordCount > 0 then
    PageControl1.Pages[4].Caption := '*其它醫令';


  query5.Close;
  query5.SQL.Clear;
  //query5.SQL.Add('select substr(a.opd_date,1,7) as opd_Date,a.preg_code,b.hosp_name from IC_Preg_Prev a,hosp_dtl b where a.prevent_kind=''C'' and a.prevent_MARK=''01'' and a.fee_no=' + QuotedStr(mainfrm.fee_no1.Text) + ' and a.hosp_code=b.hosp_id order by a.opd_date desc');
  query5.SQL.Add('select distinct substr(a.opd_date,1,7) as opd_Date,a.preg_code,a.hosp_code||''-''||b.hosp_name hosp_name');
  query5.SQL.Add('from IC_Preg_Prev a,hosp_dtl b ');
  query5.SQL.Add('where a.prevent_kind=''C'' and ');
  query5.SQL.Add('      a.prevent_MARK in(''01'',''02'',''04'',''05'',''06'',''07'',''08'') and ');
  query5.SQL.Add('      a.fee_no in(select fee_no from reg_basic where chr_no ='+ QuotedStr(trim(getChrNo))+' and fee_no is not null ');
  query5.SQL.Add('                    and (to_date(opd_date+19110000,''YYYYMMDD'') > (to_date('+trim(getOpdDate)+'+19110000,''YYYYMMDD'')-1)) ');
  query5.SQL.Add('          union all select fee_no from ipd_basic where chr_no='+ QuotedStr(trim(getChrNo))+') and ');
  query5.SQL.Add('      a.hosp_code=b.hosp_id(+) ');
  query5.SQL.Add('order by 1 desc ');
  //sql_time_log('1','預防保健記錄:'+query5.SQL.Text);
  query5.Open;
  //sql_time_log('1','預防保健記錄');
  if query5.RecordCount > 0 then
    PageControl1.Pages[5].Caption := '*預防保健記錄';


  query6.Close;
  query6.SQL.Clear;
  //query6.SQL.Add('select * from ic_cure_record where fee_no=' + QuotedStr(mainfrm.fee_no1.Text) + ' order by opd_date desc');
  query6.SQL.Add('select distinct substr(opd_date,1,7) as opd_Date,fee_no,id_no,A_code1,A_code2,A_code3,A_code4,A_code5,A_code6 ');
  query6.SQL.Add('from ic_cure_record ');
  query6.SQL.Add('where id_no='+QuotedStr(trim(getIdNo))+' and opd_date > '+QuotedStr(Subtraction_date+'000000'));
  query6.SQL.Add('order by 1 desc ');
  //sql_time_log('1','就診記錄:'+query6.SQL.Text);
  query6.Open;
  //sql_time_log('1','就診記錄');
  stringgrid1.Cells[1, 0] := '就診日期';
  stringgrid1.Cells[2, 0] := '主診斷';
  stringgrid1.Cells[3, 0] := '次診斷1';
  stringgrid1.Cells[4, 0] := '次診斷2';
  stringgrid1.Cells[5, 0] := '次診斷3';
  stringgrid1.Cells[6, 0] := '次診斷4';
  stringgrid1.Cells[7, 0] := '次診斷5';
  stringgrid1.Cells[8, 0] := '次診斷6';
  stringgrid1.Cells[0, 1] := '01';
  stringgrid1.Cells[0, 2] := '02';
  stringgrid1.Cells[0, 3] := '03';
  stringgrid1.Cells[0, 4] := '04';
  stringgrid1.Cells[0, 5] := '05';
  stringgrid1.Cells[0, 6] := '06';
               // query6.RecordCount - 1
  while not query6.Eof do
  begin
  //opd_Date := Copy(query6.FieldByName('opd_date').AsString, 1, 7);
    opd_Date := trim(query6.FieldByName('opd_date').AsString);

    acode1   := query6.FieldByName('a_code1').AsString;
    query7.Close;
    query7.SQL.Clear;
    query7.SQL.Add('select icd_code from icd_code_basic where ICD_SYSTEM=''C'' AND eff_flag=''Y'' and TRIM(REPLACE(ICD_CODE,''.'',''''))=TRIM(' + QuotedStr(acode1) + ')');
    query7.SQL.Add('union select icd9_code from icd9_basic where a_code=' + QuotedStr(acode1) + ' and op_flag=''N'' and final_flag=''Y'' ');
    query7.Open;
    acode1 := query7.FieldByName('icd_code').AsString;

    acode2 := query6.FieldByName('a_code2').AsString;
    query7.Close;
    query7.SQL.Clear;
    query7.SQL.Add('select icd_code from icd_code_basic where ICD_SYSTEM=''C'' AND eff_flag=''Y'' and TRIM(REPLACE(ICD_CODE,''.'',''''))=TRIM(' + QuotedStr(acode2) + ')');
    query7.SQL.Add('union select icd9_code from icd9_basic where a_code=' + QuotedStr(acode2) + ' and op_flag=''N'' and final_flag=''Y'' ');
    query7.Open;
    acode2 := query7.FieldByName('icd_code').AsString;


    acode3 := query6.FieldByName('a_code3').AsString;
    query7.Close;
    query7.SQL.Clear;
    query7.SQL.Add('select icd_code from icd_code_basic where ICD_SYSTEM=''C'' AND eff_flag=''Y'' and TRIM(REPLACE(ICD_CODE,''.'',''''))=TRIM(' + QuotedStr(acode3) + ')');
    query7.SQL.Add('union select icd9_code from icd9_basic where a_code=' + QuotedStr(acode3) + ' and op_flag=''N'' and final_flag=''Y'' ');
    query7.Open;
    acode3 := query7.FieldByName('icd_code').AsString;

    acode4 := query6.FieldByName('a_code4').AsString;
    query7.Close;
    query7.SQL.Clear;
    query7.SQL.Add('select icd_code from icd_code_basic where ICD_SYSTEM=''C'' AND eff_flag=''Y'' and TRIM(REPLACE(ICD_CODE,''.'',''''))=TRIM(' + QuotedStr(acode4) + ')');
    query7.SQL.Add('union select icd9_code from icd9_basic where a_code=' + QuotedStr(acode4) + ' and op_flag=''N'' and final_flag=''Y'' ');
    query7.Open;
    acode4 := query7.FieldByName('icd_code').AsString;

    acode5 := query6.FieldByName('a_code5').AsString;
    query7.Close;
    query7.SQL.Clear;
    query7.SQL.Add('select icd_code from icd_code_basic where ICD_SYSTEM=''C'' AND eff_flag=''Y'' and TRIM(REPLACE(ICD_CODE,''.'',''''))=TRIM(' + QuotedStr(acode5) + ')');
    query7.SQL.Add('union select icd9_code from icd9_basic where a_code=' + QuotedStr(acode5) + ' and op_flag=''N'' and final_flag=''Y'' ');
    query7.Open;
    acode5 := query7.FieldByName('icd_code').AsString;


    acode6:=query6.fieldbyname('a_code6').asstring;
    query7.Close;
    query7.SQL.Clear;
    query7.SQL.Add('select icd_code from icd_code_basic where ICD_SYSTEM=''C'' AND eff_flag=''Y'' and TRIM(REPLACE(ICD_CODE,''.'',''''))=TRIM(' + QuotedStr(acode6) + ')');
    query7.SQL.Add('union select icd9_code from icd9_basic where a_code=' + QuotedStr(acode6) + ' and op_flag=''N'' and final_flag=''Y'' ');
    query7.Open;
    acode6:=query7.fieldbyname('icd_code').asstring;


    stringgrid1.Cells[1, i + 1] := opd_Date;
    stringgrid1.Cells[2, i + 1] := acode1;
    stringgrid1.Cells[3, i + 1] := acode2;
    stringgrid1.Cells[4, i + 1] := acode3;
    stringgrid1.Cells[5, i + 1] := acode4;
    stringgrid1.Cells[6, i + 1] := acode5;
    stringgrid1.Cells[7, i + 1] := acode6;
    inc(i);
    query6.Next;

  end;
  query6.Close;
  query7.Close;

  if Trim(stringgrid1.Cells[1, 1]) <> '' then
    PageControl1.Pages[7].Caption := '*就診記錄';


  query8.Close;
  query8.SQL.Clear;
  //query8.SQL.Add('select substr(a.Inoculate_date,1,7) as Inoculate_date,a.Inoculate_kind,c.hosp_name,a.Inoculate_no from IC_InoculateData a,hosp_dtl c where a.fee_no=' + QuotedStr(mainfrm.fee_no1.Text) + ' and a.hosp_code=c.hosp_id(+)');
  query8.SQL.Add('select distinct substr(a.Inoculate_date,1,7) as Inoculate_date,a.Inoculate_kind,a.hosp_code||''-''||c.hosp_name,a.Inoculate_no');
  query8.SQL.Add('from IC_InoculateData a,hosp_dtl c ');
  query8.SQL.Add('where a.fee_no in(select fee_no from reg_basic where chr_no ='+ QuotedStr(trim(getChrNo))+' and fee_no is not null ');
  query8.SQL.Add('                    and (to_date(opd_date+19110000,''YYYYMMDD'') > (to_date('+trim(getOpdDate)+'+19110000,''YYYYMMDD'')-1)) ');
  query8.SQL.Add('          union all select fee_no from ipd_basic where chr_no='+ QuotedStr(trim(getChrNo))+') ');
  query8.SQL.Add('and a.hosp_code=c.hosp_id(+)');
  query8.SQL.Add('order by 1 desc ');
  //sql_time_log('1','健兒記錄:'+query8.SQL.Text);
  query8.Open;
  //sql_time_log('1','健兒記錄');
  if query8.RecordCount > 0 then
    PageControl1.Pages[6].Caption := '*健兒接種';



  query6.Close;
  query6.SQL.Clear;
  query6.SQL.Add('select distinct allergy1,allergy2,allergy3 from IC_allergy where id_no=' + QuotedStr(trim(getIdNo)));
  //sql_time_log('1','過敏記錄:'+query6.SQL.Text);
  query6.Open;
  //sql_time_log('1','過敏記錄');
  if query6.RecordCount <> 0 then
  begin
    PageControl1.Pages[8].Caption := '*過敏記錄';
    edit1.Text := Trim(query6.FieldByName('allergy1').AsString);
    edit2.Text := Trim(query6.FieldByName('allergy2').AsString);
    edit3.Text := Trim(query6.FieldByName('allergy3').AsString);
  end
  else
  begin
    edit1.Text := '';
    edit2.Text := '';
    edit3.Text := '';
  end;

  query9.Close;
  query9.SQL.Clear;
  //query9.SQL.Add('select substr(a.opd_date,1,7) as opd_Date,a.preg_code,b.hosp_name from IC_Preg_Prev a,hosp_dtl b where a.prevent_kind=''P'' and a.fee_no=' + QuotedStr(mainfrm.fee_no1.Text) + 'and a.hosp_code=b.hosp_id order by a.opd_date desc');
  query9.SQL.Add('select distinct substr(a.opd_date,1,7) as opd_Date,a.preg_code,a.hosp_code||''-''||b.hosp_name hosp_name from IC_Preg_Prev a,hosp_dtl b where a.prevent_kind=''P'' and a.id_no=' + QuotedStr(trim(getIdNo)) + 'and a.hosp_code=b.hosp_id(+) order by 1 desc');
  //sql_time_log('1','產檢記錄:'+query9.SQL.Text);
  query9.Open;
  //sql_time_log('1','產檢記錄');
  if query9.RecordCount > 0 then
    PageControl1.Pages[9].Caption := '*產檢記錄';


  query10.Close;
  query10.SQL.Clear;
  query10.SQL.Add('select distinct substr(a.opd_date,1,7) as opd_Date,decode(a.preg_code,''YC'',''取消'',a.preg_code) as preg_code,a.hosp_code||''-''||b.hosp_name hosp_name from IC_Preg_Prev a,hosp_dtl b where a.prevent_kind=''C'' and a.prevent_MARK=''03'' and a.id_no=' + QuotedStr(trim(getIdNo)) + 'and a.hosp_code=b.hosp_id(+) order by 1 desc');
  //sql_time_log('1','子宮頸抹片:'+query10.SQL.Text);
  query10.Open;
  //sql_time_log('1','子宮頸抹片');
  if query10.RecordCount > 0 then
    PageControl1.Pages[10].Caption := '*子宮頸抹片';

  PageControl1.ActivePageIndex:=0;
end;

procedure TIC_information_frm.Button1Click(Sender: TObject);
var
  ComRet, DC_V, HPC_V, IC_V: Integer;//ComRet...comport傳回直; DC_V....IDC認證傳回值;IC_V...IC卡回傳值; HPC_V...醫事人員PIN值;
  pin_code: Integer;
begin
  try
    csCloseCom();
    ComRet := csOpenCom(0);
    if ComRet = -1 then
    begin
      ShowMessage('修改醫事人員PIN碼失敗');
      csCloseCom();
    end
    else
    begin
      IC_date_time(1);
      DC_V := IDC_CONNECT();  //SAM卡檢查
      if (DC_V <> 0) then
      begin
        ShowMessage('修改醫事人員PIN碼失敗');
        csCloseCom();
      end
      else
      begin
        HPC_V := HPC_check();   //醫事人員卡檢查
        if HPC_V <> 0 then
        begin
          if (HPC_V = 4014) or (HPC_V = 4034) then
          begin
            ShowMessage('修改醫事人員PIN碼失敗');
            csCloseCom();
          end
          else
          begin
            ShowMessage('修改醫事人員PIN碼失敗');
            csCloseCom();
          end;
        end
        else
        begin
          pin_code := hpcInputHPCPIN();
          if pin_code = 0 then
          begin
            ShowMessage('修改醫事人員PIN碼成功');
          end
          else
          begin
            ShowMessage('修改醫事人員PIN碼失敗');
          end;
        end;
      end;
    end;
  except
    ShowMessage('修改醫事人員PIN碼失敗');
    csCloseCom();
  end;
  csCloseCom();
end;

procedure TIC_information_frm.Button2Click(Sender: TObject);
begin
  IC_information_frm.Close;
end;

procedure TIC_information_frm.DBGrid2CellClick(Column: TColumn);
begin
  m_string := '';
  if query2.RecordCount > 0 then
  begin
    m_string  := query2.FieldByName('alise_desc').AsString;
    md_string := m_string;
  end;
end;

procedure TIC_information_frm.DBGrid1CellClick(Column: TColumn);
begin
  m_string := '';
  if query1.RecordCount > 0 then
  begin
    m_string := query1.FieldByName('ENG_SIMP_DESC').AsString;
  end;
end;

procedure TIC_information_frm.SpeedButton20Click(Sender: TObject);
var
  path: string;
begin
  if Trim(M_String) <> '' then
  begin
    path := 'http://clinicalresource.ovid.com/gateway?name=tmuc999&password=MHs6acvQ&search=' + M_String;
    ShellExecute(Handle, 'open', 'iexplore.exe', PChar(path), '', SW_SHOWNORMAL);
  end
  else
  begin
    ShowMessage('您未選取任何資料可供查訊！');
  end;
end;

procedure TIC_information_frm.SpeedButton18Click(Sender: TObject);
var
  j, k: Integer;
  path: string;
begin
  md_string := Trim(md_string);
  j := Length(md_string);
  k := Pos(' ', md_string);
  if k > 0 then
  begin
    M_string := Copy(md_string, 1, k);
  end;
  path := 'http://tmumdx.csis.com.tw/mdxcgi/cgidict.exe?SRCHTERM=' + Trim(md_string);
  ShellExecute(Handle, 'open', 'iexplore.exe', PChar(path), '', SW_SHOWNORMAL);
end;

procedure TIC_information_frm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  query1.Close;
  query2.Close;
  query3.Close;
  query4.Close;
  query5.Close;
  query6.Close;
  query7.Close;
  query8.Close;

  Action:=cafree;
  
end;

procedure TIC_information_frm.Edit1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Trim(edit1.Text) <> '' then
  begin
    M_String := Trim(edit1.Text);
  end;
end;

procedure TIC_information_frm.Edit2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Trim(edit2.Text) <> '' then
  begin
    M_String := Trim(edit1.Text);
  end;
end;

procedure TIC_information_frm.Edit3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Trim(edit3.Text) <> '' then
  begin
    M_String := Trim(edit1.Text);
  end;
end;

procedure TIC_information_frm.Button3Click(Sender: TObject);
var
  opd_Date: string;
  id_no: string;
  birth_date: string;
  fin,seq_ru: Integer;
  msg: string;
begin
  try
    if Length(getOpdDate) = 6 then
    begin
      opd_Date := '0' + getOpdDate;
    end
    else
    begin
      opd_Date := getOpdDate;
    end;
    opd_Date := dateformat(month_add(IntToStr(StrToInt(opd_Date)+19110000),-12),'',0,1);
    id_no := Trim(getIdNo);

    birth_date := Trim(getBirthDate);

    if Length(birth_date) = 6 then
    begin
      birth_date := '0' + birth_date;
    end
    else
    begin
      birth_date := birth_date;
    end;

  except

  end;
     

end;

function cervix_age_check(opd_date, birth_Date: string): Boolean;
var
  opd_yy, birth_yy: string;
begin
  try
    begin
      opd_yy := Copy(opd_date, 1, Length(opd_date) - 4);
      birth_yy := Copy(birth_Date, 1, Length(birth_Date) - 4);

      if StrToInt(opd_yy) - StrToInt(birth_yy) + 1 >= 30 then
      begin
        Result := true;
      end
      else
      begin
        Result := false;
      end;
    end
  except
    Result := false;
  end;
end;

procedure TIC_information_frm.FormDestroy(Sender: TObject);
begin
  IC_information_frm:=nil;
end;

end.
