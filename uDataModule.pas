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
    dtContactList: TpFIBDataSet;
    dsContactList: TDataSource;
    dtContactInfo: TpFIBDataSet;
    dsContactInfo: TDataSource;
    dtRegions: TpFIBDataSet;
    dsRegions: TDataSource;
    dtTransferInfo: TpFIBDataSet;
    dsTransferInfo: TDataSource;
    procedure dtContactListBeforePost(DataSet: TDataSet);
  private
    FOnBeforePost: TDataSetNotifyEvent;
  public
    property ContactBeforePost: TDataSetNotifyEvent write FOnBeforePost;
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.dtContactListBeforePost(DataSet: TDataSet);
begin
  if Assigned(FOnBeforePost) then
    FOnBeforePost(DataSet);
end;

end.
