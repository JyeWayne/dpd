unit frm_calenderUnit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids;

type
  Tfrm_calendar = class(TForm)
    SG_Month: TStringGrid;
    Panel3: TPanel;
    lbl_y: TLabel;
    lbl_y_n: TLabel;
    lbl_m_n: TLabel;
    lbl_m: TLabel;
    btn_premonth: TButton;
    btn_nextmonth: TButton;
    p_menu: TPanel;
    img_close: TImage;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img_closeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SG_MonthDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btn_premonthClick(Sender: TObject);
    procedure btn_nextmonthClick(Sender: TObject);
    procedure SG_MonthDblClick(Sender: TObject);
    procedure SG_MonthSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    mouse_x,mouse_y:integer;
    mouse_flag:boolean;
    day:string;
    type_flag:string;
    OneDate : String;
    MyDate : TDateTime;
    procedure move_form(x,y:integer);
    procedure FrmTransparent(Handle,Flag:integer);
    procedure SetDete(TT: TStringGrid; TempDate: TDateTime; IKey: Integer);
    function ADChar(Val, key: string; leng: Integer): string;
  end;

  function SetLayeredWindowAttributes(hwnd:HWND; crKey:Longint; bAlpha:byte; dwFlags:longint ):longint; stdcall; external user32;

const
    WS_EX_LAYERED=$80000;
    LWA_ALPHA=$2;

var
  frm_calendar : Tfrm_calendar;
implementation


{$R *.DFM}

procedure Tfrm_calendar.SetDete(TT: TStringGrid; TempDate: TDateTime; IKey: Integer);
var
  i,l,j: Integer;
  date1,date2: String;
  yy,mm,dd,days : Word;
begin    
    days:=0;
    for i := 1 to TT.RowCount -1 do
      TT.Rows[i].Clear;
    DecodeDate(TempDate, yy, mm, dd);

    if IKey > 0 then
      if (mm + IKey) > 12 then
        TempDate := EnCodedate(yy+1,(mm + IKey) - 12,1)
      else
        TempDate := EnCodedate(yy,mm+Ikey,1)
    else
      if (mm + IKey) < 1 then
        TempDate := EnCodedate(yy-1,12,1)
      else
        TempDate := EnCodedate(yy,mm+Ikey,1);

    DecodeDate(TempDate, yy, mm, dd);
    i := 1;
    j := DayOfWeek(TempDate)-1;  

    if mm > 9 then
    begin
      date1:= IntToStr(yy)+'/'+IntToStr(mm)+'/'+'01';
      if mm = 12 then
          date2:= IntToStr(yy+1)+'/01/'+'01'
      else
          date2:= IntToStr(yy)+'/'+IntToStr(mm+1)+'/'+'01';
    end
    else
    begin
      date1:= IntToStr(yy)+'/'+'0'+IntToStr(mm)+'/'+'01';
      date2:= IntToStr(yy)+'/'+'0'+IntToStr(mm+1)+'/'+'01';
    end;

    ShortDateFormat := 'YYYY/MM/DD';
    days := trunc(StrToDate(date2) - StrToDate(date1));

    for l := DayOfWeek(TempDate) to 41 do
    begin
      try
        DecodeDate(TempDate, yy, mm, dd);
        if J <6 then
        begin
          TT.Cells[j,i] := IntToStr(dd);
          Inc(j);
        end
        else
        begin
          TT.Cells[j,i] := IntToStr(dd);
          Inc(i);
          j:=0;
        end;
        if dd >= days then
          exit
        else
          TempDate := EnCodedate(yy,mm,dd+1);

      except
        break;
      end;
    end;

end;

procedure Tfrm_calendar.FrmTransparent(Handle,Flag:integer);
var
    l:integer;
begin
    if flag=0 then
    begin
        l:=getWindowLong(Handle, GWL_EXSTYLE);
        l:= l Or WS_EX_LAYERED;
        SetWindowLong (Handle, GWL_EXSTYLE, l);
        SetLayeredWindowAttributes(Handle, 0, 180, LWA_ALPHA);
    end
    else
    begin
        l:=getWindowLong(Handle, GWL_EXSTYLE);
        l:= l Or WS_EX_LAYERED;
        SetWindowLong (Handle, GWL_EXSTYLE, l);
        SetLayeredWindowAttributes(Handle, 0, 255, LWA_ALPHA);
    end;
end;

function Tfrm_calendar.ADChar(Val, key: string; leng: Integer): string;
var
  i: Integer;
begin
  for i := 1 to leng - Length(Val) do
    Val := key + Val;
  Result := Val;
end;

procedure Tfrm_calendar.FormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    mouse_x:=X;
    mouse_y:=Y;
    mouse_flag:=true;
end;

procedure Tfrm_calendar.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    if mouse_flag then
    begin
        FrmTransparent(Handle,0);
        move_form(X-mouse_x,Y-mouse_y);
    end;
end;

procedure Tfrm_calendar.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    mouse_flag:=false;
    FrmTransparent(Handle,1);
end;

procedure Tfrm_calendar.move_form(x,y:integer);
begin
    self.Top := self.Top + y;
    self.Left := self.Left + X;
end;

procedure Tfrm_calendar.img_closeClick(Sender: TObject);
begin
    self.Close;
end;

procedure Tfrm_calendar.FormShow(Sender: TObject);
var
    yy,mm,dd : Word;
begin
    DecodeDate(Now, yy, mm, dd);
    MyDate := EnCodedate(yy,mm,1);
    lbl_y.Caption :=IntToStr(yy);
    lbl_m.Caption :=AdChar(IntToStr(mm),'0',2);
    lbl_y.Caption :=IntToStr(yy);
    lbl_m.Caption :=AdChar(IntToStr(mm),'0',2);
    With SG_Month do
    begin
      Cells[0,0] := '星期日';
      Cells[1,0] := '星期一';
      Cells[2,0] := '星期二';
      Cells[3,0] := '星期三';
      Cells[4,0] := '星期四';
      Cells[5,0] := '星期五';
      Cells[6,0] := '星期六';
    end;
    SetDete(SG_Month,MyDate,0);
end;

procedure Tfrm_calendar.SG_MonthDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
    
    if ARow =0 then
      Exit;
    if TStringGrid(Sender).Cells[ACol, ARow]='' then
      Exit
    else
    begin
      if aCol = 0 then
        TStringGrid(Sender).Canvas.Font.Color := clred
      else if aCol = 6 then
        TStringGrid(Sender).Canvas.Font.Color := ClLime
      else
        TStringGrid(Sender).Canvas.Font.Color := clBlack;

      if TStringGrid(Sender).Canvas.Brush.Color = clWindow then
              TStringGrid(Sender).Canvas.Brush.Color :=$00AAFFFF;
    end;
    TStringGrid(Sender).Canvas.FillRect(Rect);
    TStringGrid(Sender).Canvas.TextOut(Rect.Left + 1, Rect.Top + 1 ,TStringGrid(Sender).Cells[ACol,ARow]);
end;

procedure Tfrm_calendar.btn_premonthClick(Sender: TObject);
var
    yy1, mm1, dd1: Word;
begin
    SetDete(SG_Month,MyDate,-1);
    DecodeDate(MyDate, yy1, mm1, dd1);
    if mm1 = 1 then
    begin
        MyDate := EnCodedate(yy1-1,12,1);
        lbl_y.Caption :=IntToStr(yy1-1);
        lbl_m.Caption :=AdChar(IntToStr(12),'0',2);
    end
    else
    begin
        MyDate := EnCodedate(yy1,mm1-1,1);
        lbl_y.Caption :=IntToStr(yy1);
        lbl_m.Caption :=AdChar(IntToStr(mm1-1),'0',2);
    end;        
end;

procedure Tfrm_calendar.btn_nextmonthClick(Sender: TObject);
var
    yy1,mm1,dd1 : Word;
begin
    SetDete(SG_Month,MyDate,1);
    DecodeDate(MyDate, yy1, mm1, dd1);
    if mm1 = 12 then
    begin
        MyDate := EnCodedate(yy1+1,1,1);
        lbl_y.Caption :=IntToStr(yy1+1);
        lbl_m.Caption :=AdChar(IntToStr(1),'0',2);
    end
    else
    begin
        MyDate := EnCodedate(yy1,mm1+1,1);
        lbl_y.Caption :=IntToStr(yy1);
        lbl_m.Caption :=AdChar(IntToStr(mm1+1),'0',2);
    end;
end;

procedure Tfrm_calendar.SG_MonthDblClick(Sender: TObject);
begin

    if day <> '' then
    begin
      if type_flag = '0' then
          OneDate:=IntToStr(StrToInt(lbl_y.Caption)-1911)+'/'+lbl_m.Caption+'/'+AdChar(day,'0',2)
      else if type_flag = '1' then
          OneDate:=lbl_y.Caption+'/'+lbl_m.Caption+'/'+AdChar(day,'0',2)
      else if type_flag = '2' then
          OneDate:=IntToStr(StrToInt(lbl_y.Caption)-1911)+lbl_m.Caption+AdChar(day,'0',2)
      else if type_flag = '3' then
          OneDate:=lbl_y.Caption+lbl_m.Caption+AdChar(day,'0',2);
    end;
    self.Close;
end;

procedure Tfrm_calendar.SG_MonthSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    day:=TStringGrid(Sender).Cells[ACol,ARow];
end;

end.
