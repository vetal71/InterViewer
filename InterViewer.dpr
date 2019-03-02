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
  uEditTransferInfo in 'uEditTransferInfo.pas' {fEditTransferInfo},
  uContracts in 'uContracts.pas' {frmContracts},
  uConstants in 'uConstants.pas',
  uEditContract in 'uEditContract.pas' {fEditContract},
  uDBFuncs in 'uDBFuncs.pas',
  uWordReport in 'uWordReport.pas',
  uEditTask in 'uEditTask.pas' {fEditTask},
  uEditAct in 'uEditAct.pas' {fEditAct},
  LibMoney in 'LibMoney.pas',
  uWaitForm in 'uWaitForm.pas' {fSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'База интервьюеров';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
