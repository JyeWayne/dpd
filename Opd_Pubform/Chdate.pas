unit Chdate;

interface

  procedure Between_MonthsDays(start_date,end_date,m_d:String;out months,days:Integer);
  function ADChar(Val, key: string; leng: Integer): string;
  function month_add(daymoth: string; m_count :integer): string;
  function day_add(date: string; m_count :integer): string;
  function MinsDiff_(const sROCDateFrom, sTimeFrom, sROCDateTo, sTimeTo : String) : Integer;
  function date_transform(dt,ac_type :string):string;
  function dateformat(dt,sSeparator :string;item, out_type : integer):string;
  function Timeformat(pTime: TDateTime; item: Integer): string;
  function dttostr(dt :TDateTime):string;
  function get_age(birth_date, AC_TYPE, OPD_DATE,y_m_d :string):string;

  function CountMonths: Integer;
  function datethan(A_Str: string; B_Str: string): Boolean;
  function datetCompare(A_Str: string; B_Str: string): integer;
  function dateadd(DateStr: string; add_time: Integer): string;
  function NowDate(): string;
  function NowDates(): string;
  function NowTime(): string;
  function NowTimes(): string;
  function preg_hia_date(seq: Integer): string;
  function preg_again(max_date: string; seq: Integer): string;
  function date_addmonth(date1, add_month: string): string;
  function between_date(date1, date2: string): string;
  function between_days(cdate: string): Integer;
  function age(Kind, ac_type, opd_Date, birth_date: string): string;
  function dateadd_months(moths : integer):string;
  function f_SQL_date_trans(columnName,dateS,dateE:string):string;
  
var
  
  hundred_year : Boolean;
  ExpCheck: Boolean;
  XRayCheck: Boolean;
  Checkcheck: Boolean;
  
implementation

uses Sysutils, Dialogs,  DBTables, Controls, DBDM, ADODB, Classes, Global ;

function f_SQL_date_trans(columnName,dateS,dateE:string):string;
var
  mid_date :TDateTime;
  ls_sql,ls_last_date ,ls_first_date,ls_dateS,ls_dateE:string;
  ls_dateS6,ls_dateE6,ls_dateS7,ls_dateE7:string;

  function turn_date_6T7(Const iDate:string):string;
  var 
    ls_year:string;
    li_len,i:integer;
  begin
    ls_year := TRIM(iDate);
    li_len := length(ls_year);
    While li_len <  7 Do 
    Begin
      ls_year := '0'+ls_year;
      li_len := li_len+1;
    END;
    Result := ls_year;
  end;

  function turn_date_7T6(Const iDate:string):string;
  var ls_i,ls_year:string;
  begin
      ls_year := stringreplace(iDate,'/','',[rfReplaceAll, rfIgnoreCase]);
      ls_i := Copy(iDate,1,1);
      IF ls_i = '0' THEN ls_year := Copy(ls_year,2,6);
      Result := ls_year;
  end;
begin
    ls_sql := '';
    ls_dateS6 := turn_date_7T6(dateS);
    ls_dateE6 := turn_date_7T6(dateE);
    ls_dateS7 := turn_date_6T7(dateS);
    ls_dateE7 := turn_date_6T7(dateE);

    try
        If (ls_dateS7 = ls_dateE7) Then Begin
           ls_sql := '(('+columnName+'='+QuotedStr(ls_dateS6)+') or ('+columnName+'='+QuotedStr(ls_dateS7)+'))';
        End
        Else If (Copy(ls_dateS7,1,1)='0' ) and (Copy(ls_dateE7,1,1)<>'0') Then Begin
            ls_sql := '(('+columnName +' between '+ QuotedStr(ls_dateS6) +' and '+ QuotedStr('991231')+ ' and length(trim('+ columnName+'))=6 )';
            ls_sql := ls_sql + ' or ('+columnName +' between '+ QuotedStr(ls_dateS7) +' and '+ QuotedStr('0991231')+ ' and length(trim('+ columnName+'))=7 )';
            ls_sql := ls_sql + ' or ('+ columnName + ' between ''1000101'' and ' +  QuotedStr(ls_dateE7)+ ' and length(trim('+ columnName+'))=7))';
        End
        Else Begin
            ls_sql := '((' +columnName +' between '+ QuotedStr(ls_dateS6) +' and '+ QuotedStr(ls_dateE6)+ ' and length(trim('+ columnName+'))=6 )';
            ls_sql := ls_sql + ' or (' + columnName +' between '+ QuotedStr(ls_dateS7) +' and '+ QuotedStr(ls_dateE7)+ ' and length(trim('+ columnName+'))=7 ))';
        End;
    finally
        Result := ls_sql;
    end;
end;



function get_age(birth_date, AC_TYPE, OPD_DATE,y_m_d :string):string;
var
  months,days : integer;
begin
  Between_MonthsDays(date_transform(Trim(birth_date),AC_TYPE),date_transform(OPD_DATE,'+'),'d',months,days);
  if days > 0 then
    months := months + 1;
  if UpperCase(y_m_d) = 'Y' then
  begin
    if (months mod 12) <> 0 then
      Result := IntToStr((months div 12)+1)+'歲'
    else
      Result := IntToStr(months div 12)+'歲';
  end
  else if UpperCase(y_m_d) = 'M' then
  begin
    if (months mod 12) <> 0 then
      Result := IntToStr((months div 12))+'歲'+IntToStr((months mod 12))+'月'
    else
      Result := IntToStr(months div 12)+'歲';
  end  
  else if UpperCase(y_m_d) = 'D' then
  begin
    if days > 0 then
      months := months - 1;
    if (months mod 12) <> 0 then
    begin
      if days > 0 then
        Result := IntToStr((months div 12))+'歲'+IntToStr((months mod 12))+'月'+ IntToStr(days)+'日'
      else
        Result := IntToStr((months div 12))+'歲'+IntToStr((months mod 12))+'月';
    end
    else
      if days > 0 then
        Result := IntToStr(months div 12)+'歲'+ IntToStr(days)+'日'
      else
        Result := IntToStr(months div 12)+'歲'; 
  end
  else if UpperCase(y_m_d) = '1' then
  begin
    if (months mod 12) <> 0 then
      Result := IntToStr((months div 12))+'_'+IntToStr((months mod 12))
    else
      Result := IntToStr(months div 12)+'_0';
  end
  else if UpperCase(y_m_d) = '2' then
  begin
    if (months mod 12) <> 0 then
      Result := IntToStr((months div 12)+1)
    else
      Result := IntToStr(months div 12);
  end;
end;

procedure Between_MonthsDays(start_date,end_date,m_d:String;out months,days:Integer);
var
    year1,month1,day1,year2,month2,day2:integer;
begin
    months:=0;
    days:=0;
    if end_date > start_date then
    begin
        year1:=StrToInt(copy(start_date,1,4));
        month1:=StrToInt(copy(start_date,5,2));
        day1:=StrToInt(copy(start_date,7,2));
        year2:=StrToInt(copy(end_date,1,4));
        month2:=StrToInt(copy(end_date,5,2));
        day2:=StrToInt(copy(end_date,7,2));
        if m_d = 'd' then
        begin
            months:=(year2-year1)*12+month2-month1;

            days:=day2-day1;
            if days < 0 then
            begin
                months:=months-1;
                days:=(MonthDays[IsLeapYear(year1),month1]+day2-day1)+1;
            end
            else
        end
        else
        begin
            months:=(year2-year1)*12+month2-month1;
            days:=0;
        end;
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

function day_add(date: string; m_count :integer): string;
var
  temp_datetime : TDateTime;
begin
  date := dateformat(date,'/',1,0);
  temp_datetime := StrToDateTime(date);
  result := FormatDateTime('YYYYMMDD',temp_datetime+m_count);
end;

function month_add(daymoth: string; m_count :integer): string;
var
  temp_datetime : TDateTime;
begin
  daymoth := dateformat(daymoth,'/',1,0);
  temp_datetime := StrToDateTime(daymoth);
  result := FormatDateTime('YYYYMMDD',IncMonth(temp_datetime,m_count));
end;

function dateformat(dt,sSeparator :string;item, out_type : integer):string;
var
  s,Year, Month, Day: string;
begin
  Year  := COPY(DT,1,LENGTH(DT)-4);
  if out_type = 1 then
    Year  := IntToStr(StrToInt(Year)-1911);
  if hundred_year then //百年民國年補0
    Year := ADChar(year,'0',3);    
  Month := COPY(DT,LENGTH(DT)-3,2);
  Day   := COPY(DT,LENGTH(DT)-1,2); 
  s := sSeparator;
  case item of
    0:
      Result := Format('%s%s%s', [Year, Month, Day]);
    1:
      Result := Format('%s%s%s%s%s', [Year, s, Month, s, Day]);
    2:
      Result := Year;
    3:
      Result := Format('%s%s%s%s%s%s', [Year, '年', Month, '月', Day, '日']);
    4:
      Result := Format('%s%s', [Year, Month]);      
  end;
end;

function Timeformat(pTime: TDateTime; item: Integer): string;
var 
  Hour, Min, Sec, Msec: Word;
  s: Char;
begin
  DecodeTime(pTime, Hour, Min, Sec, MSec);
  s := ':';
  case item of
    0:
      Result := Format('%.2d%.2d%', [Hour, Min]);
    1:
      Result := Format('%.2d%s%.2d', [Hour, s, Min]);
    2:
      Result := Format('%.2d%s%.2d%s', [Hour, '時', Min, '分']);
    3:
    begin
      if (Hour - 1) > 0 then
        Result := Format('%.2d%.2d%', [Hour - 1, Min])
      else
      begin
        Result := Format('%.2d%.2d%', [Hour, 0]);
      end;
    end;
  
    4:
      Result := Format('%.2d%s%.2d%s%.2d', [Hour - 1, s, Min, s, Sec]);
    5:
      Result := Format('%.2d%s%.2d%s%.2d', [Hour, s, Min, s, Sec]);
    6:
      Result := Format('%.2d%.2d%.2d', [Hour, Min, Sec]);    
  end;
end;  

function date_transform(dt,ac_type :string):string;
var
  y : string;
begin
  Result := '';

  if ac_type = '-' then
  begin
    y := IntToStr(1912-StrToInt(copy(dt,1,LENGTH(dt)-4)));
    y := y+copy(dt,LENGTH(dt)-3,4);
  end
  else
  begin
    y := IntToStr(StrToInt(copy(dt,1,LENGTH(dt)-4))+1911);
    y := y+copy(dt,LENGTH(dt)-3,4);
  end;

  Result := y;
end;

function MinsDiff_(const sROCDateFrom, sTimeFrom,
  sROCDateTo, sTimeTo : String) : Integer;
var
  dt : TDateTime;
  tm : TDateTime;
  dtStart, dtEnd : TDateTime;
  wHour, wMinute, wSecond, wMSec : Word;
  sTheDateFrom, sTheTimeFrom, sTheDateTo, sTheTimeTo: String;
begin
  sTheDateFrom:= sROCDateFrom;
  sTheTimeFrom:= sTimeFrom;
  sTheDateTo:= sROCDateTo;
  sTheTimeTo:= sTimeTo;
  if (sTheDateFrom + sTheTimeFrom) > (sTheDateTo + sTheTimeTo) then
  begin
    sTheDateFrom:= sROCDateTo;
    sTheTimeFrom:= sTimeTo;
    sTheDateTo:= sROCDateFrom;
    sTheTimeTo:= sTimeFrom;
  end;
  Result := 0;
  if Length(trim(sTheDateFrom))= 6 then
    dt := StrToDate(dateformat(sTheDateFrom,'/',1,0))
  else
    dt := StrToDate(dateformat(sTheDateFrom,'/',1,0));
  wHour := StrToInt(Copy(sTheTimeFrom, 1, 2));
  wMinute := StrToInt(Copy(sTheTimeFrom, 3, 2));
  wSecond := 0;
  tm := EncodeTime(wHour, wMinute, wSecond, 000);
  dtStart := dt + tm;
  if Length(trim(sTheDateTo))= 6 then
    dt := StrToDate(dateformat(sTheDateTo,'/',1,0))
  else
    dt := StrToDate(dateformat(sTheDateTo,'/',1,0));
  wHour := StrToInt(Copy(sTheTimeTo, 1, 2));
  wMinute := StrToInt(Copy(sTheTimeTo, 3, 2));
  wSecond := 0;
  tm := EncodeTime(wHour, wMinute, wSecond, 000);
  dtEnd := dt + tm;
  DecodeTime(dtEnd - dtStart, wHour, wMinute, wSecond, wMSec);
  Result := wMinute + (wHour * 60);
  if (dtEnd - dtStart) >= 1 then
    Result:= Result + (Trunc(dtEnd - dtStart) * 24 * 60);
end;

function dttostr(dt :TDateTime):string;
begin
  Result := FormatDateTime('YYYYMMDD',dt);
end;

function CountMonths: Integer;
var
  d1, d2: TDatetime;
  YYYY, MM, DD: Word;
  d1a, d2a, d1b, d2b: string;
  Qrys :TADOQuery;
  SQLs :TStrings;
begin
  SQLs:=TStringList.Create;
  SQLs.Text:=' select * from sysdate ';
  DM.OpenSQL(SQLs,Qrys);

  d1a := Trim(Qrys.FieldByName('DATE').AsString);
  d1b := IntToStr(StrToInt(Copy(d1a, 1, length(d1a)-4)) + 1911);
  d1 := StrToDate(d1b + '/' + Copy(d1a, length(d1a)-3, 2) + '/' + Copy(d1a, length(d1a)-1, 2));
  DecodeDate(d1, YYYY, MM, DD);
  d1 := EncodeDate(YYYY, MM, 1);

  d2a := getBirthDate;
  d2b := IntToStr(StrToInt(Copy(d2a, 1, length(d2a)-4)) + 1911);
  d2 := StrToDate(d2b + '/' + Copy(d2a, length(d2a)-3, 2) + '/' + Copy(d2a, length(d2a)-1, 2));
  DecodeDate(d2, YYYY, MM, DD);
  d2 := EncodeDate(YYYY, MM, 1);

  Result := 0;

  while (IncMonth(Trunc(d2), Result)) <> Trunc(d1) do
    Inc(Result);

  SQLs.Free;
end;

function datethan(A_Str: string; B_Str: string): Boolean;
var
  A_DateTime, B_DateTime: TDatetime;
begin
  try
    if Length(A_Str) < 7 then
      A_Str := '0' + A_Str;
    A_Str := IntToStr(StrToInt(copy(trim(A_Str),1,length(trim(A_Str))-4)) + 1911) + copy(trim(A_Str),length(trim(A_Str))-3,4);
    A_Str := copy(trim(A_Str),1,length(trim(A_Str))-4) + '/' + copy(trim(A_Str),length(trim(A_Str))-3,2) + '/' + copy(trim(A_Str),length(trim(A_Str))-1,2);
    A_DateTime := StrToDateTime(A_Str);

    if Length(B_Str) < 7 then
      B_Str := '0' + B_Str;
    B_Str := IntToStr(StrToInt(copy(trim(B_Str),1,length(trim(B_Str))-4)) + 1911) + copy(trim(B_Str),length(trim(B_Str))-3,4);
    B_Str := copy(trim(B_Str),1,length(trim(B_Str))-4) + '/' + copy(trim(B_Str),length(trim(B_Str))-3,2) + '/' + copy(trim(B_Str),length(trim(B_Str))-1,2);
    B_DateTime := StrToDateTime(B_Str);
  except
    ShowMessage('日期格式錯誤'+ A_Str + ' or ' + B_Str +'或請填寫民國年');
    Abort;
  end;

  if A_DateTime > B_dateTime then
    Result := true
  else
    Result := false;
end;

function datetCompare(A_Str: string; B_Str: string): integer;
var
  A_DateTime, B_DateTime: TDatetime;
begin
  try
    if Length(A_Str) < 7 then
      A_Str := '0' + A_Str;
    A_Str := IntToStr(StrToInt(copy(trim(A_Str),1,length(trim(A_Str))-4)) + 1911) + copy(trim(A_Str),length(trim(A_Str))-3,4);
    A_Str := copy(trim(A_Str),1,length(trim(A_Str))-4) + '/' + copy(trim(A_Str),length(trim(A_Str))-3,2) + '/' + copy(trim(A_Str),length(trim(A_Str))-1,2);
    A_DateTime := StrToDateTime(A_Str);

    if Length(B_Str) < 7 then
      B_Str := '0' + B_Str;
    B_Str := IntToStr(StrToInt(copy(trim(B_Str),1,length(trim(B_Str))-4)) + 1911) + copy(trim(B_Str),length(trim(B_Str))-3,4);
    B_Str := copy(trim(B_Str),1,length(trim(B_Str))-4) + '/' + copy(trim(B_Str),length(trim(B_Str))-3,2) + '/' + copy(trim(B_Str),length(trim(B_Str))-1,2);
    B_DateTime := StrToDateTime(B_Str);
  except
    ShowMessage('日期格式錯誤'+ A_Str + ' or ' + B_Str +'或請填寫民國年');
    Abort;
  end;

  if A_DateTime > B_dateTime then
    Result := 1
  else if A_DateTime = B_dateTime then
    Result := 0
  else 
    Result := -1;
end;


function dateadd(DateStr: string; add_time: Integer): string;
var
  Temp_datetime: TDateTime;
  Temp_String, YearStr, MDStr: string;
begin
  Temp_String := '19110101';
  if Trim(DateStr) <> '' then
  begin
    if Length(DateStr) < 7 then
      DateStr := '0' + DateStr;
    DateStr := IntToStr(StrToInt(copy(trim(DateStr),1,length(trim(DateStr))-4)) + 1911) + copy(trim(DateStr),length(trim(DateStr))-3,4);
    DateStr := copy(trim(DateStr),1,length(trim(DateStr))-4) + '/' + copy(trim(DateStr),length(trim(DateStr))-3,2) + '/' + copy(trim(DateStr),length(trim(DateStr))-1,2);
    Temp_DateTime := StrToDateTime(DateStr);
    DateTimeToString(Temp_String, 'yyyymmdd', Temp_dateTime + add_time);
    YearStr     := IntToStr(StrToInt(Copy(Temp_String, 0, 4)) - 1911);
    MDStr       := Copy(Temp_String, 5, 4);
    Temp_String := YearStr + MDStr;
  end;
  Result := Temp_String;
end;

function NowDate(): string;
var
  NowDateStr, YearStr, MDStr: string;
begin
  DateTimeToString(NowDateStr, 'yyyymmdd', Now);

  YearStr := IntToStr(StrToInt(Copy(NowDateStr, 0, 4)) - 1911);
  MDStr := Copy(NowDateStr, 5, 4);
  NowDateStr := YearStr + MDStr;

  Result := NowDateStr;
end;

function NowDates(): string;
var
  NowDateStr, YearStr, MDStr: string;
begin
  DateTimeToString(NowDateStr, 'yyyymmdd', Now);

  YearStr := IntToStr(StrToInt(Copy(NowDateStr, 0, 4)) - 1911);
  MDStr := Copy(NowDateStr, 5, 4);
  NowDateStr := YearStr + MDStr;
  if Length(NowDateStr) < 7 then
  begin
    Result := '0' + NowDateStr;
  end
  else
  begin
    Result := NowDateStr;
  end;
end;

function NowTime(): string;
var
  NowTimeStr: string;
begin
  DateTimeToString(NowTimeStr, 'hhnn', Now);
  Result := NowTimeStr;
end;

function NowTimes(): string;
var
  NowTimeStr: string;
begin
  DateTimeToString(NowTimeStr, 'hhnnss', Now);
  Result := NowTimeStr;
end;

function preg_hia_date(seq: Integer): string;
var
  sdate: string;
  r_date: string;
begin
  //sdate:=now;
  case seq of
    41:
    begin
      DateTimeToString(sdate, 'yyyymmdd', (Now));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    42:
    begin
      DateTimeToString(sdate, 'yyyymmdd', (Now));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    43:
    begin
      DateTimeToString(sdate, 'yyyymmdd', (Now + 56));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    44:
    begin
      DateTimeToString(sdate, 'yyyymmdd', (Now + 28));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    45:
    begin
      DateTimeToString(sdate, 'yyyymmdd', (Now));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    46:
    begin
      DateTimeToString(sdate, 'yyyymmdd', (Now + 28));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    47:
    begin
      DateTimeToString(sdate, 'yyyymmdd', (Now + 14));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    48:
    begin
      DateTimeToString(sdate, 'yyyymmdd', (Now + 7));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    49:
    begin
      DateTimeToString(sdate, 'yyyymmdd', (Now));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    50:
    begin
      DateTimeToString(sdate, 'yyyymmdd', (Now + 14));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    else
    begin
    end;
  end;
  Result := r_date;
end;

function preg_again(max_date: string; seq: Integer): string;
var
  sdate: string;
  r_date: string;
  t: tdatetime;
  y, m, d: Integer;
  we: Integer;
begin
  max_date := IntToStr(StrToInt(max_date) + 19110000);

  y := StrToInt(Copy(max_date, 1, 4));
  m := StrToInt(Copy(max_date, 5, 2));
  d := StrToInt(Copy(max_date, 7, 2));
  t := EncodeDate(y, m, d);

  case seq of
    41:
    begin
      we := 196;
      DateTimeToString(sdate, 'yyyymmdd', (t + we));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    42:
    begin
      we := 147;
      DateTimeToString(sdate, 'yyyymmdd', (t + we));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    43:
    begin
      we := 112;
      DateTimeToString(sdate, 'yyyymmdd', (t + we));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    44:
    begin
      we := 84;
      DateTimeToString(sdate, 'yyyymmdd', (t + we));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    45:
    begin
      we := 56;
      DateTimeToString(sdate, 'yyyymmdd', (t + we));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    46:
    begin
      we := 42;
      DateTimeToString(sdate, 'yyyymmdd', (t + we));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    47:
    begin
      we := 28;
      DateTimeToString(sdate, 'yyyymmdd', (t + we));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    48:
    begin
      we := 21;
      DateTimeToString(sdate, 'yyyymmdd', (t + we));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    49:
    begin
      we := 14;
      DateTimeToString(sdate, 'yyyymmdd', (t + we));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    50:
    begin
      we := 7;
      DateTimeToString(sdate, 'yyyymmdd', (t + we));
      r_date := IntToStr(StrToInt(sdate) - 19110000);
    end;
    else
    begin
    end;
  end;
  Result := r_date;
end;

function between_date(date1, date2: string): string;
var
  date_query: Tquery;
  month: string;
  d1, d2: string;
begin
  d1 := Copy(IntToStr((StrToInt(date1) + 19110000)), 1, 4) + Copy(IntToStr((StrToInt(date1) + 19110000)), 5, 2) + Copy(IntToStr((StrToInt(date1) + 19110000)), 7, 2);
  d2 := Copy(IntToStr((StrToInt(date2) + 19110000)), 1, 4) + Copy(IntToStr((StrToInt(date2) + 19110000)), 5, 2) + Copy(IntToStr((StrToInt(date2) + 19110000)), 7, 2);
  try
    begin
      date_query := Tquery.Create(nil);
      date_query.DatabaseName := 'HIS';
      date_query.Close;
      date_query.SQL.Clear;
      date_query.SQL.Add('select months_between(to_date(' + QuotedStr(d1) + ',''yyyymmdd'') , to_date(' + QuotedStr(d2) + ',''yyyymmdd'')) as month from dual');
      date_query.Open;
      month := date_query.FieldByName('month').AsString;
      date_query.Close
    end;
  finally
    date_query.Free;
  end;
  Result := Copy(month, 1, 4);
end;

function date_addmonth(date1, add_month: string): string;
var
  date_query: Tquery;
  new_Date: Tdatetime;
  return_date: string;
begin
  try
    begin
      date_query := Tquery.Create(nil);
      date_query.DatabaseName := 'HIS';
      date_query.Close;
      date_query.SQL.Clear;
      date_query.SQL.Add('select add_months(to_Date(to_char(to_number(' + QuotedStr(date1) + ')+19110000),''yyyymmdd''),' + QuotedStr(add_month) + ') as new_Date from dual');
      date_query.Open;
      new_Date := date_query.FieldByName('new_Date').AsDateTime;
      date_query.Close;
      DateTimeToString(return_date, 'yyyymmdd', new_Date);
      return_date := IntToStr(StrToInt(return_date) - 19110000);  
    end
  finally                 
    date_query.Free;
  end;

  Result := return_date;
end;


function between_days(cdate: string): Integer;
var
  sdate: tdate;
  n : integer;
  d_year, d_mon, d_date, d_str : string;
begin
  Result := 0;
  n := 0;
  d_year := IntToStr(StrToInt(copy(trim(cdate),1,length(trim(cdate))-4))+1911);
  d_mon := copy(trim(cdate),length(trim(cdate))-3,2);
  d_date := copy(trim(cdate),length(trim(cdate))-1,2);
  if Copy(d_mon, 1, 1) = '0' then
  begin
    d_mon := Copy(d_mon, 2, 1);
  end;
  if Copy(d_date, 1, 1) = '0' then
  begin
    d_date := Copy(d_date, 2, 1);
  end;

  d_str := d_year + '/' + d_mon + '/' + d_date;
  sdate := Date;
  repeat
    sdate := sdate - 1;
    n := n + 1;
  until DateToStr(sdate) = d_str;
  Result := n;
end;


function age(Kind, ac_type, opd_Date, birth_date: string): string; 
var
  age_query: Tquery;
begin
  if birth_Date = '' then
  begin
    birth_Date := opd_Date;
  end;
  if ac_type = '-' then
  begin
    birth_date := IntToStr(1912 - StrToInt(Copy(birth_date, 1, Length(birth_date) - 4))) + Copy(birth_date, Length(birth_date) - 3, 4);
  end
  else
  begin
    birth_date := IntToStr(StrToInt(birth_date) + 19110000);
  end;
  try
    begin
      age_query := Tquery.Create(nil);
      age_query.DatabaseName := 'HIS';
      age_query.Close;
      age_query.SQL.Clear;
      age_query.SQL.Add(' select ');
      if StrToInt(kind) > 4 then
      begin
        age_query.SQL.Add(' months_between');
      end
      else
      begin
        age_query.SQL.Add(' round(months_between');
      end;
      age_query.SQL.Add('(');
      age_query.SQL.Add('to_date(to_char(to_number(substr(' + QuotedStr(opd_Date) + ',1,7))+19110000),''yyyymmdd''),');
      age_query.SQL.Add('to_date(to_char(' + QuotedStr(birth_date) + '),''yyyymmdd'')');
      if StrToInt(kind) > 4 then
      begin
        age_query.SQL.Add(') age from dual');
      end
      else
      begin
        age_query.SQL.Add(')/12,' + Kind + ') age from dual');
      end;
      age_query.Open;
      Result := age_query.FieldByName('age').AsString;
      age_query.Close;
    end
  finally
    age_query.Free;
  end;
end;

function dateadd_months(moths : integer):string; 
var
  Qrys :TADOQuery;
  SQLs :TStrings;
begin
  SQLs:=TStringList.Create;
  SQLs.Text:=' select TO_NUMBER (to_char(add_months(sysdate,'+IntToStr(moths)+'),''YYYYMMDD''))-19110000 as da from dual ';
  Result:='';
  if DM.OpenSQL(SQLs,Qrys) then
  begin
    Result := Qrys.FieldByName('da').AsString;
  end;
  SQLs.Free;     
end;

end.
