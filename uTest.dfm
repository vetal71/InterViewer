object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Test'
  ClientHeight = 298
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object edt1: TEdit
    Left = 16
    Top = 16
    Width = 502
    Height = 22
    TabOrder = 0
    Text = #1052#1080#1085#1089#1082'/'#1043#1086#1088#1082#1080'/'#1052#1086#1075#1080#1083#1077#1074
  end
  object btnTest: TButton
    Left = 16
    Top = 48
    Width = 150
    Height = 25
    Caption = 'Test'
    TabOrder = 1
    OnClick = btnTestClick
  end
  object mmoRes: TMemo
    Left = 16
    Top = 80
    Width = 249
    Height = 210
    TabOrder = 2
  end
end
