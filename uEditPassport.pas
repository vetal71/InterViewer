unit uEditPassport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTDialog, Vcl.ExtCtrls, RzPanel,
  RzDlgBtn, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, Vcl.StdCtrls, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfTDialog1 = class(TfTDialog)
    lbl2: TLabel;
    edtSecondName: TcxTextEdit;
    lbl1: TLabel;
    edt1: TcxTextEdit;
    lbl3: TLabel;
    edtDate: TcxDateEdit;
    lbl4: TLabel;
    edt2: TcxTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTDialog1: TfTDialog1;

implementation

{$R *.dfm}

end.
