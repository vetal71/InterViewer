unit uDBFuncs;

interface

uses
  System.IniFiles, System.SysUtils,
  pFIBDatabase;

type
  TOptions = packed record
    FBServerIP : string;
    FBDBName   : string;
    MADBName   : string;
    IsFirstRun : Boolean;
  end;

  TDBType = (dbtFirebird, dbtMSAccess);

  TDBMode = (dbmAppend, dbmEdit);

  procedure ReadConfig(AFileName: string);
  procedure InitConnection(ADatabase: TpFIBDatabase; AFileConfig: string);

implementation

var
  Options: TOptions;

procedure ReadConfig(AFileName: string);
begin
  // Чтение из ini
  with TIniFile.Create(AFileName) do
  begin
    Options.FBServerIP := ReadString('MAIN', 'FB_SERVER_IP', 'LOCALHOST');
    Options.FBDBName   := ReadString('MAIN', 'FB_DBNAME', '');
    Options.MADBName   := ReadString('MAIN', 'MA_DBNAME', '');
    Options.IsFirstRun := ReadBool('MAIN', 'FIRST_RUN', False);
  end;
end;

procedure InitConnection(ADatabase: TpFIBDatabase; AFileConfig: string);
var
  ConnectionStr: string;
begin
  ReadConfig(AFileConfig);
  with ADatabase do
  begin
    begin
      if Options.FBServerIP > '' then
        ConnectionStr := Options.FBServerIP + ':';
      if Options.FBDBName > '' then
        ConnectionStr := ConnectionStr + Options.FBDBName;
      DBName := ConnectionStr;
      if ConnectionStr = '' then
        raise Exception.Create('В файле настроек не указан путь к базе данных.');
    end;
  end;
end;

end.
