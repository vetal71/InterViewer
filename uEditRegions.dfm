inherited fEditRegions: TfEditRegions
  Caption = #1047#1086#1085#1072' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
  ClientHeight = 114
  ClientWidth = 356
  OnCreate = FormCreate
  ExplicitWidth = 362
  ExplicitHeight = 143
  PixelsPerInch = 96
  TextHeight = 14
  inherited dlgButtons: TRzDialogButtons
    Top = 78
    Width = 356
    EnableOk = False
    ExplicitTop = 100
    ExplicitWidth = 356
  end
  inherited pnlMain: TRzPanel
    Width = 356
    Height = 78
    ExplicitTop = 0
    ExplicitWidth = 356
    ExplicitHeight = 100
    object lbl1: TLabel
      Left = 8
      Top = 45
      Width = 38
      Height = 14
      Caption = #1043#1086#1088#1086#1076':'
    end
    object lbl2: TLabel
      Left = 8
      Top = 14
      Width = 51
      Height = 14
      Caption = #1054#1073#1083#1072#1089#1090#1100':'
    end
    object cbbCities: TcxDBLookupComboBox
      Left = 72
      Top = 39
      DataBinding.DataField = 'CITY_ID'
      DataBinding.DataSource = dm.udsRegions
      Properties.KeyFieldNames = 'CITY_ID'
      Properties.ListColumns = <
        item
          FieldName = 'CITY_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsCities
      Properties.OnChange = cbbCitiesPropertiesChange
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
      Width = 273
    end
    object cbbRegions: TcxComboBox
      Left = 72
      Top = 11
      Properties.OnChange = cbbRegionsPropertiesChange
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
      Text = 'cbbRegions'
      Width = 273
    end
  end
  object dtRegions: TUniQuery
    Connection = dm.dbFirebird
    SQL.Strings = (
      'select * from regions'
      'order by region_id')
    Left = 299
    Top = 31
  end
  object dsRegions: TUniDataSource
    DataSet = dtRegions
    Left = 96
    Top = 15
  end
  object dsCities: TUniDataSource
    DataSet = dtCities
    Left = 237
    Top = 16
  end
  object dtCities: TUniQuery
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
      'select * from cities')
    MasterSource = dsRegions
    MasterFields = 'REGION_ID'
    DetailFields = 'REGION_ID'
    Left = 175
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'REGION_ID'
        ParamType = ptInput
        Value = 1
      end>
  end
end
