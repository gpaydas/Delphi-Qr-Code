unit untOTLEtiket;

interface

uses
  Windows,
  StrUtils,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  frxExportTXT,
  frxExportMail,
  frxExportCSV,
  frxExportText,
  frxExportImage,
  frxExportRTF,
  frxExportXML,
  frxExportXLS,
  frxExportHTML,
  frxExportPDF,
  frxClass,
  frxDMPExport,
  frxChBox,
  frxGradient,
  frxOLE,
  frxCross,
  frxRich,
  frxBarcode,
  frxDesgn,
  frxDBXComponents,
  frxBDEComponents,
  frxIBXComponents,
  frxDBSet,
  StdCtrls,
  DB,
  ADODB,
  Math,
  Grids,
  DBGrids,
  SUIDBCtrls,
  SUIButton,
  Buttons,
  ExtCtrls,
  untFsReportPre,
  cxControls,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxGraphics,
  cxMaskEdit,
  cxDropDownEdit,
  cxLookupEdit,
  cxDBLookupEdit,
  cxDBLookupComboBox,
  cxButtonEdit,
  cxCalendar,
  cxCheckBox,
  Menus,
  cxLookAndFeelPainters,
  cxButtons,
  cmnDLL,
  ComServ,
  SUIMgr,
  SUIImagePanel,
  SUIGroupBox,
  SUIForm,
  untFrxReportSec, SUIEdit, SUIRadioGroup;

type
  TfrxOTLEtiket = class(TForm)

    suiForm1: TsuiForm;
    pnlRaporSec: TsuiPanel;
    suiThemeManager1: TsuiThemeManager;
    suiFileTheme1: TsuiFileTheme;
    ds1: TDataSource;
    frmFsReportPrev1: TfrmFsReportPrev;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    dsMamulTK: TDataSource;
    dtsMamulTK: TADODataSet;
    frxReport1: TfrxReport;
    dbMamulTk: TfrxDBDataset;
    dtsMamulTKFIRKOD: TStringField;
    dtsMamulTKFIRAD: TStringField;
    dtsMamulTKDOCKNO: TStringField;
    dtsMamulTKSUPPLIERNO: TStringField;
    dtsMamulTKFIRADRES: TStringField;
    dtsMamulTKVERGI_DAIRE: TStringField;
    dtsMamulTKVERGI_NO: TStringField;
    dtsMamulTKTELEFON: TStringField;
    dtsMamulTKIRSALIYENO: TStringField;
    dtsMamulTKTOP_SEVK_MIK: TFloatField;
    dtsMamulTKMLZ_KOD: TStringField;
    dtsMamulTKSVK_TAR: TDateTimeField;
    dtsMamulTKSVK_DELIVERY: TStringField;
    dtsMamulTKPALETNO: TStringField;
    dtsMamulTKMLZ_AD: TStringField;
    dtsMamulTKMLZ_REVNO: TStringField;
    dtsMamulTKMLZ_RESIMNO: TStringField;
    dtsMamulTKAmbMik: TFloatField;
    frxReport2: TfrxReport;
    Panel1: TPanel;
    dtsMamulTKSRNO: TIntegerField;
    dtsMamulTKNET_WEIGHT: TIntegerField;
    dtsMamulTKGROSS_WEIGHT: TIntegerField;
    dtsMamulTKTOPLAM_AMB_ADET: TIntegerField;
    dtsMamulTKPackNo: TStringField;
    dtsMamulTKBARCODE_TOP_SEVK_MIK: TStringField;
    dtsMamulTKMUSTERIKOD: TStringField;
    dtsMamulTKPartiNo: TStringField;
    dtsMamulTKFIRADRES2: TStringField;
    dtsMamulTKFIRADRES3: TStringField;
    dtsMamulTKSevkAdres: TStringField;
    dtsMamulTKFIRADRES4: TStringField;
    dtsMamulTKFIRADRES5: TStringField;
    dtsMamulTKQRCODEYOL: TStringField;
    dtsMamulTKRAN_NO: TStringField;
    dtsMamulTKDataMatrixYol: TStringField;


    procedure frmFsReportPrev1btnKapatClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frmFsReportPrev1btnPrintClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure frmFsReportPrev1btnDesignClick(Sender: TObject);
    procedure frmFsReportPrev1SpeedButton3Click(Sender: TObject);
    procedure frmFsReportPrev1suiButton1Click(Sender: TObject);
    procedure frmFsReportPrev1suiButton2Click(Sender: TObject);
    procedure frmFsReportPrev1suiButton3Click(Sender: TObject);
    procedure btnDegistirClick(Sender: TObject);
  private
    procedure setData;
    { Private declarations }

  public
    _IRSNO:string;
    { Public declarations }
     yazdirkontrol:Boolean;
  end;




procedure getReady(
  selfer: TForm;
  ReportName: string;
  frxReport: TFrxReport;
  frxReportFirst: TFrxReport;
  module: string
  );
procedure RUN(Ac: Byte; ID: rcID); far;

var
  frxOTLEtiket: TfrxOTLEtiket;

implementation

uses untFiltreListeContainer,
  cmnMisc,
  cmnDBPass,
  DateUtils,
  untOzelKod,
  untSevkiyat,untqrCode,untDataMatrixCode;

{$R *.dfm}


function KarakterSize(Canvas: TCanvas): TPoint;
var
  I: Integer;
  Buffer: array[0..51] of Char;
Const
  SMsgDlgOK = 'OK';
begin
  for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;


function HusoInput(const ACaption, APrompt: string;
  var Value: string): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
    try
      Canvas.Font := Font;
      DialogUnits := KarakterSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        Caption := APrompt;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
        WordWrap := True;
      end;
      Edit := TEdit.Create(Form);
      with Edit do
      begin
        Parent := Form;
        Left := Prompt.Left;
        Top := Prompt.Top + Prompt.Height + 5;
        Width := MulDiv(164, DialogUnits.X, 4);
        MaxLength := 255;
        Text := Value;
        PasswordChar := '*';
        SelectAll;
      end;
      ButtonTop := Edit.Top + Edit.Height + 15;
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Tamam';
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Ýptal';
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), Edit.Top + Edit.Height + 15,
          ButtonWidth, ButtonHeight);
        Form.ClientHeight := Top + Height + 13;
      end;
      if ShowModal = mrOk then
      begin
        Value := Edit.Text;
        Result := True;
      end;
    finally
      Form.Free;
    end;
end;

function HusoInputBox(const ACaption, APrompt, ADefault: string): string;
begin
  Result := ADefault;
  HusoInput(ACaption, APrompt, Result);
end;



procedure RUN(Ac: Byte; ID: rcID); far;
begin
  if ((ID.User = '') or (ID.DllPass <> dllPASS)) then
    begin
      DllCanUnloadNow;
      Exit;
    end;
  if (frxOTLEtiket = nil) then
    begin
      cmnDLL.ID := ID;
      wsA := Ac;
      frxOTLEtiket := TfrxOTLEtiket.Create(frxOTLEtiket);
      frxOTLEtiket.Show;
    end
  else
    begin
      frxOTLEtiket.BringToFront;
      DllCanUnloadNow;
    end;
end;

{ TfrxReportSec }

procedure TfrxOTLEtiket.btnDegistirClick(Sender: TObject);
var
InputString:string;
begin
    InputString := HusoInputBox('Þifre','Yöneticinin Þifresini Giriniz:','');
    if InputString=Paroku('YoneticiSifre') then
    begin
    // ParYaz('_Global','VDA_Etiket_Son_No',edEnSonPackNo.Text);
    end;
end;

procedure TfrxOTLEtiket.FormShow(Sender: TObject);
begin
  //edEnSonPackNo.Text:=Paroku('VDA_Etiket_Son_No');
  changeTh(self, suiThemeManager1, suiFileTheme1);
  //setData;
  frmFsReportPrev1.getReady(self,
    self,
    self.Caption,
    frxReport1,
    frxReport2,
    self.Caption,
    '');
end;

procedure TfrxOTLEtiket.frmFsReportPrev1btnDesignClick(Sender: TObject);
begin
  frmFsReportPrev1.btnDesignClick(Sender);
end;

procedure TfrxOTLEtiket.frmFsReportPrev1btnKapatClick(Sender: TObject);
begin
  Close;
end;

procedure TfrxOTLEtiket.frmFsReportPrev1btnPrintClick(Sender: TObject);
var
  myPic: TPicture;
begin
  if (frxReport1.FindComponent('Picture1') is TfrxPictureView) then
    begin
      myPic := GetPicture('Firma Logosu');
      if mypic <> nil then
        begin
          (frxReport1.FindComponent('Picture1') as TfrxPictureView).Picture.Assign(myPic);
          (frxReport1.FindComponent('Picture1') as TfrxPictureView).Visible := true;
        end
      else
        begin
          (frxReport1.FindComponent('Picture1') as TfrxPictureView).Visible := false;
        end;

    end;

  screen.Cursor := crHourGlass;


  setData();
  screen.Cursor := crDefault;
  frmFsReportPrev1.btnPrintClick(Sender);


end;

procedure TfrxOTLEtiket.frmFsReportPrev1SpeedButton3Click(Sender: TObject);
begin
  frmFsReportPrev1.SpeedButton3Click(Sender);

end;

procedure TfrxOTLEtiket.frmFsReportPrev1suiButton1Click(Sender: TObject);
begin
  setData;
  frmFsReportPrev1.suiButton1Click(Sender);

end;

procedure TfrxOTLEtiket.frmFsReportPrev1suiButton2Click(Sender: TObject);
begin
  frmFsReportPrev1.suiButton2Click(Sender);

end;

procedure TfrxOTLEtiket.frmFsReportPrev1suiButton3Click(Sender: TObject);
begin
  frmFsReportPrev1.suiButton3Click(Sender);

end;

procedure TfrxOTLEtiket.Panel1Click(Sender: TObject);
begin
  frxReport1.ShowReport(true);
end;

procedure getReady(selfer: TForm; ReportName: string;
  frxReport: TFrxReport; frxReportFirst: TFrxReport; module: string);
begin
  frxOTLEtiket := TfrxOTLEtiket.Create(selfer);

  frxOTLEtiket.frmFsReportPrev1.getReady(frxReportSec,
    selfer,
    ReportName,
    frxReport,
    frxReportFirst,
    module,
    '');
  frxOTLEtiket.ShowModal;
end;

procedure TfrxOTLEtiket.setData();
var
  qrKontrol,qrMusKod:TADOQuery;
  ToplamGross:Real;
  PartiNo:string;
  _qrCode:string;
  rs,gs,eot:char;
begin
//    try
//    artan:=strtoint(Paroku('VDA_Etiket_Son_No'));
//    except
//    Showmessage('En son Pack No yu Lütfen Sayýsal Bir Deðer Veriniz...');
//    edEnSonPackNo.SetFocus;
//    exit;
//    end;             Set dateformat dmy
   try
    Runsqlado(['Drop view OTL_'+ID.User]);
   except

   end;

   rs :=#30;
   gs :=#29;
   eot :=#04;

   RUNSQLADO(['create view OTL_'+ID.User+' as select '#13+
                        ' CR.NOSU as FIRKOD, '#13+
                        ' CR.AD as FIRAD, '#13+
                        ' (Select RAN_NO From D001Mussipma where cast(SIPNO as varchar(50))+''_''+cast(SRNO as varchar(50)) '#13+
                        ' = cast(SVK.SIPNO as varchar(50))+''_''+cast(SVK.SRNO as varchar(50))) as RAN_NO,'#13+
                       // ' CR.DOCK as DOCKNO, '#13+
                        ' (Select TESLIM_KAPI_KODU_1 From D001Mussipma where cast(SIPNO as varchar(50))+''_''+cast(SRNO as varchar(50)) '#13+
                        ' = cast(SVK.SIPNO as varchar(50))+''_''+cast(SVK.SRNO as varchar(50))) as DOCKNO,'#13+
                        ' CR.SUPPLIERNO as SUPPLIERNO, '#13+
                        ' CR.ADRES as FIRADRES, '#13+
                        ' CR.VDAIRE as VERGI_DAIRE, '#13+
                        ' CR.VNOSU as VERGI_NO, '#13+
                        ' CR.TELEFON1 as TELEFON, '#13+
                        ' SVK.Irsaliye as IRSALIYENO,  '#13+
                        ' SVK.AMBLJMIK as TOP_AMBALAJMIK,   '#13+
                        ' SVK.SevkMik as TOP_SEVK_MIK, '#13+
                        ' SVK.MLZKODU as MLZ_KOD, '#13+
                        ' SVK.SevkTarih as SVK_TAR, '#13+
                        ' SVK.Delivery as SVK_DELIVERY, '#13+
                        ' SVK.PaletNo as PALETNO, '#13+
                        ' MLZ.STOKADI as MLZ_AD, '#13+
                        ' MLZ.REVNO as MLZ_REVNO, '#13+
                        ' MLZ.RESIMNO as MLZ_RESIMNO, '#13+
                        ' SVK.SevkFisNo as SevkFisNo, '#13+
                        ' SVK._ID as SevkID, '#13+
                        ' MLZ.KUTUKOD AS AMB_KOD, '#13+                        ' SVK.PartiNo as PartiNo, '#13+                        ' SVK.KUTUMIK AS KUTUMIK,'#13+                        '  isnull(MLZ.NETMIK,0) as MLZ_NETMIK, '#13+                        ' isnull(MLZ.NETMIK,0)*SVK.SevkMik as MLZ_NET_WEIGHT, '#13+                        '  isnull((select AMBAGIRLIK from kdAmbTipi where NOSU=MLZ.KUTUKOD),0)*isnull(SVK.KUTUMIK,0) AS KUTU_AGIRLIK, '#13+                        ' isnull((select AMBAGIRLIK from kdAmbTipi where NOSU=MLZ.KUTUKOD),0) AS AMB_AGIRLIK '#13+
                        ' from D001StSevkiyat as SVK '#13+
                        ' inner join sbCarDos as CR on CR.NOSU=SVK.SVKFIRKOD '#13+
                        ' inner join sbMalzme as MLZ on MLZ.STOKKOD=SVK.MLZKODU '#13+
                        ' where Irsaliye='+Quotedstr(_IRSNO)]);

  Runsqlado(['Grant all on OTL_'+ID.User+' to Kullanici,Yonetici']);
  qrKontrol:=Tadoquery.create(nil);
  qrKontrol.Connection:=GetConnection();
  qrKontrol.SQL.Clear;
  qrKontrol.sql.add('Set Dateformat dmy select ');
  qrKontrol.sql.add(' (select ADRES2 from sbCardos where NOSU=FIRKOD) as FIRADRES2, ');
  qrKontrol.sql.add(' (select ADRES3 from sbCardos where NOSU=FIRKOD) as FIRADRES3, ');
  qrKontrol.sql.add(' (select ADRES4 from sbCardos where NOSU=FIRKOD) as FIRADRES4, ');
  qrKontrol.sql.add(' (select ADRES5 from sbCardos where NOSU=FIRKOD) as FIRADRES5, ');
  qrKontrol.sql.add(' (select ADRES1 from sbCardos where NOSU=FIRKOD) as SevkAdres, ');
  qrKontrol.sql.add('FIRKOD,FIRAD,DOCKNO,SUPPLIERNO,FIRADRES,VERGI_DAIRE,VERGI_NO,TELEFON,/*PartiNo,*/ ');
   qrKontrol.sql.add('(Select TOP 1 PartiNo from OTL_'+ID.User+' where PALETNO=OT.PALETNO Order by SevkID desc) as PartiNo,');
  qrKontrol.sql.add('IRSALIYENO,SVK_DELIVERY,PALETNO,');
  qrKontrol.sql.add('SUM(TOP_SEVK_MIK) as TOPLAM_SEVK,');
  qrKontrol.sql.add('SUM(KUTUMIK) as TOPLAM_KUTU,');
  qrKontrol.sql.add('SUM(KUTU_AGIRLIK) as TOPLAM_KUTU_AGIRLIK,');
  qrKontrol.sql.add('isnull((select AMBAGIRLIK from kdAmbTipi where UPPER(ACIKLAMA)=''PALET''),0) as PALET_AGIRLIK,');
  qrKontrol.sql.add('SUM(MLZ_NET_WEIGHT) as NET_WEIGHT,');
  qrKontrol.sql.add('MLZ_KOD,MLZ_AD,MLZ_REVNO,MLZ_RESIMNO,');
  qrKontrol.sql.add('(Select TOP 1 RAN_NO from OTL_'+ID.User+' where PALETNO=OT.PALETNO Order by SevkID desc) as RAN_NO,');
  qrKontrol.sql.add('(Select TOP 1 SVK_TAR from OTL_'+ID.User+' where PALETNO=OT.PALETNO) as SVK_TAR');
  qrKontrol.sql.add('from OTL_'+ID.User+' as OT');
  qrKontrol.sql.add('group by FIRKOD,FIRAD,DOCKNO,SUPPLIERNO,FIRADRES,VERGI_DAIRE,VERGI_NO,TELEFON,');
  qrKontrol.sql.add('IRSALIYENO,SVK_DELIVERY,PALETNO,MLZ_KOD,MLZ_AD,MLZ_REVNO,MLZ_RESIMNO/*,PartiNo*/');
  qrKontrol.open;

  if dtsMamulTK.Active then dtsMamulTK.Close;
  dtsMamulTK.CreateDataSet;

  while not qrKontrol.Eof do
  begin
    qrMusKod:=nil;
    Runsqlado(qrMusKod,['Select MUSTERIKOD from sbMlzFirma AS MLZF where MLZF.MLZKODU='+Quotedstr(qrKontrol.FieldByName('MLZ_KOD').AsString)+
                        ' and MLZF.FIRMAKODU='+Quotedstr(qrKontrol.FieldByName('FIRKOD').AsString)]);

    dtsMamulTK.Append;
    dtsMamulTK.FieldByName('MUSTERIKOD').AsString:=qrMusKod.FieldByName('MUSTERIKOD').AsString;
    FreeAndNil(qrMusKod);
    dtsMamulTK.FieldByName('RAN_NO').AsString:=qrKontrol.FieldByName('RAN_NO').AsString;
    dtsMamulTK.FieldByName('FIRKOD').AsString:=qrKontrol.FieldByName('FIRKOD').AsString;
    dtsMamulTK.FieldByName('FIRAD').AsString:=qrKontrol.FieldByName('FIRAD').AsString;
    dtsMamulTK.FieldByName('DOCKNO').AsString:=qrKontrol.FieldByName('DOCKNO').AsString;
    dtsMamulTK.FieldByName('SUPPLIERNO').AsString:=qrKontrol.FieldByName('SUPPLIERNO').AsString;
    dtsMamulTK.FieldByName('FIRADRES').AsString:=qrKontrol.FieldByName('FIRADRES').AsString;
    dtsMamulTK.FieldByName('FIRADRES2').AsString:=qrKontrol.FieldByName('FIRADRES2').AsString;
    dtsMamulTK.FieldByName('FIRADRES3').AsString:=qrKontrol.FieldByName('FIRADRES3').AsString;
    dtsMamulTK.FieldByName('FIRADRES4').AsString:=qrKontrol.FieldByName('FIRADRES4').AsString;
    dtsMamulTK.FieldByName('FIRADRES5').AsString:=qrKontrol.FieldByName('FIRADRES5').AsString;
    dtsMamulTK.FieldByName('SevkAdres').AsString:=qrKontrol.FieldByName('SevkAdres').AsString;
    dtsMamulTK.FieldByName('TOP_SEVK_MIK').AsFloat:=qrKontrol.FieldByName('TOPLAM_SEVK').AsFloat;
    dtsMamulTK.FieldByName('BARCODE_TOP_SEVK_MIK').asstring:='Q'+qrKontrol.FieldByName('TOPLAM_SEVK').AsString;
    dtsMamulTK.FieldByName('VERGI_DAIRE').AsString:=qrKontrol.FieldByName('VERGI_DAIRE').AsString;
    dtsMamulTK.FieldByName('VERGI_NO').AsString:=qrKontrol.FieldByName('VERGI_NO').AsString;
    dtsMamulTK.FieldByName('TELEFON').AsString:=qrKontrol.FieldByName('TELEFON').AsString;
    dtsMamulTK.FieldByName('IRSALIYENO').AsString:=qrKontrol.FieldByName('IRSALIYENO').AsString;
    dtsMamulTK.FieldByName('MLZ_KOD').AsString:=qrKontrol.FieldByName('MLZ_KOD').AsString;
    dtsMamulTK.FieldByName('SVK_TAR').AsDateTime:=qrKontrol.FieldByName('SVK_TAR').AsDateTime;
    dtsMamulTK.FieldByName('SVK_DELIVERY').AsString:=qrKontrol.FieldByName('SVK_DELIVERY').AsString;
    dtsMamulTK.FieldByName('PALETNO').AsString:=qrKontrol.FieldByName('PALETNO').AsString;
    dtsMamulTK.FieldByName('MLZ_AD').AsString:=qrKontrol.FieldByName('MLZ_AD').AsString;
    dtsMamulTK.FieldByName('MLZ_REVNO').AsString:=qrKontrol.FieldByName('MLZ_REVNO').AsString;
    dtsMamulTK.FieldByName('MLZ_RESIMNO').AsString:=qrKontrol.FieldByName('MLZ_RESIMNO').AsString;
    dtsMamulTK.FieldByName('PackNo').AsString:=qrKontrol.FieldByName('PALETNO').AsString;
    PartiNo:= qrKontrol.FieldByName('PartiNo').AsString;;
    PartiNo:=StringReplace(PartiNo, '/', '',[rfReplaceAll, rfIgnoreCase]);
    PartiNo:=StringReplace(PartiNo, '.', '',[rfReplaceAll, rfIgnoreCase]);
    PartiNo:=StringReplace(PartiNo, '-', '',[rfReplaceAll, rfIgnoreCase]);
    dtsMamulTK.FieldByName('PartiNo').AsString:= PartiNo;
    dtsMamulTK.FieldByName('NET_WEIGHT').asinteger:=Ceil(qrKontrol.FieldByName('NET_WEIGHT').asfloat);
    ToplamGross:= qrKontrol.FieldByName('PALET_AGIRLIK').asFloat+
                  qrKontrol.FieldByName('TOPLAM_KUTU_AGIRLIK').asFloat+
                  qrKontrol.FieldByName('NET_WEIGHT').asFloat;
    dtsMamulTK.FieldByName('GROSS_WEIGHT').asinteger:=Ceil(ToplamGross);
    dtsMamulTK.FieldByName('TOPLAM_AMB_ADET').asinteger:=qrKontrol.FieldByName('TOPLAM_KUTU').asinteger;

      _qrCode:='[)>'+rs+'06'+gs;
     _qrCode:=_qrCode+'12SA'+gs; //Code identification
     _qrCode:=_qrCode+'16S1'+gs;//Code Version
     _qrCode:=_qrCode+'V'+dtsMamulTK.FieldByName('SUPPLIERNO').AsString+gs; //SELLER
     _qrCode:=_qrCode+'M'+dtsMamulTK.FieldByName('PALETNO').AsString+gs; //LABEL Conatiner id
     _qrCode:=_qrCode+'P'+dtsMamulTK.FieldByName('MUSTERIKOD').AsString+gs; //Autoliv Part Number
    // _qrCode:=_qrCode+'1P'+dtsMamulTK.FieldByName('TOPLAM_AMB_ADET').AsString+gs;    //Part Revision Code
      _qrCode:=_qrCode+'1P'+gs;    //03.01.2018 Binay
     _qrCode:=_qrCode+'Q'+dtsMamulTK.FieldByName('TOP_SEVK_MIK').AsString+gs;//Quoantity
     _qrCode:=_qrCode+'3QPCE'+gs;    //Unit of Measurement
     _qrCode:=_qrCode+'H'+dtsMamulTK.FieldByName('PARTINO').AsString+gs;//Product Batch/Lot Number
     _qrCode:=_qrCode+'10D'+gs;
     //_qrCode:=_qrCode+'10D'+inttostr(WeekOfTheYear(dtsMamulTK.FieldByName('SVK_TAR').AsDateTime))
      //        +formatdatetime('yy',dtsMamulTK.FieldByName('SVK_TAR').AsDateTime)+'<GS>';//DateCode
     _qrCode:=_qrCode+'5D'+formatdatetime('yymmdd',dtsMamulTK.FieldByName('SVK_TAR').AsDateTime)+'011'+gs;//Date of Production/Dispatch
     _qrCode:=_qrCode+'N'+dtsMamulTK.FieldByName('IRSALIYENO').AsString+gs;//Delivery Reference
     _qrCode:=_qrCode+'15K'+dtsMamulTK.FieldByName('RAN_NO').AsString+gs;//Order Reference
     _qrCode:=_qrCode+'2L'+dtsMamulTK.FieldByName('DOCKNO').AsString+gs;//Location
     _qrCode:=_qrCode+'1L'+gs;//Location
     _qrCode:=_qrCode+'Z'+gs; //Moisture sensibility level
     _qrCode:=_qrCode+'14D'+gs;
     //_qrCode:=_qrCode+'14D'+formatdatetime('yyyymmdd',dtsMamulTK.FieldByName('SVK_TAR').AsDateTime)+'<GS>';//Expiry Date
     _qrCode:=_qrCode+'3Z'+rs; //Supplier Data
     _qrCode:=_qrCode+eot;

     dtsMamulTK.FieldByName('QRCODEYOL').AsString:=QrCode_Create(
                                                        self.Caption+dtsMamulTK.FieldByName('PALETNO').AsString
                                                        ,_qrCode);


     dtsMamulTK.FieldByName('DataMatrixYol').AsString:=DataMatrix_Create(
                                                        self.Caption+dtsMamulTK.FieldByName('PALETNO').AsString
                                                        ,_qrCode);
    dtsMamulTK.Post;

   qrKontrol.Next;
  end;


end;

end.
