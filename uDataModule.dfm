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
end
