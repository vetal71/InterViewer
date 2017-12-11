unit uEditFIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTDialog, Vcl.ExtCtrls, RzPanel,
  RzDlgBtn, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, Vcl.StdCtrls, uFuncs;

type
  TfEditFIO = class(TfTDialog)
    edtSecondName: TcxTextEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    edtSeName: TcxTextEdit;
    lbl1: TLabel;
    edtName: TcxTextEdit;
  private
    procedure SetFIO(AValue: string);
    function GetFIO: string;
  public
    property FIO: string read GetFIO write SetFIO;
  end;

var
  fEditFIO: TfEditFIO;

implementation

{$R *.dfm}

{ TfEditFIO }

function TfEditFIO.GetFIO: string;
begin
  Result := edtSecondName.Text + ' ' + edtName.Text + ' ' + edtSeName.Text;
end;

procedure TfEditFIO.SetFIO(AValue: string);
var
  NameList: TStringList;
  I: Integer;
begin
  if AValue = '' then Exit;
  NameList := TStringList.Create;
  try
    NameList := StrToStrL(AValue, [' ']);
    for I := 0 to NameList.Count - 1 do
    begin
      if NameList.Count > 1 then
      begin
        edtSecondName.Text := NameList[ 0 ];
        edtName.Text := NameList[ 1 ];
      end
      else if NameList.Count > 2 then
        edtSeName.Text := NameList[ 2 ]
      else
        edtName.Text := NameList[ 0 ];
    end;
  finally
    NameList.Free;
  end;
end;

end.
