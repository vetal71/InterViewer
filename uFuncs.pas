unit uFuncs;

interface

uses
  System.Classes, System.SysUtils, Vcl.Dialogs, System.Variants,
  Winapi.Windows;

function StrToStrL(Str : String; Delimeters: array of string): TStringList;

procedure ShowError(Msg: string);

function VarToInt(const AVariant: Variant): integer;

procedure SplitText(const aSource : string; aTarget : TStrings; aDelimiter : Char = ',');

implementation

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

{-----------------------------------------------------------------------------}
{Преобразует строку из слов, разделенных разделителем к TStringList}
{-----------------------------------------------------------------------------}
function StrToStrL(Str : String; Delimeters: array of string): TStringList;
var
  Res : TStringList;
  sTemp, sWord : String;
  iPos : Integer;
  I: Integer;
  IsFound: Boolean;
begin
  Res := TStringList.Create;
  Result := Res;
  IsFound := False;
  sTemp := Trim(Str);
  if Length(sTemp) = 0 Then Exit;
  for I := 0 to High(Delimeters) do
  begin
    iPos := Pos(Delimeters[ I ], sTemp);

    if iPos = 0 then Continue;

    if iPos <> 0 Then begin
      repeat
        sWord := Copy(Trim(sTemp), 1, iPos - 1);
        Res.Add(sWord);
        Delete(sTemp, 1, iPos);
        sTemp := Trim(sTemp);
        iPos := Pos(Delimeters[ I ], sTemp);
      until iPos = 0;
    end;
    IsFound := True;
    Res.Add(sTemp);
  end;
  if not IsFound then
    Res.Add(sTemp);
  Result := Res;
end;

procedure ShowError(Msg: string);
begin
  MessageDlg(Msg, mtError, [mbOK], 0);
end;

function VarToInt(const AVariant: Variant): integer;
begin
  Result := StrToIntDef(Trim(VarToStr(AVariant)), 0);
end;

end.
