unit uDataModule;

interface

uses
  Data.DB, System.Classes,
  UniProvider, InterBaseUniProvider, DBAccess, Uni, MemDS, DASQLMonitor,
  UniSQLMonitor, cxClasses, cxLookAndFeels;

type
  Tdm = class(TDataModule)
    dbFirebird: TUniConnection;
    qryContacts: TUniQuery;
    udsContacts: TUniDataSource;
    FirebirdProvider: TInterBaseUniProvider;
    qryContactList: TUniQuery;
    udsContactList: TUniDataSource;
    qryContactInfo: TUniQuery;
    udsContactInfo: TUniDataSource;
    qryRegions: TUniQuery;
    udsRegions: TUniDataSource;
    qryTransferInfo: TUniQuery;
    udsTransferInfo: TUniDataSource;
    tblContacts: TUniQuery;
    dsContacts: TUniDataSource;
    dbMonitor: TUniSQLMonitor;
    qryContracts: TUniQuery;
    udsContracts: TUniDataSource;
    qryTasks: TUniQuery;
    udsTasks: TUniDataSource;
    qryActs: TUniQuery;
    udsActs: TUniDataSource;
  private

  public

  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
