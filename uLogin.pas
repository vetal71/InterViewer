unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, RzDlgBtn,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxDBEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.StdCtrls,
  pFIBDataSet, Uni;

type
  TfLogin = class(TForm)
    dlgButtons: TRzDialogButtons;
    lbl1: TLabel;
    lbl2: TLabel;
    cbbUsers: TcxComboBox;
    edtPassword: TcxTextEdit;
    procedure dlgButtonsClickOk(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    UserName: string;
    procedure SetUserList;
  end;

var
  fLogin: TfLogin;

implementation

uses
  uDataModule;

{$R *.dfm}

procedure TfLogin.dlgButtonsClickOk(Sender: TObject);
var
  pwd: string;
begin
  if cbbUsers.Text = '' then
  begin
    MessageDlg('Имя пользователя не выбрано.', mtWarning, [mbOK], 0);
    cbbUsers.SetFocus;
    ModalResult := mrCancel;
  end;
  pwd := dm.dbFirebird.ExecSQLEx( 'select user_pwd from users where user_name = :param', [ cbbUsers.Text ] );
  if pwd <> edtPassword.Text then
  begin
    MessageDlg('Пароль не верный.', mtWarning, [mbOK], 0);
    ModalResult := mrCancel;
  end;
  UserName := cbbUsers.Text;
end;

procedure TfLogin.FormCreate(Sender: TObject);
begin
  SetUserList;
end;

procedure TfLogin.SetUserList;
var
  qList: TUniQuery;
begin
  qList := TUniQuery.Create(nil);
  with qList do
  begin
    Connection := dm.dbFirebird;
    SQL.Text := 'select user_name from users order by user_name';
    try
      Open;
      while not Eof do
      begin
        cbbUsers.Properties.Items.Add(FieldByName('user_name').AsString);
        Next;
      end;
    finally
      Free;
    end;
  end;
  if cbbUsers.Properties.Items.Count > 0 then
    cbbUsers.ItemIndex := 0;

end;

end.
