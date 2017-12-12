unit uEditTransferInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTDialog, Vcl.ExtCtrls, RzPanel,
  RzDlgBtn, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxDBEdit, Vcl.StdCtrls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Data.DB,
  FIBDataSet, pFIBDataSet;

type
  TfEditTransferInfo = class(TfTDialog)
    cbbTransferInfoType: TcxDBLookupComboBox;
    lbl2: TLabel;
    lbl1: TLabel;
    edtBank: TcxDBTextEdit;
    lbl3: TLabel;
    edtCard: TcxDBTextEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    edtPeriodCard: TcxDBMaskEdit;
    edtNote: TcxDBMaskEdit;
    dtTransferType: TpFIBDataSet;
    dsTransferType: TDataSource;
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

end.
