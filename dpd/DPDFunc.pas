unit DPDFunc;

interface
uses ADODB, Classes, Math, Grids, IniFiles, Forms, StdCtrls, ExtCtrls, Dialogs;

function CalMedTtl(Cir_code, Accu_flag: string; pack_amt, med_days: Integer; per_qty: Extended): string;
function RePeatOpen(tmpSG:TStringGrid;SGitem:String;var msg:string):boolean;
function RePeatNow(tmpSg:TStringGrid;fee_code,SGitem:string;col:integer;var msg:string):boolean;
function checkFeePartLength(col,row:integer;SGTmp:TStringGrid;var msg:string):Boolean;
procedure changeFeePart(col,row,F_Code,F_Qty:integer;part:string;do_type:integer;SGTmp:TStringGrid);
procedure resetFeeImg(Sender:TObject);
procedure AnalysisFeePart(feepart:string);
procedure setFeeImg(part:string);
procedure use_opd_log(Version_Program,str:string);
function CHKTTreat(doc_code,Tran_Treat:string;SGFee:TStringGrid;Type_Flag:integer):Boolean;
function ADSpace(Val: string; leng: Integer): string;
function Aft_Return_cut_word(s,substr: string): string;
function Pre_Return_cut_word(s,substr: string): string;
function Return_Pos(s,substr: string): Integer;
function chkFee_befoee(teeth_xml,day_xml,fee_code_xml,qty_xml,fee_status_xml,use_part_xml,nouse_part_xml,fee_code,part,cnt,chk_kind:string):boolean;
function cutitem(str:string):TStringList;
function before_part(fee_code_tmp:TStringList;chk_part,day_xml,qty_xml,fee_status_xml,fee_code:string):boolean;
function before_nopart(fee_code_tmp:TStringList;day_xml,qty_xml,fee_status_xml,fee_code:string):boolean;
function chkFee_now(teeth_xml,fee_code_xml,qty_xml,fee_status_xml,use_part_xml,nouse_part_xml,fee_code,part,cnt,chk_kind:string):boolean;
function nowfee_statusall(fee_code,use_part,nouse_part:TStringList;part:string):boolean;
function nowfee_statusno(fee_code,use_part,nouse_part:TStringList;part:string):boolean;
function ChkMedQty(chr_no,med_code,fee_no,opd_date,self_pay_flag,ttl:String):String;
function ADChar(Val, key: string; leng: Integer): string;
function CheckPatUsed(fee_no : String;var Doc_code : String; var patIP :String):Boolean;
Procedure PatInUsing(fee_no,Chr_no,Doc_code : String);
Procedure PatUnUsing(fee_no: String);
Procedure PreDelPat(fee_no,Doc_code: String);

procedure insert_ic_med_warning_log(WARNING_KIND,INS_MED_CODE1,PER_QTY1,CIR_CODE1,MED_DAYS1,SELF_PAY_FLAG,OPD_DATE2,INS_MED_CODE2,MED_DAYS2,PATH_CODE2,HOSP_CODE2,DDI_SEQ,PREG_CATE,PREG_SEQ,DR_ACTION,ALERT_DATE,ALERT_TIME:string);
procedure sql_time_log(titl,Desc:string);
function MaxMedDays(sdg :TStringGrid ): Integer;
function  stringinlist(listconst: string;findlist: TStrings):Boolean;
procedure insert_cloud_log(pass_flag:string);
function SetHoliday(mydate,sechtype:string):string;//Holiday set table
function getDiagDate(var ppLastDate: String): String; //


implementation

uses SqlCenter, DBDM, SysUtils, Commfunc, Global, Order, Chdate, Main,
  Maintain, DB;

function  stringinlist(listconst: string;findlist: TStrings):Boolean;
var
  str: string;
begin
  Result := False;
  str := listconst;
  while str <> '' do
  begin
    if findlist.IndexOf(ReturnId(str))> -1 then
    begin
      Result := True;
      Break;
    end;
    str := ReturnName(str)
  end;
end;

function ADChar(Val, key: string; leng: Integer): string;
var
  i: Integer;
begin
  for i := 1 to leng - Length(Val) do
    Val := key + Val;
  Result := Val;
end;

procedure use_opd_log(Version_Program,str:string);
var
  SDate1,STime1:string;
  Client_IP,Client_Name:string;
  tmpSql:string;
  SQLs: TStrings;
  Qrys: TADOQuery;
begin
  if length(str) > 1000 then
    str:=copy(str,1,1000);
  SDate1 := ROCDate(now,'');
  STime1 := ROCTime(now,'');
  Client_IP:=MyIP;
  Client_Name:=MyPC();
  SQLs:=TStringList.Create;
  tmpSql:=getInsertSql(25);
  SetParamter(tmpSql,'$Fee_no$',getFeeNo);
  SetParamter(tmpSql,'$Source_type$','D');
  SetParamter(tmpSql,'$Computer_name$',Client_Name);
  SetParamter(tmpSql,'$Computer_ip$',Client_IP);
  SetParamter(tmpSql,'$Upd_oper$',getDocCode1);
  SetParamter(tmpSql,'$Upd_date$',SDate1);
  SetParamter(tmpSql,'$Upd_time$',STime1);
  SetParamter(tmpSql,'$Version$',Version_Program);
  SetParamter(tmpSql,'$Column1$',str);
  try
    SQLs.Text:=tmpSql;
    DM.ExecSQL(SQLs);
  except
    SQLs.Free;
  end;
  SQLs.Free;
end;

function nowfee_statusall(fee_code,use_part,nouse_part:TStringList;part:string):boolean;
var
  i,j,cnt:integer;
  fee_part:TStringList;
begin
  fee_part:=TStringList.Create;
  cnt:=length(part) div 2;
  for j:= 0 to cnt - 1 do
    fee_part.Add(trim(copy(part,(j * 2 + 1),2)));
  if fee_code.Count >= 1 then
  begin
    if use_part <> nil then
    begin
      //ShowMessage(fee_part.text);
      //showMessage(Use_Part.text);
      for i:=0 to fee_part.Count -1 do
      begin
        result := not ( use_part.IndexOf(trim(Fee_part.Strings[i])) > -1 );
        if not result then
          break;


       { for j:=0 to use_part.Count -1 do
        begin
          if fee_part[i] = use_part[j] then
          begin
            result:=false;
            break;
          end
          else
            result:=true;
        end;
        if result then
          break; }
      end;
    end;
    if nouse_part <> nil then
    begin
      for i:=0 to fee_part.Count -1 do
      begin
        for j:=0 to nouse_part.Count -1 do
        begin
          if fee_part[i] = nouse_part[j] then
          begin
            result:=true;
            break;
          end
          else
            result:=false;
        end;
        if result then
          break;
      end;
    end;
  end
  else
    result:=false;
  fee_part.Free;
end;

procedure sql_time_log(titl,Desc:string);
var
  filehandle : integer;
  openfileName : TextFile;
  inputdata, ma : string;
begin
  Desc := titl + getChrNo +' / '+ Desc;
  try
    AssignFile(openfileName, ExtractFileDir(Application.ExeName)+'\DPD_ERROR_log.txt');
    if FileExists(ExtractFileDir(Application.ExeName)+'\DPD_ERROR_log.txt') then
      Append(openfileName)
    else
      Rewrite(openfileName);
    Writeln(openfileName, DateTimeToStr(Now) + Desc + #9);
    CloseFile(openfileName);
  except

  end;
end;


function nowfee_statusno(fee_code,use_part,nouse_part:TStringList;part:string):boolean;
var
    i,j,k,l,cnt:integer;
    fee_part:TStringList;
begin

    for i:= 0 to FrmOrder.SGFee.RowCount - 2 do
    begin
        for j:= 0 to fee_code.Count - 1 do
        begin
            if (Trim(FrmOrder.SGFee.Cells[F_Code,i]) = fee_code[j]) and (FrmOrder.SGFee.Cells[F_Ins,i] = 'Y') then
            begin
                if nouse_part.Count > 0 then
                begin
                    fee_part:=TStringList.Create;
                    cnt:=length(FrmOrder.SGFee.Cells[F_Part,i]) div 2;
                    for k:= 0 to cnt - 1 do
                        fee_part.Add(copy(FrmOrder.SGFee.Cells[F_Part,i],(k * 2 + 1),2));
                    //showMessage(Fee_part.Text);
                    if fee_part.Count > 0 then
                    begin
                        for k:= 0 to fee_part.Count - 1 do
                        begin
                            for l:= 0 to nouse_part.Count - 1 do
                            begin
                                if fee_part[k] = nouse_part[l] then
                                begin
                                    result:=true;
                                    break;
                                end
                                else
                                    result:=false;
                            end;
                            if result then
                                break;
                        end;
                    end
                    else
                        result:=false;
                    fee_part.Free;
                end
                else
                    result:=true;
            end
            else
                result:=false;

            if result then
                break;
        end;
        if result then
            break;
    end;

end;

//xml檢核_查核歷史處置
function chkFee_befoee(teeth_xml,day_xml,fee_code_xml,qty_xml,fee_status_xml,use_part_xml,nouse_part_xml,fee_code,part,cnt,chk_kind:string):boolean;
var             //牙齒類型 (0-恆牙;1-乳牙),限制天數,申報項目,限制數量,項目狀態 (0-全部包含,1-至少一項,2-全部不包含),可用部位,不可用部位,輸入項目,輸入部位,輸入數量,檢核種類 (0-相同部位,1-不同部位)
  i,j,part_cnt,li_pos,use_pos,nouse_pos:integer;
  return_flag,chk_fee:boolean;
  fee_code_tmp,use_part_tmp,nouse_part_tmp,fee_part:TStringList;
  chk_part:string;
begin
  fee_code_tmp   := TStringList.Create;
  use_part_tmp   := TStringList.Create;
  nouse_part_tmp := TStringList.Create;

  if trim(fee_code_xml) = '' then
    fee_code_xml := fee_code;

  fee_code_tmp := cutitem(fee_code_xml);
  if trim(use_part_xml) <> '' then
    use_part_tmp := cutitem(use_part_xml);

  if trim(nouse_part_xml) <> '' then
    nouse_part_tmp := cutitem(nouse_part_xml);

  fee_part := TStringList.Create;
  part_cnt := length(part) div 2;
  for i := 0 to part_cnt - 1 do
    fee_part.Add(copy(part,(i * 2 + 1),2));

  if nouse_part_tmp.Count > 0 then //不可用部位
  begin
    if chk_kind = '0' then //0-相同部位
    begin
      chk_part := '';
      for i := 0 to fee_part.Count - 1 do
        for j := 0 to nouse_part_tmp.Count - 1 do
          if fee_part[i] = nouse_part_tmp[j] then
            chk_part := chk_part + fee_part[i];

      if length(chk_part) > 0 then
        return_flag:=before_part(fee_code_tmp,chk_part,day_xml,qty_xml,fee_status_xml,fee_code)
      else                      //xml申報項目,相同部位,限制天數,限制數量,項目狀態 (0-全部包含,1-至少一項,2-全部不包含,輸入項目
        return_flag:=false;
    end
    else if chk_kind = '1' then// 1-不同部位
    begin
      for j := 0 to nouse_part_tmp.Count - 1 do
      begin
        return_flag := before_part(fee_code_tmp,nouse_part_tmp[j],day_xml,qty_xml,fee_status_xml,fee_code);
        if return_flag then
          break;
      end;
    end
    else
      return_flag := false;
  end
  else
    //執行可用部位OR沒有部位設定
    return_flag := before_nopart(fee_code_tmp,day_xml,qty_xml,fee_status_xml,fee_code);
  result := return_flag;
  fee_code_tmp.Free;
  use_part_tmp.Free;
  nouse_part_tmp.Free;
end;

//此次處置
function chkFee_now(teeth_xml,fee_code_xml,qty_xml,fee_status_xml,use_part_xml,nouse_part_xml,fee_code,part,cnt,chk_kind:string):boolean;
var
    return_flag:boolean;
    fee_code_tmp,use_part_tmp,nouse_part_tmp:TStringList;
begin
    fee_code_tmp:=TStringList.Create;
    use_part_tmp:=TStringList.Create;
    nouse_part_tmp:=TStringList.Create;
    return_flag:=false;

    if trim(fee_code_xml) = '' then  //
      fee_code_xml:=fee_code;
    fee_code_tmp:=cutitem(fee_code_xml);

    if trim(use_part_xml) <> '' then
        use_part_tmp:=cutitem(use_part_xml);

    if trim(nouse_part_xml) <> '' then
        nouse_part_tmp:=cutitem(nouse_part_xml);


    case StrToInt(teeth_xml) of //項目狀態 (0-全部包含,1-至少一項,2-全部不包含)
        -1:
        begin
            if fee_code_tmp <> nil then
            begin
                case StrToInt(fee_status_xml) of
                    0:
                    begin
                        if trim(qty_xml) <> '' then
                            if StrToInt(qty_xml) < (length(part) div 2) then
                                return_flag:=true;
                        if not return_flag then
                            return_flag:=nowfee_statusall(fee_code_tmp,use_part_tmp,nouse_part_tmp,part);
                    end;
                    1:
                    begin
                        return_flag:=false;
                    end;
                    2:
                    begin
                        if trim(qty_xml) <> '' then
                            if StrToInt(qty_xml) < StrToInt(cnt) then
                                return_flag:=true;
                        if not return_flag then
                            return_flag:=nowfee_statusno(fee_code_tmp,use_part_tmp,nouse_part_tmp,part);
                    end;
                end;
            end;
        end;
        0:
        begin
            if fee_code_tmp <> nil then
            begin
                case StrToInt(fee_status_xml) of
                    0:
                    begin
                        if trim(qty_xml) <> '' then
                            if StrToInt(qty_xml) < StrToInt(cnt) then
                                return_flag:=true;
                        if not return_flag then
                            return_flag:=nowfee_statusall(fee_code_tmp,use_part_tmp,nouse_part_tmp,part);
                    end;
                    1:
                    begin
                    end;
                    2:
                    begin
                        if trim(qty_xml) <> '' then
                            if StrToInt(qty_xml) < StrToInt(cnt) then
                                return_flag:=true;
                        if not return_flag then
                            return_flag:=nowfee_statusno(fee_code_tmp,use_part_tmp,nouse_part_tmp,part);
                    end;
                end;
            end;
        end;
        1:
        begin
            return_flag:=false;
            if fee_code_tmp <> nil then
            begin
                case StrToInt(fee_status_xml) of
                    0:
                    begin
                        if trim(qty_xml) <> '' then
                            if StrToInt(qty_xml) < StrToInt(cnt) then
                                return_flag:=true;
                        if not return_flag then
                            return_flag:=nowfee_statusall(fee_code_tmp,use_part_tmp,nouse_part_tmp,part);
                    end;
                    1:
                    begin
                    end;
                    2:
                    begin
                        if trim(qty_xml) <> '' then
                            if StrToInt(qty_xml) < StrToInt(cnt) then
                                return_flag:=true;
                        if not return_flag then
                            return_flag:=nowfee_statusno(fee_code_tmp,use_part_tmp,nouse_part_tmp,part);
                    end;
                end;
            end;
        end;
    end;           

    result:=return_flag;
    fee_code_tmp.Free;
    use_part_tmp.Free;
    nouse_part_tmp.Free;
end;

//可用部位
function before_nopart(fee_code_tmp:TStringList;day_xml,qty_xml,fee_status_xml,fee_code:string):boolean;
var
  return_flag:boolean;
  i,cnt:integer;
  d1,d2:string;
  Qrys :TADOQuery;
  tmpSql :String;
  SQLs :TStrings;
begin
  return_flag:=true;
  try
    SQLs:=TStringList.Create;
    SQLs.Clear;

    SQLs.Text:=getChkSqlStr(33);

    if fee_status_xml = '0' then//項目狀態(0-全部包含,1-至少一項,2-全部不包含)
    begin
      if fee_code_tmp.Count > 0 then
        for i:= 0 to fee_code_tmp.Count - 1 do
          SQLs.Add('and b.fee_code =' + QuotedStr(fee_code_tmp[i]));
    end
    else
    begin
      if fee_code_tmp.Count > 0 then
      begin
        SQLs.Add(' and b.fee_code in (');

        for i:= 0 to fee_code_tmp.Count - 1 do
          SQLs.Add(QuotedStr(fee_code_tmp[i]) + ',');

        SQLs.Add(QuotedStr(fee_code_tmp[(fee_code_tmp.Count-1)]) + ')');
      end;
    end;

    tmpSql:=getChkSqlStr(32);
    SetParamter(tmpSql,'$CHR_NO$',getChrNo);
    tmpSql:=StringReplace(tmpSql,'$DEPT_CODE$',gsIniDeptCode,[rfReplaceAll]);

    SQLs.Add(tmpSql);

    if day_xml <> '' then
    begin
        d1:=dateformat(day_add(date_transform(getOpdDate,'+'),-StrToInt(day_xml)),'',0,1);
        d2:=dateformat(day_add(date_transform(getOpdDate,'+'),-1),'',0,1);
        SQLs.Add(' and '+f_SQL_date_trans('a.opd_date',d1,d2));
        //SQLs.Add(' and a.opd_date between'+Qt(d1)+' and '+Qt(d2));
    end;

    case StrToInt(fee_status_xml) of
        0:
        begin
            if DM.OpenSQL(SQLs,Qrys) then
                if trim(Qrys.FieldByName('his_qty_num').AsString) <> '' then
                    result:=false
                else
                  result:=true
            else
                result:=true;
        end;
        1:
        begin
            result:=false;
        end;
        2:
        begin
            if DM.OpenSQL(SQLs,Qrys) then
                if trim(qty_xml) <> '' then
                    if StrToInt(qty_xml) <= Qrys.FieldByName('his_qty_num').AsInteger then
                        result:=true
                    else
                        result:=false
                else
                    if Qrys.FieldByName('his_qty_num').AsInteger = 0 then
                        result:=false
                    else
                        result:=true
            else
                result:=false;
        end;
    end;

  except
      SQLs.Free;
  end;
  SQLs.Free;
end;

//xml檢核_部位(不可用部位:相同部位;不同部位)
function before_part(fee_code_tmp:TStringList;chk_part,day_xml,qty_xml,fee_status_xml,fee_code:string):boolean;
var                  //xml申報項目,相同部位,限制天數,,限制數量,項目狀態(0-全部包含,1-至少一項,2-全部不包含),輸入部位
  return_flag:boolean;
  i,cnt:integer;
  d1,d2:string;
  Qrys :TADOQuery;
  tmpSql :String;
  SQLs :TStrings;
begin
  return_flag:=true;
  try
    SQLs:=TStringList.Create;
    SQLs.Clear;

    SQLs.Text:=getChkSqlStr(31);

    if fee_status_xml = '0' then//項目狀態(0-全部包含,1-至少一項,2-全部不包含)
    begin //
        if fee_code_tmp.Count > 0 then
            for i:= 0 to fee_code_tmp.Count - 1 do
                SQLs.Add('and b.fee_code =' + QuotedStr(fee_code_tmp[i]));
    end
    else
    begin
        if fee_code_tmp.Count > 0 then
        begin
            SQLs.Add(' and b.fee_code in (');

            for i:= 0 to fee_code_tmp.Count - 1 do
                SQLs.Add(QuotedStr(fee_code_tmp[i]) + ',');

            SQLs.Add(QuotedStr(fee_code_tmp[(fee_code_tmp.Count-1)]) + ')');
        end;
    end;

    SQLs.Add('and (');
    cnt:=length(chk_part) div 2;
    for i:= 0 to cnt -2 do
        SQLs.Add('(instr(substr(b.position,1,2),' + QuotedStr(copy(chk_part,i * 2 + 1,2)) + ') > 0 or instr(substr(b.position,3,2),' + QuotedStr(copy(chk_part,i * 2 + 1,2)) + ') > 0 or instr(substr(b.position,5,2),' + QuotedStr(copy(chk_part,i * 2 + 1,2)) + ') > 0) or');
    SQLs.Add('(instr(substr(b.position,1,2),' + QuotedStr(copy(chk_part,(cnt - 1)*2+1,2)) + ') > 0 or instr(substr(b.position,3,2),' + QuotedStr(copy(chk_part,(cnt - 1)*2+1,2)) + ') > 0 or instr(substr(b.position,5,2),' + QuotedStr(copy(chk_part,(cnt - 1)*2+1,2)) + ') > 0))');

    tmpSql:=getChkSqlStr(32);
    SetParamter(tmpSql,'$CHR_NO$',getChrNo);
    tmpSql:=StringReplace(tmpSql,'$DEPT_CODE$',gsIniDeptCode,[rfReplaceAll]);

    SQLs.Add(tmpSql);


    if day_xml <> '' then
    begin
        d1:=dateformat(day_add(date_transform(getOpdDate,'+'),-StrToInt(day_xml)),'',0,1);
        d2:=dateformat(day_add(date_transform(getOpdDate,'+'),-1),'',0,1);         
        SQLs.Add(' and '+f_SQL_date_trans('a.opd_date',d1,d2));
    end;
    //SQLs.SaveToFile('BeforePart.sql');
    case StrToInt(fee_status_xml) of
        0:
        begin
            if DM.OpenSQL(SQLs,Qrys) then
                if trim(Qrys.FieldByName('his_qty_num').AsString) <> '' then
                    result:=false
                else
                  result:=true
            else
                result:=true;
        end;
        1:
        begin
            result:=false;
        end;
        2:
        begin
            if DM.OpenSQL(SQLs,Qrys) then
                if trim(qty_xml) <> '' then
                    if StrToInt(qty_xml) <= Qrys.FieldByName('his_qty_num').AsInteger then
                        result:=true
                    else
                        result:=false
                else
                    if Qrys.FieldByName('his_qty_num').AsInteger = 0 then
                        result:=false
                    else
                        result:=true
            else
                result:=false;
        end;
    end;

  except
      SQLs.Free;
  end;
  SQLs.Free;
end;

function cutitem(str:string):TStringList;
var
    li_pos:integer;
    fee_code_tmp:TStringList;
begin
    fee_code_tmp := TStringList.Create;

    if (pos('|',str) = 0) and (trim(str)<>'') then
        str:=str+'|';

    li_pos:=pos('|',str);

    while li_pos > 0 do
    begin
        fee_code_tmp.Add(copy(str,1,li_pos-1));
        str:=copy(str,li_pos+1,length(str)-li_pos);

        if (pos('|',str) = 0) and (trim(str)<>'') then
            str:=str+'|';
        li_pos:=pos('|',str);
    end;
    result:=fee_code_tmp;
end;



function Return_Pos(s,substr: string): Integer;
var
  i,pos_index: Integer;
begin
  i := 1;
  pos_index:=0;
  while i <= Length(s) do
  begin
    if ByteType(s[i], 1) <> mbSingleByte then
    begin
      i := i + 2;
      Continue;
    end;
    if s[i] = substr then
    begin
      pos_index := i;
      Break;
    end;
    Inc(i);
  end;
  Result:=pos_index;
end;

function Pre_Return_cut_word(s,substr: string): string;
var
  i: Integer;
begin
  Result := s;
  i := 1;
  while i <= Length(s) do
  begin
    if ByteType(s[i], 1) <> mbSingleByte then
    begin
      i := i + 2;              
      Continue;
    end;
    if s[i] = substr then
    begin
      Result := Copy(s, 1, i - 1);
      Break;
    end;
    Inc(i);
  end;
end;

function Aft_Return_cut_word(s,substr: string): string;
var
  i: Integer;
begin
  Result := s;
  i := 1;
  while i <= Length(s) do
  begin
    if ByteType(s[i], 1) <> mbSingleByte then
    begin
      i := i + 2;
      Continue;
    end;
    if s[i] = substr then
    begin
      Result := Copy(s, i + 1, Length(s) - i);
      Break;
    end;
    Inc(i);
  end;
end;

procedure setFeeImg(part:string);
var
    i:integer;
begin

    if FrmOrder.FindComponent('a' + part) <> nil then
        TImage(FrmOrder.FindComponent('a' + part)).Visible := true;
    if FrmOrder.FindComponent('d' + part) <> nil then
        TImage(FrmOrder.FindComponent('d' + part)).Visible := false;
    if FrmOrder.FindComponent('btn_' + part) <> nil then
        TButton(FrmOrder.FindComponent('btn_' + part)).Tag := 1;

end;

procedure AnalysisFeePart(feepart:string);
var
    len,i:integer;
    part:string;
begin
    len:=length(feepart);
    i:=1;
    if (len mod 2) <> 0 then
        Abort;

    while len >= i do
    begin
        part:=copy(feepart,i,2);
        if (part <> 'UR') and (part <> 'UL') and (part <> 'LL') and (part <> 'LR') then
            setFeeImg(part);
        i:=i+2;
    end;
end;

procedure insert_ic_med_warning_log(WARNING_KIND,INS_MED_CODE1,PER_QTY1,CIR_CODE1,MED_DAYS1,SELF_PAY_FLAG,OPD_DATE2,INS_MED_CODE2,MED_DAYS2,PATH_CODE2,HOSP_CODE2,DDI_SEQ,PREG_CATE,PREG_SEQ,DR_ACTION,ALERT_DATE,ALERT_TIME:string);
var
 tmpSql :String;
 SQLs :TStrings;
begin
  SQLs:=TStringList.Create;
  tmpSql:=getInsertSql(8);
  SetParamter(tmpSql,'$SOURCE_KIND$','O');
  SetParamter(tmpSql,'$WARNING_KIND$',WARNING_KIND);
  SetParamter(tmpSql,'$CHR_NO$',getChrNo);
  SetParamter(tmpSql,'$SEX_TYPE$',getPSex);
  SetParamter(tmpSql,'$AGE$',getPAge);
  SetParamter(tmpSql,'$FEE_NO$',getFeeNo);
  SetParamter(tmpSql,'$DEPT_CODE$',getDeptCode);
  SetParamter(tmpSql,'$OPD_DATE1$',getOpdDate);
  SetParamter(tmpSql,'$INS_MED_CODE1$',INS_MED_CODE1);
  SetParamter(tmpSql,'$PER_QTY1$',PER_QTY1);
  SetParamter(tmpSql,'$CIR_CODE1$',CIR_CODE1);
  SetParamter(tmpSql,'$MED_DAYS1$',MED_DAYS1);
  SetParamter(tmpSql,'$PATH_CODE1$','');
  SetParamter(tmpSql,'$SELF_PAY_FLAG$',SELF_PAY_FLAG);
  SetParamter(tmpSql,'$DOC_CODE1$',getDocCode1);
  SetParamter(tmpSql,'$OPD_DATE2$',OPD_DATE2);
  SetParamter(tmpSql,'$INS_MED_CODE2$',INS_MED_CODE2);
  SetParamter(tmpSql,'$PER_QTY2$','');
  SetParamter(tmpSql,'$CIR_CODE2$','');
  SetParamter(tmpSql,'$MED_DAYS2$',MED_DAYS2);
  SetParamter(tmpSql,'$PATH_CODE2$',PATH_CODE2);
  SetParamter(tmpSql,'$HOSP_CODE2$',HOSP_CODE2);
  SetParamter(tmpSql,'$DDI_SEQ$',DDI_SEQ);
  SetParamter(tmpSql,'$PREG_CATE$',PREG_CATE);
  SetParamter(tmpSql,'$PREG_SEQ$',PREG_SEQ);
  SetParamter(tmpSql,'$DR_ACTION$',DR_ACTION);
  SetParamter(tmpSql,'$ALERT_DATE$',ALERT_DATE);
  SetParamter(tmpSql,'$ALERT_TIME$',ALERT_TIME);
  SetParamter(tmpSql,'$UPD_DATE$',ROCDate(now,''));
  SetParamter(tmpSql,'$UPD_TIME$',ROCTime(now,''));
  SetParamter(tmpSql,'$UPD_OPER$',getDocCode1);
  SQLs.Text:=tmpSql;

  try
  begin
    DM.ExecSQL(SQLs);
  end
  finally
    SQLs.Free;
  end;

end;

function CHKTTreat(doc_code,Tran_Treat:string;SGFee:TStringGrid;Type_Flag:integer):Boolean;
var
  i:integer;
  isTranTreat:Boolean;
  Qrys :TADOQuery;
  tmpSql :String;
  SQLs :TStrings;
begin
  if Type_Flag = 2 then
  begin
    isTranTreat:=True;
    for i:= 0 to SGFee.RowCount - 1 do
      if pos('R',UpperCase(SGFee.Cells[3,i])) > 0 then
      begin
          isTranTreat:=false;
          break;
      end;
  end
  else
    isTranTreat:=false;

  if not isTranTreat then
  begin
    if Tran_Treat = 'Y' then
      isTranTreat:=True
    else
      isTranTreat:=false;
  end;


  SQLs:=TStringList.Create;
  tmpSql:=getChkSqlStr(18);
  SetParamter(tmpSql,'$HIA_DOC$',trim(doc_code));
  tmpSql := StringReplace(tmpSql,'$DEPT_CODE$',gsIniDeptCode,[rfReplaceAll]);
  tmpSql := StringReplace(tmpSql, '$OPD_KIND$', gsOpdKind, [rfReplaceAll]);
  SetParamter(tmpSql,'$OPD_DATE$',getOpdDate);
  SQLs.Text:=tmpSql;

  if DM.OpenSQL(SQLs,Qrys) then
  begin
    if Qrys.FieldByName('qty').AsInteger > StrToInt(gsOpdCnt) then
      MessageDlg('每位醫師每日門診量限二十人申報'+#13#10+'目前已申報:'+Qrys.FieldByName('qty').AsString+'人',mtWarning,[mbOk],0);
  end;

  Result:=isTranTreat;

end;

procedure resetFeeImg(Sender:TObject);
var
    i:integer;
begin
    for i:= 0 to TGroupBox(Sender).ControlCount - 1 do
    begin
        if TGroupBox(Sender).Controls[i].ClassName = 'TImage' then
        begin
            if copy(TGroupBox(Sender).Controls[i].Name,1,1) = 'd' then
            begin
                TImage(TGroupBox(Sender).Controls[i]).Visible :=true;
            end
            else
            begin
                TImage(TGroupBox(Sender).Controls[i]).Visible :=false;
            end;
        end;
        if TGroupBox(Sender).Controls[i].ClassName = 'TButton' then
        begin
            if copy(TGroupBox(Sender).Controls[i].Name,1,3) = 'btn' then
                TButton(TGroupBox(Sender).Controls[i]).Tag :=0;
        end;
    end;
end;

procedure changeFeePart(col,row,F_Code,F_Qty:integer;part:string;do_type:integer;SGTmp:TStringGrid);
var
  feepart,onepart,newpart:string;
  len,i,part_num:integer;
  MyIni: TIniFile;
  path:string;
begin
    case do_type of
      0:
      begin
        feepart:=trim(SGTmp.Cells[col,row]);
        feepart:=feepart+part;
        SGTmp.Cells[col,row]:=feepart;
      end;
      1:
      begin
        feepart:=trim(SGTmp.Cells[col,row]);
        len:=length(feepart);
        i:=1;
        while len >= i do
        begin
            onepart:=copy(feepart,i,2);
            if onepart <> part then
                newpart := newpart + onepart;
            i:=i+2;
        end;
        SGTmp.Cells[col,row]:=newpart;
      end;
      2:
      begin
        if part = 'UR' then
        begin
            feepart:=trim(SGTmp.Cells[col,row]);
            len:=length(feepart);
            i:=1;
            while len >= i do
            begin
                onepart:=copy(feepart,i,2);
                if (copy(onepart,1,1) <> '1') then
                    newpart := newpart + onepart;
                i:=i+2;
            end;
            newpart := newpart + part;
            SGTmp.Cells[col,row]:=newpart;
        end;
        if part = 'UL' then
        begin
            feepart:=trim(SGTmp.Cells[col,row]);
            len:=length(feepart);
            i:=1;
            while len >= i do
            begin
                onepart:=copy(feepart,i,2);
                if (copy(onepart,1,1) <> '2') then
                    newpart := newpart + onepart;
                i:=i+2;
            end;
            newpart := newpart + part;
            SGTmp.Cells[col,row]:=newpart;
        end;
        if part = 'LL' then
        begin
            feepart:=trim(SGTmp.Cells[col,row]);
            len:=length(feepart);
            i:=1;
            while len >= i do
            begin
                onepart:=copy(feepart,i,2);
                if (copy(onepart,1,1) <> '3') then
                    newpart := newpart + onepart;
                i:=i+2;
            end;
            newpart := newpart + part;
            SGTmp.Cells[col,row]:=newpart;
        end;
        if part = 'LR' then
        begin
            feepart:=trim(SGTmp.Cells[col,row]);
            len:=length(feepart);
            i:=1;
            while len >= i do
            begin
                onepart:=copy(feepart,i,2);
                if (copy(onepart,1,1) <> '4') then
                    newpart := newpart + onepart;
                i:=i+2;
            end;
            newpart := newpart + part;
            SGTmp.Cells[col,row]:=newpart;
        end;
        if part = 'FM' then
        begin
            SGTmp.Cells[col,row]:='FM';
        end;
      end;
      3:
      begin
        feepart:=trim(SGTmp.Cells[col,row]);
        len:=length(feepart);
        i:=1;
        while len >= i do
        begin
            onepart:=copy(feepart,i,2);
            if onepart <> part then
                newpart := newpart + onepart;
            i:=i+2;
        end;
        SGTmp.Cells[col,row]:=newpart;
      end;
    end;
    path:=application.ExeName;
    path:=ExtractFileDir(path);

    path:=path+'\'+FeePartFileName;

    MyIni := TIniFile.Create(path);
    try
        if MyIni.ReadString('FEE_CODE',PChar(trim(SGTmp.Cells[F_Code,row])), '') <> '' then
        begin
            part_num:=StrToInt(MyIni.ReadString('FEE_CODE',PChar(trim(SGTmp.Cells[F_Code,row])), ''));
            SGTmp.Cells[F_Qty,row]:=IntToStr((length(trim(SGTmp.Cells[col,row])) div 2) * part_num);
        end
        else
          SGTmp.Cells[F_Qty,row]:=IntToStr(length(trim(SGTmp.Cells[col,row])) div 2);
        FrmOrder.ComputeAmt(SGTmp,F_Qty,F_Code,F_Ins);
    finally
        MyIni.Free;
    end;
end;

function checkFeePartLength(col,row:integer;SGTmp:TStringGrid;var msg:string):Boolean;
begin
    result:=false;
    if length(SGTmp.Cells[col,row]) >= 6 then
    begin
        msg := '項目部位代碼已為6碼，因此無法再增加其他部位';
        result:=true;
    end;
end;

function RePeatNow(tmpSg:TStringGrid;fee_code,SGitem:string;col:integer;var msg:string):boolean;
var
  i:integer;
  isRepeat:boolean;
begin
  isRepeat:=false;
  msg:='下列 "'+SGitem+'" 項目本日已曾經開立：'+#13;
  for i:= 0 to tmpSg.RowCount - 1 do
    if tmpSg.Cells[col,i] = fee_code then
    begin
      msg:=msg+tmpSG.Cells[3,i]+#13;
      isRepeat:=true;
      break;
    end;

  if isRepeat then
    msg:=msg+#13+'是否繼續?';

  result:=isRepeat;
end;

function RePeatOpen(tmpSG:TStringGrid;SGitem:String;var msg:string):boolean;
var
  i,j:integer;
  isRepeat:boolean;
  Qrys :TADOQuery;
  tmpSql :String;
  SQLs :TStrings;
begin
  try


    SQLs := TStringList.Create;

    msg:='下列 "'+SGitem+'" 項目本日已曾經開立：'+#13;
    isRepeat:=false;
    for i:=0 to tmpSG.RowCount - 1 do
    begin
      if (tmpSG.Cells[0,i] = 'N') and (copy(tmpSG.Cells[C_Kind,i],1,1) <> 'T') then
      begin
        SQLs.Clear;
        tmpSql:=getChkSqlStr(5);
        SetParamter(tmpSql,'$FEE_CODE$',tmpSG.Cells[3,i]);
        SetParamter(tmpSql,'$OPD_DATE$',getOpdDate);
        SetParamter(tmpSql,'$CHR_NO$',getChrNo);
        SQLs.Text := tmpSql;

        if DM.OpenSQL(SQLs,Qrys) then
        begin
          msg:=msg+tmpSG.Cells[3,i]+#13;
          isRepeat:=true;
        end;
      end;
    end;
    if isRepeat then
      msg:=msg+#13+'是否繼續?';

    result:=isRepeat;
    FreeAndNil(SQLs);
  except
    result:=false;
    FreeAndNil(SQLs);
  end;
end;

function ChkMedQty(chr_no,med_code,fee_no,opd_date,self_pay_flag,ttl:String):String;
var
  tmpSql,FuncResult:string;
  SQLs:TStrings;
  Qrys: TADOQuery;
begin
  SQLs:=TStringList.Create;
  tmpSql:=getChkSqlStr(63);
  SetParamter(tmpSql,'$CHR_NO$',chr_no);
  SetParamter(tmpSql,'$MED_CODE$',med_code);
  SetParamter(tmpSql,'$FEE_NO$',fee_no);
  SetParamter(tmpSql,'$OPD_DATE$',opd_date);
  SetParamter(tmpSql,'$SELF_PAY_FLAG$',self_pay_flag);
  SetParamter(tmpSql,'$TTL_QTY$',ttl);
  SQLs.Text:=tmpSql;
  if DM.OpenSQL(SQLs,Qrys) then
    Result:=Qrys.FieldByName('AA').AsString
  else
    Result:='O;';

  SQLs.Free;
end;

function CalMedTtl(Cir_code, Accu_flag: string; pack_amt, med_days: Integer; per_qty: Extended): string;
var
  s1, s2, m1, m2, qty1, qty2: integer;
  Qrys :TADOQuery;
  tmpSql,accuflag :String;
  SQLs :TStrings;
begin
  accuflag := UpperCase(Setsys.ReadString('SYSTEM','MEDCOUNT',''));
  IF (Accu_flag = 'N') and (Cir_code <> 'STAT') THEN //20140114是否累計藥量
    if accuflag = 'TRUE' THEN
       per_qty := ceil(per_qty);

  SQLs := TStringList.Create;
  tmpSql:=getChkSqlStr(2);

  SetParamter(tmpSql,'$CODE$',Cir_Code);
  SQLs.Text := tmpSql;

  if DM.OpenSQL(SQLs,Qrys) then
  begin
    with Qrys do
    begin
      if pack_amt = 0 then
        Result := '1'
      else IF pack_amt = 1 THEN
        Result := IntToStr(Ceil(max((per_qty*Round((med_days/FieldByName('TTL_DAYS').AsInteger ) * (FieldByName('TTL_DAYS').AsInteger /  FieldByName('DUR_DAYS').AsInteger) ) * FieldByName('Day_Cnt').AsInteger)/pack_amt,1)))
      ELSE
        Result := IntToStr(ceil((per_qty*Round((med_days/FieldByName('TTL_DAYS').AsInteger ) * (FieldByName('TTL_DAYS').AsInteger /  FieldByName('DUR_DAYS').AsInteger) ) * FieldByName('Day_Cnt').AsInteger)/pack_amt));
    end;
  end;
  FreeAndNil(SQLs);
end;


function ADSpace(Val: string; leng: Integer): string;
var
  i: Integer;
begin
  for i := 1 to leng - Length(Val) do
    Val := Val + #32;
  Result := Val;
end;
function CheckPatUsed(fee_no : String;var Doc_code : String; var patIP :String):Boolean;
var
  TempQQ : TADOQuery;
begin
  PreDelPat(fee_no,Doc_code);
  TempQQ := TADOQuery.Create(FrmMain);
  TempQQ.Connection := DM.ADOLink;
  With TempQQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * from ER_Lock Where SYS_TYPE=''DPD'' and FEE_NO='+Qt(Fee_no));
    open;
    CheckPatUsed := not Eof ;
    Doc_code := FieldByName('DOC_CODE').AsString;
    patIP := FieldByName('IPADDRESS').AsString;
    Close;
  end;
  FreeAndNil(TempQQ);
end;
Procedure PatInUsing(fee_no,Chr_no,Doc_code : String);
var
  TempQQ : TADOQuery;
begin
  TempQQ := TADOQuery.Create(FrmMain);
  TempQQ.Connection := DM.ADOLink;
  try
    DM.ADOLink.BeginTrans;
    With TempQQ do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Insert Into ER_LOCK(OPD_DATE,DOC_CODE,CHR_NO,FEE_NO,IPADDRESS,COMPUTERNAME,LOCK_FLAG,SYS_TYPE,UPD_DATE,UPD_TIME)');
      SQL.Add('Values ('+Qt(RocDate(now,''))+','+Qt(Doc_code)+','+Qt(Chr_no)+','+Qt(Fee_no)+','+Qt(MyIp)+','+Qt(mypc)+',''Y'',''DPD'','+Qt(RocDate(now,''))+','+RocTime(now,'')+')');
      ExecSQL;
    end;
    DM.ADOLink.CommitTrans;
    FreeAndNil(TempQQ);
  except
    DM.ADOLink.RollbackTrans;
    FreeAndNil(TempQQ);
  end;
end;
Procedure PatUnUsing(fee_no: String);
var
  TempQQ : TADOQuery;
begin
  TempQQ := TADOQuery.Create(FrmMain);
  TempQQ.Connection := DM.ADOLink;
  try
    DM.ADOLink.BeginTrans;
    With TempQQ do
    begin
      Close;
      SQL.Clear;
      SQl.Add('Delete ER_LOCK Where Fee_no='+Qt(Fee_no)+' and SYS_TYPE=''DPD''');
      Execsql;
    end;
    DM.ADOLink.CommitTrans;
    FreeAndNil(TempQQ);
  except
    DM.ADOLink.RollbackTrans;
    FreeAndNil(TempQQ);
  end;
end;
Procedure PreDelPat(fee_no,Doc_code: String);
var
  TempQQ : TADOQuery;
begin
  TempQQ := TADOQuery.Create(FrmMain);
  TempQQ.Connection := DM.ADOLink;
  try
    DM.ADOLink.BeginTrans;
    With TempQQ do
    begin
      Close;
      SQL.Clear;
      SQl.Add('Delete ER_LOCK Where Fee_no='+Qt(Fee_no)+' and SYS_TYPE=''DPD'' AND DOC_CODE='+Qt(Doc_code)+' AND IPADDRESS='+Qt(myIP));
      Execsql;
    end;
    DM.ADOLink.CommitTrans;
    FreeAndNil(TempQQ);
  except
    DM.ADOLink.RollbackTrans;
    FreeAndNil(TempQQ);
  end;
end;

function MaxMedDays(sdg :TStringGrid ): Integer;
var
  Med_Days,med_days_self : integer;
  i : integer;
begin
  Result := 0;
  Med_Days:=0;
  med_days_self:=0;

  for i := sdg.FixedRows to sdg.RowCount - 2 do
  begin
    try
      if (StrToInt(sdg.Cells[M_Day, i]) > Med_Days) and ((sdg.Cells[M_Ins,i]='Y') or (sdg.Cells[M_Ins,i]='G')) then
        Med_Days := strtoint(sdg.Cells[9, i])
      else if (StrToInt(sdg.Cells[M_Day, i]) > med_days_self) and ((sdg.Cells[M_Ins,i]='N') or (sdg.Cells[M_Ins,i]='H')) then
        med_days_self := strtoint(sdg.Cells[9, i]);
    except
    end;
  end;

  if (Med_Days = 0) and (med_days_self <> 0) then
    Med_Days :=med_days_self;

  Result := Med_Days;
end;

procedure insert_cloud_log(pass_flag: string);
var
  TempQQ : TADOQuery;
begin
  TempQQ := TADOQuery.Create(frmorder);
  TempQQ.Connection := DM.ADOLink;
  try
    With TempQQ do
    begin
      Close;
      SQL.Clear;
      SQl.Add('select * from CLOUD_MED_LOG where OPD_DATE='''+getOpdDate+''' and DEPT_CODE='''+getDeptCode+''' and SHIFT_NO='''+getShiftNo+
                                            ''' and DEPT_ROOM='''+getDeptRoom+''' and DOC_CODE='''+getDocCode+''' and CHR_NO='''+getChrNo+'''');
      Open;
      DM.ADOLink.BeginTrans;
      if Not IsEmpty then
      begin
        //update
        Close;
        SQL.Clear;
        SQl.Add('update CLOUD_MED_LOG set PASS_FLAG='''+pass_flag+''',UPD_OPER='''+getDocCode+''',UPD_DATE='''+ROCDate(Now,'')+''',UPD_TIME='''+ROCTime(now,'')+''''+
                ' where OPD_DATE='''+getOpdDate+''' and DEPT_CODE='''+getDeptCode+''' and SHIFT_NO='''+getShiftNo+
                        ''' and DEPT_ROOM='''+getDeptRoom+''' and DOC_CODE='''+getDocCode+''' and CHR_NO='''+getChrNo+'''');
      end
      else
      begin
        //insert
        Close;
        SQL.Clear;
        SQl.Add('insert into CLOUD_MED_LOG(OPD_DATE,DEPT_CODE,SHIFT_NO,DEPT_ROOM,DOC_CODE,CHR_NO,UPD_OPER,UPD_DATE,UPD_TIME,PASS_FLAG,OPD_KIND)');
        SQl.Add('values('''+getOpdDate+''','''+getDeptCode+''','''+getShiftNo+''','''+getDeptRoom+''','''+getDocCode+''','''+getChrNo+''','''+
                            getDocCode+''','''+ROCDate(Now,'')+''','''+ROCTime(now,'')+''','''+pass_flag+''',''D'')');
      end;
      Execsql;
    end;
    DM.ADOLink.CommitTrans;
  finally
    FreeAndNil(TempQQ);
  end;

end;

function SetHoliday(mydate,sechtype:string):string;
var
  sday: string;
begin
  Result := '';
  sday := '';
  With DM.QrySearch Do Begin
      Close;
      SQL.Clear;
      SQL.Add('select holiday,trim(hl_desc) hl_desc from holiday ');
      if sechtype = 'date' then
        SQL.Add('where holiday = '+QuotedStr(mydate))
      else
        SQL.Add('where holiday like '+QuotedStr(copy(mydate,1,3)+'%'));
      //SQL.SaveToFile('sql.sql');
      Open;
  End;
  If not DM.QrySearch.IsEmpty Then
  begin
    if sechtype = 'date' then
    begin
      sday := DM.QrySearch.fieldbyname('hl_desc').AsString;
    end
    else
    begin
      while not DM.QrySearch.Eof do
      begin
        sday := sday + DM.QrySearch.fieldbyname('holiday').AsString +',';
        DM.QrySearch.Next;
      end;
      if length(sday) > 0 then
        sday := copy(sday,1,length(sday)-1);
    end;
  end
  else
    case DayOfWeek(ROCToDate(myDate)) of
      7: sday := '周日';
    end;
    { day := LongDayNames[DayOfWeek(myDate)];
    1  = Sunday
    2  = Monday
    3  = Tuesday
    4  = Wednesday
    5  = Thursday
    6  = Friday
    7  = Saturday}
  dm.QrySearch.Close;
  if sday <> '' then
    Result :=  RocDate(ROCToDate(mydate)+1,'');;
end;


function getDiagDate(var ppLastDate: String): String;
var
  ttHoliday,ttSatWork : String;
  ttWeek : integer;
  ttAddDay : integer;
  ttStr,ttStrSat : TStringList;
  ttI : integer;
  ttNext : String;
begin
  //ttHoliday := SetSys.ReadString('SYSTEM','Holiday','');
  ttHoliday := SetHoliday('','');
  ttSatWork := SetSys.ReadString('SYSTEM','SatWork','');
  ttWeek := DayOfWeek(ROCToDate(ppLastDate));
  //先判斷是否為特殊假日
  ttStr := TStringList.Create;
  ttStrSat := TStringList.Create;
  try
    ttStr.Clear;
    ttStr.CommaText := ttHoliday;
    ttStrSat.Clear;
    ttStrSat.CommaText := ttSatWork;
    ttNext:= ppLastDate;
    if (ttStr.IndexOf(ppLastDate)> -1 ) or (ttWeek = 1) then  //假日
    begin
      ppLastDate := RocDate(ROCToDate(ttNext)+1,'');
      getDiagDate(ppLastDate);
    end
    else if ((ttStrSat.IndexOf(ppLastDate)=-1) and (ttWeek = 7) ) then  //星期六不上班
    begin
      ppLastDate := RocDate(ROCToDate(ttNext)+1,'');
      getDiagDate(ppLastDate);
    end
    else //要上班
    begin
      //Showmessage(ppLastDate) ;
      //mydates := ppLastDate;
    end;
  finally
    ttStr.free;
    ttStrSat.Free;
  end;
end;

end.
