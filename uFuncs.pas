unit uFuncs;

interface

uses
  System.Classes, System.SysUtils, Vcl.Dialogs, System.Variants,
  Winapi.Windows, Forms;

// **** UBPFD *********** by delphibase.endimus.com ****
// *** Преобразование даты (месяц прописью)
//
// Преобразование даты. Например: 23.02.02 преобразуется в 23 февраля 2002 года.
//
// Зависимости: DecodeDate
// Автор:       mukha, mukha@vistcom.ru, Волгоград
// Copyright:   mukha
// Дата:        17 ноября 2002 г.
//*****************************************************

function MonthStr(S: string; isYearFull: Boolean = False; isFirstUpper: Boolean = True): string;

function StrToStrL(Str : String; Delimeters: array of string): TStringList;

procedure ShowError(Msg: string);

function Ask(q: string): Boolean;

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

function Ask(q: string): Boolean;
begin
  if pos('?', Trim(q)) <> Length(Trim(q)) then q:=q+'?';
  Result := IDYES = Application.MessageBox(
    PChar(q),
    PChar('Подтвердите'),
    MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2);
end;

function MonthStr(S: string; isYearFull: Boolean; isFirstUpper: Boolean): string;
const
  Mes: array[1..12] of string = ('января', 'февраля', 'марта', 'апреля',
    'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября',
    'декабря');
var
  Year, Month, Day: Word;
  YearFull, MonthFull: string;
begin
  try
    StrToDate(S); // пр-ка правильности ввода даты
    DecodeDate(StrToDate(S), Year, Month, Day);
    YearFull := 'г.';
    if isYearFull then
      YearFull := 'года';
    MonthFull := Mes[Month];
    if isFirstUpper then
      if (Length(MonthFull) > 0) then  //можно еще и так if (S <> '') then но с Length на мой взгляд лучше
        MonthFull[1] := AnsiUpperCase(MonthFull[1])[1];
    Result := Format('%s %s %s %s', [IntToStr(day), MonthFull, IntToStr(Year), YearFull]);
  except
    raise
      Exception.Create('"' + s + '"' + ' - такой даты нет!');
  end;
end;

end.
