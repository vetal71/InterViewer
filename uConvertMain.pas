unit uConvertMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, FIBDatabase,
  pFIBDatabase, pFIBQuery, pFibProps, pFIBDataSet, uFuncs, System.IniFiles,
  uDBFuncs;

type
  TfrmConvert = class(TForm)
    lblCaption: TLabel;
    pbMain: TProgressBar;
    dbcFirebird: TpFIBDatabase;
    btnConvert: TButton;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    procedure btnConvertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UpdateProgress(AMax, ACurrent: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConvert: TfrmConvert;

implementation

{$R *.dfm}

const SQLSelect = 'select code, fio, sex, currentnotes, region, city, ' + #10#13 +
  'birthdate, celurarphone, homephone, email, othertypelinks, address, ' + #10#13 +
  'passport, specialization, transfertype, numbercard, memberprojects, ' + #10#13 +
  'datelast, countanketa, percentgood, percentbad, generalcharacteristic,' + #10#13 +
  'issupervizer, isblacklist from contacts order by code';
const SQLInsert = 'insert into book_contacts (bcontact_id, fio, gender, notes, birthday, ' + #10#13 +
  'passport, specialization, project_list, last_date, amount_forms, ' + #10#13 +
  'percent_good_forms, percent_bad_forms, characteristics, is_superviser, ' + #10#13 +
  'is_in_black_list) values (:id_, :fio_, :gender_, :notes_, :birthdate_, :passport_, ' + #10#13 +
  ':specialization_, :memberprojects_, :datelast_, :countanketa_, ' + #10#13 +
  ':percentgood_, :percentbad_, :generalcharacteristic_, :issupervizer_, ' + #10#13 +
  ':isblacklist_)';
const SQLInsertCity = 'insert into work_cities (contact_id, city_id, city_name)' + #10#13 +
  'values (:contact_id, :city_id, :city_name)';
const SQLInsertContInfo = 'insert into contact_info (cit_id, contact_id, contact_info_value)' + #10#13 +
  'values (:cit_id, :contact_id, :contact_info_value)';
const SQLInsertTransInfo = 'insert into transfer_info (tt_id, contact_id, bank_name,' + #10#13 +
  'card_name, card_period) values (:tt_id, :contact_id, :bank_name, :card_name, :card_period)';

procedure TfrmConvert.btnConvertClick(Sender: TObject);
var
  i, id, j: Integer;
  q: TpFibDataSet;
  q2: TpFIBQuery;
  str: string;
  CityList: TStringList;
  CityId: Integer;
begin
  // Конвертация данных
  lblCaption.Visible := True;
  pbMain.Visible     := True;
  id := 1;
  // удаляем все данные из таблицы
  try
    dbcFirebird.Execute('delete from book_contacts');
  except on E: Exception do
    ShowError('При удалении данных возникла ошибка' + #13#10 + E.Message);
  end;
  q := TpFIBDataSet.Create(nil);
    with q do
    try
      Database    := dbcFirebird;
      Transaction := trRead;
      SelectSQL.Text := SQLSelect;
      Open;
      q2 := TpFIBQuery.Create(nil);
      q2.Database := dbcFirebird;
      q2.Transaction := trWrite;
      q2.Options := [qoStartTransaction, qoAutoCommit];
      q2.SQL.Text := SQLInsert;
      while not Eof do
      begin
        UpdateProgress(q.RecordCountFromSrv, q.RecNo);
        // TODO Вставка записей
        // поле ПОЛ
        if Trim(VarToStr(FieldValues['sex'])) = 'мужской' then
          str := 'М'
        else
          str := 'Ж';
        // вставка записей в таблицу BOOK_CONTACTS
        try
          q2.ExecWP([
            id,
            VarToStr(FieldValues['fio']),
            str,
            VarToStr(FieldValues['currentnotes']),
            FieldValues['birthdate'],
            VarToStr(FieldValues['passport']),
            VarToStr(FieldValues['specialization']),
            VarToStr(FieldValues['memberprojects']),
            FieldValues['datelast'],
            VarToInt(FieldValues['countanketa']),
            VarToInt(FieldValues['percentgood']),
            VarToInt(FieldValues['percentbad']),
            VarToStr(FieldValues['generalcharacteristic']),
            VarToInt(FieldValues['issupervizer']),
            VarToInt(FieldValues['isblacklist'])
          ]);
        except on E: Exception do
          ShowError(Format('Попытка добавления записи с id=%d'#13#10'%s', [FieldValues['code'], E.Message]));
        end;
        // вставка записей в таблицу CITIES
        // для этого необходимо выполнить подготовку поля CITY
        str := VarToStr(FieldValues['city']);
        if str > '' then
        begin
          CityList := TStringList.Create;
          try
            CityList := StrToStrL(str, [',', '/']);
            with TpFIBQuery.Create(nil) do
              try
                Database := dbcFirebird;
                Transaction := trWrite;
                Options := [qoStartTransaction, qoAutoCommit];
                SQL.Text := SQLInsertCity;
                for j := 0 to CityList.Count - 1 do
                begin
                  CityId := VarToInt(dbcFirebird.QueryValue(Format( 'select city_id from cities where city_name = ''%s''', [ CityList[ j ] ] ), 0));
                  //if CityId > 0 then
                  try
                    ExecWP([id, CityId, CityList[ j ]]);
                  except on E: Exception do
                    ShowError(Format('Не удалось сохранить место работы для контакта %s'#13#10'%s', [FieldValues['fio'], E.Message]));
                  end;
                end;
              finally
                Free;
              end;
          finally
            CityList.Free;
          end;
        end;
        // добавляем контактные данные
        with TpFIBQuery.Create(nil) do
          try
            Database := dbcFirebird;
            Transaction := trWrite;
            Options := [qoStartTransaction, qoAutoCommit];
            SQL.Text := SQLInsertContInfo;
            try
              str := VarToStr(FieldValues['address']);
              if str > '' then
                ExecWP([1, id, str]);
              str := VarToStr(FieldValues['celurarphone']);
              if str > '' then
                ExecWP([2, id, str]);
              str := VarToStr(FieldValues['homephone']);
              if str > '' then
                ExecWP([3, id, str]);
              str := VarToStr(FieldValues['email']);
              if str > '' then
                ExecWP([4, id, str]);
              str := VarToStr(FieldValues['othertypelinks']);
              if str > '' then
                ExecWP([5, id, str]);
            except on E: Exception do
              ShowError(Format('Не удалось сохранить контактные данные для контакта %s'#13#10'%s', [FieldValues['fio'], E.Message]));
            end;
          finally
            Free;
          end;
        // добавляем финансовые данные
        with TpFIBQuery.Create(nil) do
          try
            Database := dbcFirebird;
            Transaction := trWrite;
            Options := [qoStartTransaction, qoAutoCommit];
            SQL.Text := SQLInsertTransInfo;
            str := VarToStr(FieldValues['transfertype']);
            if str > '' then
              try
                ExecWP([2, id, str, FieldValues['numbercard']]);
              except on E: Exception do
                ShowError(Format('Не удалось сохранить финансовые данные для контакта %s'#13#10'%s', [FieldValues['fio'], E.Message]));
              end;
          finally
            Free;
          end;

        id := id + 1;
        Next;
      end;
      q.Close;
    finally
      q.Free;
      q2.Free;
    end;
end;

procedure TfrmConvert.FormCreate(Sender: TObject);
const cMsgErrorConnect = 'Ошибка соединения с БД %s';
var
  UpdateURL, AppDir, ConnectionStr: string;
begin
  AppDir := IncludeTrailingPathDelimiter( ExtractFilePath(ParamStr(0)) );
    AppDir := IncludeTrailingPathDelimiter( ExtractFilePath(ParamStr(0)) );

  InitConnection(dbcFirebird, AppDir + 'config.ini');
  try
    dbcFirebird.Connected := True;
  except
    Application.MessageBox(PWideChar(Format(cMsgErrorConnect, [dbcFirebird.DBName])),
      'Ошибка соединения', MB_OK or MB_ICONERROR);
  end;

  try
    dbcFirebird.Connected := True;
  except
    Application.MessageBox(PWideChar(Format(cMsgErrorConnect, [dbcFirebird.DBName])),
      'Ошибка соединения', MB_OK or MB_ICONERROR);
  end;

end;

procedure TfrmConvert.UpdateProgress(AMax, ACurrent: Integer);
begin
  lblCaption.Caption := Format('Запись %d из %d', [ACurrent, AMax]);
  pbMain.Max := AMax;
  pbMain.Position := ACurrent;
  Update;
end;

end.
