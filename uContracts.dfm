object frmContracts: TfrmContracts
  Left = 0
  Top = 0
  Caption = #1044#1086#1075#1086#1074#1086#1088#1072
  ClientHeight = 599
  ClientWidth = 1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object scMain: TScrollBox
    Left = 0
    Top = 0
    Width = 1074
    Height = 599
    Align = alClient
    TabOrder = 0
    object pnlMain: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 1064
      Height = 589
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1064
        Height = 185
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 1
          Top = 28
          Width = 1062
          Height = 18
          Align = alTop
          Alignment = taCenter
          Caption = #1044#1086#1075#1086#1074#1086#1088#1072' '#1087#1086#1076#1088#1103#1076#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 125
        end
        object dkContracts: TSpTBXDock
          Left = 1
          Top = 1
          Width = 1062
          Height = 27
          BackgroundOnToolbars = False
          BoundLines = [blBottom]
          object tbContracts: TSpTBXToolbar
            Left = 0
            Top = 0
            DefaultDock = dkContracts
            DockPos = 0
            FullSize = True
            Images = ilMain
            Stretch = True
            TabOrder = 0
            Color = clMenu
            Caption = #1044#1086#1075#1086#1074#1086#1088#1072
            object iAdd: TSpTBXItem
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              ImageIndex = 0
              Images = ilMain
              OnClick = iAddClick
            end
            object iEdit: TSpTBXItem
              Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
              ImageIndex = 1
              OnClick = iEditClick
            end
            object iDelete: TSpTBXItem
              Caption = #1059#1076#1072#1083#1080#1090#1100
              ImageIndex = 2
              OnClick = iDeleteClick
            end
            object SpTBXSeparatorItem1: TSpTBXSeparatorItem
            end
            object iPrint: TSpTBXItem
              Caption = #1055#1077#1095#1072#1090#1100
              ImageIndex = 3
              OnClick = iPrintClick
            end
          end
        end
        object grdVContracts: TcxGrid
          AlignWithMargins = True
          Left = 4
          Top = 49
          Width = 1056
          Height = 132
          Hint = #1044#1086#1075#1086#1074#1086#1088#1072' '#1087#1086#1076#1088#1103#1076#1072
          Align = alClient
          TabOrder = 1
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          object gdvVContracts: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            FindPanel.DisplayMode = fpdmManual
            DataController.DataSource = dm.udsContracts
            DataController.KeyFieldNames = 'AGREEMENT_ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHiding = True
            OptionsCustomize.ColumnHidingOnGrouping = False
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
            OptionsView.HeaderAutoHeight = True
            object gdvVContractsAGREEMENT_ID: TcxGridDBColumn
              Caption = #1050#1054#1044
              DataBinding.FieldName = 'AGREEMENT_ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object gdvVContractsCONTACT_CODE: TcxGridDBColumn
              Caption = #1050#1054#1044
              DataBinding.FieldName = 'CONTACT_CODE'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object gdvVContractsAGREEMENT_KIND: TcxGridDBColumn
              Caption = #1042#1048#1044' '#1044#1054#1043#1054#1042#1054#1056#1040
              DataBinding.FieldName = 'KIND'
              HeaderAlignmentHorz = taCenter
              Width = 250
            end
            object gdvVContractsAGREEMENT_NUM: TcxGridDBColumn
              Caption = #1053#1054#1052#1045#1056' '#1044#1054#1043#1054#1042#1054#1056#1040
              DataBinding.FieldName = 'AGREEMENT_NUM'
              HeaderAlignmentHorz = taCenter
            end
            object gdvVContractsDATE_START: TcxGridDBColumn
              Caption = #1044#1040#1058#1040' '#1053#1040#1063#1040#1051#1040
              DataBinding.FieldName = 'DATE_START'
              HeaderAlignmentHorz = taCenter
            end
            object gdvVContractsDATE_FINISH: TcxGridDBColumn
              Caption = #1044#1040#1058#1040' '#1054#1050#1054#1053#1063#1040#1053#1048#1071
              DataBinding.FieldName = 'DATE_FINISH'
              HeaderAlignmentHorz = taCenter
            end
          end
          object gdlVContracts: TcxGridLevel
            GridView = gdvVContracts
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 185
        Width = 1064
        Height = 184
        Align = alTop
        TabOrder = 1
        object Label2: TLabel
          Left = 1
          Top = 28
          Width = 1062
          Height = 18
          Align = alTop
          Alignment = taCenter
          Caption = #1047#1072#1076#1072#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 56
        end
        object dkTasks: TSpTBXDock
          Left = 1
          Top = 1
          Width = 1062
          Height = 27
          BoundLines = [blBottom]
          object tbTasks: TSpTBXToolbar
            Left = 0
            Top = 0
            DefaultDock = dkTasks
            DockPos = 0
            FullSize = True
            Images = ilMain
            Stretch = True
            TabOrder = 0
            Color = clMenu
            Caption = 'tbTasks'
            object itAdd: TSpTBXItem
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              ImageIndex = 0
              Images = ilMain
              OnClick = itAddClick
            end
            object itEdit: TSpTBXItem
              Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
              ImageIndex = 1
              OnClick = itEditClick
            end
            object itDelete: TSpTBXItem
              Caption = #1059#1076#1072#1083#1080#1090#1100
              ImageIndex = 2
              OnClick = itDeleteClick
            end
            object SpTBXSeparatorItem2: TSpTBXSeparatorItem
            end
            object itPrint: TSpTBXItem
              Caption = #1055#1077#1095#1072#1090#1100
              ImageIndex = 3
              OnClick = itPrintClick
            end
          end
        end
        object grdVTasks: TcxGrid
          AlignWithMargins = True
          Left = 4
          Top = 49
          Width = 1056
          Height = 131
          Align = alClient
          TabOrder = 1
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          object gdvVTasks: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            FindPanel.DisplayMode = fpdmManual
            DataController.DataSource = dm.udsTasks
            DataController.KeyFieldNames = 'TASK_ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHiding = True
            OptionsCustomize.ColumnHidingOnGrouping = False
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
            OptionsView.HeaderAutoHeight = True
            object gdvVTasksTASK_ID: TcxGridDBColumn
              Caption = #1050#1054#1044' '#1047#1040#1044#1040#1053#1048#1071
              DataBinding.FieldName = 'TASK_ID'
              Visible = False
            end
            object gdvVTasksAGREEMENT_ID: TcxGridDBColumn
              Caption = #1050#1054#1044' '#1044#1054#1043#1054#1042#1054#1056#1040
              DataBinding.FieldName = 'AGREEMENT_ID'
              Visible = False
            end
            object gdvVTasksTASK_NUM: TcxGridDBColumn
              Caption = #1053#1054#1052#1045#1056' '#1047#1040#1044#1040#1053#1048#1071
              DataBinding.FieldName = 'TASK_NUM'
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
            object gdvVTasksTASK_DATE: TcxGridDBColumn
              Caption = #1044#1040#1058#1040' '#1047#1040#1044#1040#1053#1048#1071
              DataBinding.FieldName = 'TASK_DATE'
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
            object gdvVTasksTASK_THEME: TcxGridDBColumn
              Caption = #1058#1045#1052#1040' '#1047#1040#1044#1040#1053#1048#1071
              DataBinding.FieldName = 'TASK_THEME'
              HeaderAlignmentHorz = taCenter
              Width = 250
            end
            object gdvVTasksREGION_RESEARCH: TcxGridDBColumn
              Caption = #1056#1045#1043#1048#1054#1053
              DataBinding.FieldName = 'REGION_RESEARCH'
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
            object gdvVTasksOBJECT_RESEARCH: TcxGridDBColumn
              Caption = #1054#1041#1066#1045#1050#1058
              DataBinding.FieldName = 'OBJECT_RESEARCH'
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
            object gdvVTasksTASK_TARGET: TcxGridDBColumn
              Caption = #1062#1045#1051#1048
              DataBinding.FieldName = 'TASK_TARGET'
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
            object gdvVTasksTARIF: TcxGridDBColumn
              Caption = #1058#1040#1056#1048#1060
              DataBinding.FieldName = 'TARIF'
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
            object gdvVTasksDATE_START: TcxGridDBColumn
              Caption = #1044#1040#1058#1040' '#1053#1040#1063#1040#1051#1040
              DataBinding.FieldName = 'DATE_START'
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
            object gdvVTasksDATE_FINISH: TcxGridDBColumn
              Caption = #1044#1040#1058#1040' '#1054#1050#1054#1053#1063#1040#1053#1048#1071
              DataBinding.FieldName = 'DATE_FINISH'
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
          end
          object gdlVTasks: TcxGridLevel
            GridView = gdvVTasks
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 369
        Width = 1064
        Height = 220
        Align = alClient
        TabOrder = 2
        object Label3: TLabel
          Left = 1
          Top = 28
          Width = 1062
          Height = 18
          Align = alTop
          Alignment = taCenter
          Caption = #1040#1082#1090#1099' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 176
        end
        object dkActs: TSpTBXDock
          Left = 1
          Top = 1
          Width = 1062
          Height = 27
          BoundLines = [blBottom]
          object tbActs: TSpTBXToolbar
            Left = 0
            Top = 0
            DefaultDock = dkActs
            FullSize = True
            Images = ilMain
            Stretch = True
            TabOrder = 0
            Color = clMenu
            Caption = 'tbActs'
            object iaAdd: TSpTBXItem
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              ImageIndex = 0
              Images = ilMain
              OnClick = iaAddClick
            end
            object iaEdit: TSpTBXItem
              Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
              ImageIndex = 1
              OnClick = iaEditClick
            end
            object iaDelete: TSpTBXItem
              Caption = #1059#1076#1072#1083#1080#1090#1100
              ImageIndex = 2
              OnClick = iaDeleteClick
            end
            object SpTBXSeparatorItem3: TSpTBXSeparatorItem
            end
            object iaPrint: TSpTBXItem
              Caption = #1055#1077#1095#1072#1090#1100
              ImageIndex = 3
              OnClick = iaPrintClick
            end
          end
        end
        object grdVActs: TcxGrid
          AlignWithMargins = True
          Left = 4
          Top = 49
          Width = 1056
          Height = 167
          Align = alClient
          TabOrder = 1
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          object gdvVActs: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            FindPanel.DisplayMode = fpdmManual
            DataController.DataSource = dm.udsActs
            DataController.KeyFieldNames = 'ACT_ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHiding = True
            OptionsCustomize.ColumnHidingOnGrouping = False
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
            OptionsView.HeaderAutoHeight = True
            object gdvVActsACT_ID: TcxGridDBColumn
              Caption = #1050#1054#1044' '#1040#1050#1058#1040
              DataBinding.FieldName = 'ACT_ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object gdvVActsTASK_ID: TcxGridDBColumn
              Caption = #1050#1054#1044' '#1047#1040#1044#1040#1053#1048#1071
              DataBinding.FieldName = 'TASK_ID'
              HeaderAlignmentHorz = taCenter
            end
            object gdvVActsACT_NUM: TcxGridDBColumn
              Caption = #1053#1054#1052#1045#1056' '#1040#1050#1058#1040
              DataBinding.FieldName = 'ACT_NUM'
              HeaderAlignmentHorz = taCenter
            end
            object gdvVActsACT_DATE: TcxGridDBColumn
              Caption = #1044#1040#1058#1040' '#1040#1050#1058#1040
              DataBinding.FieldName = 'ACT_DATE'
              HeaderAlignmentHorz = taCenter
            end
            object gdvVActsCOUNT_ANKETA: TcxGridDBColumn
              Caption = #1050#1054#1051#1048#1063#1045#1057#1058#1042#1054' '#1040#1053#1050#1045#1058
              DataBinding.FieldName = 'COUNT_ANKETA'
              HeaderAlignmentHorz = taCenter
            end
            object gdvVActsCOST: TcxGridDBColumn
              Caption = #1057#1058#1054#1048#1052#1054#1057#1058#1068
              DataBinding.FieldName = 'COST'
              HeaderAlignmentHorz = taCenter
            end
          end
          object gdlVActs: TcxGridLevel
            GridView = gdvVActs
          end
        end
      end
    end
  end
  object ilMain: TcxImageList
    FormatVersion = 1
    DesignInfo = 18612755
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000A170D0738542D1894814626D193502AEA924F2AE87F45
          25D0522C17931209053000000009000000010000000000000000000000000000
          00030201011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A4
          6BFFC58956FFA46137F53C2112730000000F0000000300000000000000020201
          0110744226B9BC7C4DFFDDAE77FFDEB076FFE2B782FFE3BB87FFE3BC86FFE1B7
          82FFDEAF74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C36
          2095BE8053FFE0B37CFFDFB076FFDEB177FFB78254FFAA7144FFAB7245FFBC88
          59FFDFB279FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B070
          47FADFB27DFFDFB27AFFE0B37BFFE0B57DFFA56B3FFFF5EFEAFFF8F3EEFFAB72
          45FFE2B67EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B
          6FFFE2B780FFE5BD89FFE7C291FFE8C393FFA56B3FFFF1E6DEFFF9F5F1FFAA71
          44FFE8C494FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB3
          83FFE3B781FFBA8659FFA97043FFAB7245FFAC7346FFF5EDE6FFFAF6F3FFAD75
          47FFB0784AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF
          8FFFE4BB84FFA56B3FFFF3EBE6FFFAF6F3FFF6EFE8FFF7F0EAFFFBF7F5FFFAF7
          F4FFFAF7F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9
          A0FFE5BE89FFA56B3FFFE0D2CAFFE1D3CCFFE3D5CFFFF2EAE4FFF8F3EFFFEADF
          D9FFE6DAD4FFE9DED9FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CD
          ACFFEAC796FFB78456FFA56B3FFFA56B3FFFA56B3FFFF1EAE5FFFAF6F3FFA56B
          3FFFA56B3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB
          9DFFEED3A9FFEECFA2FFEED2A5FFF0D6A9FFA56B3FFFF0EAE7FFFDFCFBFFA56B
          3FFFF1D6AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC794
          6CFCF5E8CCFFEFD6ABFFF1D8AEFFF2DAB0FFA56B3FFFDECFC9FFDFD1CBFFA56B
          3FFFF3DCB2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F52
          3C92D7B08CFFF8EFD3FFF3E0B9FFF3DFB7FFB98A5FFFA56B3FFFA56B3FFFBA8A
          5FFFF4E1B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C00000006000000010202
          0107906C4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7EC
          CAFFF8EED0FFF4E8CDFFD7AF8BFF88664AB30202010B00000001000000000000
          00010202010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8
          B9FFE3C5A3FFC59973F24C392A67000000060000000100000000000000000000
          000000000001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E
          60CD6C543F8B16110D2200000003000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000070000001A0000001C00000012000000070000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000018421C11FF30140DE7190A06A7030407510000
          0014000000030000000000000000000000000000000000000000000000000000
          0000000000000000000000000016663C2BE2B9C7D2FF7889A2FF244182FF0510
          33A4000000180000000300000000000000000000000000000000000000010000
          000500000009000000090000001641261BA1879AB2FFC8E3F5FF1F66B6FF2B6B
          A8FF051336A30000001900000006000000020000000000000000000000057F55
          47BCB07662FFB07661FFAC725FFFAA9794FF488BC3FFDEFEFDFF51B4E3FF1F68
          B7FF3173AEFF061538A00000001A00000008000000000000000000000007B57D
          6AFFFAF4F0FFF9F3F0FFF9F3EEFFEFECEAFF84AAC6FF479FD2FFDEFEFDFF59BF
          E9FF216BB9FF367BB3FF07173AA000000019000000020000000000000006BA84
          72FFFBF5F2FF8F6F63FF8E6F63FF8D6E62FF86685DFF7091AAFF4BA5D5FFDEFE
          FDFF61CAEFFF246FBCFF3B83B9FF08193D9E000000120000000200000005C08C
          7AFFFBF7F4FFA68C81FF907165FF907164FF8E6F63FF896B60FF7596B1FF4EAA
          D7FFDEFEFDFF68D4F4FF2875BEFF3F8BBEFF091B3F970000000A00000005C594
          83FFFCF8F7FFF7EDEAFFCEBDB6FF937569FF927468FFC9B7AFFFE9E0DBFF8BB1
          CCFF51AEDAFFDEFEFDFF6EDDF8FF2C7BC2FF18448BFF0000000E00000004CB9C
          8BFFFDFAF8FFF9F1EEFFE7DBD7FF937569FF937569FFE1D4CEFFF7F0ECFFEEE7
          E3FF8EB3CFFF54B1DCFFDEFEFDFF4FA6D4FF102B4E8E0000000700000003CFA3
          93FFFDFBFAFFFAF2EEFFC3B0A8FF95786CFF95786CFFC2AFA6FFF9F1EFFFF8F1
          EDFFF1E9E7FF92B9D5FF357FBCFF173A598D000000090000000100000003D4A9
          9AFFFDFCFBFFF8F0ECFF9B8074FF977B6FFF977B6FFF9B8176FFF6EEEAFFFAF2
          EFFFF8F2EDFFF9F6F5FFDBC0B6FF00000009000000010000000000000002D7AF
          9FFFFEFCFCFFFAF3F0FFBDAAA0FF9E8377FF9C8175FFBBA79EFFF9F2EEFFFAF3
          F0FFFAF3EFFFFDFBFAFFD4A899FF00000004000000000000000000000001D8B0
          A1FFFEFDFCFFFEFDFCFFFEFDFCFFFEFDFCFFFEFDFCFFFEFCFCFFFEFCFCFFFEFC
          FCFFFEFCFBFFFEFCFBFFD6AE9FFF00000003000000000000000000000001A082
          77BED8B0A1FFD8B0A1FFD8B0A1FFD8B0A1FFD8B0A1FFD8B0A1FFD8B0A1FFD8B0
          A1FFD8B0A1FFD8B0A1FFA08277BF000000020000000000000000000000000000
          0000000000010000000100000001000000010000000100000001000000020000
          0002000000020000000200000001000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000020000000A00000010000000090000000200000000000000000000
          00020000000A000000120000000C000000030000000000000000000000000000
          00020000000F0F0742921D0F7EEF0603347A0000000E00000002000000020000
          000F0804347C1D0F7EF00F084194000000120000000200000000000000000000
          0008120B47923233AFFF3648CCFF1D1EA5FF0603357A0000000F0000000F0703
          357C1F20A5FF3747CCFF2D2FAEFF120B46950000000B00000000000000000000
          000C281C8DF1596CD8FF3B51D3FF3A4FD2FF1E22A6FF0602347D0502357E2022
          A6FF3A50D3FF3A50D3FF4C5FD4FF291D8CF10000001000000000000000000000
          0006130F3C734D4FBAFF667EE0FF415AD6FF415AD7FF1F24A7FF2529A8FF415A
          D7FF415AD7FF5B72DEFF484AB8FF130F3C790000000900000000000000000000
          00010000000A16123F73585CC1FF758DE6FF4A64DBFF4A65DBFF4A65DBFF4A64
          DBFF6983E3FF5356C0FF16123F780000000C0000000200000000000000000000
          0000000000010000000A191643755D63C7FF6783E5FF5774E2FF5774E2FF5774
          E2FF565CC6FF1916437A0000000D000000020000000000000000000000000000
          00000000000100000009100E3D734A50BEFF7492EBFF6383E7FF6483E7FF6383
          E7FF3840B6FF0B0839780000000C000000020000000000000000000000000000
          0001000000071413416E555CC5FF85A1EFFF7897EDFF9CB6F4FF9DB7F5FF7997
          EEFF7796EDFF414ABCFF0E0C3C730000000A0000000100000000000000000000
          00041818456B636CCFFF93AFF3FF83A1F1FFA6BFF7FF676DCAFF7E87DDFFAFC7
          F8FF83A3F2FF83A1F1FF5058C4FF121040710000000600000000000000000000
          00065759C3EFAFC6F6FF8EADF4FFABC4F8FF6F76D0FF1817456F24244F70868E
          E1FFB5CCF9FF8DACF4FFA1B8F4FF5758C3EF0000000900000000000000000000
          000331326B8695A0EAFFC0D3F9FF7880D7FF1C1C496B00000006000000072527
          526C8B93E6FFC1D3F9FF949EE9FF303168870000000500000000000000000000
          00010000000431336B825E62CBEC1F204D680000000500000001000000010000
          00052728536B5E62CBEC31326883000000070000000100000000000000000000
          0000000000000000000200000004000000020000000100000000000000000000
          0001000000030000000500000004000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000030000000C000000120000001400000014000000150000
          0015000000140000000D00000003000000000000000000000000000000000000
          00000000000000000009896256C2BD8A78FFBE8A78FFBD8A78FFBD8978FFBD89
          78FFBE8978FF876356C30000000B000000000000000000000000000000030000
          000E0000001500000021C08D7CFFF6EEE9FFF5EDE9FFF5EDE9FFF5ECE8FFF4EC
          E8FFF5ECE7FFBF8D7BFF00000026000000180000000F000000040000000C7B50
          42C5A76E5BFF9F6755FFC2917FFFF7F0ECFFE2B47DFFE2B37AFFE1B077FFE0AE
          72FFF6EEEAFFC2907FFF845545FF895847FF613E32C70000000E00000011BB7E
          6BFFECD9CCFFE3CEBEFFC59483FFF9F2F0FFE4B984FFE3B781FFE3B47CFFE0B1
          76FFF7F0EDFFC59483FFE0CBBCFFEBD8CBFFB67763FF0000001400000010BE85
          71FFF1E5DAFFECDBD0FF7A4835FF7A4835FF7A4835FF7A4835FF7A4835FF7A48
          35FF7A4835FF7A4835FFEBDBCFFFF1E2D8FFB97C69FF000000130000000EC28B
          78FFF5EEE7FFF2E7DDFFF2E7DEFFF3E7DEFFF2E5DEFFF3E5DEFFF2E7DDFFF2E7
          DDFFF2E7DEFFF2E7DDFFF2E5DEFFF5EDE6FFBC826EFF000000120000000CC793
          7FFFFAF4F1FFCDBEB8FF6F5448FF614337FF614035FF5F3F34FF5E3F33FF5D3D
          32FF5D3D34FF6A4C44FFCABCB6FFF9F5F1FFC18875FF000000100000000ACC99
          86FFFDFAFAFF7D6054FF745043FF744F43FF744E43FF734E43FF734E42FF724D
          42FF724C41FF724C40FF73584DFFFDFAFAFFC58F7CFF0000000E00000008CF9F
          8DFFFFFFFFFF7A5A4CFF8E695AFFF9F4F1FFF0E6E0FFF0E5DFFFEFE5DEFFEFE5
          DEFFF6EFEBFF866253FF704F43FFFFFFFFFFCA9683FF0000000B00000005BE95
          84E9F5ECE8FF866656FF977262FFFAF6F4FFF2E8E3FFF1E8E1FFF1E7E2FFF1E7
          E1FFF8F2EEFF8E6A5BFF7A5B4CFFF5EAE6FFBA8E7DEA00000008000000023429
          2545A78375CC947262FFA07B6AFFFCF9F8FFF3EBE6FFF4EAE5FFF2EAE5FFF3EA
          E3FFF9F5F3FF977263FF876658FFA68072CE3428234800000003000000000000
          0001000000030000000AC89B89FFFDFBFAFFF5EDE8FFF4EDE8FFF5EDE7FFF5EC
          E7FFFBF7F6FFC59685FF00000011000000040000000200000000000000000000
          00000000000000000005CA9E8DFFFEFCFCFFF7F0ECFFF6EFEBFFF7EFEBFFF5EF
          EAFFFCFAF8FFC89A89FF00000009000000000000000000000000000000000000
          00000000000000000003CDA291FFFEFEFDFFFEFDFDFFFEFDFCFFFEFCFCFFFEFC
          FBFFFDFBFAFFCB9F8DFF00000007000000000000000000000000000000000000
          000000000000000000019A796DBFCFA493FFCEA493FFCEA493FFCEA492FFCDA3
          91FFCDA391FF98786BC100000004000000000000000000000000}
      end>
  end
end
