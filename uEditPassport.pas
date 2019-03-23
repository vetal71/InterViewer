unit uEditPassport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTEditDialog, Vcl.ExtCtrls, RzPanel,
  RzDlgBtn, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, Vcl.StdCtrls, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, System.AnsiStrings,
  cxClasses;

type
  TfEditPassport = class(TfTEditDialog)
    lbl2: TLabel;
    edtSiries: TcxTextEdit;
    lbl1: TLabel;
    edtNumber: TcxTextEdit;
    lbl3: TLabel;
    edtDateGive: TcxDateEdit;
    lbl4: TLabel;
    edtWhoGive: TcxTextEdit;
    edtFullPassport: TcxTextEdit;
    procedure edtSiriesPropertiesChange(Sender: TObject);
    procedure edtFullPassportPropertiesChange(Sender: TObject);
  private
    FPassport: string;
    procedure ChangePassportData;
    procedure SetPassport(const Value: string);
    function GetPassport: string;
  public
    property Passport: string read GetPassport write SetPassport;
  end;

var
  fEditPassport: TfEditPassport;

implementation

uses
  synautil;

{$R *.dfm}

{ TfEditPassport }

procedure TfEditPassport.ChangePassportData;
begin
  FPassport := Format('������� %s%s ����� %s ���� ������ %s', [ edtSiries.Text, edtNumber.Text, edtWhoGive.Text, DateToStr( edtDateGive.Date ) ]);
  edtFullPassport.Text := FPassport;
end;

procedure TfEditPassport.edtFullPassportPropertiesChange(Sender: TObject);
begin
  dlgButtons.EnableOk := edtFullPassport.Text > '';
end;

procedure TfEditPassport.edtSiriesPropertiesChange(Sender: TObject);
begin
  ChangePassportData
end;

function TfEditPassport.GetPassport: string;
begin
  Result := FPassport;
end;

procedure TfEditPassport.SetPassport(const Value: string);
var
  SerNum: string;
begin
  FPassport := Value;
  edtFullPassport.Text := FPassport;

  if Pos('�������', Value) > 0 then
  begin
    SerNum := Trim( GetBetween('�������', '�����', Value) );
    edtSiries.Text := LeftStr(SerNum, 2);
    edtNumber.Text := MidStr(SerNum, 3, 8);
    edtWhoGive.Text := Trim( GetBetween('�����', '����', Value ) );

    edtDateGive.Date := StrToDateDef( Trim( MidStr(Value, Pos('��', Value) + 3, 12 ) ), Now );
  end;
end;

end.
