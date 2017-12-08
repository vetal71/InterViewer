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
  System.StrUtils, pFIBProps, uFuncs, uDBFuncs, dxBarBuiltInMenu, cxPC;

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
    pgcMain: TcxPageControl;
    tsNew: TcxTabSheet;
    tsOld: TcxTabSheet;
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
    pnlMain_: TRzPanel;
    pnlGrid_: TRzPanel;
    splInfo_: TSplitter;
    pnlInfo_: TRzPanel;
    lbl11: TLabel;
    btnContract: TSpeedButton;
    grdVContacts: TcxGrid;
    gdvVContacts: TcxGridDBTableView;
    gdlVContacts: TcxGridLevel;
    gdvVContactsBCONTACT_ID: TcxGridDBColumn;
    gdvVContactsFIO: TcxGridDBColumn;
    gdvVContactsGENDER: TcxGridDBColumn;
    gdvVContactsNOTES: TcxGridDBColumn;
    gdvVContactsBIRTHDAY: TcxGridDBColumn;
    gdvVContactsPASSPORT: TcxGridDBColumn;
    gdvVContactsSPECIALIZATION: TcxGridDBColumn;
    gdvVContactsPROJECT_LIST: TcxGridDBColumn;
    gdvVContactsLAST_DATE: TcxGridDBColumn;
    gdvVContactsAMOUNT_FORMS: TcxGridDBColumn;
    gdvVContactsPERCENT_GOOD_FORMS: TcxGridDBColumn;
    gdvVContactsPERCENT_BAD_FORMS: TcxGridDBColumn;
    gdvVContactsCHARACTERISTICS: TcxGridDBColumn;
    gdvVContactsIS_SUPERVISER: TcxGridDBColumn;
    gdvVContactsIS_IN_BLACK_LIST: TcxGridDBColumn;
    gdvVContactsSOCIAL_NUMBER: TcxGridDBColumn;
    gdvVContactsREGION_NAME: TcxGridDBColumn;
    gdvVContactsCITY_NAME: TcxGridDBColumn;
    gdvVContactsADDRESS: TcxGridDBColumn;
    gdvVContactsCELURAR: TcxGridDBColumn;
    gdvVContactsHOMEPHONE: TcxGridDBColumn;
    gdvVContactsEMAIL: TcxGridDBColumn;
    gdvVContactsSOCIALNET: TcxGridDBColumn;
    gdvVContactsTRANSFERS: TcxGridDBColumn;
    lbl12: TLabel;
    edtEMAIL_: TDBEdit;
    lbl13: TLabel;
    edtSOCIALNET: TDBEdit;
    edtPASSPORT_: TDBEdit;
    lbl14: TLabel;
    edtADDRESS_: TDBEdit;
    lbl15: TLabel;
    lbl16: TLabel;
    edtSPECIALIZATION_: TDBEdit;
    lbl17: TLabel;
    edtTRANSFERS: TDBEdit;
    lbl19: TLabel;
    dbmmoGENERALCHARACTERISTIC_: TDBMemo;
    lbl20: TLabel;
    dbmmoCURRENTNOTES_: TDBMemo;
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
  private
    Options: TOptions;
    IsFirstRun: Boolean;
    procedure DBConnect;
    procedure OpenData;
    procedure ShowEditForm(AMode: TDBMode);
    procedure ApplyFilter(AFilterSQL: string; AIsApply: Boolean);
    function GetSQLFilter(aIndex: Integer): string;
    function GetUser: string;
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
  // �������� ������
  ShowEditForm(dbmAppend);
end;

procedure TfMain.btnContractClick(Sender: TObject);
const cFileName = '�������.doc';
begin
  if FileExists(AppDir + cFileName) then
    ShellExecute(0, Nil, PChar(cFileName), Nil, Nil, sw_Show)
  else Application.MessageBox(PWideChar(Format(
      '���� �������� (%s) ����������� � ��������.', [cFileName])),
      '������ ����������', MB_OK or MB_ICONERROR);
end;

procedure TfMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.btnPrintClick(Sender: TObject);
var FileName: string;

begin
  FileName := '��������.xls';
  ExportGridToExcel(FileName, grdContracts, False, True, True);
  ShellExecute(0, Nil, PChar(FileName), Nil, Nil, sw_Show);

end;

procedure TfMain.ButtonFilterClick(Sender: TObject);
var SQLFilter: string;
begin
  ApplyFilter('', False);
  if not (Sender is TSpeedButton) then Exit;

  case TSpeedButton(Sender).Tag of
    1: SQLFilter := 'ISSUPERVIZER=1';                                           // ������ �� �������������
    2..8: SQLFilter := 'SPECIALIZATION CONTAINING ''' + GetSQLFilter(TSpeedButton(Sender).Tag) + '''';
  end;
  ApplyFilter(SQLFilter, TSpeedButton(Sender).Down);
end;

procedure TfMain.ButtonFilterDblClick(Sender: TObject);
var sSQLFilterDef, sSQLFilterNew: string;
var aIndex: Integer;
begin
  // ��� ������� ����� �� ������ - ��������� �������
  if not (Sender is TSpeedButton) then Exit;
  aIndex := TSpeedButton(Sender).Tag;
  sSQLFilterDef := GetSQLFilter(aIndex);

  sSQLFilterNew := InputBox('������', '������� ����� �������� �������', sSQLFilterDef);
  with TIniFile.Create( AppDir + 'config.ini' ) do
  begin
    WriteString('FILTER', 'Filter' + IntToStr(aIndex), sSQLFilterNew);
  end;
end;

procedure TfMain.DBConnect;
const cMsgErrorConnect = '������ ���������� � �� %s';
begin
  InitConnection(dm.dbcFirebird, AppDir + 'config.ini');
  try
    dm.dbcFirebird.Connected := True;
    spDBInfo.Caption := '���������� � �� �������';
  except
    Application.MessageBox(PWideChar(Format(cMsgErrorConnect, [dm.dbcFirebird.DBName])),
      '������ ����������', MB_OK or MB_ICONERROR);
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
var UpdateURL: string;
begin
  AppDir := IncludeTrailingPathDelimiter( ExtractFilePath(ParamStr(0)) );
  // ������ ���������
  DBConnect;
  // �������� ������ �������������
//  MainUser := GetUser;
//  if MainUser = 'admin' then
//    Exit;

  // �������� ������
  OpenData;

  psMain.Load;
  gdvContracts.RestoreFromIniFile('gridconfig.ini');

  if PingHost(WebUpdate1.Host) <> -1 then
  begin
    if WebUpdate1.NewVersionAvailable then
    begin
      ShowMessage('���������� ����� ������ ����������');
      WebUpdate1.DoUpdate(True);

      // ������� ����� � �������
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
    2: sSQLFilterDef := '������ ����������';                // ������ ����������
    3: sSQLFilterDef := '��������� ����-������';            // call-�����
    4: sSQLFilterDef := '�����-������';                     // �����-������
    5: sSQLFilterDef := '������� �����';                    // ������� �����
    6: sSQLFilterDef := '������������ �����';               // ������������ �����
    7: sSQLFilterDef := '������';                           // ������
    8: sSQLFilterDef := '�������';                          // �������
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
    Application.MessageBox('�� ������� ������� ������� CONTACTS',
      '������ ��������', MB_OK or MB_ICONERROR);
  end;
end;

procedure TfMain.ShowEditForm(AMode: TDBMode);
var fEdit: TfEditContacts;
var eBookmark: TBookmark;
begin
  // �������� ������
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
  // �������� ������
  ShowEditForm(dbmEdit);
end;

procedure TfMain.btnDeleteClick(Sender: TObject);
begin
  // �������� ������
  if MessageBox(0, '������� ������ ����� �������. �� �������� ?', '������ �� ��������',
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
