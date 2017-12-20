inherited fEditContactInfo: TfEditContactInfo
  Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
  ClientHeight = 111
  ClientWidth = 577
  OnCreate = FormCreate
  ExplicitWidth = 583
  ExplicitHeight = 140
  PixelsPerInch = 96
  TextHeight = 14
  object lbl2: TLabel [0]
    Left = 8
    Top = 14
    Width = 171
    Height = 14
    Caption = #1042#1080#1076' '#1082#1086#1085#1090#1072#1082#1090#1085#1086#1081' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080':'
  end
  object lbl1: TLabel [1]
    Left = 8
    Top = 45
    Width = 58
    Height = 14
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077':'
  end
  inherited dlgButtons: TRzDialogButtons
    Top = 75
    Width = 577
    ExplicitLeft = 0
    ExplicitTop = 75
    ExplicitWidth = 474
  end
  object cbbContactInfoType: TcxDBLookupComboBox
    Left = 192
    Top = 11
    DataBinding.DataField = 'CIT_ID'
    DataBinding.DataSource = dm.udsContactInfo
    Properties.KeyFieldNames = 'CIT_ID'
    Properties.ListColumns = <
      item
        FieldName = 'CIT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsContactInfoType
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = False
    Style.ButtonStyle = btsFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Width = 377
  end
  object edtValue: TcxDBMaskEdit
    Left = 192
    Top = 42
    DataBinding.DataField = 'CONTACT_INFO_VALUE'
    DataBinding.DataSource = dm.udsContactInfo
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Width = 377
  end
  object dtContactInfoType: TUniQuery
    Connection = dm.dbFirebird
    SQL.Strings = (
      'select * from contact_info_types')
    Left = 160
    Top = 8
  end
  object dsContactInfoType: TUniDataSource
    DataSet = dtContactInfoType
    Left = 248
    Top = 8
  end
end
