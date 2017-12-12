unit uEditContactInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTDialog, Vcl.ExtCtrls, RzPanel,
  RzDlgBtn, Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Data.DB,
  FIBDataSet, pFIBDataSet, cxDBEdit;

type
  TfEditContactInfo = class(TfTDialog)
    lbl2: TLabel;
    dtContactInfoType: TpFIBDataSet;
    dsContactInfoType: TDataSource;
    cbbContactInfoType: TcxDBLookupComboBox;
    lbl1: TLabel;
    edtValue: TcxDBTextEdit;
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
    Application.MessageBox('�� ������� ������� ������� CONTACT_INFO_TYPES',
      '������ ��������', MB_OK or MB_ICONERROR);
  end;
end;

end.
