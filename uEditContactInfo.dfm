inherited fEditContactInfo: TfEditContactInfo
  Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
  ClientHeight = 111
  ClientWidth = 474
  OnCreate = FormCreate
  ExplicitWidth = 480
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
    Width = 474
    ExplicitLeft = 0
    ExplicitTop = 185
    ExplicitWidth = 415
  end
  object cbbContactInfoType: TcxDBLookupComboBox
    Left = 192
    Top = 11
    DataBinding.DataField = 'CIT_ID'
    DataBinding.DataSource = dm.dsContactInfo
    Properties.KeyFieldNames = 'CIT_ID'
    Properties.ListColumns = <
      item
        FieldName = 'CIT_NAME'
      end>
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
    Width = 273
  end
  object edtValue: TcxDBTextEdit
    Left = 192
    Top = 42
    DataBinding.DataField = 'CONTACT_INFO_VALUE'
    DataBinding.DataSource = dm.dsContactInfo
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Width = 273
  end
  object dtContactInfoType: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CONTACT_INFO_TYPES'
      'SET '
      '    CIT_NAME = :CIT_NAME,'
      '    CIT_TEMPLATE = :CIT_TEMPLATE'
      'WHERE'
      '    CIT_ID = :OLD_CIT_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CONTACT_INFO_TYPES'
      'WHERE'
      '        CIT_ID = :OLD_CIT_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CONTACT_INFO_TYPES('
      '    CIT_ID,'
      '    CIT_NAME,'
      '    CIT_TEMPLATE'
      ')'
      'VALUES('
      '    :CIT_ID,'
      '    :CIT_NAME,'
      '    :CIT_TEMPLATE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    CIT.CIT_ID,'
      '    CIT.CIT_NAME,'
      '    CIT.CIT_TEMPLATE'
      'FROM'
      '    CONTACT_INFO_TYPES CIT'
      ''
      ' WHERE '
      '        CIT.CIT_ID = :OLD_CIT_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    CIT.CIT_ID,'
      '    CIT.CIT_NAME,'
      '    CIT.CIT_TEMPLATE'
      'FROM'
      '    CONTACT_INFO_TYPES CIT')
    Transaction = dm.trRead
    Database = dm.dbcFirebird
    UpdateTransaction = dm.trWrite
    AutoCommit = True
    Left = 160
    Top = 8
  end
  object dsContactInfoType: TDataSource
    DataSet = dtContactInfoType
    Left = 248
    Top = 8
  end
end
