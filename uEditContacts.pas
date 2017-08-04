unit uEditContacts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, RzDlgBtn,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, uDataModule, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxCheckBox, cxCheckComboBox,
  Vcl.CheckLst, cxButtonEdit, cxMemo;

type
  TfEditContacts = class(TForm)
    dlgButtons: TRzDialogButtons;
    pnlAddInfo: TRzPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtDateBirthday: TcxDBDateEdit;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    chkSupervizer: TcxDBCheckBox;
    chbSpecialization: TcxCheckComboBox;
    edtEMail: TcxDBTextEdit;
    edtOtherLinks: TcxDBTextEdit;
    edtAddress: TcxDBTextEdit;
    edtPassport: TcxDBTextEdit;
    edtSpecialization: TcxDBTextEdit;
    edtTypeTransfer: TcxDBTextEdit;
    edtCardNumbers: TcxDBTextEdit;
    edtFIO: TcxDBTextEdit;
    edtCity: TcxDBTextEdit;
    edtCelurar: TcxDBTextEdit;
    edtHomePhone: TcxDBTextEdit;
    edtCountAnketa: TcxDBTextEdit;
    edtPercentGood: TcxDBTextEdit;
    edtPercentBad: TcxDBTextEdit;
    mCurrentNotes: TcxDBMemo;
    mCharacteristics: TcxDBMemo;
    mProjects: TcxDBMemo;
    cbSex: TcxDBComboBox;
    lbl1: TLabel;
    edtDateLast: TcxDBDateEdit;
    edtRegion: TcxDBComboBox;
    chkBlackList: TcxDBCheckBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FillCheckBox(cxCheckComboBox: TcxCheckComboBox; s: string);
  end;

var
  fEditContacts: TfEditContacts;

implementation

{$R *.dfm}

{ TfEditContacts }

procedure SplitText(const aSource : string; aTarget : TStrings; aDelimiter : Char = ',');
var pS, pT : PChar;
    fS : string;
begin
  aTarget.Clear;
  pS := PChar(aSource);
  while pS^ <> #0 do
  begin
    pT := pS;
    while (pS^ <> #0) and (pS^ <> aDelimiter) do
      pS := CharNext(pS);
    SetString(fS, pT, pS - pT);
    aTarget.Add(fS);
    if pS^ = aDelimiter then
      pS := CharNext(pS);
  end;
end;

procedure TfEditContacts.FillCheckBox(cxCheckComboBox: TcxCheckComboBox;
  s: string);
var
  sl: TStringList;
  CheckComboboxItem: TcxCheckComboboxItem;
  I, J: Integer;
  ACheckStates: TcxCheckStates;
begin
  sl := TStringList.Create;
  try
    SplitText(s, sl, ';');
    for I := 0 to sl.Count - 1 do
    begin
      for J := 0 to cxCheckComboBox.Properties.Items.Count - 1 do
      begin
        CheckComboboxItem := cxCheckComboBox.Properties.Items[J];
        if CheckComboboxItem.Description = sl[I] then
          cxCheckComboBox.SetItemState(J, cbsChecked);
      end;
    end;

  finally
    sl.Free;
  end;

end;

procedure TfEditContacts.FormShow(Sender: TObject);
begin
  FillCheckBox(chbSpecialization, edtSpecialization.Text);
end;

end.
