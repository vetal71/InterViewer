unit uContact;

interface

uses
  uContactInfoType;

type
  TContact = class
  private
    function GetId: Integer;
    procedure SetId(AValue: Integer);
    function GetFIO: string;
    procedure SetFIO(const Value: string);
    function GetGender: string;
    procedure SetGender(const Value: string);
    procedure SetBirthday(const Value: TDateTime);
    function GetBirthday: TDateTime;
    function GetPassport: string;
    procedure SetPassport(const Value: string);
    function GetSpecialization: string;
    procedure SetSpecialization(const Value: string);
    procedure SetProjectList(const Value: string);
    function GetProjectList: string;
    function GetLastDate: TDateTime;
    procedure SetLastDate(const Value: TDateTime);
    function GetAmountForms: Integer;
    procedure SetAmountForms(const Value: Integer);
    function GetCharacteristics: string;
    function GetIsInBlackList: Integer;
    function GetIsSuperviser: Integer;
    function GetPercentBadForms: Integer;
    function GetPercentGoodForms: Integer;
    function GetSocialNumber: string;
    procedure SetCharacteristics(const Value: string);
    procedure SetIsInBlackList(const Value: Integer);
    procedure SetIsSuperviser(const Value: Integer);
    procedure SetPercentBadForms(const Value: Integer);
    procedure SetPercentGoodForms(const Value: Integer);
    procedure SetSocialNumber(const Value: string);
  public
    property Id: Integer read GetId write SetId;
    property FIO: string read GetFIO write SetFIO;
    property Gender: string read GetGender write SetGender;
    property Birthday: TDateTime read GetBirthday write SetBirthday;
    property Passport: string read GetPassport write SetPassport;
    property Specialization: string read GetSpecialization write SetSpecialization;
    property ProjectList: string read GetProjectList write SetProjectList;
    property LastDate: TDateTime read GetLastDate write SetLastDate;
    property AmountForms: Integer read GetAmountForms write SetAmountForms;
    property PercentGoodForms: Integer read GetPercentGoodForms write SetPercentGoodForms;
    property PercentBadForms: Integer read GetPercentBadForms write SetPercentBadForms;
    property Characteristics: string read GetCharacteristics write SetCharacteristics;
    property IsSuperviser: Integer read GetIsSuperviser write SetIsSuperviser;
    property IsInBlackList: Integer read GetIsInBlackList write SetIsInBlackList;
    property SocialNumber: string read GetSocialNumber write SetSocialNumber;
  end;

implementation

{ TContact }

function TContact.GetAmountForms: Integer;
begin

end;

function TContact.GetBirthday: TDateTime;
begin

end;

function TContact.GetCharacteristics: string;
begin

end;

function TContact.GetFIO: string;
begin

end;

function TContact.GetGender: string;
begin

end;

function TContact.GetId: Integer;
begin

end;

function TContact.GetIsInBlackList: Integer;
begin

end;

function TContact.GetIsSuperviser: Integer;
begin

end;

function TContact.GetLastDate: TDateTime;
begin

end;

function TContact.GetPassport: string;
begin

end;

function TContact.GetPercentBadForms: Integer;
begin

end;

function TContact.GetPercentGoodForms: Integer;
begin

end;

function TContact.GetProjectList: string;
begin

end;

function TContact.GetSocialNumber: string;
begin

end;

function TContact.GetSpecialization: string;
begin

end;

procedure TContact.SetAmountForms(const Value: Integer);
begin

end;

procedure TContact.SetBirthday(const Value: TDateTime);
begin

end;

procedure TContact.SetCharacteristics(const Value: string);
begin

end;

procedure TContact.SetFIO(const Value: string);
begin

end;

procedure TContact.SetGender(const Value: string);
begin

end;

procedure TContact.SetId(AValue: Integer);
begin

end;

procedure TContact.SetIsInBlackList(const Value: Integer);
begin

end;

procedure TContact.SetIsSuperviser(const Value: Integer);
begin

end;

procedure TContact.SetLastDate(const Value: TDateTime);
begin

end;

procedure TContact.SetPassport(const Value: string);
begin

end;

procedure TContact.SetPercentBadForms(const Value: Integer);
begin

end;

procedure TContact.SetPercentGoodForms(const Value: Integer);
begin

end;

procedure TContact.SetProjectList(const Value: string);
begin

end;

procedure TContact.SetSocialNumber(const Value: string);
begin

end;

procedure TContact.SetSpecialization(const Value: string);
begin

end;

end.
