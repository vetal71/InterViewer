unit uEditRegions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTEditDialog, Vcl.ExtCtrls, RzPanel,
  RzDlgBtn, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Data.DB, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls,
  DBAccess, Uni, MemDS, cxClasses;

type
  TfEditRegions = class(TfTEditDialog)
    lbl2: TLabel;
    lbl1: TLabel;
    cbbCities: TcxDBLookupComboBox;
    dtRegions: TUniQuery;
    dsRegions: TUniDataSource;
    dsCities: TUniDataSource;
    dtCities: TUniQuery;
    cbbRegions: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cbbRegionsPropertiesChange(Sender: TObject);
    procedure cbbCitiesPropertiesChange(Sender: TObject);
  private
    FRegionId: Integer;
    procedure FillRegionComboBox;
    procedure AllowSave;
    procedure SetRegionId(const Value: Integer);
  public
    property RegionId: Integer write SetRegionId;
  end;

var
  fEditRegions: TfEditRegions;

implementation

uses
  uDataModule;

{$R *.dfm}

procedure TfEditRegions.AllowSave;
begin
  dlgButtons.EnableOk := (cbbRegions.Text > '') and (cbbCities.Text > '')
end;

procedure TfEditRegions.cbbCitiesPropertiesChange(Sender: TObject);
begin
  AllowSave;
end;

procedure TfEditRegions.cbbRegionsPropertiesChange(Sender: TObject);
var
  Key: Integer;
begin
  with cbbRegions do
    Key := Integer(cbbRegions.Properties.Items.Objects[ItemIndex]);
  dtRegions.Locate('REGION_ID', Key, []);
  AllowSave;
end;

procedure TfEditRegions.FillRegionComboBox;
begin
  with dtRegions do
  begin
    while not Eof do
    begin
      cbbRegions.Properties.Items.AddObject(FieldByName('REGION_NAME').AsString, Pointer(FieldByName('REGION_ID').AsInteger));
      Next;
    end;
  end;
  if cbbRegions.Properties.Items.Count > 0 then
    cbbRegions.ItemIndex := 0
  else
    cbbRegions.Text := '';
end;

procedure TfEditRegions.FormCreate(Sender: TObject);
begin
  try
    dtRegions.Open;
    dtCities.Open;
    FillRegionComboBox;
  except on E: Exception do
    Application.MessageBox(PWideChar('Не удалось открыть таблицу регионов'#13#10 + E.Message),
      'Ошибка открытия', MB_OK or MB_ICONERROR);
  end;
end;

procedure TfEditRegions.SetRegionId(const Value: Integer);
begin
  if Value > 0 then
    cbbRegions.ItemIndex := cbbRegions.Properties.Items.IndexOfObject(Pointer(Value));
end;

end.
