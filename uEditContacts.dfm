object fEditContacts: TfEditContacts
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1086#1085#1090#1072#1082#1090#1077
  ClientHeight = 745
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 869
    Height = 23
    Align = alTop
    Alignment = taCenter
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1086#1085#1090#1072#1082#1090#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 212
  end
  object dlgButtons: TRzDialogButtons
    Left = 0
    Top = 709
    Width = 875
    CaptionCancel = #1054#1090#1084#1077#1085#1072
    HotTrack = True
    OKDefault = False
    ShowDivider = True
    TabOrder = 0
    ExplicitTop = 518
    ExplicitWidth = 946
  end
  object pnlMainInfo: TRzPanel
    Left = 0
    Top = 29
    Width = 875
    Height = 360
    Align = alTop
    BorderOuter = fsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 349
    object Label2: TLabel
      Left = 11
      Top = 162
      Width = 106
      Height = 14
      Caption = #1058#1077#1082#1091#1097#1080#1077' '#1087#1086#1084#1077#1090#1082#1080':'
    end
    object Label6: TLabel
      Left = 11
      Top = 39
      Width = 103
      Height = 14
      Caption = #1044#1072#1085#1085#1099#1077' '#1087#1072#1089#1087#1086#1088#1090#1072':'
    end
    object Label7: TLabel
      Left = 11
      Top = 68
      Width = 91
      Height = 14
      Caption = #1057#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103':'
    end
    object Label10: TLabel
      Left = 11
      Top = 92
      Width = 155
      Height = 14
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080':'
    end
    object Label11: TLabel
      Left = 11
      Top = 11
      Width = 89
      Height = 14
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'. '#1054'.:'
    end
    object Label12: TLabel
      Left = 543
      Top = 11
      Width = 26
      Height = 14
      Caption = #1055#1086#1083':'
    end
    object Label19: TLabel
      Left = 642
      Top = 11
      Width = 93
      Height = 14
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
    end
    object Label15: TLabel
      Left = 11
      Top = 231
      Width = 53
      Height = 14
      Caption = #1055#1088#1086#1077#1082#1090#1099':'
    end
    object Label16: TLabel
      Left = 293
      Top = 303
      Width = 107
      Height = 14
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1072#1085#1082#1077#1090':'
    end
    object Label20: TLabel
      Left = 482
      Top = 303
      Width = 141
      Height = 14
      Caption = #1055#1088#1086#1094#1077#1085#1090' '#1093#1086#1088#1086#1096#1080#1093' '#1072#1085#1082#1077#1090':'
    end
    object Label21: TLabel
      Left = 705
      Top = 303
      Width = 80
      Height = 14
      Caption = #1087#1083#1086#1093#1080#1093' '#1072#1085#1082#1077#1090':'
    end
    object lbl1: TLabel
      Left = 11
      Top = 303
      Width = 150
      Height = 14
      Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1091#1095#1072#1089#1090#1080#1103':'
    end
    object chkSupervizer: TcxDBCheckBox
      Left = 8
      Top = 333
      Caption = #1057#1091#1087#1077#1088#1074#1072#1081#1079#1077#1088
      DataBinding.DataField = 'ISSUPERVIZER'
      DataBinding.DataSource = dm.dsContacts
      ParentFont = False
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
    end
    object chbSpecialization: TcxCheckComboBox
      Left = 134
      Top = 64
      Properties.EmptySelectionText = #1053#1080#1095#1077#1075#1086' '#1085#1077' '#1074#1099#1073#1088#1072#1085#1086
      Properties.EditValueFormat = cvfCaptions
      Properties.Items = <
        item
          Description = #1072#1091#1090#1089#1086#1088#1089
        end
        item
          Description = #1074#1073#1080#1074#1082#1072
        end
        item
          Description = #1076#1080#1089#1087#1077#1090#1095#1077#1088' '#1082#1086#1083#1083'-'#1094#1077#1085#1090#1088#1072
        end
        item
          Description = #1087#1086#1082#1074#1072#1088#1090#1080#1088#1085#1099#1081' '#1086#1087#1088#1086#1089
        end
        item
          Description = #1090#1072#1081#1085#1099#1081' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1100
        end
        item
          Description = #1091#1083#1080#1095#1085#1099#1081' '#1086#1087#1088#1086#1089
        end
        item
          Description = #1092#1086#1082#1091#1089'-'#1075#1088#1091#1087#1087#1072
        end>
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 9
      Width = 727
    end
    object chkBlackList: TcxDBCheckBox
      Left = 124
      Top = 333
      Caption = #1042' '#1095#1077#1088#1085#1086#1084' '#1089#1087#1080#1089#1082#1077
      DataBinding.DataField = 'ISBLACKLIST'
      DataBinding.DataSource = dm.dsContacts
      ParentFont = False
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 11
    end
    object edtFIO: TcxButtonEdit
      Left = 134
      Top = 8
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edtFIOPropertiesButtonClick
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Text = 'edtFIO'
      TextHint = #1055#1086#1088#1103#1076#1086#1082' '#1074#1074#1086#1076#1072': '#1092#1072#1084#1080#1083#1080#1103', '#1080#1084#1103' '#1080' '#1086#1090#1095#1077#1089#1090#1074#1086
      Width = 400
    end
    object cbbSex: TcxComboBox
      Left = 575
      Top = 8
      Properties.Items.Strings = (
        #1052
        #1046)
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Text = #1046
      Width = 59
    end
    object mmoCharacteristics: TcxMemo
      Left = 11
      Top = 111
      Lines.Strings = (
        'mmoCharacteristics')
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 6
      Height = 45
      Width = 850
    end
    object mmoCurrentNotes: TcxMemo
      AlignWithMargins = True
      Left = 11
      Top = 182
      Lines.Strings = (
        'mmoCurrentNotes')
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 7
      Height = 43
      Width = 850
    end
    object mmoProjects: TcxMemo
      AlignWithMargins = True
      Left = 11
      Top = 251
      Lines.Strings = (
        'mmoProjects')
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Height = 43
      Width = 850
    end
    object edtCountAnketa: TcxCalcEdit
      Left = 406
      Top = 300
      EditValue = 0.000000000000000000
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 8
      Width = 70
    end
    object edtDateBirthday: TcxDateEdit
      Left = 741
      Top = 8
      Properties.UseNullString = True
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 120
    end
    object edtPassport: TcxButtonEdit
      Left = 134
      Top = 36
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edtPassportPropertiesButtonClick
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
      Text = 'edtPassport'
      Width = 727
    end
    object edtDateLast: TcxDateEdit
      Left = 167
      Top = 300
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 10
      Width = 120
    end
    object edtPercentGood: TcxCalcEdit
      Left = 629
      Top = 300
      EditValue = 0.000000000000000000
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 12
      Width = 70
    end
    object edtPercentBad: TcxCalcEdit
      Left = 791
      Top = 300
      EditValue = 0.000000000000000000
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 13
      Width = 70
    end
  end
  object pnlAddInfo: TRzPanel
    Left = 0
    Top = 389
    Width = 875
    Height = 320
    Align = alClient
    BorderInner = fsFlat
    BorderOuter = fsNone
    BorderSides = [sdTop]
    TabOrder = 2
    ExplicitLeft = 80
    ExplicitTop = 528
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pnlButtons: TRzPanel
      Left = 0
      Top = 1
      Width = 875
      Height = 41
      Align = alTop
      BorderOuter = fsNone
      TabOrder = 0
      ExplicitLeft = 344
      ExplicitTop = 120
      ExplicitWidth = 185
      object btnAdd: TSpeedButton
        Left = 5
        Top = 4
        Width = 100
        Height = 32
        Glyph.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000040404070A0A0A101111111B141414201C1C1C2C1C1C1C2B212021332827
          273D2827283D2927283D2827283D2827283D2727273D222222351C1C1C2B1C1C
          1C2C151515211111111B0A0A0A10050505080000000000000000000000001919
          19245B5B5B90777777B9888888D38D8B8CDB999597E99B9298E69A9598EB83A3
          8FFC6FA885FF66A97FFF69A980FF76A889FF8FA095F99D9399E79B9398E89895
          97EB8D8D8DDC888888D3767676B95D5D5D911818182400000000000000000000
          000001010101030303050908090D04040407222D26443D885BC827B35EFF2AB2
          60FE2DB261FE2DB261FE2DB261FE2CB260FE28B45FFF30AA5EF33D674E9A0F11
          101B0808080C0908090D03030305010101010000000000000000000000000000
          00000000000000000000000000001C6A3D9628B563FF2DB565FF30B467FE30B4
          68FF30B468FF30B468FF30B367FD30B468FF30B367FD2FB567FF2BB565FF28AF
          5FF50D2E1B410000000000000000000000000000000000000000000000000000
          00000000000000010001259757D12FB86AFF30B86BFF30B86BFF30B76AFD30B8
          6BFF2EB76AFF2BB668FF2CB567FD30B86AFF30B76AFD30B86BFF30B86BFF2FB8
          6AFF2EB869FF13512F6E00000000000000000000000000000000000000000000
          000000000000259659CD2EB96EFF2EB86EFE2EB86DFD2EB86DFD2EB86EFE2CB8
          6CFD25B668FD49C281FD45C17EFE22B565FD2DB86DFE2EB86DFD2EB86DFD2EB8
          6EFE2EB86EFE2EB96DFF1045295A000000000000000000000000000000000000
          000017663D842BBD70FF2BBD71FF2BBC70FD2BBD71FF2BBD71FF2BBC70FD1CB8
          66FFD8F2E4FFFFFFFFFFFDFDFDFD8CDBB1FF22B969FD2BBD71FF2BBD71FF2BBC
          70FD2BBD71FF2BBD71FF2CBD70FF04130C180000000000000000000000000411
          0A142BBF73FF2BBE74FF2BBE74FF2BBD73FD2BBE74FF2BBE74FF2BBD73FD19B9
          68FFF0F9F5FFFFFFFFFFFDFDFDFDA8E4C6FF1FB96AFD2BBE74FF2BBE74FF2BBD
          73FD2BBE74FF2BBE74FF2BBE74FF1F8E55BA0000000000000000000000001872
          468F28C277FF28C076FD28C076FD28C177FE28C076FD28C076FD28C177FE16BB
          6AFDECF6F1FDFDFCFDFDFEFEFEFEA5E2C3FD1CBD6FFE28C076FD28C076FD28C1
          77FE28C076FD28C076FD28C177FE29C277FF05170E1C000000000000000025BB
          74EF28C37AFF28C37AFF28C37AFF26C177FD22C276FF21C275FF21C074FD10BC
          6BFFECF9F3FFFFFFFFFFFDFDFDFDA2E5C5FF15BD6DFD21C275FF21C275FF22C0
          75FD27C37AFF28C37AFF28C179FD28C37AFF14663F7E0000000003100A1626C8
          7DFF25C57AFD25C77DFF24C67CFF21C379FD5DD59EFF5BD49CFF5AD29BFD4ED1
          94FFF1FBF6FFFFFFFFFFFDFDFDFDB9EDD5FF52D096FD5BD49CFF5CD49DFF53D1
          98FD1AC574FF25C77DFF25C57AFD25C77DFF1D9B60C00000000009311F3E24C8
          7EFF25C77EFD25C97FFF16C576FFC6EFDCFDFFFFFFFFFFFFFFFFFDFDFDFDFFFF
          FFFFFFFFFFFFFFFFFFFFFBFBFBFDFFFFFFFFFDFDFDFDFFFFFFFFFFFFFFFFFDFD
          FDFD7ADEB0FF1CC679FF25C77EFD25C97FFF22BC77E9000000000B3D274D26CC
          81FF22C97FFE22C97FFD12C476FDD7F4E7FEFDFCFDFDFBFBFBFDFDFDFDFEFBFB
          FBFDFBFBFBFDFBFBFBFDFDFDFDFEFBFBFBFDFDFDFDFEFBFBFBFDFBFBFBFDFEFE
          FEFE8CE1BCFD18C67AFD22CA7FFE22C97FFE24CA80F600000000093522422CD0
          88FF20CA82FD22CD84FF14CA7CFFB1ECD2FDFFFFFFFFFFFFFFFFFDFDFDFDFFFF
          FFFFFFFFFFFFFFFFFFFFFBFBFBFDFFFFFFFFFDFDFDFDFFFFFFFFFFFFFFFFFDFD
          FDFD64DBA8FF1ACB7FFF22CB83FD20CC83FF2BC884EE000000000419102034D5
          8FFF1FCD83FE21CD85FD20CD84FD13CA7EFE2ECF8BFD2DCE8CFD2DCF8CFE1DCB
          83FDEAF7F3FDFDFCFDFDFEFEFEFEA6E9CDFD22CD86FE2DCE8BFD2ECE8CFD25CF
          88FE17CA7FFD21CD85FD21CE85FE1DCD84FF2EAE76CA00000000000000003DDA
          97FB1BCE84FE20D188FF20D188FF1FCF86FD1DD086FF1DD086FF1DCE85FD0ACC
          7CFFECFBF4FFFFFFFFFFFDFDFDFDA0EBCBFF10CB7EFD1DD086FF1DD086FF1DCE
          85FD20D188FF20D188FF1ECE85FD33D691FF187B518D00000000000000002291
          62A530D792FF1DD188FF1FD18AFF1FCF89FD1FD18AFF1FD18AFF1FCF89FD0CCD
          7FFFECFBF4FFFFFFFFFFFDFDFDFDA1ECCDFF11CD82FD1FD18AFF1FD18AFF1FCF
          89FD1FD18AFF1FD18AFF1ACE86FD44DC9CFF072C1D3100000000000000000525
          192952E0A4FF16D087FD1ED28BFD1ED38BFE1ED28BFD1ED28BFD1ED38BFE0BCE
          81FDEFF9F5FDFDFCFDFDFEFEFEFEA4EBCEFD10D084FE1ED28BFD1ED28BFD1ED3
          8BFE1ED28BFD1CD18AFD27D590FF3ABA84D50000000000000000000000000000
          0000239467A947DFA0FF16D38AFF1DD38BFD1DD48CFF1DD48CFF1DD38BFD0ED2
          85FFB8F1DBFFFFFFFFFFFDFDFDFD69E3B3FF14D187FD1DD48CFF1DD48CFF1DD3
          8BFD1CD48CFF13D289FF61E6ACFF072D1E330000000000000000000000000000
          00000001010148D098EB3BDD9BFF14D28BFD1CD78FFF1CD78FFF1CD38EFD1BD7
          8FFF0ED487FF0ED387FF0DD186FD13D58AFF1CD38EFD1CD78FFF1CD78FFF1AD3
          8DFD11D489FF66E8AFFF17765188000000000000000000000000000000000000
          00000000000003150E1750D8A0F34EE2A5FF0FD38AFD18D58DFD1BD78FFE1AD6
          8FFD1AD68FFD19D58EFD1AD68EFE1AD68FFD1BD78FFE1AD68EFD15D48CFD15D5
          8BFE72EAB5FF218F64A400000000000000000000000000000000000000000000
          00000000000000000000020B080C34B783CF77ECB8FF2FDD99FF0FD48BFD13D7
          8EFF16D78EFF17D78FFF15D58EFD15D78EFF12D58DFD11D68DFF54E4A8FF71EA
          B5FF126B497A0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000B55395E51D29DE873ECB6FF6CEB
          B3FF50E5A8FF41E1A1FF46E2A4FF5CE6ACFF71ECB5FF71EBB5FF2AA374B7041E
          1420000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000005281B2F0E66
          4577228E64A2319F75B32D9C71B0198059930A50365E020C080E000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      object btnEdit: TSpeedButton
        Left = 111
        Top = 4
        Width = 100
        Height = 32
        Glyph.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000002F3743540606060A000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000003B7DE1003476E10011287C0003062E00000008000000000000
          0000000000030000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000427CDC006397FE005392FE003E8CFB00478DF3003E7DE40045
          81E2004462C5000E065100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000100488AF4006699FF006598FF02539CFF0099CCFF0099CCFF0099
          CCFF006B8DFF004600BC00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000E0F1220004D91FF006597FE005191FE3C91D0FF1BA5D8FE0097CAFE008F
          C5FF005172FE007500FD0003001F000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00002228314D1960A8FF216FB1FE3F93D1FE65CBFEFF3EB7EAFE0097CAFE0057
          9DFF007E26FE008300FF00220082000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000303F526F439AD7FF66CCFFFF66CCFFFF66CCFFFF2EAADFFF005CA0FF006F
          3DFF009900FF009400FF006A00ED000100150000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000032425674439AD7FF58B8EEFE4EA9E3FE3383C5FF045581FE037F31FE0099
          00FF009700FE009900FF008400FE0034009C0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000012141729004428D218776AFE359F91FE2CAC69FF0BA119FE0AA215FE07A0
          0EFF009800FE009900FF009600FE007900FC000E004D00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000010012025202C840CB60FF65FE97FF2EC74AFF0FA81EFF0EA7
          1CFF09A212FF009900FF009900FF009300FF006900EB00030020000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000001000E015002C342CF64FF63FB93FE28C043FE13AC
          25FF12AA24FE0AA314FF009800FE009700FE008E00FE005400D0000100100000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000010011025704CE4EDF76FF60F991FF24BD
          3FFF16AF2DFF15AE2BFF0AA315FF009900FF009900FF008C00FF004B00C00000
          000A000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000200190A6E0EDE5CF189FE5CF5
          8CFF23BB41FE1AB335FF19B132FE0BA316FE009800FE009900FF008C00FE0050
          00C30001000F0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000600311B9228F365FD
          97FF57EF85FE23BC43FF1EB63CFE1CB439FE08A010FE009900FF009700FE0090
          00FE005600CE0003001E00000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000017006539C1
          55FF65FD97FE52EB80FF23BB46FE21B944FE1DB53BFE029B05FF009700FE0097
          00FE009500FF006E00E50009003D000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000242
          03AF55E880FF66FF99FF43DC6FFF26BF4DFF25BE4BFF19B233FF009900FF0099
          00FF009900FF009800FF008700FA002B00890000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000002
          0019178522EA64FD96FF63FB95FE34CC61FE2AC254FE29C252FF10A821FE0097
          00FE009900FF009700FE009700FE007200F60C0D0C0E00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000015005F3EC85DFE65FD97FE59F18AFE30C85FFE2EC75CFF2BC356FE079F
          0EFE009900FF009700FE009600FE006400E20303030300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001064C09B75EF58EFF66FF99FF4AE37DFF32CB64FF31CA63FF27C0
          4FFF019A02FF009800FF008300FF001B006F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000003002229A73EF465FD97FE64FC96FE3BD46EFF32CA65FE32CA
          65FE1AB235FF008300FE004200B0000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000120017454E57EFE65FD97FE5AF38DFF33CB66FE25B3
          4AFE098312FE0035009B00000009000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000006137E1DE439C155FF2DB244FF0F8617FA0047
          00BD000B00410000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000010121018313C31482F392F451214121A0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      object btnDelete: TSpeedButton
        Left = 217
        Top = 4
        Width = 100
        Height = 32
        Glyph.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0409181A5E9C5962B5DF22257EBA00000F1F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000202
          254B6971C5F893A4F2FF5565DEFF040641780000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000020300000101000000000000000000000000000003062324
          6FAD9AA6FCFF7589FCFF5470FFFF1827B1EC0000070C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000102003057ABF0101202E00000000000000000000000001011424393E
          A7E4727EF4FF4758ECFF2742F8FF0F25D0F90102132000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000002055E99060BBAF300011A2700000000000000000000000000000D192225
          92D34A52E8FF212EE1FF0B21EAFF0719C8F801010F1B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000101
          22420915CFFF0407689D00000103000000000000000000000000000000000707
          548E1E23D7FF0910D8FF0411DDFF0715D4FF0203407A00000000000000000000
          00000000000000000000000000000000000000000000000000000000060C060C
          8DCD0B1ADBFF01012F5800000000000000000000000000000000000000000101
          23450305B4F50105D5FF0209D2FF0510E0FF050CAAEB01011730000000000000
          00000000000000000000000000000000000000000000000000000204508B0C21
          E7FF060E92CE0000081000000000000000000000000000000000000000000000
          010201035DA10001CCFF0103D0FF0209D4FF040DD8FF030674BB0000060D0000
          00000000000000000000000000000000000000000000010129520B1FD2F80C22
          E1FF01012D560000000000000000000000000000000000000000000000000000
          00000000050A020386D10000D0FF0102CDFF0106D5FF0309CBFF0202427A0000
          00000000000000000000000000000000000001001732091AB4EC0E30FEFF040B
          78BB000000010000000000000000000000000000000000000000000000000000
          0000000000000101183102029CE40000D0FF0001CCFF0104D3FF0306B2F60102
          22410000000000000000000000000100142907139ADE0F36FFFF091DBEF00100
          1B39000000000000000000000000000000000000000000000000000000000000
          000000000000000000000102274A0202A5EB0000D0FF0000CCFF0102D2FF0304
          8FDA01011223000000000101152A050D94D90A25F4FF0C28E9FF030548820000
          0001000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000101294A0203A5ED0000D0FF0000CFFF0102
          CCFF020473B60101223F030794DC0512E0FF0719E9FF050A81CB000007100000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000101203D030393DA0001D0FF0000
          CFFF0001C6FF0203B7FF0106D1FF030ADBFF040AAEF301011B38000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000010B16020277C10102
          CAFF0001CEFF0000CEFF0001CFFF0204B8FA0202336100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000F1C02046AB10207
          CCFF0104CFFF0001CDFF0000CEFF020287D300010B1800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000004080103446F040DACE5040FDCFF030C
          D7FF0208D4FF0205CFFF0103D1FF0102CBFF020477BD00001221000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000101253F09108BC50F22DEFF0B1FEAFF0617E0FF0614
          E0FF030DD1FF02046FB403049BE20406D4FF0809D4FF06078BD200011C350000
          0000000000000000000000000000000000000000000000000000000000000000
          00000101182D171A70A63748DAFC3352FEFF1C3AF8FF0F29ECFF0B22EEFF0616
          DCFF02045F9C0000030501011323020580C00C0FD0FF2124DEFF1819A4E90101
          2E5300000000000000000000000000000000000000000000000006061C2F2425
          628F626ACEF57E8DFBFF697FFFFF4A64FAFF2E4DF9FF1A3CFDFF0C21DFFF0203
          528B0000050900000000000000000000080D01024478171AB6F44041E4FF3A3B
          C8FB0506477D0101080F000000000000000000000000000000007D80C1E7B9C0
          F8FFB1BCFFFF94A0FEFF7A8AFCFF677DFFFF4D67FFFF1C2FD1F701023A6A0000
          0000000000000000000000000000000000000000000001011F360F0F78B94B4D
          D8FF6467E2FF2D2D92CF030427440000000000000000000000006364A4D2C5C9
          F4FFC2C8FFFFA7AFFFFF96A2FFFF707EF0FF242891CA0203263E000000000000
          0000000000000000000000000000000000000000000000000000000001020102
          365F2B2B97D16F70DDFF6E70D3FF262673A90404213900000E1A02020C162829
          64989799DFFFA9AEF3FF5D62BFED11114F7E0100080E00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000060B04043D682F308CC7696ACEFF3536B0FF010169BD000000000B0B
          2E4E6061A0CA8B8FCDDF32347EB204031C320000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000111F0B0C4D7E4546A1D63638A7EA010266B2}
      end
    end
    object pgcInfo: TRzPageControl
      Left = 0
      Top = 42
      Width = 875
      Height = 278
      Hint = ''
      ActivePage = tsContactInfo
      ActivePageDefault = tsContactInfo
      Align = alClient
      TabIndex = 0
      TabOrder = 1
      ExplicitLeft = -21
      ExplicitTop = 10
      ExplicitWidth = 852
      ExplicitHeight = 310
      FixedDimension = 19
      object tsContactInfo: TRzTabSheet
        Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
        ExplicitWidth = 848
        ExplicitHeight = 287
        object grdContactInfo: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 865
          Height = 249
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          ExplicitLeft = 6
          ExplicitTop = 6
          object gdvContactInfo: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            FindPanel.DisplayMode = fpdmManual
            DataController.DataSource = dm.dsContactInfo
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHiding = True
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.InvertSelect = False
            OptionsView.CellEndEllipsis = True
            OptionsView.NoDataToDisplayInfoText = #1053#1077#1090' '#1076#1072#1085#1085#1099#1093
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object gdvContactInfoCI_ID: TcxGridDBColumn
              Caption = #1050#1054#1044
              DataBinding.FieldName = 'CI_ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object gdvContactInfoCIT_ID: TcxGridDBColumn
              Caption = #1050#1054#1044' '#1058#1048#1055#1040' '#1050#1054#1053#1058#1040#1050#1058#1053#1054#1049' '#1048#1053#1060#1054#1056#1052#1040#1062#1048#1048
              DataBinding.FieldName = 'CIT_ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object gdvContactInfoCIT_NAME: TcxGridDBColumn
              Caption = #1042#1048#1044' '#1050#1054#1053#1058#1040#1050#1058#1053#1054#1049' '#1048#1053#1060#1054#1056#1052#1040#1062#1048#1048
              DataBinding.FieldName = 'CIT_NAME'
              HeaderAlignmentHorz = taCenter
              Width = 400
            end
            object gdvContactInfoCONTACT_ID: TcxGridDBColumn
              Caption = #1050#1054#1044' '#1050#1054#1053#1058#1040#1050#1058#1040
              DataBinding.FieldName = 'CONTACT_ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object gdvContactInfoCONTACT_INFO_VALUE: TcxGridDBColumn
              Caption = #1050#1054#1053#1058#1040#1050#1058#1053#1040#1071' '#1048#1053#1060#1054#1056#1052#1040#1062#1048#1071
              DataBinding.FieldName = 'CONTACT_INFO_VALUE'
              HeaderAlignmentHorz = taCenter
            end
          end
          object gdlContactInfo: TcxGridLevel
            GridView = gdvContactInfo
          end
        end
      end
      object tsRegions: TRzTabSheet
        Caption = #1047#1086#1085#1072' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
        ExplicitHeight = 256
        object grdRegions: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 865
          Height = 249
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          ExplicitLeft = 6
          ExplicitTop = 6
          object gdvRegions: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            FindPanel.DisplayMode = fpdmManual
            DataController.DataSource = dm.dsRegions
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHiding = True
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.InvertSelect = False
            OptionsView.CellEndEllipsis = True
            OptionsView.NoDataToDisplayInfoText = #1053#1077#1090' '#1076#1072#1085#1085#1099#1093
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object gdvRegionsWC_ID: TcxGridDBColumn
              Caption = #1050#1054#1044
              DataBinding.FieldName = 'WC_ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object gdvRegionsCONTACT_ID: TcxGridDBColumn
              Caption = #1050#1054#1044' '#1050#1054#1053#1058#1040#1050#1058#1040
              DataBinding.FieldName = 'CONTACT_ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object gdvRegionsCITY_ID: TcxGridDBColumn
              Caption = #1050#1054#1044' '#1043#1054#1056#1054#1044#1040
              DataBinding.FieldName = 'CITY_ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object gdvRegionsREGION_NAME: TcxGridDBColumn
              Caption = #1054#1041#1051#1040#1057#1058#1068
              DataBinding.FieldName = 'REGION_NAME'
              HeaderAlignmentHorz = taCenter
              Width = 400
            end
            object gdvRegionsCITY_NAME: TcxGridDBColumn
              Caption = #1043#1054#1056#1054#1044
              DataBinding.FieldName = 'CITY_NAME'
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object gdvRegionsOLD_CITY: TcxGridDBColumn
              Caption = #1044#1051#1071' '#1057#1055#1056#1040#1042#1050#1048
              DataBinding.FieldName = 'OLD_CITY'
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
          end
          object gdlRegions: TcxGridLevel
            GridView = gdvRegions
          end
        end
      end
      object tsTransferInfo: TRzTabSheet
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086#1073' '#1086#1087#1083#1072#1090#1077
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grdTransfer: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 865
          Height = 249
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          ExplicitLeft = 6
          ExplicitTop = 6
          object gdvTransfer: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            FindPanel.DisplayMode = fpdmManual
            DataController.DataSource = dm.dsTransferInfo
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHiding = True
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.InvertSelect = False
            OptionsView.CellEndEllipsis = True
            OptionsView.NoDataToDisplayInfoText = #1053#1077#1090' '#1076#1072#1085#1085#1099#1093
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object gdvTransferTI_ID: TcxGridDBColumn
              Caption = #1050#1054#1044
              DataBinding.FieldName = 'TI_ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object gdvTransferTT_ID: TcxGridDBColumn
              Caption = #1050#1054#1044' '#1042#1048#1044#1040
              DataBinding.FieldName = 'TT_ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object gdvTransferCONTACT_ID: TcxGridDBColumn
              Caption = #1050#1054#1044' '#1050#1054#1053#1058#1040#1050#1058#1040
              DataBinding.FieldName = 'CONTACT_ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object gdvTransferTT_NAME: TcxGridDBColumn
              Caption = #1042#1048#1044' '#1055#1045#1056#1045#1042#1054#1044#1040
              DataBinding.FieldName = 'TT_NAME'
              HeaderAlignmentHorz = taCenter
              Width = 400
            end
            object gdvTransferBANK_NAME: TcxGridDBColumn
              Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1041#1040#1053#1050#1040
              DataBinding.FieldName = 'BANK_NAME'
              HeaderAlignmentHorz = taCenter
              Width = 300
            end
            object gdvTransferCARD_NAME: TcxGridDBColumn
              Caption = #1053#1054#1052#1045#1056' '#1050#1040#1056#1058#1054#1063#1050#1048
              DataBinding.FieldName = 'CARD_NAME'
              HeaderAlignmentHorz = taCenter
              Width = 300
            end
            object gdvTransferCARD_PERIOD: TcxGridDBColumn
              Caption = #1055#1045#1056#1048#1054#1044' '#1044#1045#1049#1057#1058#1042#1048#1071
              DataBinding.FieldName = 'CARD_PERIOD'
              HeaderAlignmentHorz = taCenter
              Width = 250
            end
            object gdvTransferNOTES: TcxGridDBColumn
              Caption = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1071
              DataBinding.FieldName = 'NOTES'
              HeaderAlignmentHorz = taCenter
              Width = 400
            end
          end
          object gdlTransfer: TcxGridLevel
            GridView = gdvTransfer
          end
        end
      end
    end
  end
end
