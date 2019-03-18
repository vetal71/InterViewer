unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Forms, Vcl.Dialogs,
  System.Variants, System.Classes, Vcl.Graphics, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView, Uni,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.Buttons, Vcl.ExtCtrls, RzPanel, RzStatus, Vcl.Controls, Vcl.Mask,
  Vcl.DBCtrls, RzCommon, cxCheckBox, cxGridExportLink, WUpdate, uLogin,
  System.StrUtils, uFuncs, uDBFuncs, dxBarBuiltInMenu, cxPC, RzTabs,
  AdvCircularProgress, dxBar, cxDropDownEdit, cxLabel, cxBarEditItem,
  System.ImageList, Vcl.ImgList, cxSplitter;

type
  TfMain = class(TForm)
    alActions: TActionList;
    sbMain: TRzStatusBar;
    spText: TRzStatusPane;
    RzClockStatus1: TRzClockStatus;
    spDBInfo: TRzStatusPane;
    psMain: TRzPropertyStore;
    rifMain: TRzRegIniFile;
    pbsImport: TRzProgressStatus;
    spProgress: TRzStatusPane;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    verInfo: TRzVersionInfo;
    WebUpdate1: TWebUpdate;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aPrint: TAction;
    pgcMain: TRzPageControl;
    tsNew: TRzTabSheet;
    tsOld: TRzTabSheet;
    pnlMain_: TRzPanel;
    splInfo_: TSplitter;
    pnlGrid_: TRzPanel;
    grdVContacts: TcxGrid;
    gdvVContacts: TcxGridDBTableView;
    gdvVContactsBCONTACT_ID: TcxGridDBColumn;
    gdvVContactsFIO: TcxGridDBColumn;
    gdvVContactsIS_SUPERVISER: TcxGridDBColumn;
    gdvVContactsGENDER: TcxGridDBColumn;
    gdvVContactsREGION_NAME: TcxGridDBColumn;
    gdvVContactsCITY_NAME: TcxGridDBColumn;
    gdvVContactsBIRTHDAY: TcxGridDBColumn;
    gdvVContactsCELURAR: TcxGridDBColumn;
    gdvVContactsHOMEPHONE: TcxGridDBColumn;
    gdvVContactsPROJECT_LIST: TcxGridDBColumn;
    gdvVContactsLAST_DATE: TcxGridDBColumn;
    gdvVContactsIS_IN_BLACK_LIST: TcxGridDBColumn;
    gdvVContactsNOTES: TcxGridDBColumn;
    gdvVContactsPASSPORT: TcxGridDBColumn;
    gdvVContactsSPECIALIZATION: TcxGridDBColumn;
    gdvVContactsAMOUNT_FORMS: TcxGridDBColumn;
    gdvVContactsPERCENT_GOOD_FORMS: TcxGridDBColumn;
    gdvVContactsPERCENT_BAD_FORMS: TcxGridDBColumn;
    gdvVContactsCHARACTERISTICS: TcxGridDBColumn;
    gdvVContactsSOCIAL_NUMBER: TcxGridDBColumn;
    gdvVContactsADDRESS: TcxGridDBColumn;
    gdvVContactsEMAIL: TcxGridDBColumn;
    gdvVContactsSOCIALNET: TcxGridDBColumn;
    gdvVContactsTRANSFERS: TcxGridDBColumn;
    gdlVContacts: TcxGridLevel;
    pnlInfo_: TRzPanel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    edtEMAIL_: TDBEdit;
    edtSOCIALNET: TDBEdit;
    edtPASSPORT_: TDBEdit;
    edtADDRESS_: TDBEdit;
    edtSPECIALIZATION_: TDBEdit;
    edtTRANSFERS: TDBEdit;
    dbmmoGENERALCHARACTERISTIC_: TDBMemo;
    dbmmoCURRENTNOTES_: TDBMemo;
    pnlMain: TRzPanel;
    pnlGrid: TRzPanel;
    grdContracts: TcxGrid;
    gdvContracts: TcxGridDBTableView;
    gdvContractsCODE: TcxGridDBColumn;
    gdvContractsFIO: TcxGridDBColumn;
    gdvContractsISSUPERVIZER: TcxGridDBColumn;
    gdvContractsSEX: TcxGridDBColumn;
    gdvContractsCURRENTNOTES: TcxGridDBColumn;
    gdvContractsREGION: TcxGridDBColumn;
    gdvContractsCITY: TcxGridDBColumn;
    gdvContractsBIRTHDATE: TcxGridDBColumn;
    gdvContractsCELURARPHONE: TcxGridDBColumn;
    gdvContractsHOMEPHONE: TcxGridDBColumn;
    gdvContractsEMAIL: TcxGridDBColumn;
    gdvContractsOTHERTYPELINKS: TcxGridDBColumn;
    gdvContractsADDRESS: TcxGridDBColumn;
    gdvContractsPASSPORT: TcxGridDBColumn;
    gdvContractsSPECIALIZATION: TcxGridDBColumn;
    gdvContractsTRANSFERTYPE: TcxGridDBColumn;
    gdvContractsNUMBERCARD: TcxGridDBColumn;
    gdvContractsDATELAST: TcxGridDBColumn;
    gdvContractsMEMBERPROJECTS: TcxGridDBColumn;
    gdvContractsCOUNTANKETA: TcxGridDBColumn;
    gdvContractsPERCENTGOOD: TcxGridDBColumn;
    gdvContractsPERCENTBAD: TcxGridDBColumn;
    gdvContractsGENERALCHARACTERISTIC: TcxGridDBColumn;
    gdvContractsISBLACKLIST: TcxGridDBColumn;
    gdlContracts: TcxGridLevel;
    pb: TAdvCircularProgress;
    bmMain: TdxBarManager;
    brMainMenu: TdxBar;
    siContacts: TdxBarSubItem;
    bbAdd: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    btnEdit: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    siView: TdxBarSubItem;
    dxBarLargeButton4: TdxBarLargeButton;
    btnView: TdxBarLargeButton;
    siReports: TdxBarSubItem;
    dxBarLargeButton6: TdxBarLargeButton;
    bbExit: TdxBarButton;
    btnExport: TdxBarLargeButton;
    ilMainLarge: TcxImageList;
    btnContracts: TdxBarLargeButton;
    dbSeparator: TdxBarSeparator;
    dxBarSeparator1: TdxBarSeparator;
    ilSmall: TcxImageList;
    brMainToolbar: TdxBar;
    dxBarButton4: TdxBarButton;
    cxBarEditItem2: TcxBarEditItem;
    dxBarButton5: TdxBarButton;
    cbbFilter: TdxBarCombo;
    btnAdd: TdxBarLargeButton;
    spMain: TcxSplitter;
    pnlAddInfo: TRzPanel;
    scMain: TScrollBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    dbmmoCURRENTNOTES: TDBMemo;
    edtEMAIL: TDBEdit;
    edtOTHERTYPELINKS: TDBEdit;
    edtADDRESS: TDBEdit;
    edtPASSPORT: TDBEdit;
    edtSPECIALIZATION: TDBEdit;
    edtTRANSFERTYPE: TDBEdit;
    edtNUMBERCARD: TDBEdit;
    dbmmoGENERALCHARACTERISTIC: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure gdvContractsCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ButtonFilterClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnContractClick(Sender: TObject);
    procedure gdvContractsFocusedItemChanged(Sender: TcxCustomGridTableView;
      APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem);
    procedure btnViewClick(Sender: TObject);
    procedure cbbFilterChange(Sender: TObject);
  private
    Options: TOptions;
    IsFirstRun: Boolean;
    procedure DBConnect;
    procedure OpenData;
    procedure ShowEditForm(AMode: TDBMode);
    procedure ApplyFilter(AFilterSQL: string; AIsApply: Boolean);
    function GetSQLFilter(aIndex: Integer): string;
    function GetUser: string;
    procedure SetEnableButtons;
  public
    procedure AfterConstruction(Sender: TObject); overload;
  end;

var
  fMain: TfMain;
  AppDir, MainUser: string;

implementation

uses
  IniFiles, uDataModule, uEditContacts, Winapi.ShellAPI, pingsend, uWhats,
  uContracts, uConstants;

{$R *.dfm}

procedure TfMain.AfterConstruction(Sender: TObject);
begin
  psMain.Load;
end;

procedure TfMain.ApplyFilter(AFilterSQL: string; AIsApply: Boolean);
var eFilter: string;
begin
  dm.qryContacts.Close;
  if AIsApply then
    dm.qryContacts.FilterSQL := AFilterSQL
  else dm.qryContacts.FilterSQL := '';
  try
    dm.qryContacts.Open;
    dm.qryContacts.First;
  except on E: Exception do
    ShowError('Не удалось получить данны контактов.'#13#10 + E.Message);
  end;
end;

procedure TfMain.btAddClick(Sender: TObject);
begin
  // Добавить запись
  ShowEditForm(dbmAppend);
end;

procedure TfMain.btnContractClick(Sender: TObject);
var
  frmContracts : TfrmContracts;
begin
  // Вызов формы договоров
  frmContracts := TfrmContracts.Create(nil);
  try
    frmContracts.Caption := Format('Договора: %s', [ dm.qryContacts.FieldValues['FIO'] ] );
    frmContracts.ShowModal;
  finally
    frmContracts.Free;
  end;
end;

procedure TfMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.btnPrintClick(Sender: TObject);
var
  FileName: string;
  Grid: TcxGrid;
begin
  FileName := 'Контакты.xls';

  if pgcMain.ActivePageIndex = 0 then
    Grid := grdVContacts
  else if pgcMain.ActivePageIndex = 1 then
    Grid := grdContracts;

  ExportGridToExcel(FileName, Grid, False, True, True);
  ShellExecute(0, Nil, PChar(FileName), Nil, Nil, sw_Show);

end;

procedure TfMain.btnViewClick(Sender: TObject);
begin
  if TdxBarLargeButton(Sender).Tag = 0 then
  begin
    TdxBarLargeButton(Sender).Tag := 1;
    pgcMain.ActivePage := tsOld;
  end
  else
  begin
    TdxBarLargeButton(Sender).Tag := 0;
    pgcMain.ActivePage := tsNew;
  end;
  SetEnableButtons;
end;

procedure TfMain.ButtonFilterClick(Sender: TObject);
var SQLFilter: string;
begin
  ApplyFilter('', False);
  case cbbFilter.Index of
    0: SQLFilter := '';
    1: SQLFilter := 'IS_SUPERVISER=1';                                           // Фильтр по супервайзерам
    2..8: SQLFilter := 'SPECIALIZATION CONTAINING ''' + cbbFilter.Text + '''';
  end;
  ApplyFilter(SQLFilter, True);
end;

procedure TfMain.DBConnect;
const cMsgErrorConnect = 'Ошибка соединения с БД %s'#13#10'%s';
begin
  InitConnection(dm.dbFirebird, AppDir + 'config.ini');
  try
    dm.dbFirebird.Connected := True;
    spDBInfo.Caption := Format('Соединение с БД %s', [dm.dbFirebird.Database]);
  except on E: Exception do
    Application.MessageBox(PWideChar(Format(cMsgErrorConnect, [dm.dbFirebird.Database, E.Message])),
      'Ошибка соединения', MB_OK or MB_ICONERROR);
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
var UpdateURL: string;
begin
  AppDir := IncludeTrailingPathDelimiter( ExtractFilePath(ParamStr(0)) );
  // Читаем параметры
  DBConnect;
  // Открытие таблиц
  OpenData;

  psMain.Load;
  gdvContracts.RestoreFromIniFile('gridconfig.ini');

  if PingHost(WebUpdate1.Host) <> -1 then
  begin
    if WebUpdate1.NewVersionAvailable then
    begin
      ShowMessage('Обнаружена новая версия приложения');

      // Покажем форму с текстом
      if FileExists(AppDir + 'whats.txt') then
      begin
        frmWhatsNew := TfrmWhatsNew.Create(nil);
        try
          frmWhatsNew.mWhats.Lines.LoadFromFile(AppDir + 'whats.txt');
        finally
          frmWhatsNew.Free;
        end;
      end;

      WebUpdate1.DoUpdate(True);

    end;
  end;

end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  gdvContracts.StoreToIniFile('gridconfig.ini');
  psMain.Save;
end;

procedure TfMain.gdvContractsCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  btnEditClick(nil);
end;

procedure TfMain.gdvContractsFocusedItemChanged(Sender: TcxCustomGridTableView;
  APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem);
begin
  Sender.OptionsBehavior.IncSearchItem := AFocusedItem;
end;

function TfMain.GetSQLFilter(aIndex: Integer): string;
var sSQLFilterDef: string;
begin
  case aIndex of
    2: sSQLFilterDef := 'тайный покупатель';                // тайный покупатель
    3: sSQLFilterDef := 'диспетчер колл-центра';            // call-центр
    4: sSQLFilterDef := 'фокус-группа';                     // фокус-группа
    5: sSQLFilterDef := 'уличный опрос';                    // уличный опрос
    6: sSQLFilterDef := 'поквартирный опрос';               // поквартирный опрос
    7: sSQLFilterDef := 'вбивка';                           // вбивка
    8: sSQLFilterDef := 'аутсорс';                          // аутсорс
  end;
  with TIniFile.Create( AppDir + 'config.ini' ) do
  begin
    Result := ReadString('FILTER', 'Filter' + IntToStr(aIndex), sSQLFilterDef);
    Free;
  end;
end;

function TfMain.GetUser: string;
var
  i: Integer;
begin
  with TfLogin.Create(Application) do
  begin
    try
      if ShowModal = mrOk then
        Result := UserName;
    finally
      Free;
    end;
  end;
end;

procedure TfMain.OpenData;
begin
  try
    dm.qryContacts.Open;
    dm.qryContacts.First;
  except on E: Exception do
    Application.MessageBox(PChar(Format(strNotOpenTable, ['BOOK_CONTACTS', E.Message])),
      'Ошибка открытия', MB_OK or MB_ICONERROR);
  end;
  try
    dm.tblContacts.Open;
    dm.tblContacts.First;
  except on E: Exception do
    Application.MessageBox(PChar(Format(strNotOpenTable, ['CONTACTS', E.Message])),
      'Ошибка открытия', MB_OK or MB_ICONERROR);
  end;
end;

procedure TfMain.SetEnableButtons;
var
  ViewType: Integer;
begin
  btnAdd.Enabled    := pgcMain.ActivePageIndex = 0;
  btnEdit.Enabled   := pgcMain.ActivePageIndex = 0;
  btnDelete.Enabled := pgcMain.ActivePageIndex = 0;
end;

procedure TfMain.ShowEditForm(AMode: TDBMode);
var fEdit: TfEditContacts;
var FId, FRecId: Integer;
begin
  // Изменить запись
  dm.qryContactList.Open;
  fEdit := TfEditContacts.Create(Self);
  try
    try
      if AMode = dbmAppend then
      begin
        dm.qryContactList.Append;
        try
          FRecId := GenerateID('BOOK_CONTACTS', 'BCONTACT_ID');
        except
          dm.qryContactList.Cancel;
          Exit;
        end;
        fEdit.ID := FrecId;
      end
      else if AMode = dbmEdit then
      begin
        FId := dm.qryContacts.FieldValues['BCONTACT_ID'];
        fEdit.ID := FId;
        FRecId := dm.qryContacts.FieldValues['REC_ID'];
        if dm.qryContactList.Locate('BCONTACT_ID', FId, [ loPartialKey, loCaseInsensitive ]) then
          dm.qryContactList.Edit
        else
          raise Exception.CreateFmt('Запись с кодом %d не найдена.', [FId]);
      end;
      if fEdit.ShowModal = mrOk then
      begin
        if dm.qryContactList.State in [ dsEdit ] then
          dm.qryContactList.Post;
      end
      else
      begin
        dm.qryContactList.Cancel;
      end;
      dm.qryContacts.Refresh;
      dm.qryContacts.Locate('REC_ID', FRecId, [ loPartialKey, loCaseInsensitive ]);
    except on E: Exception do
      ShowError('Не удалось сохранить данные контакта'#13#10 + E.Message);
    end;

  finally
    fEdit.Free;
  end;
end;

procedure TfMain.btnEditClick(Sender: TObject);
begin
  // Изменить запись
  ShowEditForm(dbmEdit);
end;

procedure TfMain.btnDeleteClick(Sender: TObject);
var
  Count: Integer;

function GetContactsCount(AContactID: Integer): Integer;
var
  eCount: Integer;
begin
  eCount := 0;
  with TUniQuery.Create(nil) do
  try
    Connection := dm.dbFirebird;
    SQL.Text := 'select count(*) as cnt from work_cities where contact_id = :contact_id';
    try
      ParamByName('contact_id').AsInteger := AContactID;
      Open;
      Result := FieldByName('cnt').AsInteger;
    except on E: Exception do
      ShowError('Не удалось получить данные по контакту'#13#10 + E.Message);
    end;
  finally
    Free;
  end;
end;

procedure DeleteContact(AContactID: Integer);
begin
  with TUniQuery.Create(nil) do
  try
    Connection := dm.dbFirebird;
    SQL.Text := 'delete from book_contacts where bcontact_id = :contact_id';
    try
      ParamByName('contact_id').AsInteger := AContactID;
      ExecSQL;
    except on E: Exception do
      ShowError('Не удалось удалить данные по контакту'#13#10 + E.Message);
    end;
  finally
    Free;
  end;
end;

procedure DeleteMultipleContact(AID: Integer);
begin
  with TUniQuery.Create(nil) do
  try
    Connection := dm.dbFirebird;
    SQL.Text := 'delete from work_cities where wc_id = :wc_id';
    try
      ParamByName('wc_id').AsInteger := AID;
      ExecSQL;
    except on E: Exception do
      ShowError('Не удалось удалить данные по контакту'#13#10 + E.Message);
    end;
  finally
    Free;
  end;
end;

begin
  // Удаление записи
  if MessageBox(0, 'Текущая запись будет удалена. Вы согласны ?', 'Запрос на удаление',
    MB_ICONQUESTION or MB_OKCANCEL) <> mrOk then Exit;

  Count := GetContactsCount( dm.qryContacts.FieldByName('BCONTACT_ID').AsInteger );
  if Count <= 1 then
    DeleteContact( dm.qryContacts.FieldByName('BCONTACT_ID').AsInteger )
  else if Count > 1 then
    DeleteMultipleContact( dm.qryContacts.FieldByName('WC_ID').AsInteger );
  dm.qryContacts.Refresh;
end;

procedure TfMain.cbbFilterChange(Sender: TObject);
var SQLFilter: string;
begin
  ApplyFilter('', False);
  case cbbFilter.ItemIndex of
    0: SQLFilter := '';
    1: SQLFilter := 'IS_SUPERVISER=1';                                           // Фильтр по супервайзерам
    2..8: SQLFilter := 'SPECIALIZATION CONTAINING ''' + cbbFilter.Text + '''';
  end;
  ApplyFilter(SQLFilter, True);
end;

end.
