unit uWhats;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmWhatsNew = class(TForm)
    mWhats: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWhatsNew: TfrmWhatsNew;

implementation

{$R *.dfm}

end.
