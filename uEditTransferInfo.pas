unit uEditTransferInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTEditDialog, Vcl.ExtCtrls, RzPanel,
  RzDlgBtn, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxDBEdit, Vcl.StdCtrls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Data.DB,
  DBAccess, Uni, MemDS, cxClasses;

type
  TfEditTransferInfo = class(TfTEditDialog)
    cbbTransferInfoType: TcxDBLookupComboBox;
    lbl2: TLabel;
    lbl1: TLabel;
    edtBank: TcxDBTextEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtNote: TcxDBMaskEdit;
    tblTransferType: TUniQuery;
    dsTransferType: TUniDataSource;
    edtCard: TcxDBMaskEdit;
    edtPeriodCard: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure cbbTransferInfoTypePropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEditTransferInfo: TfEditTransferInfo;

implementation

uses
  uDataModule;

{$R *.dfm}

procedure TfEditTransferInfo.cbbTransferInfoTypePropertiesChange(
  Sender: TObject);
begin
  if cbbTransferInfoType.Text > '' then
    dlgButtons.EnableOk := True
  else
    dlgButtons.EnableOk := False;
end;

procedure TfEditTransferInfo.FormCreate(Sender: TObject);
begin
  try
    tblTransferType.Open;
  except on E: Exception do
    Application.MessageBox(PWideChar('Не удалось открыть таблицу типов переводов'#13#10 + E.Message),
      'Ошибка открытия', MB_OK or MB_ICONERROR);
  end;
end;

end.
