unit uEditContacts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Uni,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, RzDlgBtn,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, uDataModule, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxCheckBox, cxCheckComboBox,
  Vcl.CheckLst, cxButtonEdit, cxMemo, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalc,
  RzTabs, Vcl.Buttons, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxImage,
  Vcl.ExtDlgs, Vcl.Imaging.jpeg, uDBFuncs, uFuncs;

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
    chbSpecialization: TcxCheckComboBox;
    lbl1: TLabel;
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
    imgPhoto: TcxImage;
    chkSupervizer: TcxCheckBox;
    chkBlackList: TcxCheckBox;
    lbl3: TLabel;
    edtSocialNumber: TcxTextEdit;
    dlgOpenPicture: TOpenPictureDialog;
    procedure FormShow(Sender: TObject);
    procedure edtFIOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtPassportPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure imgPhotoClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure edtFIOExit(Sender: TObject);
    procedure edtFIOPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FId: Integer;
  private
    procedure Init;
    procedure BeforeSave;
    procedure LoadPhotoFromDatabase;
    procedure SaveContactToDatabase(DataSet: TDataSet);
    procedure EditContactInfo(AMode: TDBMode);
  public
    procedure FillCheckBox(cxCheckComboBox: TcxCheckComboBox; s: string);
    property ContactID: Integer read FId write FId;
  end;

var
  fEditContacts: TfEditContacts;

implementation

uses
  uEditFIO, uTDialog, uEditContactInfo, uEditRegions, uEditTransferInfo, uEditPassport;

{$R *.dfm}

{ TfEditContacts }

procedure TfEditContacts.BeforeSave;
begin
  // Save
  with dm.qryContactList do
  begin
    FieldByName('FIO').AsString                 := edtFIO.Text;
    FieldByName('GENDER').AsString              := cbbSex.Text;
    if edtDateBirthday.Date > 0 then
      FieldByName('BIRTHDAY').AsDateTime        := edtDateBirthday.Date;
    FieldByName('PASSPORT').AsString            := edtPassport.Text;
    FieldByName('SPECIALIZATION').AsString      := chbSpecialization.Text;
    FieldByName('CHARACTERISTICS').AsString     := mmoCharacteristics.Text;
    FieldByName('NOTES').AsString               := mmoCurrentNotes.Text;
    FieldByName('PROJECT_LIST').AsString        := mmoProjects.Text;
    if edtDateLast.Date > 0 then
      FieldByName('LAST_DATE').AsDateTime       := edtDateLast.Date;
    FieldByName('AMOUNT_FORMS').AsInteger       := Trunc(edtCountAnketa.Value);
    FieldByName('PERCENT_GOOD_FORMS').AsInteger := Trunc(edtPercentGood.Value);
    FieldByName('PERCENT_BAD_FORMS').AsInteger  := Trunc(edtPercentBad.Value);
    FieldByName('SOCIAL_NUMBER').AsString       := edtSocialNumber.Text;
    FieldByName('IS_SUPERVISER').AsInteger      := Integer( chkSupervizer.Checked );
    FieldByName('IS_IN_BLACK_LIST').AsInteger   := Integer( chkBlackList.Checked );
  end;
end;

procedure TfEditContacts.btnAddClick(Sender: TObject);
begin
  // Append Record;
  EditContactInfo(dbmAppend);
end;

procedure TfEditContacts.btnDeleteClick(Sender: TObject);
var
  DataSet: TDataSet;
begin
  if pgcInfo.ActivePageIndex = 0 then            // контактна€ информаци€
  begin
    DataSet := dm.qryContactInfo;
  end else if pgcInfo.ActivePageIndex = 1 then   // зона обслуживани€
  begin
    DataSet := dm.qryRegions;
  end else if pgcInfo.ActivePageIndex = 2 then   // финансы
  begin
    DataSet := dm.qryTransferInfo;
  end;
  if MessageDlg('”далить текущую запись ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DataSet.Delete;
end;

procedure TfEditContacts.btnEditClick(Sender: TObject);
begin
  // Edit Record
  EditContactInfo(dbmEdit);
end;

procedure TfEditContacts.EditContactInfo(AMode: TDBMode);
var
  EditDlg: TfTDialog;
  DataSet: TDataSet;
begin
  if pgcInfo.ActivePageIndex = 0 then            // контактна€ информаци€
  begin
    EditDlg := TfEditContactInfo.Create(Application);
    DataSet := dm.qryContactInfo;
  end else if pgcInfo.ActivePageIndex = 1 then   // зона обслуживани€
  begin
    EditDlg := TfEditRegions.Create(Application);
    DataSet := dm.qryRegions;
  end else if pgcInfo.ActivePageIndex = 2 then   // финансы
  begin
    EditDlg := TfEditTransferInfo.Create(Application);
    DataSet := dm.qryTransferInfo;
  end;
  try
    if AMode = dbmAppend then
      DataSet.Append
    else if AMode = dbmEdit then
      DataSet.Edit;
    DataSet.FieldByName('CONTACT_ID').AsInteger := FId;
    if EditDlg.ShowModal <> mrOk then
    begin
      if DataSet.State in [dsEdit, dsInsert] then
        DataSet.Cancel;
    end
    else
    begin
      // перед сохранением св€занной информации сохран€ем родительскую запись
      try
        if dm.qryContactList.State in [ dsInsert ] then
          dm.qryContactList.Post;
        DataSet.Post;
      except on E: Exception do
        ShowError('Ќе удалось сохранить данные контакта.'#13#10 + E.Message);
      end;
    end;
  finally
    EditDlg.Free;
  end;
end;

procedure TfEditContacts.edtFIOExit(Sender: TObject);
begin
  edtFIO.ValidateEdit( True );
end;

procedure TfEditContacts.edtFIOPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  // вызов формы редактировани€ фамилии и имени
  with TfEditFIO.Create(Application) do
  try
    FIO := edtFIO.Text;
    if ShowModal = mrOk then
      edtFIO.Text := FIO;
  finally
    Free;
  end;
end;

procedure TfEditContacts.edtFIOPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if edtFIO.Text = EmptyStr then
  begin
    Error := True;
    ErrorText := 'ѕоле не может быть пустым.';
  end;
end;

procedure TfEditContacts.edtPassportPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  // ‘орма редактировани€ паспорта
  with TfEditPassport.Create(Application) do
  try
    Passport := edtPassport.Text;
    if ShowModal = mrOk then
      edtPassport.Text := Passport;
  finally
    Free;
  end;
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

procedure TfEditContacts.imgPhotoClick(Sender: TObject);
begin
  //загрузка из файла
  if dlgOpenPicture.Execute then
    imgPhoto.Picture.LoadFromFile(dlgOpenPicture.FileName);
end;

procedure TfEditContacts.Init;
begin
  with dm.qryContactList do
  begin
    dm.ContactBeforePost := SaveContactToDatabase;

    FieldByName('BCONTACT_ID').AsInteger := ContactID;

    if State in [dsEdit] then
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
      edtSocialNumber.Text := FieldByName('SOCIAL_NUMBER').AsString;
      chkSupervizer.Checked := Boolean(FieldByName('IS_SUPERVISER').AsInteger);
      chkBlackList.Checked := Boolean(FieldByName('IS_IN_BLACK_LIST').AsInteger);

      if not TBlobField(FieldByName('PHOTO')).IsNull then
        LoadPhotoFromDatabase;
    end;
  end;
  try
    dm.qryContactInfo.Open;
    dm.qryRegions.Open;
    dm.qryTransferInfo.Open;
  except on E: Exception do
    ShowError('ѕри открытии дополнительных таблиц возникла ошибка.'#13#10 + E.Message);
  end;
end;

procedure TfEditContacts.LoadPhotoFromDatabase;
var
  BLOB: TStream;
  Code: Word;
begin
  //считывание картинки из базы
  BLOB := dm.qryContactList.CreateBlobStream(dm.qryContactList.FieldByName('PHOTO'), bmRead);
  try
    BLOB.Read(Code, SizeOf(Code));
    BLOB.Seek(0, 0);
    case Code of
      $4D42:
        begin
          imgPhoto.Picture.Graphic := TBitmap.Create;
          imgPhoto.Picture.Graphic.LoadFromStream( BLOB );
        end;
      $D8FF:
        begin
          imgPhoto.Picture.Graphic := TJPEGImage.Create;
          imgPhoto.Picture.Graphic.LoadFromStream( BLOB );
        end;
    end;
  finally
    BLOB.Free;
  end;
end;

procedure TfEditContacts.SaveContactToDatabase(DataSet: TDataSet);
var
  BLOB:TStream;
begin
  BeforeSave;
  //сохранение картинки в базе
  if not Assigned( imgPhoto.Picture.Graphic ) then Exit;

  BLOB := DataSet.CreateBlobStream( DataSet.FieldByName('PHOTO'), bmWrite );
  try
    imgPhoto.Picture.Graphic.SaveToStream( BLOB );
  finally
    BLOB.Free;
  end;
end;

end.
