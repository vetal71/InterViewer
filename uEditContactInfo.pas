unit uEditContactInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTDialog, Vcl.ExtCtrls, RzPanel,
  RzDlgBtn, Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Data.DB,
  cxDBEdit, DBAccess, Uni, MemDS, cxClasses;

type
  TfEditContactInfo = class(TfTDialog)
    lbl2: TLabel;
    cbbContactInfoType: TcxDBLookupComboBox;
    lbl1: TLabel;
    dtContactInfoType: TUniQuery;
    dsContactInfoType: TUniDataSource;
    edtValue: TcxDBMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure dlgButtonsClickOk(Sender: TObject);
    procedure cbbContactInfoTypePropertiesChange(Sender: TObject);
    procedure edtValuePropertiesChange(Sender: TObject);
  private
    procedure AllowSave;
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

procedure TfEditContactInfo.cbbContactInfoTypePropertiesChange(Sender: TObject);
begin
  AllowSave
end;

procedure TfEditContactInfo.AllowSave;
begin
  dlgButtons.EnableOk := (cbbContactInfoType.Text > '') and (edtValue.Text > '');
end;

procedure TfEditContactInfo.dlgButtonsClickOk(Sender: TObject);
begin
  if (cbbContactInfoType.Text = '') then
    ModalResult := mrCancel;
end;

procedure TfEditContactInfo.edtValuePropertiesChange(Sender: TObject);
begin
  AllowSave;
end;

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
