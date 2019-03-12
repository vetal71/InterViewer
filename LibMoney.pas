unit LibMoney;

interface

(*
c=0 - 21.05 -> "�������� ���� ����� 05 ������."
�=1 - 21.05 -> "�������� ����"
c=2 - 21.05 -> "21-05", 21.00 -> "21="
*)

function MoneyToStr(n: double; c: byte = 0): string;
function NumToStr(n: double; c: byte = 0): string;
function propis(default:double):string;
function F2W(number: Currency): ShortString; stdcall;

implementation

uses SysUtils;

function F2W(number: Currency): ShortString; stdcall; // � ���� ��� ������� ����������� � DLL
var FiguresInWord: string;
const
  s1: array[0..19] of string = ('����', '����', '���', '���', '������',
    '����', '�����', '����', '������', '������', '������', '�����������', '����������',
    '����������', '������������', '����������', '�����������', '����������',
    '������������', '������������');
  s10: array[2..9] of string = ('��������', '��������', '�����', '���������',
    '����������', '���������', '�����������', '���������');
  s100: array[1..9] of string = ('���', '������', '������', '���������',
    '�������', '��������', '�������', '���������', '���������');

  function f(s: string; t: Boolean): Integer;
  var i: Integer; r: string;
  begin
    FiguresInWord:= '';
    i:=StrToInt(s);
    s:=IntToStr(i); // ������� ���� �������
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
        if i = 1 then r:=r + '����'
        else if i = 2 then r:=r + '���'
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
{---------------------------- ����������� ������� ����� }
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
    if n = 1 then r:=r + ' ������� '
    else if (n = 2) or (n = 3) or (n = 4) then r:=r + ' �������� '
    else r:=r + ' ��������� ';
    Delete(s, 1, c); c:=3;
  end;
  if i > 999 then begin
    n:=f(Copy(s, 1, c), true); r:=r + FiguresInWord;
    if n = 1 then r:=r + ' ������ '
    else if (n = 2) or (n = 3) or (n = 4) then r:=r + ' ������ '
    else if Copy(s, 1, c) <> '000' then r:=r + ' ����� ';
    Delete(s, 1, c);
  end;
  n:=f(s, false); r:=r + FiguresInWord;
  if n < 5 then begin
    if n = 1 then r:=r + ' ����� '
    else if (n = 2) or (n = 3) or (n = 4) then r:=r + ' ����� '
    else r:=r + ' ������ ';
  end
  else r:=r + ' ������ ';

  s:=FloatToStrF(number, ffCurrency, 15, 2);
  i:=Pos(FormatSettings.DecimalSeparator, s);
  r:=r + Copy(s, i + 1, 2);
  n:=StrToInt(Copy(s, i + 1, 2));
  if (n > 4) and (n < 21) then r:=r + ' ������'
  else begin
    n:=StrToInt(Copy(s, i + 2, 1));
    if n = 1 then r:=r + ' �������'
    else if (n = 2) or (n = 3) or (n = 4) then r:=r + ' �������'
    else r:=r + ' ������';
  end;

  s:=AnsiUpperCase(Copy(r, 1, 1));
  Delete(r, 1, 1);
  r:=Concat(s, r);

  result:=r;
end;

//��� ����

function NumToStr(n: double; c: byte = 0): string;
(*
c=0 - 21.05 -> '�������� ���� ����� 05 ������.'
�=1 - 21.05 -> '�������� ����'
c=2 - 21.05 -> '21-05', 21.00 -> '21='
*)
const
  digit: array[0..9] of string = ('����', '���', '���', '���', '�����',
    '���', '����', '���', '�����', '�����');

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
          0: result:= '������ ';
          2: result:= '���������� '
        else result:=digit[d] + '������� '
        end;
        case pos of
          4: result:=result + '����� ';
          7: result:=result + '��������� ';
          10: result:=result + '���������� '
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
            2, 3: result:=digit[d] + '����� ';
            4: result:= '����� ';
            9: result:= '��������� ';
            5..8: result:=digit[d] + '������ '
          end;
        if (pos = 3) or (pos = 6) or (pos = 9) or (pos = 12) then
          case d of
            1: result:= '��� ';
            2: result:= '������ ';
            3: result:= '������ ';
            4: result:= '��������� ';
            5..9: result:=digit[d] + '���� '
          end;
        if (pos = 1) or (pos = 4) or (pos = 7) or (pos = 10) then
          case d of
            1: result:= '���� ';
            2, 3: result:=digit[d] + ' ';
            4: result:= '������ ';
            5..9: result:=digit[d] + '� '
          end;
        if pos = 4 then begin
          case d of
            0: if ts then result:= '����� ';
            1: result:= '���� ������ ';
            2: result:= '��� ������ ';
            3, 4: result:=result + '������ ';
            5..9: result:=result + '����� '
          end;
          ts:=false
        end;
        if pos = 7 then begin
          case d of
            0: if mln then result:= '��������� ';
            1: result:=result + '������� ';
            2, 3, 4: result:=result + '�������� ';
            5..9: result:=result + '��������� '
          end;
          mln:=false
        end;
        if pos = 10 then begin
          case d of
            0: if mlrd then result:= '���������� ';
            1: result:=result + '�������� ';
            2, 3, 4: result:=result + '��������� ';
            5..9: result:=result + '���������� '
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
      result:= result + ' ������'
    else begin
      case StrToInt(copy(n, len, 1)) of
        1: result:= result + ' �����';
        2, 3, 4: result:= result + ' �����'
      else result:= result + ' ������'
      end
    end;

    len:=length(number);
    n:=copy(number, len - 1, len);
    if copy(n, 1, 1) = '1' then n:=n + ' ������.'
    else begin
      case StrToInt(copy(n, 2, 1)) of
        1: n:=n + ' �������.';
        2, 3, 4: n:=n + ' �������.'
      else n:=n + ' ������.'
      end
    end;
    result:=result + ' ' + n
  end;

// �������� �����
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
    razr:array[0..5] of string;//�������
    mill:array[0..9] of string;//�������+, ��������+, ...
    tysa4:array[0..9] of string;//�����+
    sotn:array[0..9] of string;//�����
    des:array[0..9] of string;//�������
    desd:array[0..9] of string;//20>i>10
    edin:array[0..1,0..9] of string;//�������
    ruble:array[0..9] of string;//����+
    kopeek:array[0..9] of string;//�������
    nacion:array[0..9] of string;//����������+

procedure Init;
begin
  razr[0]:='';
  razr[1]:='�����';
  razr[2]:='�������';
  razr[3]:='��������';
  razr[4]:='��������';

  mill[0]:='�� ';
  mill[1]:=' ';
  mill[2]:='a ';
  mill[3]:='� ';
  mill[4]:='� ';
  mill[5]:='�� ';
  mill[6]:='�� ';
  mill[7]:='�� ';
  mill[8]:='�� ';
  mill[9]:='�� ';

  tysa4[0]:=' ';
  tysa4[1]:='� ';
  tysa4[2]:='� ';
  tysa4[3]:='� ';
  tysa4[4]:='� ';
  tysa4[5]:=' ';
  tysa4[6]:=' ';
  tysa4[7]:=' ';
  tysa4[8]:=' ';
  tysa4[9]:=' ';

  sotn[0]:=' ';
  sotn[1]:='��� ';
  sotn[2]:='������ ';
  sotn[3]:='������ ';
  sotn[4]:='��������� ';
  sotn[5]:='������� ';
  sotn[6]:='�������� ';
  sotn[7]:='������� ';
  sotn[8]:='��������� ';
  sotn[9]:='��������� ';

  des[0]:=' ';
  des[1]:='������ ';
  des[2]:='�������� ';
  des[3]:='�������� ';
  des[4]:='����� ';
  des[5]:='��������� ';
  des[6]:='���������� ';
  des[7]:='��������� ';
  des[8]:='����������� ';
  des[9]:='��������� ';

  desd[0]:=' ';
  desd[1]:='����������� ';
  desd[2]:='���������� ';
  desd[3]:='���������� ';
  desd[4]:='������������ ';
  desd[5]:='���������� ';
  desd[6]:='���������� ';
  desd[7]:='���������� ';
  desd[8]:='������������ ';
  desd[9]:='������������ ';

  edin[0,0]:=' ';
  edin[0,1]:='���� ';
  edin[0,2]:='��� ';
  edin[0,3]:='��� ';
  edin[0,4]:='������ ';
  edin[0,5]:='���� ';
  edin[0,6]:='����� ';
  edin[0,7]:='���� ';
  edin[0,8]:='������ ';
  edin[0,9]:='������ ';
  edin[1,0]:=' ';
  edin[1,1]:='���� ';
  edin[1,2]:='��� ';
  edin[1,3]:='��� ';
  edin[1,4]:='������ ';
  edin[1,5]:='���� ';
  edin[1,6]:='����� ';
  edin[1,7]:='���� ';
  edin[1,8]:='������ ';
  edin[1,9]:='������ ';

  ruble[0]:='�� ';
  ruble[1]:='� ';
  ruble[2]:='� ';
  ruble[3]:='� ';
  ruble[4]:='� ';
  ruble[5]:='�� ';
  ruble[6]:='�� ';
  ruble[7]:='�� ';
  ruble[8]:='�� ';
  ruble[9]:='�� ';

  kopeek[0]:='��';
  kopeek[1]:='���';
  kopeek[2]:='���';
  kopeek[3]:='���';
  kopeek[4]:='���';
  kopeek[5]:='��';
  kopeek[6]:='��';
  kopeek[7]:='��';
  kopeek[8]:='��';
  kopeek[9]:='��';

  nacion[0]:='�� ';
  nacion[1]:='�� ';
  nacion[2]:='�� ';
  nacion[3]:='�� ';
  nacion[4]:='�� ';
  nacion[5]:='�� ';
  nacion[6]:='�� ';
  nacion[7]:='�� ';
  nacion[8]:='�� ';
  nacion[9]:='�� ';
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
    s:=s+'�� '
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
              rezR:=rezR+ed1(mass[i])+'������ '
            else
              rezR:=rezR+ed1(mass[i])+'����'+ruble[mass[0] mod 10];
      end;
    end;
    rezK:='';
    if kop>0 then
    begin
      if (kop<20) and (kop>10) then
       rezK:=rezK+desd[kop mod 10]+'������';
      if ((kop>=20) and (kop<100)) or (kop=10) then
      begin
        rezK:=rezK+des[kop div 10];
        kop:=kop mod 10;
      end;
      if kop<10 then
        rezK:=rezK+edin[1,kop]+'����'+kopeek[kop];
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
