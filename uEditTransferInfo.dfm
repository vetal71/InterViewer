inherited fEditTransferInfo: TfEditTransferInfo
  Caption = #1060#1080#1085#1072#1085#1089#1086#1074#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
  ClientHeight = 203
  ClientWidth = 458
  OnCreate = FormCreate
  ExplicitWidth = 464
  ExplicitHeight = 232
  PixelsPerInch = 96
  TextHeight = 14
  object lbl2: TLabel [0]
    Left = 8
    Top = 14
    Width = 83
    Height = 14
    Caption = #1042#1080#1076' '#1087#1077#1088#1077#1074#1086#1076#1072':'
  end
  object lbl1: TLabel [1]
    Left = 9
    Top = 45
    Width = 30
    Height = 14
    Caption = #1041#1072#1085#1082':'
  end
  object lbl3: TLabel [2]
    Left = 9
    Top = 76
    Width = 78
    Height = 14
    Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099':'
  end
  object lbl4: TLabel [3]
    Left = 9
    Top = 135
    Width = 75
    Height = 14
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
  end
  object lbl5: TLabel [4]
    Left = 9
    Top = 105
    Width = 84
    Height = 14
    Caption = #1055#1077#1088#1080#1086#1076' '#1082#1072#1088#1090#1099':'
  end
  inherited dlgButtons: TRzDialogButtons
    Top = 167
    Width = 458
    EnableOk = False
    TabOrder = 5
    ExplicitTop = 167
    ExplicitWidth = 458
  end
  object cbbTransferInfoType: TcxDBLookupComboBox
    Left = 104
    Top = 11
    DataBinding.DataField = 'TT_ID'
    DataBinding.DataSource = dm.udsTransferInfo
    Properties.KeyFieldNames = 'TT_ID'
    Properties.ListColumns = <
      item
        FieldName = 'TT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsTransferType
    Properties.OnChange = cbbTransferInfoTypePropertiesChange
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
    TabOrder = 0
    Width = 346
  end
  object edtBank: TcxDBTextEdit
    Left = 104
    Top = 42
    DataBinding.DataField = 'BANK_NAME'
    DataBinding.DataSource = dm.udsTransferInfo
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Width = 346
  end
  object edtNote: TcxDBMaskEdit
    Left = 104
    Top = 132
    DataBinding.DataField = 'NOTES'
    DataBinding.DataSource = dm.udsTransferInfo
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 4
    Width = 346
  end
  object edtCard: TcxDBMaskEdit
    Left = 104
    Top = 74
    DataBinding.DataField = 'CARD_NAME'
    DataBinding.DataSource = dm.udsTransferInfo
    Properties.EditMask = '!9999-9999-9999-9999;1;_'
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Width = 346
  end
  object edtPeriodCard: TcxDBTextEdit
    Left = 104
    Top = 102
    DataBinding.DataField = 'CARD_PERIOD'
    DataBinding.DataSource = dm.udsTransferInfo
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 3
    Width = 105
  end
  object tblTransferType: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO V_CONTACTS'
      
        '  (BCONTACT_ID, FIO, GENDER, NOTES, BIRTHDAY, PASSPORT, SPECIALI' +
        'ZATION, PROJECT_LIST, LAST_DATE, AMOUNT_FORMS, PERCENT_GOOD_FORM' +
        'S, PERCENT_BAD_FORMS, CHARACTERISTICS, IS_SUPERVISER, IS_IN_BLAC' +
        'K_LIST, SOCIAL_NUMBER, PHOTO, REGION_NAME, CITY_NAME, F_ADDRESS,' +
        ' F_CELURAR, F_HOMEPHONE, F_EMAIL, F_SOCIALNET, F_TRANSFERS, REC_' +
        'ID)'
      'VALUES'
      
        '  (:BCONTACT_ID, :FIO, :GENDER, :NOTES, :BIRTHDAY, :PASSPORT, :S' +
        'PECIALIZATION, :PROJECT_LIST, :LAST_DATE, :AMOUNT_FORMS, :PERCEN' +
        'T_GOOD_FORMS, :PERCENT_BAD_FORMS, :CHARACTERISTICS, :IS_SUPERVIS' +
        'ER, :IS_IN_BLACK_LIST, :SOCIAL_NUMBER, :PHOTO, :REGION_NAME, :CI' +
        'TY_NAME, :F_ADDRESS, :F_CELURAR, :F_HOMEPHONE, :F_EMAIL, :F_SOCI' +
        'ALNET, :F_TRANSFERS, :REC_ID)')
    SQLDelete.Strings = (
      'DELETE FROM V_CONTACTS'
      'WHERE'
      '  REC_ID = :Old_REC_ID')
    SQLUpdate.Strings = (
      'UPDATE V_CONTACTS'
      'SET'
      
        '  BCONTACT_ID = :BCONTACT_ID, FIO = :FIO, GENDER = :GENDER, NOTE' +
        'S = :NOTES, BIRTHDAY = :BIRTHDAY, PASSPORT = :PASSPORT, SPECIALI' +
        'ZATION = :SPECIALIZATION, PROJECT_LIST = :PROJECT_LIST, LAST_DAT' +
        'E = :LAST_DATE, AMOUNT_FORMS = :AMOUNT_FORMS, PERCENT_GOOD_FORMS' +
        ' = :PERCENT_GOOD_FORMS, PERCENT_BAD_FORMS = :PERCENT_BAD_FORMS, ' +
        'CHARACTERISTICS = :CHARACTERISTICS, IS_SUPERVISER = :IS_SUPERVIS' +
        'ER, IS_IN_BLACK_LIST = :IS_IN_BLACK_LIST, SOCIAL_NUMBER = :SOCIA' +
        'L_NUMBER, PHOTO = :PHOTO, REGION_NAME = :REGION_NAME, CITY_NAME ' +
        '= :CITY_NAME, F_ADDRESS = :F_ADDRESS, F_CELURAR = :F_CELURAR, F_' +
        'HOMEPHONE = :F_HOMEPHONE, F_EMAIL = :F_EMAIL, F_SOCIALNET = :F_S' +
        'OCIALNET, F_TRANSFERS = :F_TRANSFERS, REC_ID = :REC_ID'
      'WHERE'
      '  REC_ID = :Old_REC_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM V_CONTACTS'
      'WHERE'
      'REC_ID = :Old_REC_ID'
      'FOR UPDATE WITH LOCK')
    SQLRefresh.Strings = (
      
        'SELECT BCONTACT_ID, FIO, GENDER, NOTES, BIRTHDAY, PASSPORT, SPEC' +
        'IALIZATION, PROJECT_LIST, LAST_DATE, AMOUNT_FORMS, PERCENT_GOOD_' +
        'FORMS, PERCENT_BAD_FORMS, CHARACTERISTICS, IS_SUPERVISER, IS_IN_' +
        'BLACK_LIST, SOCIAL_NUMBER, PHOTO, REGION_NAME, CITY_NAME, F_ADDR' +
        'ESS, F_CELURAR, F_HOMEPHONE, F_EMAIL, F_SOCIALNET, F_TRANSFERS, ' +
        'REC_ID FROM V_CONTACTS'
      'WHERE'
      '  REC_ID = :REC_ID')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM V_CONTACTS'
      ''
      ') q')
    Connection = dm.dbFirebird
    SQL.Strings = (
      'SELECT'
      '    TRA.TT_ID,'
      '    TRA.TT_NAME'
      'FROM'
      '    TRANSFER_TYPES TRA')
    Left = 304
    Top = 79
  end
  object dsTransferType: TUniDataSource
    DataSet = tblTransferType
    Left = 390
    Top = 79
  end
end
