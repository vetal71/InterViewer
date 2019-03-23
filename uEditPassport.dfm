inherited fEditPassport: TfEditPassport
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1072#1089#1087#1086#1088#1090#1072
  ClientHeight = 142
  ClientWidth = 662
  ExplicitWidth = 668
  ExplicitHeight = 171
  PixelsPerInch = 96
  TextHeight = 14
  inherited dlgButtons: TRzDialogButtons
    Top = 106
    Width = 662
    EnableOk = False
    ExplicitTop = 131
    ExplicitWidth = 662
  end
  inherited pnlMain: TRzPanel
    Width = 662
    Height = 106
    ExplicitTop = 0
    ExplicitWidth = 662
    ExplicitHeight = 131
    object lbl1: TLabel
      Left = 107
      Top = 42
      Width = 41
      Height = 14
      Caption = #1053#1086#1084#1077#1088':'
    end
    object lbl2: TLabel
      Left = 10
      Top = 42
      Width = 39
      Height = 14
      Caption = #1057#1077#1088#1080#1103':'
    end
    object lbl3: TLabel
      Left = 262
      Top = 42
      Width = 75
      Height = 14
      Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080':'
    end
    object lbl4: TLabel
      Left = 10
      Top = 70
      Width = 39
      Height = 14
      Caption = #1042#1099#1076#1072#1085':'
    end
    object edtDateGive: TcxDateEdit
      Left = 343
      Top = 39
      Properties.UseNullString = True
      Properties.OnChange = edtSiriesPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 120
    end
    object edtFullPassport: TcxTextEdit
      Left = 9
      Top = 7
      Enabled = False
      Properties.OnChange = edtFullPassportPropertiesChange
      Style.BorderStyle = ebsSingle
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 640
    end
    object edtNumber: TcxTextEdit
      Left = 156
      Top = 39
      Properties.OnChange = edtSiriesPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 100
    end
    object edtSiries: TcxTextEdit
      Left = 59
      Top = 39
      Properties.OnChange = edtSiriesPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Text = 'KB'
      Width = 40
    end
    object edtWhoGive: TcxTextEdit
      Left = 59
      Top = 67
      Properties.OnChange = edtSiriesPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      Width = 590
    end
  end
end
