unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Forms, Vcl.Dialogs,
  System.Variants, System.Classes, Vcl.Graphics, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.Buttons, Vcl.ExtCtrls, RzPanel, RzStatus, Vcl.Controls, Vcl.Mask,
  Vcl.DBCtrls, RzCommon, cxCheckBox, cxGridExportLink, WUpdate;

type
  TOptions = packed record
    FBServerIP : string;
    FBDBName   : string;
    MADBName   : string;
  end;

  TDBType = (dbtFirebird, dbtMSAccess);

  TDBMode = (dbmAppend, dbmEdit);

type
  TfMain = class(TForm)
    alActions: TActionList;
    aConvert: TAction;
    sbMain: TRzStatusBar;
    spText: TRzStatusPane;
    RzClockStatus1: TRzClockStatus;
    spDBInfo: TRzStatusPane;
    pnlMain: TRzPanel;
    pnlGrid: TRzPanel;
    splInfo: TSplitter;
    pnlAddInfo: TRzPanel;
    Label1: TLabel;
    pnlButton: TRzPanel;
    pnlData: TRzPanel;
    grdContracts: TcxGrid;
    gdvContracts: TcxGridDBTableView;
    gdvContractsCODE: TcxGridDBColumn;
    gdvContractsFIO: TcxGridDBColumn;
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
    gdvContractsMEMBERPROJECTS: TcxGridDBColumn;
    gdvContractsDATELAST: TcxGridDBColumn;
    gdvContractsCOUNTANKETA: TcxGridDBColumn;
    gdvContractsPERCENTGOOD: TcxGridDBColumn;
    gdvContractsPERCENTBAD: TcxGridDBColumn;
    gdvContractsGENERALCHARACTERISTIC: TcxGridDBColumn;
    gdvContractsISSUPERVIZER: TcxGridDBColumn;
    gdlContracts: TcxGridLevel;
    btnAdd: TSpeedButton;
    btnImport: TSpeedButton;
    btnEdit: TSpeedButton;
    btnDelete: TSpeedButton;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBMemo2: TDBMemo;
    btnExit: TSpeedButton;
    psMain: TRzPropertyStore;
    rifMain: TRzRegIniFile;
    pbsImport: TRzProgressStatus;
    spProgress: TRzStatusPane;
    pnlFilter: TRzPanel;
    btnSuperVizer: TSpeedButton;
    btnPrint: TSpeedButton;
    btnHidenBuyer: TSpeedButton;
    btnOperator: TSpeedButton;
    btnFocusGroup: TSpeedButton;
    btnStreetInterview: TSpeedButton;
    btnFlatInterview: TSpeedButton;
    btnWriters: TSpeedButton;
    btnOutSource: TSpeedButton;
    btnContract: TSpeedButton;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    verInfo: TRzVersionInfo;
    WebUpdate1: TWebUpdate;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aPrint: TAction;
    procedure aConvertExecute(Sender: TObject);
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
  private
    Options: TOptions;
    IsFirstRun: Boolean;
    procedure ReadIni;
    procedure DBConnect;
    procedure InitConnection(ADBType: TDBType);
//    procedure ImportData;
    procedure OpenData;
    procedure ShowEditForm(AMode: TDBMode);
    procedure ApplyFilter(AFilterSQL: string; AIsApply: Boolean);
    function GetSQLFilter(aIndex: Integer): string;
  public
    procedure AfterConstruction(Sender: TObject); overload;
  end;

var
  fMain: TfMain;
  AppDir: string;

implementation

uses
  IniFiles, uDataModule, uEditContacts, Winapi.ShellAPI, pingsend, uWhats;

{$R *.dfm}

procedure TfMain.aConvertExecute(Sender: TObject);
begin
  // Импортирование данных
  //ImportData
end;

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
  InitConnection(dbtFirebird);
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
  ReadIni;
  // Коннектимся
  DBConnect;
  // Открытие таблиц
  OpenData;
  btnImport.Visible := IsFirstRun or (dm.tblContacts.RecordCount = 0);
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
(*
procedure TfMain.ImportData;
var
  i: Integer;
begin
  // Импорт данных
  if InputBox('Безопасность', 'Введите пароль:', '') <> '6486451' then
  begin
    Application.MessageBox('У вас нет прав для выполнения данной операции.',
      'Нарушение прав доступа', MB_OK or MB_ICONERROR);
    Exit;
  end;

  if MessageBox(0, 'Текущие данные будут удалены. Вы согласны ?', 'Импорт данных',
    MB_ICONQUESTION or MB_OKCANCEL) <> mrOk then Exit;
  // Импорт таблицы Контактные данные
  try
    with dm do
    begin
      if tblContacts.Active then tblContacts.Close;
      // Копирование
      tblAContacts.Active := True;
      tblAContacts.First;
      tblContacts.Open;
      tblContacts.DisableControls;
      // Удаление данных
      dbcFirebird.ExecSQL('DELETE FROM CONTACTS');
      // сброс генератора
      dbcFirebird.ExecSQL('SET GENERATOR GEN_CONTACTS_ID TO 0');
      i := 0;
      while not tblAContacts.Eof do
      begin
        tblContacts.Insert;
        try
          spProgress.Caption := Format('Импорт: %s', [tblAContacts.FieldByName('ФИО').AsString]);
          spProgress.Update;
          tblContacts.FieldByName('FIO').AsString            := tblAContacts.FieldByName('ФИО').AsString;
          tblContacts.FieldByName('CURRENTNOTES').AsString   := tblAContacts.FieldByName('Текущие пометки').AsString;
          tblContacts.FieldByName('SEX').AsString            := tblAContacts.FieldByName('Пол').AsString;
          tblContacts.FieldByName('REGION').AsString         := tblAContacts.FieldByName('Область').AsString;
          tblContacts.FieldByName('CITY').AsString           := tblAContacts.FieldByName('Город').AsString;
          tblContacts.FieldByName('BIRTHDATE').AsString      := tblAContacts.FieldByName('Дата рождения').AsString;
          tblContacts.FieldByName('CELURARPHONE').AsString   := tblAContacts.FieldByName('Мобильный телефон').AsString;
          tblContacts.FieldByName('HOMEPHONE').AsString      := tblAContacts.FieldByName('Домашний телефон').AsString;
          tblContacts.FieldByName('EMAIL').AsString          := tblAContacts.FieldByName('Электронная почта').AsString;
          tblContacts.FieldByName('OTHERTYPELINKS').AsString := tblAContacts.FieldByName('Другие способы связи').AsString;
          tblContacts.FieldByName('ADDRESS').AsString        := tblAContacts.FieldByName('Адрес проживания').AsString;
          tblContacts.FieldByName('PASSPORT').AsString       := tblAContacts.FieldByName('Паспортные данные').AsString;
          tblContacts.FieldByName('SPECIALIZATION').AsString := tblAContacts.FieldByName('Специализация').AsString;
          tblContacts.FieldByName('TRANSFERTYPE').AsString   := tblAContacts.FieldByName('Способ перевода').AsString;
          tblContacts.FieldByName('NUMBERCARD').AsString     := tblAContacts.FieldByName('Номер банковской карты').AsString;
          tblContacts.FieldByName('MEMBERPROJECTS').AsString := tblAContacts.FieldByName('Участие в проектах').AsString;
          tblContacts.FieldByName('DATELAST').AsString       := tblAContacts.FieldByName('Дата последнего участия').AsString;
          tblContacts.FieldByName('COUNTANKETA').AsString    := tblAContacts.FieldByName('Количество сделанных анкет').AsString;
          tblContacts.FieldByName('PERCENTGOOD').AsString    := tblAContacts.FieldByName('Процент качественных').AsString;
          tblContacts.FieldByName('PERCENTBAD').AsString     := tblAContacts.FieldByName('Процент брака').AsString;
          tblContacts.FieldByName('GENERALCHARACTERISTIC').AsString := tblAContacts.FieldByName('Общая характеристика').AsString;
          tblContacts.FieldByName('ISSUPERVIZER').AsInteger := 0;
          tblContacts.Post;
          Inc(i);
        except
          tblContacts.Cancel;
        end;
        tblAContacts.Next;
      end;
      // Супервайзеры
      tblASuperVizer.Open;
      tblASuperVizer.First;
      while not tblASuperVizer.Eof do
      begin
        tblContacts.Insert;
        try
          spProgress.Caption := Format('Импорт: %s', [tblASuperVizer.FieldByName('ФИО').AsString]);
          spProgress.Update;
          tblContacts.FieldByName('FIO').AsString            := tblASuperVizer.FieldByName('ФИО').AsString;
          tblContacts.FieldByName('CURRENTNOTES').AsString   := tblASuperVizer.FieldByName('Общая характеристика1').AsString;
          //tblContacts.FieldByName('SEX').AsString            := tblASuperVizer.FieldByName('Пол').AsString;
          tblContacts.FieldByName('REGION').AsString         := tblASuperVizer.FieldByName('Область').AsString;
          tblContacts.FieldByName('CITY').AsString           := tblASuperVizer.FieldByName('Город').AsString;
          tblContacts.FieldByName('BIRTHDATE').AsString      := tblASuperVizer.FieldByName('Дата рождения').AsString;
          tblContacts.FieldByName('CELURARPHONE').AsString   := tblASuperVizer.FieldByName('Мобильный телефон').AsString;
          tblContacts.FieldByName('HOMEPHONE').AsString      := tblASuperVizer.FieldByName('Домашний телефон').AsString;
          tblContacts.FieldByName('EMAIL').AsString          := tblASuperVizer.FieldByName('Электронная почта').AsString;
          tblContacts.FieldByName('OTHERTYPELINKS').AsString := tblASuperVizer.FieldByName('Другие способы связи').AsString;
          tblContacts.FieldByName('ADDRESS').AsString        := tblASuperVizer.FieldByName('Адрес проживания').AsString;
          tblContacts.FieldByName('PASSPORT').AsString       := tblASuperVizer.FieldByName('Паспортные данные').AsString;
  //        tblContacts.FieldByName('SPECIALIZATION').AsString := tblASuperVizer.FieldByName('Специализация').AsString;
          tblContacts.FieldByName('TRANSFERTYPE').AsString   := tblASuperVizer.FieldByName('Способ перевода').AsString;
          tblContacts.FieldByName('NUMBERCARD').AsString     := Trim(tblASuperVizer.FieldByName('Номер банковской карты').AsString) + ',' +
                                                                Trim(tblASuperVizer.FieldByName('Номер банковской карты1').AsString);
          tblContacts.FieldByName('MEMBERPROJECTS').AsString := Trim(tblASuperVizer.FieldByName('Проекты').AsString) + ',' +
                                                                Trim(tblASuperVizer.FieldByName('Участие в проектах').AsString);
          tblContacts.FieldByName('DATELAST').AsString       := tblASuperVizer.FieldByName('Дата последнего участия').AsString;
          tblContacts.FieldByName('COUNTANKETA').AsString    := tblASuperVizer.FieldByName('Количество сделанных анкет').AsString;
          tblContacts.FieldByName('PERCENTGOOD').AsString    := tblASuperVizer.FieldByName('Процент качественных').AsString;
          tblContacts.FieldByName('PERCENTBAD').AsString     := tblASuperVizer.FieldByName('Процент брака').AsString;
          tblContacts.FieldByName('GENERALCHARACTERISTIC').AsString := tblASuperVizer.FieldByName('Общая характеристика').AsString;
          tblContacts.FieldByName('ISSUPERVIZER').AsInteger := 1;
          tblContacts.Post;
          Inc(i);
        except
          tblContacts.Cancel;
        end;
        tblASuperVizer.Next;
      end;
      tblContacts.EnableControls;
      spProgress.Caption := '';
      ShowMessageFmt('Добавлено %d записей.', [ i ]);
      // Изменим параметр IsFirstRun
      TIniFile.Create(AppDir + 'config.ini').WriteBool('MAIN', 'FIRST_RUN', False);
      btnImport.Visible := False;
      tblContacts.First;
    end;
  except on E:Exception do
    begin
      E.Message := Format('Ошибка при импорте данных.'#10#13+'%s', [E.Message]);
      Application.MessageBox(PWideChar(E.Message), 'Ошибка импорта', MB_OK or MB_ICONERROR);
    end;
  end;
end;
*)

procedure TfMain.InitConnection(ADBType: TDBType);
var
  ConnectionStr: string;
begin
  with dm do
  begin
    case ADBType of
    dbtFirebird:
      begin
        if Options.FBServerIP > '' then
          ConnectionStr := Options.FBServerIP + ':';
        if Options.FBDBName > '' then
          ConnectionStr := ConnectionStr + Options.FBDBName;
        dbcFirebird.DBName := ConnectionStr;
        if ConnectionStr = '' then
          raise Exception.Create('В файле настроек не указан путь к базе данных.');
      end;
    end;
  end;
end;

procedure TfMain.OpenData;
begin
  try
    dm.tblContacts.Open;
    dm.tblContacts.First;
  except
    Application.MessageBox('Не удалось открыть таблицу CONTACTS',
      'Ошибка открытия', MB_OK or MB_ICONERROR);
  end;
end;

procedure TfMain.ReadIni;
begin
  // Чтение из ini
  with TIniFile.Create(AppDir + 'config.ini') do
  begin
    Options.FBServerIP := ReadString('MAIN', 'FB_SERVER_IP', 'LOCALHOST');
    Options.FBDBName   := ReadString('MAIN', 'FB_DBNAME', '');
    Options.MADBName   := ReadString('MAIN', 'MA_DBNAME', '');
    IsFirstRun         := ReadBool('MAIN', 'FIRST_RUN', False);
  end;
end;

procedure TfMain.ShowEditForm(AMode: TDBMode);
var fEdit: TfEditContacts;
var eBookmark: TBookmark;
begin
  // Изменить запись
  eBookmark := dm.tblContacts.GetBookmark;
  fEdit := TfEditContacts.Create(Self);
  try
    dm.trWrite.StartTransaction;
    if AMode = dbmAppend then dm.tblContacts.Append;
    if AMode = dbmEdit then
    begin
      dm.tblContacts.Edit;
      fEdit.chbSpecialization.EditValue := fEdit.edtSpecialization.Text;
    end;
    if fEdit.ShowModal = mrOk then
    begin
      dm.tblContacts.FieldByName('SPECIALIZATION').AsString := fEdit.chbSpecialization.Text;
      dm.tblContacts.Post;
      dm.trWrite.Commit;
      if AMode = dbmEdit then dm.tblContacts.GotoBookmark(eBookmark);
    end
    else
    begin
      dm.tblContacts.Cancel;
      dm.trWrite.Rollback;
      dm.tblContacts.GotoBookmark(eBookmark);
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
