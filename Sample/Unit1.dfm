object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 335
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 24
    Width = 33
    Height = 13
    Caption = #304#231'erik :'
  end
  object label2: TLabel
    Left = 24
    Top = 184
    Width = 66
    Height = 13
    Caption = 'Kodlama Tipi :'
  end
  object Label3: TLabel
    Left = 16
    Top = 216
    Width = 74
    Height = 13
    Caption = 'Bo'#351'luk Boyutu :'
  end
  object Image1: TImage
    Left = 312
    Top = 21
    Width = 273
    Height = 276
    Stretch = True
  end
  object mmIcerik: TMemo
    Left = 95
    Top = 21
    Width = 185
    Height = 148
    Lines.Strings = (
      'mmIcerik')
    TabOrder = 0
  end
  object cbEncoding: TComboBox
    Left = 95
    Top = 178
    Width = 185
    Height = 21
    TabOrder = 1
    Text = 'cbEncoding'
    Items.Strings = (
      'Oto=0 //Auto'
      'Sayisal=1 //Numeric'
      'SayisalSozel=2 //Alphanumeric'
      'ISO=2 //ISO-8859-1'
      'UTF8=3 //UTF-8 without BOM'
      'UTF8W=4 //UTF-8 with BOM')
  end
  object cbQuietZone: TComboBox
    Left = 96
    Top = 213
    Width = 185
    Height = 21
    TabOrder = 2
    Text = 'cbEncoding'
    Items.Strings = (
      'QuietZone1=1'
      'QuietZone2=2'
      'QuietZone3=3'
      'QuietZone4=4'
      'QuietZone5=5'
      'QuietZone6=6'
      'QuietZone7=7'
      'QuietZone8=8'
      'QuietZone9=9'
      'QuietZone10=10')
  end
  object Button1: TButton
    Left = 168
    Top = 248
    Width = 113
    Height = 49
    Caption = 'Kaydet ve Olu'#351'tur'
    TabOrder = 3
    OnClick = Button1Click
  end
end
