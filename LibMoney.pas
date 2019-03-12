unit LibMoney;

interface

(*
c=0 - 21.05 -> "Двадцать один рубль 05 копеек."
с=1 - 21.05 -> "двадцать один"
c=2 - 21.05 -> "21-05", 21.00 -> "21="
*)

function MoneyToStr(n: double; c: byte = 0): string;
function NumToStr(n: double; c: byte = 0): string;
function propis(default:double):string;
function F2W(number: Currency): ShortString; stdcall;

implementation

uses SysUtils;

function F2W(number: Currency): ShortString; stdcall; // у меня эта функция реализована в DLL
var FiguresInWord: string;
const
  s1: array[0..19] of string = ('ноль', 'один', 'два', 'три', 'четыре',
    'пять', 'шесть', 'семь', 'восемь', 'девять', 'десять', 'одиннадцать', 'двенадцать',
    'тринадцать', 'четырнадцать', 'пятнадцать', 'шестнадцать', 'семнадцать',
    'восемнадцать', 'девятнадцать');
  s10: array[2..9] of string = ('двадцать', 'тридцать', 'сорок', 'пятьдесят',
    'шестьдесят', 'семьдесят', 'восемьдесят', 'девяносто');
  s100: array[1..9] of string = ('сто', 'двести', 'триста', 'четыреста',
    'пятьсот', 'шестьсот', 'семьсот', 'восемьсот', 'девятьсот');

  function f(s: string; t: Boolean): Integer;
  var i: Integer; r: string;
  begin
    FiguresInWord:= '';
    i:=StrToInt(s);
    s:=IntToStr(i); // убираем нули впереди
    if i > 99 then begin
      r:=r + s100[StrToInt(s[1])] + ' ';
      Delete(s, 1, 1); i:=StrToInt(s);
    end;
    if i > 19 then begin
      r:=r + s10[StrToInt(s[1])] + ' ';
      Delete(s, 1, 1); i:=StrToInt(s);
    end;
    if (i > 9) and (i < 20) then r:=r + s1[i]
    else if i <> 0 then
      if t then begin
        if i = 1 then r:=r + 'одна'
        else if i = 2 then r:=r + 'две'
        else r:=r + s1[i];
      end
      else r:=r + s1[i];
    FiguresInWord:=FiguresInWord + r;
    result:=i;
  end;
var i, l, n, c: Integer;
  s, r: string;
begin
  r:= '';
{---------------------------- отбрасываем дробную часть }
  number:=number * 100;
  number:=System.Round(number);
  number:=number / 100;
  s:=FloatToStr(number);
  i:=Pos(FormatSettings.DecimalSeparator, s);
  l:=Length(s);
  Delete(s, i, l - i + 1);
  l:=Length(s);
  i:=StrToInt(s);
{----------------------------}
  c:=l mod 3; if (c = 0) and (l > 0) then c:=3;
  if i > 999999999 then i:=0;
  if i > 999999 then begin
    n:=f(Copy(s, 1, c), false); r:=r + FiguresInWord;
    if n = 1 then r:=r + ' миллион '
    else if (n = 2) or (n = 3) or (n = 4) then r:=r + ' миллиона '
    else r:=r + ' миллионов ';
    Delete(s, 1, c); c:=3;
  end;
  if i > 999 then begin
    n:=f(Copy(s, 1, c), true); r:=r + FiguresInWord;
    if n = 1 then r:=r + ' тысяча '
    else if (n = 2) or (n = 3) or (n = 4) then r:=r + ' тысячи '
    else if Copy(s, 1, c) <> '000' then r:=r + ' тысяч ';
    Delete(s, 1, c);
  end;
  n:=f(s, false); r:=r + FiguresInWord;
  if n < 5 then begin
    if n = 1 then r:=r + ' рубль '
    else if (n = 2) or (n = 3) or (n = 4) then r:=r + ' рубля '
    else r:=r + ' рублей ';
  end
  else r:=r + ' рублей ';

  s:=FloatToStrF(number, ffCurrency, 15, 2);
  i:=Pos(FormatSettings.DecimalSeparator, s);
  r:=r + Copy(s, i + 1, 2);
  n:=StrToInt(Copy(s, i + 1, 2));
  if (n > 4) and (n < 21) then r:=r + ' копеек'
  else begin
    n:=StrToInt(Copy(s, i + 2, 1));
    if n = 1 then r:=r + ' копейка'
    else if (n = 2) or (n = 3) or (n = 4) then r:=r + ' копейки'
    else r:=r + ' копеек';
  end;

  s:=AnsiUpperCase(Copy(r, 1, 1));
  Delete(r, 1, 1);
  r:=Concat(s, r);

  result:=r;
end;

//Еще одна

function NumToStr(n: double; c: byte = 0): string;
(*
c=0 - 21.05 -> 'Двадцать один рубль 05 копеек.'
с=1 - 21.05 -> 'двадцать один'
c=2 - 21.05 -> '21-05', 21.00 -> '21='
*)
const
  digit: array[0..9] of string = ('ноль', 'оди', 'два', 'три', 'четыр',
    'пят', 'шест', 'сем', 'восем', 'девят');

var
  ts, mln, mlrd, SecDes: Boolean;
  len: byte;
  summa: string;


  function NumberString(number: string): string;
  var d, pos: byte;

    function DigitToStr: string;
    begin
      result:= '';
      if (d <> 0) and ((pos = 11) or (pos = 12)) then mlrd:=true;
      if (d <> 0) and ((pos = 8) or (pos = 9)) then mln:=true;
      if (d <> 0) and ((pos = 5) or (pos = 6)) then ts:=true;
      if SecDes then begin
        case d of
          0: result:= 'десять ';
          2: result:= 'двенадцать '
        else result:=digit[d] + 'надцать '
        end;
        case pos of
          4: result:=result + 'тысяч ';
          7: result:=result + 'миллионов ';
          10: result:=result + 'миллиардов '
        end;
        SecDes:=false;
        mln:=false;
        mlrd:=false;
        ts:=false
      end
      else begin
        if (pos = 2) or (pos = 5) or (pos = 8) or (pos = 11) then
          case d of
            1: SecDes:=true;
            2, 3: result:=digit[d] + 'дцать ';
            4: result:= 'сорок ';
            9: result:= 'девяносто ';
            5..8: result:=digit[d] + 'ьдесят '
          end;
        if (pos = 3) or (pos = 6) or (pos = 9) or (pos = 12) then
          case d of
            1: result:= 'сто ';
            2: result:= 'двести ';
            3: result:= 'триста ';
            4: result:= 'четыреста ';
            5..9: result:=digit[d] + 'ьсот '
          end;
        if (pos = 1) or (pos = 4) or (pos = 7) or (pos = 10) then
          case d of
            1: result:= 'один ';
            2, 3: result:=digit[d] + ' ';
            4: result:= 'четыре ';
            5..9: result:=digit[d] + 'ь '
          end;
        if pos = 4 then begin
          case d of
            0: if ts then result:= 'тысяч ';
            1: result:= 'одна тысяча ';
            2: result:= 'две тысячи ';
            3, 4: result:=result + 'тысячи ';
            5..9: result:=result + 'тысяч '
          end;
          ts:=false
        end;
        if pos = 7 then begin
          case d of
            0: if mln then result:= 'миллионов ';
            1: result:=result + 'миллион ';
            2, 3, 4: result:=result + 'миллиона ';
            5..9: result:=result + 'миллионов '
          end;
          mln:=false
        end;
        if pos = 10 then begin
          case d of
            0: if mlrd then result:= 'миллиардов ';
            1: result:=result + 'миллиард ';
            2, 3, 4: result:=result + 'миллиарда ';
            5..9: result:=result + 'миллиардов '
          end;
          mlrd:=false
        end
      end
    end;

  begin
    result:= '';
    ts:=false;
    mln:=false;
    mlrd:=false;
    SecDes:=false;
    len:=length(number);
    if (len = 0) or (number = '0') then
      result:=digit[0]
    else
      for pos:=len downto 1 do begin
        d:=StrToInt(copy(number, len - pos + 1, 1));
        result:=result + DigitToStr
      end
  end;


  function MoneyString(number: string): string;
  var
    s: string[1];
    n: string;
  begin
    len:=length(number);
    n:=copy(number, 1, len - 3);
    result:=NumberString(n);
    s:=AnsiUpperCase(result[1]);
    delete(result, 1, 1);
    result:=s + result;
    if len < 2 then begin
      if len = 0 then n:= '0';
      len:=2;
      n:= '0' + n
    end;
    result:=trim(result);
    if copy(n, len - 1, 1) = '1' then
      result:= result + ' рублей'
    else begin
      case StrToInt(copy(n, len, 1)) of
        1: result:= result + ' рубль';
        2, 3, 4: result:= result + ' рубля'
      else result:= result + ' рублей'
      end
    end;

    len:=length(number);
    n:=copy(number, len - 1, len);
    if copy(n, 1, 1) = '1' then n:=n + ' копеек.'
    else begin
      case StrToInt(copy(n, 2, 1)) of
        1: n:=n + ' копейка.';
        2, 3, 4: n:=n + ' копейки.'
      else n:=n + ' копеек.'
      end
    end;
    result:=result + ' ' + n
  end;

// Основная часть
begin
  case c of
    0: result:=MoneyString(FormatFloat('0.00', n));
    1: result:=NumberString(FormatFloat('0', n));
    2: begin
        summa:=FormatFloat('0.00', n);
        len:=length(summa);
        if copy(summa, len - 1, 2) = '00' then begin
          delete(summa, len - 2, 3);
          result:=summa + '='
        end
        else begin
          delete(summa, len - 2, 1);
          insert('-', summa, len - 2);
          result:=summa;
        end;
      end
  end;
end;

function MoneyToStr(n: double; c: byte = 0): string;
begin
  Result:=NumToStr(n, c);
end;

var mass:array[0..4]of integer;
    razr:array[0..5] of string;//разряды
    mill:array[0..9] of string;//миллион+, миллиард+, ...
    tysa4:array[0..9] of string;//тысяч+
    sotn:array[0..9] of string;//сотни
    des:array[0..9] of string;//десятки
    desd:array[0..9] of string;//20>i>10
    edin:array[0..1,0..9] of string;//единицы
    ruble:array[0..9] of string;//рубл+
    kopeek:array[0..9] of string;//копейки
    nacion:array[0..9] of string;//белорусски+

procedure Init;
begin
  razr[0]:='';
  razr[1]:='тысяч';
  razr[2]:='миллион';
  razr[3]:='миллиард';
  razr[4]:='триллион';

  mill[0]:='ов ';
  mill[1]:=' ';
  mill[2]:='a ';
  mill[3]:='а ';
  mill[4]:='а ';
  mill[5]:='ов ';
  mill[6]:='ов ';
  mill[7]:='ов ';
  mill[8]:='ов ';
  mill[9]:='ов ';

  tysa4[0]:=' ';
  tysa4[1]:='а ';
  tysa4[2]:='и ';
  tysa4[3]:='и ';
  tysa4[4]:='и ';
  tysa4[5]:=' ';
  tysa4[6]:=' ';
  tysa4[7]:=' ';
  tysa4[8]:=' ';
  tysa4[9]:=' ';

  sotn[0]:=' ';
  sotn[1]:='сто ';
  sotn[2]:='двесте ';
  sotn[3]:='триста ';
  sotn[4]:='четыреста ';
  sotn[5]:='пятьсот ';
  sotn[6]:='шестьсот ';
  sotn[7]:='семьсот ';
  sotn[8]:='восемьсот ';
  sotn[9]:='девятьсот ';

  des[0]:=' ';
  des[1]:='десять ';
  des[2]:='двадцать ';
  des[3]:='тридцать ';
  des[4]:='сорок ';
  des[5]:='пятьдесят ';
  des[6]:='шестьдесят ';
  des[7]:='семьдесят ';
  des[8]:='восемьдесят ';
  des[9]:='девяносто ';

  desd[0]:=' ';
  desd[1]:='одиннадцать ';
  desd[2]:='двенадцать ';
  desd[3]:='тринадцать ';
  desd[4]:='четырнадцать ';
  desd[5]:='пятнадцать ';
  desd[6]:='шеснадцать ';
  desd[7]:='семнадцать ';
  desd[8]:='восемнадцать ';
  desd[9]:='девятнадцать ';

  edin[0,0]:=' ';
  edin[0,1]:='один ';
  edin[0,2]:='два ';
  edin[0,3]:='три ';
  edin[0,4]:='четыре ';
  edin[0,5]:='пять ';
  edin[0,6]:='шесть ';
  edin[0,7]:='семь ';
  edin[0,8]:='восемь ';
  edin[0,9]:='девять ';
  edin[1,0]:=' ';
  edin[1,1]:='одна ';
  edin[1,2]:='две ';
  edin[1,3]:='три ';
  edin[1,4]:='четыре ';
  edin[1,5]:='пять ';
  edin[1,6]:='шесть ';
  edin[1,7]:='семь ';
  edin[1,8]:='восемь ';
  edin[1,9]:='девять ';

  ruble[0]:='ей ';
  ruble[1]:='ь ';
  ruble[2]:='я ';
  ruble[3]:='я ';
  ruble[4]:='я ';
  ruble[5]:='ей ';
  ruble[6]:='ей ';
  ruble[7]:='ей ';
  ruble[8]:='ей ';
  ruble[9]:='ей ';

  kopeek[0]:='ек';
  kopeek[1]:='йка';
  kopeek[2]:='йки';
  kopeek[3]:='йки';
  kopeek[4]:='йки';
  kopeek[5]:='ек';
  kopeek[6]:='ек';
  kopeek[7]:='ек';
  kopeek[8]:='ек';
  kopeek[9]:='ек';

  nacion[0]:='их ';
  nacion[1]:='ий ';
  nacion[2]:='их ';
  nacion[3]:='их ';
  nacion[4]:='их ';
  nacion[5]:='их ';
  nacion[6]:='их ';
  nacion[7]:='их ';
  nacion[8]:='их ';
  nacion[9]:='их ';
end;

function ed1(i:integer):string;
var s:string;
begin
  s:='';
  if i>99 then
    s:=s+sotn[i div 100];
  i:=i mod 100;
  if (i<20) and (i>10) then
    s:=s+desd[i mod 10];
  if ((i>19) and (i<100)) or (i=10) then begin
    s:=s+des[i div 10];
    i:=i mod 10;
  end;
  if i<10 then
    s:=s+edin[0,i];
  result:=s;
end;

function ed2(i:integer):string;
var s:string;
begin
  s:='';
  if i>99 then
    s:=s+sotn[i div 100];
  i:=i mod 100;
  if (i<20) and (i>10) then
    s:=s+desd[i mod 10];
  if ((i>19) and (i<100)) or (i=10) then begin
    s:=s+des[i div 10];
    i:=i mod 10;
  end;
  if i<10 then
    s:=s+edin[1,i];
  result:=s;
end;

function OkRazr1(i:integer):string;
var s:string;
begin
  s:='';
  i:=i mod 100;
  if (i<20) and (i>9) then
    s:=s+'ов '
  else begin
    s:=mill[i mod 10];
  end;
  result:=s;
end;

function OkRazr2(i:integer):string;
var s:string;
begin
  s:='';
  i:=i mod 100;
  if (i<20) and (i>10) then
  s:=s+' '
  else begin
    s:=tysa4[i mod 10];
  end;
  result:=s;
end;

function StrFloat(s:string):boolean;
var i:double;
begin
  if TryStrTofloat(s,i) then Result:=true
  else Result:=false;
end;

function propis(default:double):string;
var rez, rezR, rezK,temp_s,temp_r:String;
    ishR,ishK,kol,i,rub,kop:int64;
begin
  kol:=0;
  rez:='';
  rub:=Trunc(Abs(default));
  kop:=Abs(Round(Frac(default)*100));
  Init();
  if rub<1000000000000  then
  begin
    rezR:='';
    kol:=0;
    while rub>0 do
    begin
      mass[kol]:=rub mod 1000;
      rub:=rub div 1000;
      kol:=kol+1;
    end;
    for i := kol-1 downto 0 do
    begin
      if mass[i]>0 then
      begin
        if i>1 then
          rezR:=rezR+ed1(mass[i])+razr[i]+OkRazr1(mass[i])
        else
          if i=1 then
            rezR:=rezR+ed2(mass[i])+razr[i]+OkRazr2(mass[i])
          else
            if (mass[i]>10) and (mass[i]<20)then
              rezR:=rezR+ed1(mass[i])+'рублей '
            else
              rezR:=rezR+ed1(mass[i])+'рубл'+ruble[mass[0] mod 10];
      end;
    end;
    rezK:='';
    if kop>0 then
    begin
      if (kop<20) and (kop>10) then
       rezK:=rezK+desd[kop mod 10]+'копеек';
      if ((kop>=20) and (kop<100)) or (kop=10) then
      begin
        rezK:=rezK+des[kop div 10];
        kop:=kop mod 10;
      end;
      if kop<10 then
        rezK:=rezK+edin[1,kop]+'копе'+kopeek[kop];
    end;
    rez:=rezR+rezK;
    temp_s:=AnsiUpperCase(copy(rez,0,1));
    temp_r:=Copy(rez,1,Length(rez)-1);
    insert(temp_s,rez,1);
    delete(rez,2,1);
    result:=rez;
  end;
end;

end.
