unit uDBFuncs;

interface

uses
  System.IniFiles, System.SysUtils,
  Uni;

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
  procedure InitConnection(ADatabase: TUniConnection; AFileConfig: string);

implementation

var
  vOptions: TOptions;

procedure ReadConfig(AFileName: string);
begin
  // Чтение из ini
  with TIniFile.Create(AFileName) do
  begin
    vOptions.FBServerIP := ReadString('MAIN', 'FB_SERVER_IP', 'LOCALHOST');
    vOptions.FBDBName   := ReadString('MAIN', 'FB_DBNAME', '');
    vOptions.MADBName   := ReadString('MAIN', 'MA_DBNAME', '');
    vOptions.IsFirstRun := ReadBool('MAIN', 'FIRST_RUN', False);
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

end.
