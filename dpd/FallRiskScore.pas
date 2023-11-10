unit FallRiskScore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmFallRiskScore = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFallRiskScore: TFrmFallRiskScore;

implementation

uses Order;

{$R *.dfm}

procedure TFrmFallRiskScore.Button2Click(Sender: TObject);
begin
  FrmOrder.sPass := 'Y';
  Close;
end;

procedure TFrmFallRiskScore.Button1Click(Sender: TObject);
begin
  FrmOrder.sPass := 'N';
  Close;
end;

procedure TFrmFallRiskScore.FormShow(Sender: TObject);
begin
  Label5.Top := Label4.Top;
  Label6.Top := Label4.Top;
  Label5.Left := Label4.Left + Label4.Width;
  Label6.Left := Label4.Left + Label4.Width + Label5.Width;
end;

end.
