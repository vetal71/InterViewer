inherited fEditFIO: TfEditFIO
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1080#1084#1077#1085#1080
  ClientHeight = 173
  ClientWidth = 539
  ExplicitWidth = 545
  ExplicitHeight = 202
  PixelsPerInch = 96
  TextHeight = 14
  inherited dlgButtons: TRzDialogButtons
    Top = 137
    Width = 539
    ExplicitTop = 137
    ExplicitWidth = 539
  end
  inherited pnlMain: TRzPanel
    Width = 539
    Height = 137
    ExplicitTop = 0
    ExplicitWidth = 539
    ExplicitHeight = 137
    object lbl1: TLabel
      Left = 8
      Top = 73
      Width = 27
      Height = 14
      Caption = #1048#1084#1103':'
    end
    object lbl2: TLabel
      Left = 8
      Top = 43
      Width = 56
      Height = 14
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
    end
    object lbl3: TLabel
      Left = 8
      Top = 102
      Width = 58
      Height = 14
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
    end
    object edtFullFIO: TcxTextEdit
      Left = 8
      Top = 8
      Enabled = False
      Style.BorderStyle = ebsSingle
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 523
    end
    object edtName: TcxTextEdit
      Left = 128
      Top = 70
      Anchors = [akLeft, akTop, akRight]
      Properties.OnChange = edtSecondNamePropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 403
    end
    object edtSecondName: TcxTextEdit
      Left = 128
      Top = 40
      Anchors = [akLeft, akTop, akRight]
      Properties.OnChange = edtSecondNamePropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 403
    end
    object edtSeName: TcxTextEdit
      Left = 128
      Top = 99
      Anchors = [akLeft, akTop, akRight]
      Properties.OnChange = edtSecondNamePropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Width = 403
    end
  end
end
