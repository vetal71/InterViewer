unit uTDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, RzDlgBtn, DB,
  cxClasses, cxLookAndFeels, Vcl.StdCtrls;

type
  TfTDialog = class(TForm)
    dlgButtons: TRzDialogButtons;
    LookAndFeelController: TcxLookAndFeelController;
    lblCaption: TLabel;
    pnlMain: TRzPanel;
    procedure FormShow(Sender: TObject);
  private
    FID: Integer;
  public
    property ID: Integer read FID write FID;
  protected
    procedure Init; virtual; abstract;
    procedure BeforeSave; virtual;
    procedure SaveToDatabase(DataSet: TDataSet); virtual;
  end;

var
  fTDialog: TfTDialog;

implementation

{$R *.dfm}

{ TfTDialog }

procedure TfTDialog.BeforeSave;
begin
end;

procedure TfTDialog.FormShow(Sender: TObject);
begin
  Init;
end;

procedure TfTDialog.SaveToDatabase(DataSet: TDataSet);
begin
  BeforeSave;
end;

end.
