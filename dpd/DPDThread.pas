unit DPDThread;

interface

uses ADODB, Classes, SysUtils, Contnrs, Variants, MaskUtils;

type
  HisFeeThread = class(TThread)
  protected
      procedure Execute; override;
  end;

  ICSEQThread = class(TThread)
  protected
      procedure Execute; override;
  end;

var
  g_HisFeeThread: TThread;
  g_ICSEQThread: TThread;
implementation

uses SqlCenter, Global, DBDM, Order, DateUtils;

procedure ICSEQThread.Execute;
begin
  FrmOrder.fin_get_seq;
end;

procedure HisFeeThread.Execute;
  procedure sql_log(Desc:string);
  var
    filehandle : integer;
    openfileName : TextFile;
    inputdata, ma : string;
  begin

    try
      AssignFile(openfileName, 'd:\DPD_log.txt');
      if FileExists('d:\DPD_log.txt') then
        Append(openfileName)
      else
        Rewrite(openfileName);
      Writeln(openfileName, DateTimeToStr(Now) +' '+ Desc + #9);
      CloseFile(openfileName);
    except

    end;
  end;
var
  date1,date2:String;
  ADate: TDateTime;
  Qrys :TADOQuery;
  tmpSql :String;
  SQLs :TStrings;
begin
    FrmOrder.Pgc_SOA.Enabled:=false;
    FrmOrder.HisFee_Tabst.Caption:='未取得資料';

    //FrmOrder.HisFee_Tabst.Visible:=false;
    //SQLs:=TStringList.Create;
    try
      Qrys:=TADOQUERY.Create(nil);
      Qrys.Connection:=DM.ADOLink;

      tmpSql:=getLoadOrder(7);

      //SetParamter(tmpSql,'$DEPT_CODE$',gsIniDeptCode);
      tmpSql := StringReplace(tmpSql,'$DEPT_CODE$',gsIniDeptCode,[rfReplaceAll]);
      tmpSql := StringReplace(tmpSql, '$OPD_KIND$', gsOpdKind, [rfReplaceAll]);
      SetParamter(tmpSql,'$CHR_NO$',getChrNo);

      //sql_log(tmpSql);

      Qrys.SQL.Text:=tmpSql;
      Qrys.Open;
      if not Qrys.Eof then //DM.OpenSQL(SQLs,Qrys) then
      begin

        sql_log(Qrys.FieldByName('min_date').AsString);
        sql_log(Qrys.FieldByName('max_date').AsString);

        if length(Qrys.FieldByName('min_date').AsString) < 7 then
            FrmOrder.msk_beg_day.Text := '0' + Qrys.FieldByName('min_date').AsString
        else
            FrmOrder.msk_beg_day.Text := Qrys.FieldByName('min_date').AsString;

        if length(Qrys.FieldByName('max_date').AsString) < 7 then
            FrmOrder.msk_end_day.Text := '0' + Qrys.FieldByName('max_date').AsString
        else
            FrmOrder.msk_end_day.Text := Qrys.FieldByName('max_date').AsString;

        date1 := FrmOrder.msk_beg_day.Text;
        date2 := FrmOrder.msk_end_day.Text;
        ADate := StrToDate(FormatMaskText('9999/99/00;0;_',IntToStr(StrToInt(date2)+19110000)));
        if DayOfWeek(ADate)= 7 then
        begin
          //星期日

        end
        else
        begin
          //判斷是否放假日
         { With DM.QrySearch Do Begin
            Close;
            SQL.Clear;
            SQL.Add('select holiday,trim(hl_desc) hl_desc from holiday ');
            if sechtype = 'date' then
              SQL.Add('where holiday = '+QuotedStr(mydate))
            else
              SQL.Add('where holiday like '+QuotedStr(copy(mydate,1,3)+'%'));
            Open;
          End;}
        end;

        //sql_log(date1+'/'+date2);

        tmpSql:=getLoadOrder(6);
        tmpSql:=StringReplace(tmpSql,'$DEPT_CODE$',gsIniDeptCode,[rfReplaceAll]);
        if trim(FrmOrder.card_no2.Text) <> '' then
          SetParamter(tmpSql,'$INS_SEQ_NO$',trim(FrmOrder.card_no2.Text))
        else
          SetParamter(tmpSql,'$INS_SEQ_NO$','');
        SetParamter(tmpSql,'$CHR_NO$',getChrNo);
        SetParamter(tmpSql,'$OPD_DATE1$',date1);
        SetParamter(tmpSql,'$OPD_DATE2$',date2);
        SetParamter(tmpSql,'$OPD_DATE2$',date2);
        tmpSql := StringReplace(tmpSql, '$OPD_KIND$', gsOpdKind, [rfReplaceAll]);

        //sql_log(tmpSql);

        with FrmOrder.QryFeeHis do
        begin
          Close;
          SQL.Clear;
          SQL.Text:=tmpSql;
          Open;
        end;

      end;
      Qrys.Free;
      FrmOrder.Pgc_SOA.Enabled:=true;
      FrmOrder.HisFee_Tabst.Caption:='歷史處置';
      if FileExists('d:\DPD_log.txt') then
        DELETEFILE('d:\DPD_log.txt');
    except
      FrmOrder.Pgc_SOA.Enabled:=true;
      FrmOrder.HisFee_Tabst.Caption:='歷史處置';
      //FrmOrder.HisFee_Tabst.Visible:=true;
    end;
    //SQLs.Free;
end;

end.
