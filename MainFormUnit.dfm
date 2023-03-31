object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #1043#1083#1072#1074#1085#1072#1103
  ClientHeight = 285
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    656
    285)
  PixelsPerInch = 96
  TextHeight = 13
  object btnSettingsFrm: TButton
    Left = 549
    Top = 8
    Width = 99
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    ImageIndex = 0
    TabOrder = 0
    OnClick = btnSettingsFrmClick
  end
  object dbGrid: TDBGridEh
    Left = 8
    Top = 48
    Width = 640
    Height = 229
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsProducts
    DynProps = <>
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    TabOrder = 1
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ProductID'
        Footers = <>
        Title.Caption = #1048#1044
        WordWrap = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ProductName'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Quantity'
        Footers = <>
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        WordWrap = True
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object btnAddProduct: TButton
    Left = 309
    Top = 8
    Width = 114
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088#1100
    TabOrder = 2
  end
  object btnTransaction: TButton
    Left = 429
    Top = 8
    Width = 114
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1056#1072#1089#1093#1086#1076'/'#1055#1088#1080#1093#1086#1076
    TabOrder = 3
  end
  object dtReportDate: TDateTimePicker
    Left = 8
    Top = 8
    Width = 105
    Height = 25
    Date = 45011.756281111110000000
    Time = 45011.756281111110000000
    TabOrder = 4
    OnChange = dtReportDateChange
  end
  object btnReport: TButton
    Left = 119
    Top = 8
    Width = 122
    Height = 25
    Caption = #1057#1075#1077#1085#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1095#1077#1090#1100
    TabOrder = 5
    OnClick = btnReportClick
  end
  object dbConnection: TADOConnection
    LoginPrompt = False
    Provider = 'SQLNCLI11'
    Left = 504
    Top = 32
  end
  object dsProducts: TDataSource
    DataSet = queryProducts
    Left = 568
    Top = 32
  end
  object queryProducts: TADOQuery
    Connection = dbConnection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Products')
    Left = 600
    Top = 32
  end
  object reportTransaction: TfrxReport
    Version = '2022.2.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45015.741771238430000000
    ReportOptions.LastChange = 45015.742652777780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 264
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object TransactionsPage: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Transactions: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
    end
  end
end