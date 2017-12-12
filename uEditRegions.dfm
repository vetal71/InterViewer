inherited fEditRegions: TfEditRegions
  Caption = #1047#1086#1085#1072' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
  ClientHeight = 108
  ClientWidth = 356
  ExplicitWidth = 362
  ExplicitHeight = 137
  PixelsPerInch = 96
  TextHeight = 14
  object lbl2: TLabel [0]
    Left = 8
    Top = 14
    Width = 51
    Height = 14
    Caption = #1054#1073#1083#1072#1089#1090#1100':'
  end
  object lbl1: TLabel [1]
    Left = 8
    Top = 45
    Width = 38
    Height = 14
    Caption = #1043#1086#1088#1086#1076':'
  end
  inherited dlgButtons: TRzDialogButtons
    Top = 72
    Width = 356
    ExplicitLeft = 0
    ExplicitTop = 185
    ExplicitWidth = 415
  end
  object cbbRegions: TcxDBLookupComboBox
    Left = 72
    Top = 11
    DataBinding.DataField = 'REGION_ID'
    DataBinding.DataSource = dm.dsRegions
    Properties.KeyFieldNames = 'REGION_ID'
    Properties.ListColumns = <
      item
        FieldName = 'REGION_NAME'
      end>
    Properties.ListSource = dsRegions
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
  object cbbCities: TcxDBLookupComboBox
    Left = 72
    Top = 42
    DataBinding.DataField = 'CITY_ID'
    DataBinding.DataSource = dm.dsRegions
    Properties.KeyFieldNames = 'CITY_ID'
    Properties.ListColumns = <
      item
        FieldName = 'CITY_NAME'
      end>
    Properties.ListSource = dsCities
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
    TabOrder = 2
    Width = 273
  end
  object dtRegions: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE REGIONS'
      'SET '
      '    REGION_NAME = :REGION_NAME'
      'WHERE'
      '    REGION_ID = :OLD_REGION_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    REGIONS'
      'WHERE'
      '        REGION_ID = :OLD_REGION_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO REGIONS('
      '    REGION_ID,'
      '    REGION_NAME'
      ')'
      'VALUES('
      '    :REGION_ID,'
      '    :REGION_NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    REG.REGION_ID,'
      '    REG.REGION_NAME'
      'FROM'
      '    REGIONS REG'
      ''
      ' WHERE '
      '        REG.REGION_ID = :OLD_REGION_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    REG.REGION_ID,'
      '    REG.REGION_NAME'
      'FROM'
      '    REGIONS REG')
    Transaction = dm.trRead
    Database = dm.dbcFirebird
    UpdateTransaction = dm.trWrite
    AutoCommit = True
    Left = 15
    Top = 12
  end
  object dsRegions: TDataSource
    DataSet = dtRegions
    Left = 81
    Top = 12
  end
  object dtCities: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CITIES'
      'SET '
      '    CITY_NAME = :CITY_NAME,'
      '    REGION_ID = :REGION_ID'
      'WHERE'
      '    CITY_ID = :OLD_CITY_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CITIES'
      'WHERE'
      '        CITY_ID = :OLD_CITY_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CITIES('
      '    CITY_ID,'
      '    CITY_NAME,'
      '    REGION_ID'
      ')'
      'VALUES('
      '    :CITY_ID,'
      '    :CITY_NAME,'
      '    :REGION_ID'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    CIT.CITY_ID,'
      '    CIT.CITY_NAME,'
      '    CIT.REGION_ID'
      'FROM'
      '    CITIES CIT'
      ''
      ' WHERE '
      '        CIT.CITY_ID = :OLD_CITY_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    CIT.CITY_ID,'
      '    CIT.CITY_NAME,'
      '    CIT.REGION_ID'
      'FROM'
      '    CITIES CIT')
    Transaction = dm.trRead
    Database = dm.dbcFirebird
    UpdateTransaction = dm.trWrite
    AutoCommit = True
    Left = 192
    Top = 16
  end
  object dsCities: TDataSource
    DataSet = dtCities
    Left = 237
    Top = 16
  end
end
