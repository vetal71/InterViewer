object fTDialog: TfTDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 281
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object lblCaption: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 496
    Height = 23
    Align = alTop
    Alignment = taCenter
    Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 103
  end
  object dlgButtons: TRzDialogButtons
    Left = 0
    Top = 245
    Width = 502
    CaptionCancel = #1054#1090#1084#1077#1085#1072
    HotTrack = True
    OKDefault = False
    ShowDivider = True
    WidthOk = 100
    WidthCancel = 100
    WidthHelp = 100
    TabOrder = 0
    ExplicitTop = 185
    ExplicitWidth = 415
  end
  object pnlMain: TRzPanel
    Left = 0
    Top = 29
    Width = 502
    Height = 216
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 1
    ExplicitLeft = -116
    ExplicitTop = -6
    ExplicitWidth = 661
    ExplicitHeight = 400
  end
  object LookAndFeelController: TcxLookAndFeelController
    Kind = lfFlat
    NativeStyle = False
    Left = 152
    Top = 33
  end
end
