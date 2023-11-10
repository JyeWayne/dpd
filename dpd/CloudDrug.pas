unit CloudDrug;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, HTTPApp, HTTPProd, ExtCtrls,
  Buttons;

type
  TFrmCloudDrug = class(TForm)
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    Panel1: TPanel;
    button2: TButton;
    Button3: TButton;
    Panel2: TPanel;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCloudDrug: TFrmCloudDrug;

implementation

uses DPDFunc, Global;

{$R *.dfm}

procedure TFrmCloudDrug.FormShow(Sender: TObject);
begin

  //o := WebBrowser1.OleObject.document.item('lst-ib',0);
  //o.value := 'Test';
  //WebBrowser1.OleObject.Document.GetElementByID('.save').Click;
end;

procedure TFrmCloudDrug.Button1Click(Sender: TObject);
var
  o, Edits : OleVariant;
begin
  try
    o := WebBrowser1.OleObject.Document;
    Edits  := o.GetElementByID('username');
    edits.value :='Test';
    Edits  := o.GetElementByID('passwd');
    edits.value :='Test';
  except

  end;


end;

procedure TFrmCloudDrug.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := cafree;
end;

procedure TFrmCloudDrug.Button2Click(Sender: TObject);
var
  o : OleVariant;
begin
  o := WebBrowser1.OleObject.Document;
  try
    WebBrowser1.OleObject.Document.GetElementByID('ContentPlaceHolder1_btnReSrc').Click;
    insert_cloud_log('O');
    //'Y:第一次忘了插卡  P:拒絕插卡  B:補點';
  except
    insert_cloud_log('E');
  end;

end;

procedure TFrmCloudDrug.FormDestroy(Sender: TObject);
begin
  FrmCloudDrug := nil;
end;

procedure TFrmCloudDrug.Button3Click(Sender: TObject);
begin
  //WebBrowser1.Navigate('https://10.253.253.245/imme0000/IMME0002S01.aspx');
  //WebBrowser1.Navigate('https://medcloud.nhi.gov.tw/imme0000/IMME0002S01.aspx');
  IF cloudmedurl <> '' THEN
    FrmCloudDrug.WebBrowser1.Navigate(cloudmedurl)
  ELSE
    WebBrowser1.Navigate('https://medcloud.nhi.gov.tw/imme0008/IMME0008S01.aspx');
  insert_cloud_log('B');
end;

procedure TFrmCloudDrug.SpeedButton1Click(Sender: TObject);
begin
  Self.Hide;
end;

end.
