unit uEditRegions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTDialog, Vcl.ExtCtrls, RzPanel,
  RzDlgBtn, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Data.DB, FIBDataSet, pFIBDataSet, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls,
  DBAccess, Uni, MemDS;

type
  TfEditRegions = class(TfTDialog)
    lbl2: TLabel;
    cbbRegions: TcxDBLookupComboBox;
    lbl1: TLabel;
    cbbCities: TcxDBLookupComboBox;
    dtRegions: TUniQuery;
    dtCities: TUniQuery;
    dsRegions: TUniDataSource;
    dsCities: TUniDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEditRegions: TfEditRegions;

implementation

uses
  uDataModule;

{$R *.dfm}

end.
