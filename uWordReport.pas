unit uWordReport;

interface

uses
  System.Win.ComObj, System.Generics.Collections, System.SysUtils, Forms,
  dxActivityIndicator, Vcl.StdCtrls, Vcl.Controls, uWaitForm;

type
  TWordReport = class
  private
    FWord: Variant;
    FVars: TDictionary<string, string>;       // список переменных ключ=значение для автозамены в тексте
    FSplash: TfSplash;
  private
    function FindAndReplace: Boolean;
    procedure CreateForm;
  public
    procedure AddPair(AKey, AValue: string);
    procedure SetVars(AVars: TDictionary<string, string>);
    procedure Execute;
  public
    constructor Create(AFilePath: string);
    destructor Destroy; override;

  end;

implementation

{ TWordReport }

procedure TWordReport.AddPair(AKey, AValue: string);
begin
  FVars.Add(AKey, AValue);
end;

constructor TWordReport.Create(AFilePath: string);
begin
  // Заставка
  CreateForm;

  try
    FWord := GetActiveOleObject('Word.Application');
  except
    try
      FWord := CreateOleObject('Word.Application');
    except
      Exception.Create('Ошибка создания документа Word');
    end;
  end;
  FVars := TDictionary<string, string>.Create;
  FWord.Documents.Open(AFilePath);
end;

procedure TWordReport.CreateForm;
begin
  FSplash := TfSplash.Create(Application.MainForm);
  with FSplash do
  begin
    aiProgress.Active := True;
    Show;
    Update;
    Application.ProcessMessages;
  end;
end;

destructor TWordReport.Destroy;
begin
  FSplash.Free;
  FVars.Free;
  inherited;
end;

procedure TWordReport.Execute;
begin
  if FindAndReplace then
  begin
    FWord.Visible := True;
    FSplash.Hide;
  end;
end;

function TWordReport.FindAndReplace: Boolean;
const wdReplaceAll = 2;
var
  FindText: string;
  ReplaceText: string;
begin
  Result := True;
  if FVars.Count = 0 then Exit;
  // Конфигурация Word для замены
  FWord.Selection.Find.MatchSoundsLike   := False;
  FWord.Selection.Find.MatchAllWordForms := False;
  FWord.Selection.Find.MatchWholeWord    := False;
  FWord.Selection.Find.Format            := False;
  FWord.Selection.Find.Forward           := True;
  FWord.Selection.Find.ClearFormatting;

  for FindText in FVars.Keys do
  begin
    FWord.Selection.Find.Text := Format('$%s#', [ FindText ] );
    ReplaceText := FVars.Items[ FindText ];
    FWord.Selection.Find.Replacement.Text := ReplaceText;
    FindAndReplace := FWord.Selection.Find.Execute( Replace := wdReplaceAll );
    FSplash.aiProgress.Update;
    Application.ProcessMessages;
  end;
end;

procedure TWordReport.SetVars(AVars: TDictionary<string, string>);
begin
  FVars := AVars;
end;

end.
