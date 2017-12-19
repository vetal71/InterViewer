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
    ExplicitTop = 72
    ExplicitWidth = 356
  end
  object cbbRegions: TcxDBLookupComboBox
    Left = 72
    Top = 11
    DataBinding.DataField = 'REGION_ID'
    DataBinding.DataSource = dsRegions
    Properties.KeyFieldNames = 'REGION_ID'
    Properties.ListColumns = <
      item
        FieldName = 'REGION_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
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
    DataBinding.DataSource = dsCities
    Properties.KeyFieldNames = 'CITY_ID'
    Properties.ListColumns = <
      item
        FieldName = 'CITY_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
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
  object dtRegions: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO REGIONS'
      '  (REGION_ID, REGION_NAME)'
      'VALUES'
      '  (:REGION_ID, :REGION_NAME)')
    SQLDelete.Strings = (
      'DELETE FROM REGIONS'
      'WHERE'
      '  REGION_ID = :Old_REGION_ID')
    SQLUpdate.Strings = (
      'UPDATE REGIONS'
      'SET'
      '  REGION_ID = :REGION_ID, REGION_NAME = :REGION_NAME'
      'WHERE'
      '  REGION_ID = :Old_REGION_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM REGIONS'
      'WHERE'
      'REGION_ID = :Old_REGION_ID'
      'FOR UPDATE WITH LOCK')
    SQLRefresh.Strings = (
      'SELECT REGION_ID, REGION_NAME FROM REGIONS'
      'WHERE'
      '  REGION_ID = :REGION_ID')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM REGIONS'
      ''
      ') q')
    Connection = dm.dbFirebird
    SQL.Strings = (
      'select * from regions')
    Left = 15
    Top = 12
  end
  object dtCities: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO CITIES'
      '  (CITY_ID, CITY_NAME, REGION_ID)'
      'VALUES'
      '  (:CITY_ID, :CITY_NAME, :REGION_ID)')
    SQLDelete.Strings = (
      'DELETE FROM CITIES'
      'WHERE'
      '  CITY_ID = :Old_CITY_ID')
    SQLUpdate.Strings = (
      'UPDATE CITIES'
      'SET'
      
        '  CITY_ID = :CITY_ID, CITY_NAME = :CITY_NAME, REGION_ID = :REGIO' +
        'N_ID'
      'WHERE'
      '  CITY_ID = :Old_CITY_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM CITIES'
      'WHERE'
      'CITY_ID = :Old_CITY_ID'
      'FOR UPDATE WITH LOCK')
    SQLRefresh.Strings = (
      'SELECT CITY_ID, CITY_NAME, REGION_ID FROM CITIES'
      'WHERE'
      '  CITY_ID = :CITY_ID')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM CITIES'
      ''
      ') q')
    Connection = dm.dbFirebird
    SQL.Strings = (
      'select * from cities')
    MasterSource = dsRegions
    MasterFields = 'REGION_ID'
    DetailFields = 'REGION_ID'
    Left = 192
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'REGION_ID'
        Value = nil
      end>
  end
  object dsRegions: TUniDataSource
    DataSet = dtRegions
    Left = 96
    Top = 16
  end
  object dsCities: TUniDataSource
    DataSet = dtCities
    Left = 237
    Top = 16
  end
end
