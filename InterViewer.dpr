program InterViewer;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  uDataModule in 'uDataModule.pas' {dm: TDataModule},
  uEditContacts in 'uEditContacts.pas' {fEditContacts},
  uWhats in 'uWhats.pas' {frmWhatsNew};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'База интервьюеров';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
