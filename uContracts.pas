unit uContracts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, TB2Dock, TB2Toolbar, SpTBXItem, TB2Item, System.ImageList,
  Vcl.ImgList, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.StdCtrls, uDataModule, uDBFuncs, cxDropDownEdit, System.Generics.Collections;

type
  TfrmContracts = class(TForm)
    scMain: TScrollBox;
    pnlMain: TPanel;
    Panel1: TPanel;
    dkContracts: TSpTBXDock;
    tbContracts: TSpTBXToolbar;
    Panel2: TPanel;
    Panel3: TPanel;
    dkTasks: TSpTBXDock;
    tbTasks: TSpTBXToolbar;
    dkActs: TSpTBXDock;
    tbActs: TSpTBXToolbar;
    ilMain: TcxImageList;
    iPrint: TSpTBXItem;
    iDelete: TSpTBXItem;
    iEdit: TSpTBXItem;
    SpTBXSeparatorItem1: TSpTBXSeparatorItem;
    iAdd: TSpTBXItem;
    itAdd: TSpTBXItem;
    itEdit: TSpTBXItem;
    itDelete: TSpTBXItem;
    SpTBXSeparatorItem2: TSpTBXSeparatorItem;
    itPrint: TSpTBXItem;
    iaAdd: TSpTBXItem;
    iaEdit: TSpTBXItem;
    iaDelete: TSpTBXItem;
    SpTBXSeparatorItem3: TSpTBXSeparatorItem;
    iaPrint: TSpTBXItem;
    grdVContracts: TcxGrid;
    gdvVContracts: TcxGridDBTableView;
    gdlVContracts: TcxGridLevel;
    grdVTasks: TcxGrid;
    gdvVTasks: TcxGridDBTableView;
    gdlVTasks: TcxGridLevel;
    grdVActs: TcxGrid;
    gdvVActs: TcxGridDBTableView;
    gdlVActs: TcxGridLevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    gdvVContractsAGREEMENT_ID: TcxGridDBColumn;
    gdvVContractsCONTACT_CODE: TcxGridDBColumn;
    gdvVContractsAGREEMENT_KIND: TcxGridDBColumn;
    gdvVContractsAGREEMENT_NUM: TcxGridDBColumn;
    gdvVContractsDATE_START: TcxGridDBColumn;
    gdvVContractsDATE_FINISH: TcxGridDBColumn;
    gdvVTasksTASK_ID: TcxGridDBColumn;
    gdvVTasksAGREEMENT_ID: TcxGridDBColumn;
    gdvVTasksTASK_NUM: TcxGridDBColumn;
    gdvVTasksTASK_DATE: TcxGridDBColumn;
    gdvVTasksTASK_THEME: TcxGridDBColumn;
    gdvVTasksREGION_RESEARCH: TcxGridDBColumn;
    gdvVTasksOBJECT_RESEARCH: TcxGridDBColumn;
    gdvVTasksTASK_TARGET: TcxGridDBColumn;
    gdvVTasksTARIF: TcxGridDBColumn;
    gdvVTasksDATE_START: TcxGridDBColumn;
    gdvVTasksDATE_FINISH: TcxGridDBColumn;
    gdvVActsACT_ID: TcxGridDBColumn;
    gdvVActsTASK_ID: TcxGridDBColumn;
    gdvVActsCOUNT_ANKETA: TcxGridDBColumn;
    gdvVActsCOST: TcxGridDBColumn;
    gdvVActsACT_NUM: TcxGridDBColumn;
    gdvVActsACT_DATE: TcxGridDBColumn;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure iAddClick(Sender: TObject);
    procedure iDeleteClick(Sender: TObject);
    procedure iEditClick(Sender: TObject);
    procedure iPrintClick(Sender: TObject);
    procedure itAddClick(Sender: TObject);
    procedure itEditClick(Sender: TObject);
    procedure itDeleteClick(Sender: TObject);
    procedure itPrintClick(Sender: TObject);
    procedure iaAddClick(Sender: TObject);
    procedure iaEditClick(Sender: TObject);
    procedure iaDeleteClick(Sender: TObject);
    procedure iaPrintClick(Sender: TObject);
  private
    FVars: TDictionary<string, string>;
  private
    procedure OpenData;
    procedure ShowEditContractForm(AMode: TDBMode);
    procedure ShowEditTaskForm(AMode: TDBMode);
    procedure ShowEditActForm(AMode: TDBMode);
    procedure FillVars;
    procedure GenerateReport;
  public
    { Public declarations }
  end;

var
  frmContracts: TfrmContracts;

implementation

uses
  uMain, uEditContract, uFuncs, uConstants, uWordReport, System.IniFiles,
  uEditTask, uEditAct, LibMoney;

{$R *.dfm}

function GetTemplateFileName(AIndex: Integer): string;
begin
  case AIndex of
  0: Result := '������ �������� �� ��������������� �������.doc';
  1: Result := '������ �������� ������� ����������.doc';
  2: Result := '������ �������� �� ���� ������.doc';
  else Result := '����������� ��� ��������';
  end;
end;


procedure TfrmContracts.FormDestroy(Sender: TObject);
begin
  FVars.Free;
end;

procedure TfrmContracts.FillVars;
begin
  with FVars do
  begin
    Add('�����',         dm.qryContracts.FieldByName('AGREEMENT_NUM').AsString);
    Add('������������',  FormatDateTime( 'dd mmmm yyyy �.', dm.qryContracts.FieldByName('DATE_START').AsDateTime ) );
    Add('�������������', FormatDateTime( 'dd mmmm yyyy �.', dm.qryContracts.FieldByName('DATE_FINISH').AsDateTime ) );
    Add('������������',  FormatDateTime( 'dd mmmm yyyy �.', dm.qryContracts.FieldByName('BIRTHDATE').AsDateTime ) );
    Add('���',           dm.qryContacts.FieldByName('FIO').AsString);
    Add('������������',  dm.qryContracts.FieldByName('KIND').AsString);
    Add('�������',       dm.qryContracts.FieldByName('PASSPORT').AsString);
    Add('�����',         GetFieldValue('CONTACT_INFO', 'CONTACT_INFO_VALUE',
      Format('CIT_ID = 1 AND CONTACT_ID = %d', [ dm.qryContacts.FieldByName('BCONTACT_ID').AsInteger ])));
    Add('������������',  dm.qryTasks.FieldByName('TASK_NUM').AsString);
    Add('�����������',   FormatDateTime( 'dd mmmm yyyy �.', dm.qryTasks.FieldByName('TASK_DATE').AsDateTime ) );
    Add('������',        dm.qryTasks.FieldByName('REGION_RESEARCH').AsString);
    Add('������',        dm.qryTasks.FieldByName('OBJECT_RESEARCH').AsString);
    Add('�����������',   dm.qryTasks.FieldByName('TASK_THEME').AsString);
    Add('����������',    dm.qryTasks.FieldByName('TASK_TARGET').AsString);
    Add('�����',         dm.qryTasks.FieldByName('TARIF').AsString);
    Add('����������',    FormatDateTime( 'dd mmmm yyyy �.', dm.qryTasks.FieldByName('DATE_START').AsDateTime ) );
    Add('�������������', FormatDateTime( 'dd mmmm yyyy �.', dm.qryTasks.FieldByName('DATE_FINISH').AsDateTime ) );
    Add('���������',     dm.qryActs.FieldByName('ACT_NUM').AsString);
    Add('��������',      FormatDateTime( 'dd mmmm yyyy �.', dm.qryActs.FieldByName('ACT_DATE').AsDateTime ) );
    Add('���������������',    dm.qryActs.FieldByName('COUNT_ANKETA').AsString);
    Add('���������',         dm.qryActs.FieldByName('COST').AsString);
    Add('�������������', MoneyToStr( dm.qryActs.FieldByName('COST').AsFloat ) );
  end;
end;

procedure TfrmContracts.FormCreate(Sender: TObject);
begin
  OpenData;
  FVars := TDictionary<string, string>.Create;
end;

procedure TfrmContracts.GenerateReport;
var
  WordReport: TWordReport;
  FilePath, FileName: string;
begin
  // ������ ��������
  with TIniFile.Create(AppDir + 'config.ini') do
  try
    FilePath := ReadString('PATH', 'TemplateDir', '');
  finally
    Free;
  end;
  FilePath := IncludeTrailingPathDelimiter( FilePath );

  if not DirectoryExists(FilePath) then
    raise Exception.Create('������� � ��������� ���� �� ������.');

  FileName := GetTemplateFileName( dm.qryContracts.FieldByName('AGREEMENT_KIND').AsInteger );
  if not FileExists(FilePath + FileName) then
    raise Exception.CreateFmt('���� %s �� ������.', [ FilePath + FileName ] );

  WordReport := TWordReport.Create( FilePath + FileName );
  try
    // ���������� ����������
    FillVars;
    WordReport.SetVars(FVars);
    WordReport.Execute;
  finally
    WordReport.Free;
  end;
end;

procedure TfrmContracts.iaAddClick(Sender: TObject);
begin
  ShowEditActForm(dbmAppend);
end;

procedure TfrmContracts.iAddClick(Sender: TObject);
begin
  ShowEditContractForm(dbmAppend);
end;

procedure TfrmContracts.iaDeleteClick(Sender: TObject);
begin
  if Ask('������� ������� ��� ����������� ����� ?') then
    try
      dm.qryActs.Delete;
    except on E: Exception do
      ShowError('�� ������� ������� ��� ����������� �����.'#10#13 + E.Message);
    end;
end;

procedure TfrmContracts.iaEditClick(Sender: TObject);
begin
  ShowEditActForm(dbmEdit);
end;

procedure TfrmContracts.iaPrintClick(Sender: TObject);
begin
  iPrintClick(nil);
end;

procedure TfrmContracts.iDeleteClick(Sender: TObject);
begin
  if Ask('������� ������� ������� ?') then
    try
      dm.qryContracts.Delete;
    except on E: Exception do
      ShowError('�� ������� ������� ������� �������.'#10#13 + E.Message);
    end;
end;

procedure TfrmContracts.iEditClick(Sender: TObject);
begin
  ShowEditContractForm(dbmEdit);
end;

procedure TfrmContracts.iPrintClick(Sender: TObject);
begin
  GenerateReport;
end;

procedure TfrmContracts.itAddClick(Sender: TObject);
begin
  ShowEditTaskForm(dbmAppend);
end;

procedure TfrmContracts.itDeleteClick(Sender: TObject);
begin
  if Ask('������� ������� ������� ?') then
    try
      dm.qryTasks.Delete;
    except on E: Exception do
      ShowError('�� ������� ������� ������� �� �������� �������.'#10#13 + E.Message);
    end;
end;

procedure TfrmContracts.itEditClick(Sender: TObject);
begin
  ShowEditTaskForm(dbmEdit);
end;

procedure TfrmContracts.itPrintClick(Sender: TObject);
begin
  iPrintClick(nil)
end;

procedure TfrmContracts.OpenData;
begin
  OpenDataSet(dm.qryContracts);
  OpenDataSet(dm.qryTasks);
  OpenDataSet(dm.qryActs);
end;

procedure TfrmContracts.ShowEditActForm(AMode: TDBMode);
var fEdit: TfEditAct;
var FId: Integer;
begin
  // �������� ������
  fEdit := TfEditAct.Create(Self);
  try
    try
      if AMode = dbmAppend then
      begin
        dm.qryActs.Append;
        try
          fEdit.ID := GenerateID('ACTS', 'ACT_ID');
        except
          dm.qryActs.Cancel;
          Exit;
        end;
      end
      else if AMode = dbmEdit then
      begin
        dm.qryActs.Edit;
        FId := dm.qryActs.FieldValues['ACT_ID'];
        fEdit.ID := FId;
      end;
      if fEdit.ShowModal = mrOk then
      begin
        if dm.qryActs.State in [ dsEdit ] then
          dm.qryActs.Post;
      end
      else
      begin
        dm.qryActs.Cancel;
      end;
      dm.qryActs.Refresh;
      dm.qryActs.Locate('ACT_ID', FId, [ loPartialKey, loCaseInsensitive ]);
    except on E: Exception do
      ShowError('�� ������� ��������� ������ ���� ����������� �����.'#13#10 + E.Message);
    end;

  finally
    fEdit.Free;
  end;
end;

procedure TfrmContracts.ShowEditContractForm(AMode: TDBMode);
var fEdit: TfEditContract;
var FId: Integer;
begin
  // �������� ������
  fEdit := TfEditContract.Create(Self);
  try
    try
      if AMode = dbmAppend then
      begin
        dm.qryContracts.Append;
        try
          fEdit.ID := GenerateID('AGREEMENTS', 'AGREEMENT_ID');
        except
          dm.qryContracts.Cancel;
          Exit;
        end;
      end
      else if AMode = dbmEdit then
      begin
        dm.qryContracts.Edit;
        FId := dm.qryContracts.FieldValues['AGREEMENT_ID'];
        fEdit.ID := FId;
      end;
      if fEdit.ShowModal = mrOk then
      begin
        if dm.qryContracts.State in [ dsEdit ] then
          dm.qryContracts.Post;
      end
      else
      begin
        dm.qryContracts.Cancel;
      end;
      dm.qryContracts.Refresh;
      dm.qryContracts.Locate('AGREEMENT_ID', FId, [ loPartialKey, loCaseInsensitive ]);
    except on E: Exception do
      ShowError('�� ������� ��������� ������ ��������-�������'#13#10 + E.Message);
    end;

  finally
    fEdit.Free;
  end;
end;

procedure TfrmContracts.ShowEditTaskForm(AMode: TDBMode);
var fEdit: TfEditTask;
var FId: Integer;
begin
  // �������� ������
  fEdit := TfEditTask.Create(Self);
  try
    try
      if AMode = dbmAppend then
      begin
        dm.qryTasks.Append;
        try
          fEdit.ID := GenerateID('AGREEMENT_TASKS', 'TASK_ID');
        except
          dm.qryTasks.Cancel;
          Exit;
        end;
      end
      else if AMode = dbmEdit then
      begin
        dm.qryTasks.Edit;
        FId := dm.qryTasks.FieldValues['TASK_ID'];
        fEdit.ID := FId;
      end;
      if fEdit.ShowModal = mrOk then
      begin
        if dm.qryTasks.State in [ dsEdit ] then
          dm.qryTasks.Post;
      end
      else
      begin
        dm.qryTasks.Cancel;
      end;
      dm.qryTasks.Refresh;
      dm.qryTasks.Locate('TASK_ID', FId, [ loPartialKey, loCaseInsensitive ]);
    except on E: Exception do
      ShowError('�� ������� ��������� ������ ������� � �������� �������.'#13#10 + E.Message);
    end;

  finally
    fEdit.Free;
  end;
end;

end.
