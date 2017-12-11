unit uTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uFuncs, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit;

type
  TForm1 = class(TForm)
    edtTest: TcxButtonEdit;
    procedure edtTestPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uEditFIO;

{$R *.dfm}

procedure TForm1.edtTestPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  with TfEditFIO.Create(Application) do
  try
    FIO := edtTest.Text;
    if ShowModal = mrOk then
      edtTest.Text := FIO;
  finally
    Free;
  end;
end;

end.
