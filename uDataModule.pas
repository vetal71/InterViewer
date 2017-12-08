unit uDataModule;

interface

uses
  FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, Data.DB, System.Classes, FIBSQLMonitor, FIBQuery, pFIBQuery;

type
  Tdm = class(TDataModule)
    dsContacts: TDataSource;
    dbcFirebird: TpFIBDatabase;
    tblContacts: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    tblVContacts: TpFIBDataSet;
    dsVContacts: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
