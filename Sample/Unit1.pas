unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    mmIcerik: TMemo;
    label2: TLabel;
    Label3: TLabel;
    cbEncoding: TComboBox;
    cbQuietZone: TComboBox;
    Button1: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
   uses untqrCode;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
yol:string;
tempDos_:string;
FileName:string;
Data:string;
Encoding:integer;
QuietZone:integer;
begin
 tempDos_:='tmpQrCode_Images';
 FileName:='qrCode_Deneme';
 Data:=mmIcerik.Lines.Text;
 Encoding:=cbEncoding.ItemIndex;
 QuietZone:=cbQuietZone.ItemIndex+1;
 yol:=QrCode_Create(tempDos_,FileName,Data,Encoding,QuietZone);
 Image1.Picture.LoadFromFile(yol);

end;

end.
