program InterViewer;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  uDataModule in 'uDataModule.pas' {dm: TDataModule},
  uEditContacts in 'uEditContacts.pas' {fEditContacts},
  uWhats in 'uWhats.pas' {frmWhatsNew},
  uLogin in 'uLogin.pas' {fLogin},
  uFuncs in 'uFuncs.pas',
  uTDialog in 'uTDialog.pas' {fTDialog},
  uEditFIO in 'uEditFIO.pas' {fEditFIO},
  uEditPassport in 'uEditPassport.pas' {fEditPassport},
  uEditContactInfo in 'uEditContactInfo.pas' {fEditContactInfo},
  uEditRegions in 'uEditRegions.pas' {fEditRegions},
  uEditTransferInfo in 'uEditTransferInfo.pas' {fEditTransferInfo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'База интервьюеров';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfTDialog, fTDialog);
  Application.Run;
end.
