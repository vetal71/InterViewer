unit LibMoney;

interface

(*
c=0 - 21.05 -> "�������� ���� ����� 05 ������."
�=1 - 21.05 -> "�������� ����"
c=2 - 21.05 -> "21-05", 21.00 -> "21="
*)

function MoneyToStr(n: double; c: byte = 0): string;
function NumToStr(n: double; c: byte = 0): string;
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
      result:= '(' + result + ') ������'
    else begin
      case StrToInt(copy(n, len, 1)) of
        1: result:= '(' + result + ') �����';
        2, 3, 4: result:= '(' + result + ') �����'
      else result:= '(' + result + ') ������'
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

end.



