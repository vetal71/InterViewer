unit uWaitForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxActivityIndicator, Vcl.StdCtrls, Vcl.ExtCtrls,
  RzPanel;

type
  TfSplash = class(TForm)
    RzPanel1: TRzPanel;
    Label1: TLabel;
    aiProgress: TdxActivityIndicator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSplash: TfSplash;

implementation

{$R *.dfm}

end.
