inherited fEditTransferInfo: TfEditTransferInfo
  Caption = #1060#1080#1085#1072#1085#1089#1086#1074#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
  ClientHeight = 203
  ClientWidth = 458
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
    ExplicitLeft = 0
    ExplicitTop = 185
    ExplicitWidth = 415
  end
  object cbbTransferInfoType: TcxDBLookupComboBox
    Left = 104
    Top = 11
    DataBinding.DataField = 'TT_ID'
    DataBinding.DataSource = dm.dsTransferInfo
    Properties.KeyFieldNames = 'TT_ID'
    Properties.ListColumns = <
      item
        FieldName = 'TT_NAME'
      end>
    Properties.ListSource = dsTransferType
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
    Width = 346
  end
  object edtBank: TcxDBTextEdit
    Left = 104
    Top = 42
    DataBinding.DataField = 'BANK_NAME'
    DataBinding.DataSource = dm.dsTransferInfo
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
  object edtCard: TcxDBTextEdit
    Left = 104
    Top = 73
    DataBinding.DataField = 'CARD_NAME'
    DataBinding.DataSource = dm.dsTransferInfo
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 3
    Width = 346
  end
  object edtPeriodCard: TcxDBMaskEdit
    Left = 104
    Top = 102
    DataBinding.DataField = 'CARD_PERIOD'
    DataBinding.DataSource = dm.dsTransferInfo
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '([0]{1}[1-9]{1}|([1]{1}[12]{1}))\/(\d{2})'
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 5
    Width = 105
  end
  object edtNote: TcxDBMaskEdit
    Left = 104
    Top = 132
    DataBinding.DataField = 'NOTES'
    DataBinding.DataSource = dm.dsTransferInfo
    Properties.EditMask = '!9999-9999-9999-9999;1;_'
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
  object dtTransferType: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TRANSFER_TYPES'
      'SET '
      '    TT_NAME = :TT_NAME'
      'WHERE'
      '    TT_ID = :OLD_TT_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TRANSFER_TYPES'
      'WHERE'
      '        TT_ID = :OLD_TT_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TRANSFER_TYPES('
      '    TT_ID,'
      '    TT_NAME'
      ')'
      'VALUES('
      '    :TT_ID,'
      '    :TT_NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    TRA.TT_ID,'
      '    TRA.TT_NAME'
      'FROM'
      '    TRANSFER_TYPES TRA'
      ''
      ' WHERE '
      '        TRA.TT_ID = :OLD_TT_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    TRA.TT_ID,'
      '    TRA.TT_NAME'
      'FROM'
      '    TRANSFER_TYPES TRA')
    Transaction = dm.trRead
    Database = dm.dbcFirebird
    UpdateTransaction = dm.trWrite
    AutoCommit = True
    Left = 191
    Top = 52
  end
  object dsTransferType: TDataSource
    DataSet = dtTransferType
    Left = 257
    Top = 52
  end
end
