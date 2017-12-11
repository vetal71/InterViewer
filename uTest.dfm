object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Test'
  ClientHeight = 54
  ClientWidth = 497
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
  object edtTest: TcxButtonEdit
    Left = 24
    Top = 16
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = edtTestPropertiesButtonClick
    TabOrder = 0
    Width = 457
  end
end
