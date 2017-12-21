unit uEditContactInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTDialog, Vcl.ExtCtrls, RzPanel,
  RzDlgBtn, Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Data.DB,
  cxDBEdit, DBAccess, Uni, MemDS;

type
  TfEditContactInfo = class(TfTDialog)
    lbl2: TLabel;
    cbbContactInfoType: TcxDBLookupComboBox;
    lbl1: TLabel;
    dtContactInfoType: TUniQuery;
    dsContactInfoType: TUniDataSource;
    edtValue: TcxDBMaskEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEditContactInfo: TfEditContactInfo;

implementation

uses
  uDataModule, uFuncs;

{$R *.dfm}

procedure TfEditContactInfo.FormCreate(Sender: TObject);
begin
  try
    dtContactInfoType.Open;
  except on E: Exception do
    Application.MessageBox(PWideChar('Не удалось открыть таблицу типов контактной информации'#13#10 + E.Message),
      'Ошибка открытия', MB_OK or MB_ICONERROR);
  end;
end;

end.
