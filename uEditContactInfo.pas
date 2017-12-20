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
  except
    Application.MessageBox('Не удалось открыть таблицу CONTACT_INFO_TYPES',
      'Ошибка открытия', MB_OK or MB_ICONERROR);
  end;
end;

end.
