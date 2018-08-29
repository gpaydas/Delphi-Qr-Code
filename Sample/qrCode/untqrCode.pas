unit untqrCode;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DelphiZXingQRCode, StdCtrls, ExtCtrls;
const
//************* ENCODING Yani Değerin alacağı İfade Sayısal mı Sözel mi, UTF8 Destekli mi gibi
Oto=0; //Auto
Sayisal=1; //Numeric
SayisalSozel=2; //Alphanumeric
ISO=2; //ISO-8859-1
UTF8=3; //UTF-8 without BOM
UTF8W=4;//UTF-8 with BOM
//************* ENCODING
//************* QuietZon Optimal okunabilirliğe ulaşmak için QR Kod etrafında bırakılması gereken boş alan
QuietZone1=1;
QuietZone2=2;
QuietZone3=3;
QuietZone4=4;
QuietZone5=5;
QuietZone6=6;
QuietZone7=7;
QuietZone8=8;
QuietZone9=9;
QuietZone10=10;
//*******************
//*********************
tempDos='tmpqrCode';

function EnG_Cevir(s:string):string;
Function QrCode_Create(tempDos_:string=tempDos;FileName:string='';Data:string='';Encoding:integer=UTF8;QuietZone:integer=QuietZone4):string;
Function Klasor_Kontrol(Yol:string):Boolean;
Function Klasor_Olustur(Yol:string):Boolean;
Function Save_file(dosya:TBitmap;Yol:string;FileName:string):string;
function generate(cantidad: integer): string;
implementation

function generate(cantidad: integer): string;
const
  letras_mi = 'abcdefghijklmnopqrstuvwxyz';
  letras_ma = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  numeros = '0123456789';
begin
  Result := '';
  Result := Result + letras_mi[Random(Length(letras_mi)) + 1];
  Result := Result + letras_ma[Random(Length(letras_ma)) + 1];
  Result := Result + numeros[Random(Length(numeros)) + 1];
  Result := Result + letras_ma[Random(Length(letras_ma)) + 1];
  Result := Result + letras_mi[Random(Length(letras_mi)) + 1];
  Result := Result + '_';
  Result := Result + letras_mi[Random(Length(letras_mi)) + 1];
  Result := Result + letras_ma[Random(Length(letras_ma)) + 1];
  Result := Result + numeros[Random(Length(numeros)) + 1];
  Result := Result + letras_ma[Random(Length(letras_ma)) + 1];
  Result := Result + letras_mi[Random(Length(letras_mi)) + 1];
end;

Function Klasor_Kontrol(Yol:string):Boolean;
begin
  if Not DirectoryExists(Yol) then
  begin
   Result:=Klasor_Olustur(Yol);
  end
  else
  begin
    Result:=True;
  end;
end;

Function Klasor_Olustur(Yol:string):Boolean;
begin
  try
  CreateDir(Yol) ;
  Result:=True;
  except
   Result:=False;
  end;
end;

Function Save_file(dosya:TBitmap;Yol:string;FileName:string):string;
begin
  if Klasor_Kontrol(Yol)=False then
  begin
    Result:='';
  end
  else
  begin
  Yol:=Yol+'\'+FileName+'.bmp';
  result:=Yol;
  end;
end;

Function QrCode_Create(tempDos_:string=tempDos;FileName:string='';Data:string='';Encoding:integer=UTF8;QuietZone:integer=QuietZone4):string;
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
  QRCodeBitmap:TBitmap;
  SaveFile:string;
  str:TStringList;
  stryol:string;
begin
  str:=TStringList.Create;
  QRCode := TDelphiZXingQRCode.Create;
  QRCodeBitmap := TBitmap.Create;

  if trim(FileName)='' then
  begin
    FileName:=generate(Random(1000)+1);
  end;

  try
    Data:=EnG_Cevir(Data); //İngilizce Karaktere Çevirme
    str.Text:=Data;
    QRCode.Data := Data;
    QRCode.Encoding := TQRCodeEncoding(Encoding);
    QRCode.QuietZone := QuietZone;
    QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
        end else
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
    SaveFile:=ExtractFilePath(Application.ExeName)+tempDos;
    stryol:=SaveFile+'\';
//    showmessage(SaveFile);
    SaveFile:=Save_file(QRCodeBitmap,SaveFile,FileName);
//    Showmessage(SaveFile);

    QRCodeBitmap.SaveToFile(SaveFile);
    str.SaveToFile(stryol+'Son_QRCode_icerik.txt');
    Result:=SaveFile;
  except
    QRCode.Free;
    str.Free;
    QRCodeBitmap.Free;
    Result:='';
  end;
  try
  QRCode.Free;
  QRCodeBitmap.Free;
  str.Free;
  except
  end;
end;

function EnG_Cevir(s:string):string;
 const
   list1:string='İĞÜŞÖÇöçşğüı';
   list2:string='IGUSOCocsgui';
 var
  j:byte;
 begin
    for j:=1 to length(list1) do
     while pos(list1[j],s)>0 do
       s[pos(list1[j],s)]:=list2[j];
    result:=s;
end;

end.
