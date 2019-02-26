unit uDBFuncs;

interface

uses
  System.IniFiles, System.SysUtils, DB,
  Uni;

type
  TOptions = packed record
    FBServerIP : string;
    FBDBName   : string;
    MADBName   : string;
    IsFirstRun : Boolean;
    TemplateDir: string;
  end;

  TDBType = (dbtFirebird, dbtMSAccess);

  TDBMode = (dbmAppend, dbmEdit);

  procedure ReadConfig(AFileName: string);
  procedure InitConnection(ADatabase: TUniConnection; AFileConfig: string);

  function GenerateID(const ATableName, AKeyName: string): Integer;
  function GetFieldValue(const ATableName, AFieldName, AWhere: string): Variant;

  procedure OpenDataSet(DataSet: TDataset);

implementation

uses
  uDataModule, uFuncs, uConstants;

var
  vOptions: TOptions;

procedure ReadConfig(AFileName: string);
begin
  // Чтение из ini
  with TIniFile.Create(AFileName) do
  begin
    vOptions.FBServerIP  := ReadString('MAIN', 'FB_SERVER_IP', 'LOCALHOST');
    vOptions.FBDBName    := ReadString('MAIN', 'FB_DBNAME', '');
    vOptions.MADBName    := ReadString('MAIN', 'MA_DBNAME', '');
    vOptions.IsFirstRun  := ReadBool('MAIN',   'FIRST_RUN', False);
    vOptions.TemplateDir := ReadString('PATH', 'TemplateDir', '');
  end;
end;

procedure InitConnection(ADatabase: TUniConnection; AFileConfig: string);
var
  ConnectionStr: string;
begin
  ReadConfig(AFileConfig);
  with ADatabase do
  begin
    begin
      if vOptions.FBServerIP > '' then
        Server := vOptions.FBServerIP;
      if vOptions.FBDBName > '' then
        Database := vOptions.FBDBName;
    end;
  end;
end;

function GenerateID(const ATableName, AKeyName: string): Integer;
const
  cUpdate = 'execute procedure upd_sequence(:p1, :p2)';
  cSelect = 'select s.seq_value from sequences s where s.seq_table = ''%s''';
begin
  Result := 0;
  // обновление
  with TUniQuery.Create(nil) do
  try
    Connection := dm.dbFirebird;
    SQL.Text   := cUpdate;
    ParamByName('p1').AsString := ATableName;
    ParamByName('p2').AsString := AKeyName;

    try
      ExecSQL;
    except on E: Exception do
      ShowError('Не удалось обновить генератор.'#13#10 + E.Message);
    end;
    SQL.Text := Format(cSelect, [ ATableName ]);
    try
      Open;
    except on E: Exception do
      ShowError('Не удалось сгенерировать новый код.'#13#10 + E.Message);
    end;
    if not IsEmpty then
      Result := Fields[ 0 ].AsInteger;
  finally
    Free;
  end;
end;

function GetFieldValue(const ATableName, AFieldName, AWhere: string): Variant;
var
  sWhere: string;
begin
  with TUniQuery.Create(nil) do
  try
    Connection := dm.dbFirebird;
    sWhere := AWhere;
    if AWhere.IsEmpty then
      sWhere := '1=1';
    SQL.Text := Format('select %s from %s where %s', [ AFieldName, ATableName, AWhere ] );
    try
      Open;
      Result := Fields[ 0 ].AsVariant;
    except on E: Exception do
      ShowError('Не удалось сгенерировать новый код.'#13#10 + E.Message);
    end;
  finally
    Free;
  end;
end;

procedure OpenDataSet(DataSet: TDataset);
begin
  try
    DataSet.Open;
    DataSet.First;
  except on E: Exception do
    ShowError(Format(strNotOpenTable, ['AGREEMENTS', E.Message]));
  end;
end;

end.
