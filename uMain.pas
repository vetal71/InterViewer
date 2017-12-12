unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Forms, Vcl.Dialogs,
  System.Variants, System.Classes, Vcl.Graphics, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView, pFIBDataSet,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.Buttons, Vcl.ExtCtrls, RzPanel, RzStatus, Vcl.Controls, Vcl.Mask,
  Vcl.DBCtrls, RzCommon, cxCheckBox, cxGridExportLink, WUpdate, pFIBQuery, uLogin,
  System.StrUtils, pFIBProps, uFuncs, uDBFuncs, dxBarBuiltInMenu, cxPC, RzTabs;

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
    pnlButton: TRzPanel;
    btnAdd: TSpeedButton;
    btnEdit: TSpeedButton;
    btnDelete: TSpeedButton;
    btnExit: TSpeedButton;
    btnPrint: TSpeedButton;
    pnlFilter: TRzPanel;
    btnSuperVizer: TSpeedButton;
    btnHidenBuyer: TSpeedButton;
    btnOperator: TSpeedButton;
    btnFocusGroup: TSpeedButton;
    btnStreetInterview: TSpeedButton;
    btnFlatInterview: TSpeedButton;
    btnWriters: TSpeedButton;
    btnOutSource: TSpeedButton;
    btnContract: TSpeedButton;
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
    splInfo: TSplitter;
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
    pnlAddInfo: TRzPanel;
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
    btnView: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure gdvContractsCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ButtonFilterClick(Sender: TObject);
    procedure ButtonFilterDblClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnContractClick(Sender: TObject);
    procedure gdvContractsFocusedItemChanged(Sender: TcxCustomGridTableView;
      APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem);
    procedure btnViewClick(Sender: TObject);
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
  IniFiles, uDataModule, uEditContacts, Winapi.ShellAPI, pingsend, uWhats;

{$R *.dfm}

procedure TfMain.AfterConstruction(Sender: TObject);
begin
  psMain.Load;
end;

procedure TfMain.ApplyFilter(AFilterSQL: string; AIsApply: Boolean);
var eFilter: string;
begin
  dm.tblContacts.Close;
  if AIsApply then
    dm.tblContacts.MainWhereClause := AFilterSQL
  else dm.tblContacts.MainWhereClause := '';
  dm.tblContacts.Open;
  dm.tblContacts.First;
end;

procedure TfMain.btnAddClick(Sender: TObject);
begin
  // Добавить запись
  ShowEditForm(dbmAppend);
end;

procedure TfMain.btnContractClick(Sender: TObject);
const cFileName = 'договор.doc';
begin
  if FileExists(AppDir + cFileName) then
    ShellExecute(0, Nil, PChar(cFileName), Nil, Nil, sw_Show)
  else Application.MessageBox(PWideChar(Format(
      'Файл договора (%s) отсутствует в каталоге.', [cFileName])),
      'Ошибка соединения', MB_OK or MB_ICONERROR);
end;

procedure TfMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.btnPrintClick(Sender: TObject);
var FileName: string;

begin
  FileName := 'Контакты.xls';
  ExportGridToExcel(FileName, grdContracts, False, True, True);
  ShellExecute(0, Nil, PChar(FileName), Nil, Nil, sw_Show);

end;

procedure TfMain.btnViewClick(Sender: TObject);
begin
  if string(TSpeedButton(Sender).Caption).Equals('Старый вариант') then
  begin
    TSpeedButton(Sender).Caption := 'Новый вариант';
    pgcMain.ActivePage := tsOld;
  end
  else
  begin
    TSpeedButton(Sender).Caption := 'Старый вариант';
    pgcMain.ActivePage := tsNew;
  end;
  SetEnableButtons;
end;

procedure TfMain.ButtonFilterClick(Sender: TObject);
var SQLFilter: string;
begin
  ApplyFilter('', False);
  if not (Sender is TSpeedButton) then Exit;

  case TSpeedButton(Sender).Tag of
    1: SQLFilter := 'ISSUPERVIZER=1';                                           // Фильтр по супервайзерам
    2..8: SQLFilter := 'SPECIALIZATION CONTAINING ''' + GetSQLFilter(TSpeedButton(Sender).Tag) + '''';
  end;
  ApplyFilter(SQLFilter, TSpeedButton(Sender).Down);
end;

procedure TfMain.ButtonFilterDblClick(Sender: TObject);
var sSQLFilterDef, sSQLFilterNew: string;
var aIndex: Integer;
begin
  // При двойном клике на кнопке - изменение фильтра
  if not (Sender is TSpeedButton) then Exit;
  aIndex := TSpeedButton(Sender).Tag;
  sSQLFilterDef := GetSQLFilter(aIndex);

  sSQLFilterNew := InputBox('Фильтр', 'Введите новое значение фильтра', sSQLFilterDef);
  with TIniFile.Create( AppDir + 'config.ini' ) do
  begin
    WriteString('FILTER', 'Filter' + IntToStr(aIndex), sSQLFilterNew);
  end;
end;

procedure TfMain.DBConnect;
const cMsgErrorConnect = 'Ошибка соединения с БД %s';
begin
  InitConnection(dm.dbcFirebird, AppDir + 'config.ini');
  try
    dm.dbcFirebird.Connected := True;
    spDBInfo.Caption := 'Соединение с БД успешно';
  except
    Application.MessageBox(PWideChar(Format(cMsgErrorConnect, [dm.dbcFirebird.DBName])),
      'Ошибка соединения', MB_OK or MB_ICONERROR);
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
var UpdateURL: string;
begin
  AppDir := IncludeTrailingPathDelimiter( ExtractFilePath(ParamStr(0)) );
  // Читаем параметры
  DBConnect;
  // Получаем список пользователей
//  MainUser := GetUser;
//  if MainUser = 'admin' then
//    Exit;

  // Открытие таблиц
  OpenData;

  psMain.Load;
  gdvContracts.RestoreFromIniFile('gridconfig.ini');

  if PingHost(WebUpdate1.Host) <> -1 then
  begin
    if WebUpdate1.NewVersionAvailable then
    begin
      ShowMessage('Обнаружена новая версия приложения');
      WebUpdate1.DoUpdate(True);

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
    dm.tblVContacts.Open;
    dm.tblVContacts.First;
  except
    Application.MessageBox('Не удалось открыть таблицу BOOK_CONTACTS',
      'Ошибка открытия', MB_OK or MB_ICONERROR);
  end;
  try
    dm.tblContacts.Open;
    dm.tblContacts.First;
  except
    Application.MessageBox('Не удалось открыть таблицу CONTACTS',
      'Ошибка открытия', MB_OK or MB_ICONERROR);
  end;
end;

procedure TfMain.SetEnableButtons;
var
  ViewType: Integer;
begin
  btnAdd.Enabled := pgcMain.ActivePageIndex = 0;
  btnEdit.Enabled := pgcMain.ActivePageIndex = 0;
  btnDelete.Enabled := pgcMain.ActivePageIndex = 0;
end;

procedure TfMain.ShowEditForm(AMode: TDBMode);
var fEdit: TfEditContacts;
var eBookmark: TBookmark;
var FId: Integer;
begin
  // Изменить запись
  eBookmark := dm.tblVContacts.GetBookmark;
  dm.dtContactList.Open;
  fEdit := TfEditContacts.Create(Self);
  try
    dm.trWrite.StartTransaction;
    if AMode = dbmAppend then
    begin
      dm.dtContactList.Append;
    end
    else if AMode = dbmEdit then
    begin
      FId := dm.tblVContacts.FieldValues['BCONTACT_ID'];
      if dm.dtContactList.Locate('BCONTACT_ID', FId, [ loPartialKey, loCaseInsensitive ]) then
        dm.dtContactList.Edit
      else
        raise Exception.CreateFmt('Запись с кодом %d не найдена.', [FId]);
    end;
    if fEdit.ShowModal = mrOk then
    begin
      if dm.dtContactList.State in [dsEdit, dsInsert] then
        dm.dtContactList.Post;
      if dm.dtContactInfo.State in [dsEdit, dsInsert] then
        dm.dtContactInfo.Post;
      if dm.dtRegions.State in [dsEdit, dsInsert] then
        dm.dtRegions.Post;
      if dm.dtTransferInfo.State in [dsEdit, dsInsert] then
        dm.dtTransferInfo.Post;

      dm.trWrite.Commit;
      if AMode = dbmEdit then dm.tblVContacts.GotoBookmark(eBookmark);
    end
    else
    begin
      dm.dtContactList.Cancel;
      dm.trWrite.Rollback;
      dm.tblVContacts.GotoBookmark(eBookmark);
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
begin
  // Удаление записи
  if MessageBox(0, 'Текущая запись будет удалена. Вы согласны ?', 'Запрос на удаление',
    MB_ICONQUESTION or MB_OKCANCEL) <> mrOk then Exit;
  dm.trWrite.StartTransaction;
  try
    dm.tblContacts.Delete;
    dm.trWrite.Commit;
  except
    dm.trWrite.Rollback;
  end;
end;

end.
