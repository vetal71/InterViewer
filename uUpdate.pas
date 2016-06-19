unit uUpdate;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
StdCtrls, RzLabel, RzPrgres, ExtCtrls;

type
TfmUpdate = class(TForm)
imTitle: TImage;
prProcess: TRzProgressBar;
lbTitle: TRzLabel;
lbJob: TRzLabel;
tmrExecute: TTimer;
procedure prProcessChange(Sender: TObject; Percent: Integer);
private
{ Private declarations }
public
FOutFile : string;
procedure tmrStartTimer(Sender: TObject);
procedure tmrEndTimer(Sender: TObject);
{ Public declarations }
end;

var
fmUpdate: TfmUpdate;

function StartUpdate(outFileName : string): boolean;
function EndUpdate:boolean;

implementation

uses uGlobal;



const
WaitDeleteOriginalFile = 900;
MaxCountCopyByte = 65536;

{$R *.DFM}

{
копирование файла с ожиданием
}
function CopyExecuteFile(OutFileName : string) : boolean;
var
inFile, outFile : TFileStream;
Buffer : pointer;
CountCopyByte : integer;
i, SizeFile, CopyByte : integer;
begin
result := true;
fmUpdate.lbJob.Caption := 'Копирование файла';
try
i := 0;
repeat
try
DeleteFile(OutFileName);
i := -1;
except
inc(i);
Application.ProcessMessages;
sleep(200);
end;
until (i < 0) or (i > WaitDeleteOriginalFile);
if FileExists(OutFileName) then
begin
raise Exception.Create('Не удалось удалить конечный файл.');
end;
inFile := TFileStream.Create(Application.ExeName,fmOpenRead+fmShareDenyNone);
OutFile := TFileStream.Create(OutFileName,fmCreate);
GetMem(Buffer,MaxCountCopyByte);
SizeFile := inFile.Size;
CopyByte := 0;
CountCopyByte := inFile.Read(Buffer^,MaxCountCopyByte);
while CountCopyByte > 0 do
begin
inc(CopyByte,CountCopyByte);
CountCopyByte := outFile.Write(Buffer^,CountCopyByte);
Application.ProcessMessages;
fmUpdate.prProcess.Percent := MulDiv(100,CopyByte,SizeFile);
// sleep(200);
CountCopyByte := inFile.Read(Buffer^,MaxCountCopyByte);
end;
FreeMem(Buffer);
inFile.Free;
outFile.Free;
except
result := false;
end;
end;

{
Начинаем обнавлять программу.
Для каждойворсии программы
}
function StartUpdate(outFileName : string): boolean;
begin
Application.Initialize;
Application.Title := ApplTitle;
Application.CreateForm(TfmUpdate, fmUpdate);
fmUpdate.FOutFile := outFileName;
fmUpdate.tmrExecute.OnTimer := fmUpdate.tmrStartTimer;
Application.Run;
end;

{
Окончание обнавление программы
}
function EndUpdate:boolean;
begin
Application.Initialize;
Application.Title := ApplTitle;
Application.CreateForm(TfmUpdate, fmUpdate);
fmUpdate.tmrExecute.OnTimer := fmUpdate.tmrEndTimer;
Application.Run;
end;

procedure TfmUpdate.tmrStartTimer(Sender: TObject);
begin
tmrExecute.Enabled := false;
CopyExecuteFile(FOutFile);
WinExec(PChar('"'+FOutFile+'" /UPDATE'),SW_SHOW);
fmUpdate.Close
end;

procedure TfmUpdate.tmrEndTimer(Sender: TObject);
var
i : integer;
begin
try
tmrExecute.Enabled := false;
{ for i := 0 to 100 do
begin
sleep(100);
Application.ProcessMessages;
fmUpdate.prProcess.Percent := i;
end;}
try
// DeleteFile(GetUpdateDir+ExtractFileName(Application.ExeName));
except
end;
fmUpdate.Close;
WinExec(PChar('"'+Application.ExeName+'"'),SW_SHOW);
except
end;
end;

{
изменение прогрес бара
}
procedure TfmUpdate.prProcessChange(Sender: TObject; Percent: Integer);
begin
Application.ProcessMessages;
end;

end.unit Unit1;

interface

implementation

end.
