unit uEditContacts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, RzDlgBtn,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, uDataModule, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxCheckBox, cxCheckComboBox,
  Vcl.CheckLst, cxButtonEdit, cxMemo, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalc,
  RzTabs, Vcl.Buttons, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfEditContacts = class(TForm)
    dlgButtons: TRzDialogButtons;
    pnlMainInfo: TRzPanel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    chkSupervizer: TcxDBCheckBox;
    chbSpecialization: TcxCheckComboBox;
    lbl1: TLabel;
    chkBlackList: TcxDBCheckBox;
    edtFIO: TcxButtonEdit;
    cbbSex: TcxComboBox;
    mmoCharacteristics: TcxMemo;
    mmoCurrentNotes: TcxMemo;
    mmoProjects: TcxMemo;
    edtCountAnketa: TcxCalcEdit;
    edtDateBirthday: TcxDateEdit;
    edtPassport: TcxButtonEdit;
    edtDateLast: TcxDateEdit;
    edtPercentGood: TcxCalcEdit;
    edtPercentBad: TcxCalcEdit;
    lbl2: TLabel;
    pnlAddInfo: TRzPanel;
    pnlButtons: TRzPanel;
    btnAdd: TSpeedButton;
    btnEdit: TSpeedButton;
    btnDelete: TSpeedButton;
    pgcInfo: TRzPageControl;
    tsContactInfo: TRzTabSheet;
    tsRegions: TRzTabSheet;
    grdContactInfo: TcxGrid;
    gdvContactInfo: TcxGridDBTableView;
    gdlContactInfo: TcxGridLevel;
    gdvContactInfoCI_ID: TcxGridDBColumn;
    gdvContactInfoCIT_ID: TcxGridDBColumn;
    gdvContactInfoCIT_NAME: TcxGridDBColumn;
    gdvContactInfoCONTACT_ID: TcxGridDBColumn;
    gdvContactInfoCONTACT_INFO_VALUE: TcxGridDBColumn;
    tsTransferInfo: TRzTabSheet;
    grdRegions: TcxGrid;
    gdvRegions: TcxGridDBTableView;
    gdlRegions: TcxGridLevel;
    gdvRegionsWC_ID: TcxGridDBColumn;
    gdvRegionsCONTACT_ID: TcxGridDBColumn;
    gdvRegionsCITY_ID: TcxGridDBColumn;
    gdvRegionsREGION_NAME: TcxGridDBColumn;
    gdvRegionsCITY_NAME: TcxGridDBColumn;
    gdvRegionsOLD_CITY: TcxGridDBColumn;
    grdTransfer: TcxGrid;
    gdvTransfer: TcxGridDBTableView;
    gdlTransfer: TcxGridLevel;
    gdvTransferTI_ID: TcxGridDBColumn;
    gdvTransferTT_ID: TcxGridDBColumn;
    gdvTransferCONTACT_ID: TcxGridDBColumn;
    gdvTransferBANK_NAME: TcxGridDBColumn;
    gdvTransferCARD_NAME: TcxGridDBColumn;
    gdvTransferCARD_PERIOD: TcxGridDBColumn;
    gdvTransferNOTES: TcxGridDBColumn;
    gdvTransferTT_NAME: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure edtFIOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtPassportPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FId: Integer;
  private
    function GetId: Integer;
    procedure SetId(const Value: Integer);

    procedure Init;
    procedure BeforeSave;
  public
    procedure FillCheckBox(cxCheckComboBox: TcxCheckComboBox; s: string);
  end;

var
  fEditContacts: TfEditContacts;

implementation

uses
  uEditFIO, uFuncs;

{$R *.dfm}

{ TfEditContacts }

procedure TfEditContacts.BeforeSave;
begin
  //
end;

procedure TfEditContacts.edtFIOPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  // вызов формы редактирования фамилии и имени
  with TfEditFIO.Create(Application) do
  try
    FIO := edtFIO.Text;
    if ShowModal = mrOk then
      edtFIO.Text := FIO;
  finally
    Free;
  end;
end;

procedure TfEditContacts.edtPassportPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  // Форма редактирования паспорта
end;

procedure TfEditContacts.FillCheckBox(cxCheckComboBox: TcxCheckComboBox;
  s: string);
var
  sl: TStringList;
  CheckComboboxItem: TcxCheckComboboxItem;
  I, J: Integer;
  ACheckStates: TcxCheckStates;
begin
  sl := TStringList.Create;
  try
    SplitText(s, sl, ';');
    for I := 0 to sl.Count - 1 do
    begin
      for J := 0 to cxCheckComboBox.Properties.Items.Count - 1 do
      begin
        CheckComboboxItem := cxCheckComboBox.Properties.Items[J];
        if CheckComboboxItem.Description = sl[I] then
          cxCheckComboBox.SetItemState(J, cbsChecked);
      end;
    end;

  finally
    sl.Free;
  end;

end;

procedure TfEditContacts.FormShow(Sender: TObject);
begin
  Init;
  FillCheckBox(chbSpecialization, chbSpecialization.EditValue);
end;

function TfEditContacts.GetId: Integer;
begin
  Result := FId;
end;

procedure TfEditContacts.Init;
begin
  with dm.dtContactList do
  begin
    edtFIO.Text := FieldByName('FIO').AsString;
    cbbSex.Text := FieldByName('GENDER').AsString;
    if VarIsNull(FieldValues['BIRTHDAY']) then
      edtDateBirthday.Clear
    else
      edtDateBirthday.Date := FieldByname('BIRTHDAY').AsDateTime;
    edtPassport.Text := FieldByName('PASSPORT').AsString;
    chbSpecialization.EditValue := FieldByName('SPECIALIZATION').AsString;
    mmoCharacteristics.Text := FieldByName('CHARACTERISTICS').AsString;
    mmoCurrentNotes.Text := FieldByName('NOTES').AsString;
    mmoProjects.Text := FieldByName('PROJECT_LIST').AsString;
    if VarIsNull(FieldValues['LAST_DATE']) then
      edtDateLast.Clear
    else
      edtDateLast.Date := FieldByName('LAST_DATE').AsDateTime;
    edtCountAnketa.Value := FieldByName('AMOUNT_FORMS').AsInteger;
    edtPercentGood.Value := FieldByName('PERCENT_GOOD_FORMS').AsInteger;
    edtPercentBad.Value := FieldByName('PERCENT_BAD_FORMS').AsInteger;
    chkSupervizer.Checked := Boolean(FieldByName('IS_SUPERVISER').AsInteger);
    chkBlackList.Checked := Boolean(FieldByName('IS_IN_BLACK_LIST').AsInteger);
  end;
end;

procedure TfEditContacts.SetId(const Value: Integer);
begin
  FId := Value;
end;

end.
