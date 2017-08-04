object dm: Tdm
  OldCreateOrder = False
  Height = 638
  Width = 941
  object dsContacts: TUniDataSource
    DataSet = tblContacts
    Left = 200
    Top = 24
  end
  object dbcFirebird: TpFIBDatabase
    AutoReconnect = True
    DBName = '192.168.254.217/3051:D:\DevProjects\InterViewer\data\IVIEWER.FDB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
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
end
