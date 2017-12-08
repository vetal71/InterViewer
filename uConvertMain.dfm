object frmConvert: TfrmConvert
  Left = 0
  Top = 0
  Caption = #1050#1086#1085#1074#1077#1088#1090#1072#1094#1080#1103' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 137
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblCaption: TLabel
    Left = 8
    Top = 88
    Width = 190
    Height = 13
    Caption = #1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1082#1086#1085#1074#1077#1088#1090#1072#1094#1080#1103'. '#1046#1076#1080#1090#1077'...'
    Visible = False
  end
  object pbMain: TProgressBar
    Left = 8
    Top = 105
    Width = 619
    Height = 25
    Smooth = True
    Style = pbstMarquee
    TabOrder = 0
    Visible = False
  end
  object btnConvert: TButton
    Left = 8
    Top = 8
    Width = 619
    Height = 57
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 1
    OnClick = btnConvertClick
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
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 416
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
