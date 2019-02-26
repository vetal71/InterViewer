unit uEditTask;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTDialog, cxClasses, cxLookAndFeels,
  Vcl.ExtCtrls, RzPanel, RzDlgBtn, cxGraphics, cxControls,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  Vcl.StdCtrls, DB, uDataModule;

type
  TfEditTask = class(TfTDialog)
    Label2: TLabel;
    lbl1: TLabel;
    Label3: TLabel;
    edtTaskDateFrom: TcxDateEdit;
    edtTaskDateTo: TcxDateEdit;
    edtTaskTarget: TcxTextEdit;
    Label1: TLabel;
    edtTaskNum: TcxTextEdit;
    Label4: TLabel;
    edtTaskDate: TcxDateEdit;
    Label5: TLabel;
    edtTaskTheme: TcxTextEdit;
    Label6: TLabel;
    edtRegion: TcxTextEdit;
    Label7: TLabel;
    edtObjects: TcxTextEdit;
    edtTarif: TcxCurrencyEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cbbKind: TcxComboBox;
    edtDateFrom: TcxDateEdit;
    edtDateTo: TcxDateEdit;
    edtContractNum: TcxTextEdit;
    Bevel1: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Init; override;
    procedure BeforeSave; override;
  end;

var
  fEditTask: TfEditTask;

implementation

uses
  uDBFuncs, uFuncs;

{$R *.dfm}

{ TfEditTask }

procedure TfEditTask.BeforeSave;
begin
  with dm.qryTasks do
  begin
    FieldByName('TASK_NUM').AsString        := edtTaskNum.Text;
    FieldByName('TASK_DATE').AsDateTime     := edtTaskDate.Date;
    FieldByName('TASK_THEME').AsString      := edtTaskTheme.Text;
    FieldByName('REGION_RESEARCH').AsString := edtRegion.Text;
    FieldByName('OBJECT_RESEARCH').AsString := edtObjects.Text;
    FieldByName('TASK_TARGET').AsString     := edtTaskTarget.Text;
    FieldByName('DATE_START').AsDateTime    := edtTaskDateFrom.Date;
    FieldByName('DATE_FINISH').AsDateTime   := edtTaskDateTo.Date;
    FieldByName('TARIF').AsFloat            := edtTarif.Value;
  end;
end;

procedure TfEditTask.Init;
begin
  with dm.qryTasks do
  begin
    BeforePost := SaveToDatabase;

    FieldByName('TASK_ID').AsInteger := ID;

    // Информация по договору
    cbbKind.ItemIndex   := dm.qryContracts.FieldByName('AGREEMENT_KIND').AsInteger;
    edtContractNum.Text := dm.qryContracts.FieldByName('AGREEMENT_NUM').AsString;
    edtDateFrom.Date    := dm.qryContracts.FieldByName('DATE_START').AsDateTime;
    edtDateTo.Date      := dm.qryContracts.FieldByName('DATE_FINISH').AsDateTime;

    if State in [dsEdit] then
    begin
      edtTaskNum.Text      := FieldByName('TASK_NUM').AsString;
      edtTaskDate.Date     := FieldByName('TASK_DATE').AsDateTime;
      edtTaskTheme.Text    := FieldByName('TASK_THEME').AsString;
      edtRegion.Text       := FieldByName('REGION_RESEARCH').AsString;
      edtObjects.Text      := FieldByName('OBJECT_RESEARCH').AsString;
      edtTaskTarget.Text   := FieldByName('TASK_TARGET').AsString;
      edtTaskDateFrom.Date := FieldByName('DATE_START').AsDateTime;
      edtTaskDateTo.Date   := FieldByName('DATE_FINISH').AsDateTime;
      edtTarif.Value       := FieldByName('TARIF').AsFloat;
    end;
  end;
end;

end.
