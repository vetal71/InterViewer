unit uDataModule;

interface

uses
  FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, Data.DB, System.Classes, DBAccess, Uni;

type
  Tdm = class(TDataModule)
    dsContacts: TUniDataSource;
    dbcFirebird: TpFIBDatabase;
    tblContacts: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
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
