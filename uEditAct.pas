unit uEditAct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTDialog, cxClasses, cxLookAndFeels,
  RzPanel, Vcl.ExtCtrls, RzDlgBtn, Vcl.StdCtrls, DB, uDataModule, cxGraphics,
  cxControls, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxDropDownEdit, cxCurrencyEdit, cxTextEdit, cxMaskEdit,
  cxCalendar, cxCalc;

type
  TfEditAct = class(TfTDialog)
    Label2: TLabel;
    lbl1: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel1: TBevel;
    edtTaskDateFrom: TcxDateEdit;
    edtTaskDateTo: TcxDateEdit;
    edtTaskTarget: TcxTextEdit;
    edtTaskNum: TcxTextEdit;
    edtTaskDate: TcxDateEdit;
    edtTaskTheme: TcxTextEdit;
    edtRegion: TcxTextEdit;
    edtObjects: TcxTextEdit;
    edtTarif: TcxCurrencyEdit;
    cbbKind: TcxComboBox;
    edtDateFrom: TcxDateEdit;
    edtDateTo: TcxDateEdit;
    edtContractNum: TcxTextEdit;
    Bevel2: TBevel;
    Label13: TLabel;
    edtActNum: TcxTextEdit;
    Label14: TLabel;
    edtActDate: TcxDateEdit;
    Label15: TLabel;
    Label16: TLabel;
    edtCost: TcxCurrencyEdit;
    edtAmount: TcxCalcEdit;
    procedure edtAmountPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Init; override;
    procedure BeforeSave; override;
  end;

var
  fEditAct: TfEditAct;

implementation

uses
  uDBFuncs, uFuncs;

{$R *.dfm}

{ TfEditAct }

procedure TfEditAct.BeforeSave;
begin
  with dm.qryActs do
  begin
    FieldByName('ACT_NUM').AsString     := edtActNum.Text;
    FieldByName('ACT_DATE').AsDateTime  := edtActDate.Date;
    FieldByName('COUNT_ANKETA').AsFloat := edtAmount.Value;
    FieldByName('COST').AsFloat         := edtCost.Value;
  end;
end;

procedure TfEditAct.edtAmountPropertiesChange(Sender: TObject);
begin
  edtCost.Value := edtAmount.Value * dm.qryTasks.FieldByName('TARIF').AsFloat;
end;

procedure TfEditAct.Init;
begin
  with dm.qryActs do
  begin
    BeforePost := SaveToDatabase;

    FieldByName('ACT_ID').AsInteger := ID;

    // Информация по договору
    cbbKind.ItemIndex    := dm.qryContracts.FieldByName('AGREEMENT_KIND').AsInteger;
    edtContractNum.Text  := dm.qryContracts.FieldByName('AGREEMENT_NUM').AsString;
    edtDateFrom.Date     := dm.qryContracts.FieldByName('DATE_START').AsDateTime;
    edtDateTo.Date       := dm.qryContracts.FieldByName('DATE_FINISH').AsDateTime;

    edtTaskNum.Text      := dm.qryTasks.FieldByName('TASK_NUM').AsString;
    edtTaskDate.Date     := dm.qryTasks.FieldByName('TASK_DATE').AsDateTime;
    edtTaskTheme.Text    := dm.qryTasks.FieldByName('TASK_THEME').AsString;
    edtRegion.Text       := dm.qryTasks.FieldByName('REGION_RESEARCH').AsString;
    edtObjects.Text      := dm.qryTasks.FieldByName('OBJECT_RESEARCH').AsString;
    edtTaskTarget.Text   := dm.qryTasks.FieldByName('TASK_TARGET').AsString;
    edtTaskDateFrom.Date := dm.qryTasks.FieldByName('DATE_START').AsDateTime;
    edtTaskDateTo.Date   := dm.qryTasks.FieldByName('DATE_FINISH').AsDateTime;
    edtTarif.Value       := dm.qryTasks.FieldByName('TARIF').AsFloat;

    if State in [dsEdit] then
    begin
      edtActNum.Text  := FieldByName('ACT_NUM').AsString;
      edtActDate.Date := FieldByName('ACT_DATE').AsDateTime;
      edtAmount.Value := FieldByName('COUNT_ANKETA').AsFloat;
    end;
  end;
end;

end.
