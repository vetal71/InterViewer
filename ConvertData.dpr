program ConvertData;

uses
  Vcl.Forms,
  uConvertMain in 'uConvertMain.pas' {frmConvert},
  uDBFuncs in 'uDBFuncs.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmConvert, frmConvert);
  Application.Run;
end.
