object dm: Tdm
  OldCreateOrder = False
  Height = 638
  Width = 941
  object dbFirebird: TUniConnection
    ProviderName = 'InterBase'
    Port = 3051
    Database = 'D:\GDrive\'#1056#1072#1079#1088#1072#1073#1086#1090#1082#1080'\Interviewer\data\IVIEWER.FDB'
    SpecificOptions.Strings = (
      'InterBase.Charset=UTF-8'
      'InterBase.UseUnicode=True')
    Options.KeepDesignConnected = False
    Username = 'sysdba'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 304
    Top = 24
    EncryptedPassword = '92FF9EFF8CFF8BFF9AFF8DFF94FF9AFF86FF'
  end
  object qryContacts: TUniQuery
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
        'ALNET, :F_TRANSFERS, :REC_ID)'
      'RETURNING BCONTACT_ID')
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
    Connection = dbFirebird
    SQL.Strings = (
      'select'
      '    REC_ID,'
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
      '    PHOTO,'
      '    REGION_NAME,'
      '    CITY_NAME,'
      '    F_ADDRESS,'
      '    F_CELURAR,'
      '    F_HOMEPHONE,'
      '    F_EMAIL,'
      '    F_SOCIALNET,'
      '    F_TRANSFERS'
      'from'
      '    V_CONTACTS')
    Options.ReturnParams = True
    Left = 304
    Top = 79
  end
  object udsContacts: TUniDataSource
    DataSet = qryContacts
    Left = 390
    Top = 79
  end
  object FirebirdProvider: TInterBaseUniProvider
    Left = 640
    Top = 25
  end
  object qryContactList: TUniQuery
    UpdatingTable = 'BOOK_CONTACTS'
    KeyFields = 'BCONTACT_ID'
    SQLInsert.Strings = (
      'INSERT INTO BOOK_CONTACTS'
      
        '  (BCONTACT_ID, FIO, GENDER, NOTES, BIRTHDAY, PASSPORT, SPECIALI' +
        'ZATION, PROJECT_LIST, LAST_DATE, AMOUNT_FORMS, PERCENT_GOOD_FORM' +
        'S, PERCENT_BAD_FORMS, CHARACTERISTICS, IS_SUPERVISER, IS_IN_BLAC' +
        'K_LIST, SOCIAL_NUMBER, PHOTO)'
      'VALUES'
      
        '  (:BCONTACT_ID, :FIO, :GENDER, :NOTES, :BIRTHDAY, :PASSPORT, :S' +
        'PECIALIZATION, :PROJECT_LIST, :LAST_DATE, :AMOUNT_FORMS, :PERCEN' +
        'T_GOOD_FORMS, :PERCENT_BAD_FORMS, :CHARACTERISTICS, :IS_SUPERVIS' +
        'ER, :IS_IN_BLACK_LIST, :SOCIAL_NUMBER, :PHOTO)')
    SQLDelete.Strings = (
      'DELETE FROM BOOK_CONTACTS'
      'WHERE'
      '  BCONTACT_ID = :Old_BCONTACT_ID')
    SQLUpdate.Strings = (
      'UPDATE BOOK_CONTACTS'
      'SET'
      
        '  BCONTACT_ID = :BCONTACT_ID, FIO = :FIO, GENDER = :GENDER, NOTE' +
        'S = :NOTES, BIRTHDAY = :BIRTHDAY, PASSPORT = :PASSPORT, SPECIALI' +
        'ZATION = :SPECIALIZATION, PROJECT_LIST = :PROJECT_LIST, LAST_DAT' +
        'E = :LAST_DATE, AMOUNT_FORMS = :AMOUNT_FORMS, PERCENT_GOOD_FORMS' +
        ' = :PERCENT_GOOD_FORMS, PERCENT_BAD_FORMS = :PERCENT_BAD_FORMS, ' +
        'CHARACTERISTICS = :CHARACTERISTICS, IS_SUPERVISER = :IS_SUPERVIS' +
        'ER, IS_IN_BLACK_LIST = :IS_IN_BLACK_LIST, SOCIAL_NUMBER = :SOCIA' +
        'L_NUMBER, PHOTO = :PHOTO'
      'WHERE'
      '  BCONTACT_ID = :Old_BCONTACT_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM BOOK_CONTACTS'
      'WHERE'
      'BCONTACT_ID = :Old_BCONTACT_ID'
      'FOR UPDATE WITH LOCK')
    SQLRefresh.Strings = (
      
        'SELECT BCONTACT_ID, FIO, GENDER, NOTES, BIRTHDAY, PASSPORT, SPEC' +
        'IALIZATION, PROJECT_LIST, LAST_DATE, AMOUNT_FORMS, PERCENT_GOOD_' +
        'FORMS, PERCENT_BAD_FORMS, CHARACTERISTICS, IS_SUPERVISER, IS_IN_' +
        'BLACK_LIST, SOCIAL_NUMBER, PHOTO FROM BOOK_CONTACTS'
      'WHERE'
      '  BCONTACT_ID = :BCONTACT_ID')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM BOOK_CONTACTS'
      ''
      ') q')
    Connection = dbFirebird
    SQL.Strings = (
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
    BeforePost = dtContactListBeforePost
    Left = 304
    Top = 135
  end
  object udsContactList: TUniDataSource
    DataSet = qryContactList
    Left = 390
    Top = 135
  end
  object qryContactInfo: TUniQuery
    UpdatingTable = 'CONTACT_INFO'
    KeyFields = 'CI_ID'
    SQLInsert.Strings = (
      'INSERT INTO CONTACT_INFO'
      '  (CI_ID, CIT_ID, CONTACT_ID, CONTACT_INFO_VALUE)'
      'VALUES'
      '  (:CI_ID, :CIT_ID, :CONTACT_ID, :CONTACT_INFO_VALUE)')
    SQLDelete.Strings = (
      'DELETE FROM CONTACT_INFO'
      'WHERE'
      '  CI_ID = :Old_CI_ID')
    SQLUpdate.Strings = (
      'UPDATE CONTACT_INFO'
      'SET'
      
        '  CI_ID = :CI_ID, CIT_ID = :CIT_ID, CONTACT_ID = :CONTACT_ID, CO' +
        'NTACT_INFO_VALUE = :CONTACT_INFO_VALUE'
      'WHERE'
      '  CI_ID = :Old_CI_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM CONTACT_INFO'
      'WHERE'
      'CI_ID = :Old_CI_ID'
      'FOR UPDATE WITH LOCK')
    SQLRefresh.Strings = (
      'SELECT'
      '    CI.CI_ID,'
      '    CI.CIT_ID,'
      '    CIT.CIT_NAME,'
      '    CI.CONTACT_ID,'
      '    CI.CONTACT_INFO_VALUE'
      'FROM'
      '    CONTACT_INFO CI, CONTACT_INFO_TYPES CIT'
      'WHERE'
      '    CIT.CIT_ID = CI.CIT_ID '
      '  AND CI_ID = :CI_ID')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM CONTACT_INFO'
      ''
      ') q')
    Connection = dbFirebird
    SQL.Strings = (
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
      '')
    MasterSource = udsContactList
    MasterFields = 'BCONTACT_ID'
    DetailFields = 'CONTACT_ID'
    RefreshOptions = [roAfterInsert, roAfterUpdate, roBeforeEdit]
    SpecificOptions.Strings = (
      'InterBase.KeyGenerator=GEN_CONTACT_INFO_ID')
    Left = 304
    Top = 191
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BCONTACT_ID'
        Value = nil
      end>
  end
  object udsContactInfo: TUniDataSource
    DataSet = qryContactInfo
    Left = 390
    Top = 191
  end
  object qryRegions: TUniQuery
    UpdatingTable = 'WORK_CITIES'
    KeyFields = 'WC_ID'
    SQLInsert.Strings = (
      'INSERT INTO WORK_CITIES'
      '  (WC_ID, CONTACT_ID, CITY_ID, CITY_NAME)'
      'VALUES'
      '  (:WC_ID, :CONTACT_ID, :CITY_ID, :CITY_NAME)')
    SQLDelete.Strings = (
      'DELETE FROM WORK_CITIES'
      'WHERE'
      '  WC_ID = :Old_WC_ID')
    SQLUpdate.Strings = (
      'UPDATE WORK_CITIES'
      'SET'
      
        '  WC_ID = :WC_ID, CONTACT_ID = :CONTACT_ID, CITY_ID = :CITY_ID, ' +
        'CITY_NAME = :CITY_NAME'
      'WHERE'
      '  WC_ID = :Old_WC_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM WORK_CITIES'
      'WHERE'
      'WC_ID = :Old_WC_ID'
      'FOR UPDATE WITH LOCK')
    SQLRefresh.Strings = (
      'SELECT'
      '    WC.WC_ID,'
      '    WC.CONTACT_ID,'
      '    WC.CITY_ID,'
      '    R.REGION_ID,'
      '    R.REGION_NAME,'
      '    C.CITY_NAME,'
      '    WC.CITY_NAME AS OLD_CITY'
      'FROM'
      '    WORK_CITIES WC, CITIES C, REGIONS R'
      'WHERE C.CITY_ID = WC.CITY_ID'
      '  AND R.REGION_ID = C.REGION_ID'
      '  AND WC_ID = :WC_ID')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM WORK_CITIES'
      ''
      ') q')
    Connection = dbFirebird
    SQL.Strings = (
      'SELECT'
      '    WC.WC_ID,'
      '    WC.CONTACT_ID,'
      '    WC.CITY_ID,'
      '    R.REGION_ID,'
      '    R.REGION_NAME,'
      '    C.CITY_NAME,'
      '    WC.CITY_NAME AS OLD_CITY'
      'FROM'
      '    WORK_CITIES WC, CITIES C, REGIONS R'
      'WHERE C.CITY_ID = WC.CITY_ID'
      '  AND R.REGION_ID = C.REGION_ID')
    MasterSource = udsContactList
    MasterFields = 'BCONTACT_ID'
    DetailFields = 'CONTACT_ID'
    RefreshOptions = [roAfterInsert, roAfterUpdate, roBeforeEdit]
    SpecificOptions.Strings = (
      'InterBase.KeyGenerator=GEN_WORK_CITIES_ID')
    Left = 304
    Top = 247
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BCONTACT_ID'
        Value = nil
      end>
  end
  object udsRegions: TUniDataSource
    DataSet = qryRegions
    Left = 390
    Top = 247
  end
  object qryTransferInfo: TUniQuery
    UpdatingTable = 'TRANSFER_INFO'
    KeyFields = 'TI_ID'
    SQLInsert.Strings = (
      'INSERT INTO TRANSFER_INFO'
      
        '  (TI_ID, TT_ID, CONTACT_ID, BANK_NAME, CARD_NAME, CARD_PERIOD, ' +
        'NOTES)'
      'VALUES'
      
        '  (:TI_ID, :TT_ID, :CONTACT_ID, :BANK_NAME, :CARD_NAME, :CARD_PE' +
        'RIOD, :NOTES)')
    SQLDelete.Strings = (
      'DELETE FROM TRANSFER_INFO'
      'WHERE'
      '  TI_ID = :Old_TI_ID')
    SQLUpdate.Strings = (
      'UPDATE TRANSFER_INFO'
      'SET'
      
        '  TI_ID = :TI_ID, TT_ID = :TT_ID, CONTACT_ID = :CONTACT_ID, BANK' +
        '_NAME = :BANK_NAME, CARD_NAME = :CARD_NAME, CARD_PERIOD = :CARD_' +
        'PERIOD, NOTES = :NOTES'
      'WHERE'
      '  TI_ID = :Old_TI_ID')
    SQLLock.Strings = (
      'SELECT NULL FROM TRANSFER_INFO'
      'WHERE'
      'TI_ID = :Old_TI_ID'
      'FOR UPDATE WITH LOCK')
    SQLRefresh.Strings = (
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
      '  AND TI_ID = :TI_ID')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM TRANSFER_INFO'
      ''
      ') q')
    Connection = dbFirebird
    SQL.Strings = (
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
      '    TT.TT_ID = TI.TT_ID')
    MasterSource = udsContactList
    MasterFields = 'BCONTACT_ID'
    DetailFields = 'CONTACT_ID'
    RefreshOptions = [roAfterInsert, roAfterUpdate, roBeforeEdit]
    SpecificOptions.Strings = (
      'InterBase.KeyGenerator=GEN_TRANSFER_INFO_ID')
    Left = 304
    Top = 311
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BCONTACT_ID'
        Value = nil
      end>
  end
  object udsTransferInfo: TUniDataSource
    DataSet = qryTransferInfo
    Left = 390
    Top = 311
  end
  object tblContacts: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO CONTACTS'
      
        '  (CODE, FIO, SEX, CURRENTNOTES, REGION, CITY, BIRTHDATE, CELURA' +
        'RPHONE, HOMEPHONE, EMAIL, OTHERTYPELINKS, ADDRESS, PASSPORT, SPE' +
        'CIALIZATION, TRANSFERTYPE, NUMBERCARD, MEMBERPROJECTS, DATELAST,' +
        ' COUNTANKETA, PERCENTGOOD, PERCENTBAD, GENERALCHARACTERISTIC, IS' +
        'SUPERVIZER, ISBLACKLIST)'
      'VALUES'
      
        '  (:CODE, :FIO, :SEX, :CURRENTNOTES, :REGION, :CITY, :BIRTHDATE,' +
        ' :CELURARPHONE, :HOMEPHONE, :EMAIL, :OTHERTYPELINKS, :ADDRESS, :' +
        'PASSPORT, :SPECIALIZATION, :TRANSFERTYPE, :NUMBERCARD, :MEMBERPR' +
        'OJECTS, :DATELAST, :COUNTANKETA, :PERCENTGOOD, :PERCENTBAD, :GEN' +
        'ERALCHARACTERISTIC, :ISSUPERVIZER, :ISBLACKLIST)')
    SQLDelete.Strings = (
      'DELETE FROM CONTACTS'
      'WHERE'
      '  CODE = :Old_CODE')
    SQLUpdate.Strings = (
      'UPDATE CONTACTS'
      'SET'
      
        '  CODE = :CODE, FIO = :FIO, SEX = :SEX, CURRENTNOTES = :CURRENTN' +
        'OTES, REGION = :REGION, CITY = :CITY, BIRTHDATE = :BIRTHDATE, CE' +
        'LURARPHONE = :CELURARPHONE, HOMEPHONE = :HOMEPHONE, EMAIL = :EMA' +
        'IL, OTHERTYPELINKS = :OTHERTYPELINKS, ADDRESS = :ADDRESS, PASSPO' +
        'RT = :PASSPORT, SPECIALIZATION = :SPECIALIZATION, TRANSFERTYPE =' +
        ' :TRANSFERTYPE, NUMBERCARD = :NUMBERCARD, MEMBERPROJECTS = :MEMB' +
        'ERPROJECTS, DATELAST = :DATELAST, COUNTANKETA = :COUNTANKETA, PE' +
        'RCENTGOOD = :PERCENTGOOD, PERCENTBAD = :PERCENTBAD, GENERALCHARA' +
        'CTERISTIC = :GENERALCHARACTERISTIC, ISSUPERVIZER = :ISSUPERVIZER' +
        ', ISBLACKLIST = :ISBLACKLIST'
      'WHERE'
      '  CODE = :Old_CODE')
    SQLLock.Strings = (
      'SELECT NULL FROM CONTACTS'
      'WHERE'
      'CODE = :Old_CODE'
      'FOR UPDATE WITH LOCK')
    SQLRefresh.Strings = (
      
        'SELECT CODE, FIO, SEX, CURRENTNOTES, REGION, CITY, BIRTHDATE, CE' +
        'LURARPHONE, HOMEPHONE, EMAIL, OTHERTYPELINKS, ADDRESS, PASSPORT,' +
        ' SPECIALIZATION, TRANSFERTYPE, NUMBERCARD, MEMBERPROJECTS, DATEL' +
        'AST, COUNTANKETA, PERCENTGOOD, PERCENTBAD, GENERALCHARACTERISTIC' +
        ', ISSUPERVIZER, ISBLACKLIST FROM CONTACTS'
      'WHERE'
      '  CODE = :CODE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM CONTACTS'
      ''
      ') q')
    Connection = dbFirebird
    SQL.Strings = (
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
      '    CONTACTS')
    Left = 120
    Top = 23
  end
  object dsContacts: TUniDataSource
    DataSet = tblContacts
    Left = 206
    Top = 23
  end
  object dbMonitor: TUniSQLMonitor
    Left = 640
    Top = 96
  end
end
