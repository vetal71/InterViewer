object dm: Tdm
  OldCreateOrder = False
  Height = 638
  Width = 941
  object dsContacts: TDataSource
    DataSet = tblContacts
    Left = 200
    Top = 24
  end
  object dbcFirebird: TpFIBDatabase
    AutoReconnect = True
    DBName = 
      'localhost/3051:D:\GDriveIn\'#1056#1072#1079#1088#1072#1073#1086#1090#1082#1080'\Interviewer\data\IVIEWER.F' +
      'DB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=UTF8')
    DefaultTransaction = trRead
    DefaultUpdateTransaction = trWrite
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 40
    Top = 24
  end
  object tblContacts: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CONTACTS'
      'SET '
      '    FIO = :FIO,'
      '    SEX = :SEX,'
      '    CURRENTNOTES = :CURRENTNOTES,'
      '    REGION = :REGION,'
      '    CITY = :CITY,'
      '    BIRTHDATE = :BIRTHDATE,'
      '    CELURARPHONE = :CELURARPHONE,'
      '    HOMEPHONE = :HOMEPHONE,'
      '    EMAIL = :EMAIL,'
      '    OTHERTYPELINKS = :OTHERTYPELINKS,'
      '    ADDRESS = :ADDRESS,'
      '    PASSPORT = :PASSPORT,'
      '    SPECIALIZATION = :SPECIALIZATION,'
      '    TRANSFERTYPE = :TRANSFERTYPE,'
      '    NUMBERCARD = :NUMBERCARD,'
      '    MEMBERPROJECTS = :MEMBERPROJECTS,'
      '    DATELAST = :DATELAST,'
      '    COUNTANKETA = :COUNTANKETA,'
      '    PERCENTGOOD = :PERCENTGOOD,'
      '    PERCENTBAD = :PERCENTBAD,'
      '    GENERALCHARACTERISTIC = :GENERALCHARACTERISTIC,'
      '    ISSUPERVIZER = :ISSUPERVIZER,'
      '    ISBLACKLIST = :ISBLACKLIST'
      'WHERE'
      '    CODE = :OLD_CODE'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CONTACTS'
      'WHERE'
      '        CODE = :OLD_CODE'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CONTACTS('
      '    CODE,'
      '    FIO,'
      '    SEX,'
      '    CURRENTNOTES,'
      '    REGION,'
      '    CITY,'
      '    BIRTHDATE,'
      '    CELURARPHONE,'
      '    HOMEPHONE,'
      '    EMAIL,'
      '    OTHERTYPELINKS,'
      '    ADDRESS,'
      '    PASSPORT,'
      '    SPECIALIZATION,'
      '    TRANSFERTYPE,'
      '    NUMBERCARD,'
      '    MEMBERPROJECTS,'
      '    DATELAST,'
      '    COUNTANKETA,'
      '    PERCENTGOOD,'
      '    PERCENTBAD,'
      '    GENERALCHARACTERISTIC,'
      '    ISSUPERVIZER,'
      '    ISBLACKLIST'
      ')'
      'VALUES('
      '    :CODE,'
      '    :FIO,'
      '    :SEX,'
      '    :CURRENTNOTES,'
      '    :REGION,'
      '    :CITY,'
      '    :BIRTHDATE,'
      '    :CELURARPHONE,'
      '    :HOMEPHONE,'
      '    :EMAIL,'
      '    :OTHERTYPELINKS,'
      '    :ADDRESS,'
      '    :PASSPORT,'
      '    :SPECIALIZATION,'
      '    :TRANSFERTYPE,'
      '    :NUMBERCARD,'
      '    :MEMBERPROJECTS,'
      '    :DATELAST,'
      '    :COUNTANKETA,'
      '    :PERCENTGOOD,'
      '    :PERCENTBAD,'
      '    :GENERALCHARACTERISTIC,'
      '    :ISSUPERVIZER,'
      '    :ISBLACKLIST'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    CODE,'
      '    FIO,'
      '    SEX,'
      '    CURRENTNOTES,'
      '    REGION,'
      '    CITY,'
      '    BIRTHDATE,'
      '    CELURARPHONE,'
      '    HOMEPHONE,'
      '    EMAIL,'
      '    OTHERTYPELINKS,'
      '    ADDRESS,'
      '    PASSPORT,'
      '    SPECIALIZATION,'
      '    TRANSFERTYPE,'
      '    NUMBERCARD,'
      '    MEMBERPROJECTS,'
      '    DATELAST,'
      '    COUNTANKETA,'
      '    PERCENTGOOD,'
      '    PERCENTBAD,'
      '    GENERALCHARACTERISTIC,'
      '    ISSUPERVIZER,'
      '    ISBLACKLIST'
      'FROM'
      '    CONTACTS '
      ''
      ' WHERE '
      '        CONTACTS.CODE = :OLD_CODE'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    CODE,'
      '    FIO,'
      '    SEX,'
      '    CURRENTNOTES,'
      '    REGION,'
      '    CITY,'
      '    BIRTHDATE,'
      '    CELURARPHONE,'
      '    HOMEPHONE,'
      '    EMAIL,'
      '    OTHERTYPELINKS,'
      '    ADDRESS,'
      '    PASSPORT,'
      '    SPECIALIZATION,'
      '    TRANSFERTYPE,'
      '    NUMBERCARD,'
      '    MEMBERPROJECTS,'
      '    DATELAST,'
      '    COUNTANKETA,'
      '    PERCENTGOOD,'
      '    PERCENTBAD,'
      '    GENERALCHARACTERISTIC,'
      '    ISSUPERVIZER,'
      '    ISBLACKLIST'
      'FROM'
      '    CONTACTS ')
    AutoUpdateOptions.UpdateTableName = 'CONTACTS'
    AutoUpdateOptions.KeyFields = 'CODE'
    AutoUpdateOptions.GeneratorName = 'GEN_CONTACTS_ID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = trRead
    Database = dbcFirebird
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 120
    Top = 24
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dbcFirebird
    Left = 280
    Top = 24
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dbcFirebird
    Left = 344
    Top = 24
  end
  object tblVContacts: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      ''
      '')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      'SELECT'
      '    V_C.BCONTACT_ID,'
      '    V_C.FIO,'
      '    V_C.GENDER,'
      '    V_C.NOTES,'
      '    V_C.BIRTHDAY,'
      '    V_C.PASSPORT,'
      '    V_C.SPECIALIZATION,'
      '    V_C.PROJECT_LIST,'
      '    V_C.LAST_DATE,'
      '    V_C.AMOUNT_FORMS,'
      '    V_C.PERCENT_GOOD_FORMS,'
      '    V_C.PERCENT_BAD_FORMS,'
      '    V_C.CHARACTERISTICS,'
      '    V_C.IS_SUPERVISER,'
      '    V_C.IS_IN_BLACK_LIST,'
      '    V_C.SOCIAL_NUMBER,'
      '    V_C.PHOTO,'
      '    V_C.REGION_NAME,'
      '    V_C.CITY_NAME,'
      '    V_C.ADDRESS,'
      '    V_C.CELURAR,'
      '    V_C.HOMEPHONE,'
      '    V_C.EMAIL,'
      '    V_C.SOCIALNET,'
      '    V_C.TRANSFERS'
      'FROM'
      '    V_CONTACTS V_C'
      ' ')
    SelectSQL.Strings = (
      'select * from v_contacts')
    AutoUpdateOptions.UpdateTableName = 'V_CONTACTS'
    AutoUpdateOptions.GeneratorName = 'GEN_V_CONTACTS_ID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = trRead
    Database = dbcFirebird
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 120
    Top = 80
  end
  object dsVContacts: TDataSource
    DataSet = tblVContacts
    Left = 200
    Top = 80
  end
  object dtContactList: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE BOOK_CONTACTS'
      'SET '
      '    FIO = :FIO,'
      '    GENDER = :GENDER,'
      '    NOTES = :NOTES,'
      '    BIRTHDAY = :BIRTHDAY,'
      '    PASSPORT = :PASSPORT,'
      '    SPECIALIZATION = :SPECIALIZATION,'
      '    PROJECT_LIST = :PROJECT_LIST,'
      '    LAST_DATE = :LAST_DATE,'
      '    AMOUNT_FORMS = :AMOUNT_FORMS,'
      '    PERCENT_GOOD_FORMS = :PERCENT_GOOD_FORMS,'
      '    PERCENT_BAD_FORMS = :PERCENT_BAD_FORMS,'
      '    CHARACTERISTICS = :CHARACTERISTICS,'
      '    IS_SUPERVISER = :IS_SUPERVISER,'
      '    IS_IN_BLACK_LIST = :IS_IN_BLACK_LIST,'
      '    SOCIAL_NUMBER = :SOCIAL_NUMBER,'
      '    PHOTO = :PHOTO'
      'WHERE'
      '    BCONTACT_ID = :OLD_BCONTACT_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    BOOK_CONTACTS'
      'WHERE'
      '        BCONTACT_ID = :OLD_BCONTACT_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO BOOK_CONTACTS('
      '    BCONTACT_ID,'
      '    FIO,'
      '    GENDER,'
      '    NOTES,'
      '    BIRTHDAY,'
      '    PASSPORT,'
      '    SPECIALIZATION,'
      '    PROJECT_LIST,'
      '    LAST_DATE,'
      '    AMOUNT_FORMS,'
      '    PERCENT_GOOD_FORMS,'
      '    PERCENT_BAD_FORMS,'
      '    CHARACTERISTICS,'
      '    IS_SUPERVISER,'
      '    IS_IN_BLACK_LIST,'
      '    SOCIAL_NUMBER,'
      '    PHOTO'
      ')'
      'VALUES('
      '    :BCONTACT_ID,'
      '    :FIO,'
      '    :GENDER,'
      '    :NOTES,'
      '    :BIRTHDAY,'
      '    :PASSPORT,'
      '    :SPECIALIZATION,'
      '    :PROJECT_LIST,'
      '    :LAST_DATE,'
      '    :AMOUNT_FORMS,'
      '    :PERCENT_GOOD_FORMS,'
      '    :PERCENT_BAD_FORMS,'
      '    :CHARACTERISTICS,'
      '    :IS_SUPERVISER,'
      '    :IS_IN_BLACK_LIST,'
      '    :SOCIAL_NUMBER,'
      '    :PHOTO'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    BC.BCONTACT_ID,'
      '    BC.FIO,'
      '    BC.GENDER,'
      '    BC.NOTES,'
      '    BC.BIRTHDAY,'
      '    BC.PASSPORT,'
      '    BC.SPECIALIZATION,'
      '    BC.PROJECT_LIST,'
      '    BC.LAST_DATE,'
      '    BC.AMOUNT_FORMS,'
      '    BC.PERCENT_GOOD_FORMS,'
      '    BC.PERCENT_BAD_FORMS,'
      '    BC.CHARACTERISTICS,'
      '    BC.IS_SUPERVISER,'
      '    BC.IS_IN_BLACK_LIST,'
      '    BC.SOCIAL_NUMBER,'
      '    BC.PHOTO'
      'FROM'
      '    BOOK_CONTACTS BC'
      ''
      ' WHERE '
      '        BC.BCONTACT_ID = :OLD_BCONTACT_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    BC.BCONTACT_ID,'
      '    BC.FIO,'
      '    BC.GENDER,'
      '    BC.NOTES,'
      '    BC.BIRTHDAY,'
      '    BC.PASSPORT,'
      '    BC.SPECIALIZATION,'
      '    BC.PROJECT_LIST,'
      '    BC.LAST_DATE,'
      '    BC.AMOUNT_FORMS,'
      '    BC.PERCENT_GOOD_FORMS,'
      '    BC.PERCENT_BAD_FORMS,'
      '    BC.CHARACTERISTICS,'
      '    BC.IS_SUPERVISER,'
      '    BC.IS_IN_BLACK_LIST,'
      '    BC.SOCIAL_NUMBER,'
      '    BC.PHOTO'
      'FROM'
      '    BOOK_CONTACTS BC')
    AutoUpdateOptions.UpdateTableName = 'BOOK_CONTACTS'
    AutoUpdateOptions.KeyFields = 'BCONTACT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_BOOK_CONTACTS_ID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = trRead
    Database = dbcFirebird
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 120
    Top = 176
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object dsContactList: TDataSource
    DataSet = dtContactList
    Left = 200
    Top = 176
  end
  object dtContactInfo: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CONTACT_INFO'
      'SET '
      '    CIT_ID = :CIT_ID,'
      '    CONTACT_ID = :BCONTACT_ID,'
      '    CONTACT_INFO_VALUE = :CONTACT_INFO_VALUE'
      'WHERE'
      '    CI_ID = :OLD_CI_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CONTACT_INFO'
      'WHERE'
      '        CI_ID = :OLD_CI_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CONTACT_INFO('
      '    CI_ID,'
      '    CIT_ID,'
      '    CONTACT_ID,'
      '    CONTACT_INFO_VALUE'
      ')'
      'VALUES('
      '    :CI_ID,'
      '    :CIT_ID,'
      '    :BCONTACT_ID,'
      '    :CONTACT_INFO_VALUE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    CI.CI_ID,'
      '    CI.CIT_ID,'
      '    CIT.CIT_NAME,'
      '    CI.CONTACT_ID,'
      '    CI.CONTACT_INFO_VALUE'
      'FROM'
      '    CONTACT_INFO CI, CONTACT_INFO_TYPES CIT'
      'WHERE( '
      '    CIT.CIT_ID = CI.CIT_ID'
      '  AND CI.CONTACT_ID = :BCONTACT_ID'
      '     ) and (     CI.CI_ID = :OLD_CI_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    CI.CI_ID,'
      '    CI.CIT_ID,'
      '    CIT.CIT_NAME,'
      '    CI.CONTACT_ID,'
      '    CI.CONTACT_INFO_VALUE'
      'FROM'
      '    CONTACT_INFO CI, CONTACT_INFO_TYPES CIT'
      'WHERE'
      '    CIT.CIT_ID = CI.CIT_ID'
      '  AND CI.CONTACT_ID = :BCONTACT_ID')
    AutoUpdateOptions.UpdateTableName = 'CONTACT_INFO'
    AutoUpdateOptions.KeyFields = 'CI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_CONTACT_INFO_ID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = trRead
    Database = dbcFirebird
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = dsContactList
    Left = 120
    Top = 231
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object dsContactInfo: TDataSource
    DataSet = dtContactInfo
    Left = 200
    Top = 231
  end
  object dtRegions: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE WORK_CITIES'
      'SET '
      '    CONTACT_ID = :BCONTACT_ID,'
      '    CITY_ID = :CITY_ID'
      'WHERE'
      '    WC_ID = :OLD_WC_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    WORK_CITIES'
      'WHERE'
      '        WC_ID = :OLD_WC_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO WORK_CITIES('
      '    WC_ID,'
      '    CONTACT_ID,'
      '    CITY_ID'
      ')'
      'VALUES('
      '    :WC_ID,'
      '    :BCONTACT_ID,'
      '    :CITY_ID'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    WC.WC_ID,'
      '    WC.CONTACT_ID,'
      '    WC.CITY_ID,'
      '    R.REGION_NAME,'
      '    C.CITY_NAME,'
      '    WC.CITY_NAME AS OLD_CITY'
      'FROM'
      '    WORK_CITIES WC, CITIES C, REGIONS R'
      'WHERE(  C.CITY_ID = WC.CITY_ID'
      '  AND R.REGION_ID = C.REGION_ID'
      '  AND WC.CONTACT_ID = :BCONTACT_ID'
      '     ) and (     WC.WC_ID = :OLD_WC_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    WC.WC_ID,'
      '    WC.CONTACT_ID,'
      '    WC.CITY_ID,'
      '    R.REGION_NAME,'
      '    C.CITY_NAME,'
      '    WC.CITY_NAME AS OLD_CITY'
      'FROM'
      '    WORK_CITIES WC, CITIES C, REGIONS R'
      'WHERE C.CITY_ID = WC.CITY_ID'
      '  AND R.REGION_ID = C.REGION_ID'
      '  AND WC.CONTACT_ID = :BCONTACT_ID')
    AutoUpdateOptions.UpdateTableName = 'WORK_CITIES'
    AutoUpdateOptions.KeyFields = 'WC_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_WORK_CITIES_ID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = trRead
    Database = dbcFirebird
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = dsContactList
    Left = 120
    Top = 287
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object dsRegions: TDataSource
    DataSet = dtRegions
    Left = 200
    Top = 287
  end
  object dtTransferInfo: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TRANSFER_INFO'
      'SET '
      '    TT_ID = :TT_ID,'
      '    CONTACT_ID = :BCONTACT_ID,'
      '    BANK_NAME = :BANK_NAME,'
      '    CARD_NAME = :CARD_NAME,'
      '    CARD_PERIOD = :CARD_PERIOD,'
      '    NOTES = :NOTES'
      'WHERE'
      '    TI_ID = :OLD_TI_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TRANSFER_INFO'
      'WHERE'
      '        TI_ID = :OLD_TI_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TRANSFER_INFO('
      '    TI_ID,'
      '    TT_ID,'
      '    CONTACT_ID,'
      '    BANK_NAME,'
      '    CARD_NAME,'
      '    CARD_PERIOD,'
      '    NOTES'
      ')'
      'VALUES('
      '    :TI_ID,'
      '    :TT_ID,'
      '    :BCONTACT_ID,'
      '    :BANK_NAME,'
      '    :CARD_NAME,'
      '    :CARD_PERIOD,'
      '    :NOTES'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    TI.TI_ID,'
      '    TI.TT_ID,'
      '    TT.TT_NAME,'
      '    TI.CONTACT_ID,'
      '    TI.BANK_NAME,'
      '    TI.CARD_NAME,'
      '    TI.CARD_PERIOD,'
      '    TI.NOTES'
      'FROM'
      '    TRANSFER_INFO TI, TRANSFER_TYPES TT'
      'WHERE( '
      '    TT.TT_ID = TI.TT_ID'
      '  AND TI.CONTACT_ID = :BCONTACT_ID'
      '     ) and (     TI.TI_ID = :OLD_TI_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    TI.TI_ID,'
      '    TI.TT_ID,'
      '    TT.TT_NAME,'
      '    TI.CONTACT_ID,'
      '    TI.BANK_NAME,'
      '    TI.CARD_NAME,'
      '    TI.CARD_PERIOD,'
      '    TI.NOTES'
      'FROM'
      '    TRANSFER_INFO TI, TRANSFER_TYPES TT'
      'WHERE'
      '    TT.TT_ID = TI.TT_ID'
      '  AND TI.CONTACT_ID = :BCONTACT_ID')
    AutoUpdateOptions.UpdateTableName = 'TRANSFER_INFO'
    AutoUpdateOptions.KeyFields = 'TI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_TRANSFER_INFO_ID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = trRead
    Database = dbcFirebird
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = dsContactList
    Left = 120
    Top = 351
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object dsTransferInfo: TDataSource
    DataSet = dtTransferInfo
    Left = 200
    Top = 351
  end
end
