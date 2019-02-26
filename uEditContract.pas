unit uEditContract;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTDialog, Vcl.ExtCtrls, RzPanel,
  RzDlgBtn, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.StdCtrls,
  uDataModule, DB, Vcl.ComCtrls, dxCore, cxDateUtils, cxDBEdit, cxCalendar,
  cxClasses;

type
  TfEditContract = class(TfTDialog)
    Label1: TLabel;
    Label2: TLabel;
    lbl1: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label19: TLabel;
    Label6: TLabel;
    lbl3: TLabel;
    Label5: TLabel;
    cbbKind: TcxComboBox;
    edtDateFrom: TcxDateEdit;
    edtDateTo: TcxDateEdit;
    edtContractNum: TcxTextEdit;
    edtFIO: TcxTextEdit;
    edtDateBirthday: TcxDateEdit;
    edtSocialNumber: TcxTextEdit;
    edtPassport: TcxTextEdit;
    edtAddress: TcxTextEdit;
  private

  protected
    procedure Init; override;
    procedure BeforeSave; override;
  public

  end;

var
  fEditContract: TfEditContract;

implementation

uses
  uDBFuncs, uFuncs;

{$R *.dfm}

{ TfEditContract }

procedure TfEditContract.BeforeSave;
begin
  with dm.qryContracts do
  begin
    FieldByName('AGREEMENT_KIND').AsInteger := cbbKind.ItemIndex;
    FieldByName('AGREEMENT_NUM').AsString := edtContractNum.Text;
    if edtDateFrom.Date > 0 then
      FieldByName('DATE_START').AsDateTime := edtDateFrom.Date;
    if edtDateTo.Date > 0 then
      FieldByName('DATE_FINISH').AsDateTime := edtDateTo.Date;
  end;

end;

procedure TfEditContract.Init;
begin
  with dm.qryContracts do
  begin
    BeforePost := SaveToDatabase;

    FieldByName('AGREEMENT_ID').AsInteger := ID;

    edtFIO.Text          := dm.qryContacts.FieldByName('FIO').AsString;
    edtDateBirthday.Date := dm.qryContacts.FieldByname('BIRTHDAY').AsDateTime;
    edtPassport.Text     := dm.qryContacts.FieldByName('PASSPORT').AsString;
    edtSocialNumber.Text := dm.qryContacts.FieldByName('SOCIAL_NUMBER').AsString;

    if State in [dsEdit] then
    begin
      cbbKind.ItemIndex   := FieldByName('AGREEMENT_KIND').AsInteger;
      edtContractNum.Text := FieldByName('AGREEMENT_NUM').AsString;
      edtDateFrom.Date    := FieldByName('DATE_START').AsDateTime;
      edtDateTo.Date      := FieldByName('DATE_FINISH').AsDateTime;
    end;
  end;
  try
    edtAddress.Text := GetFieldValue('CONTACT_INFO', 'CONTACT_INFO_VALUE',
      Format('CIT_ID = 1 AND CONTACT_ID = %d', [ dm.qryContacts.FieldByName('BCONTACT_ID').AsInteger ]));
  except on E: Exception do
    ShowError('При открытии дополнительных таблиц возникла ошибка.'#13#10 + E.Message);
  end;
end;

end.
