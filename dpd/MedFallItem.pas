unit MedFallItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmMedFallItem = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnOK: TButton;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMedFallItem: TFrmMedFallItem;

implementation

{$R *.dfm}

procedure TFrmMedFallItem.btnOKClick(Sender: TObject);
begin
  Close;
end;

end.
