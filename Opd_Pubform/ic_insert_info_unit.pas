unit ic_insert_info_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons;

type
  Tic_insert_info_frm = class(TForm)
    ProgressBar1: TProgressBar;
    SpeedButton1: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ic_insert_info_frm: Tic_insert_info_frm;

implementation

{$R *.DFM}

end.
