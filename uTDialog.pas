unit uTDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, RzDlgBtn;

type
  TfTDialog = class(TForm)
    dlgButtons: TRzDialogButtons;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTDialog: TfTDialog;

implementation

{$R *.dfm}

end.
