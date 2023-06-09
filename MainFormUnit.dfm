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
    Flat = True
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    RowHeight = 30
    TabOrder = 1
    VertScrollBar.Tracking = False
    OnDblClick = dbGridDblClick
    OnKeyDown = dbGridKeyDown
    OnKeyPress = dbGridKeyPress
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ProductID'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1048#1044
        WordWrap = True
      end
      item
        AlwaysShowEditButton = True
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
        ReadOnly = True
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        WordWrap = True
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object btnAddProduct: TButton
    Left = 429
    Top = 8
    Width = 114
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088#1100
    TabOrder = 2
    OnClick = btnAddProductClick
  end
  object dtReportDate: TDateTimePicker
    Left = 8
    Top = 8
    Width = 105
    Height = 25
    Date = 45011.756281111110000000
    Time = 45011.756281111110000000
    TabOrder = 3
    OnChange = dtReportDateChange
  end
  object btnReport: TButton
    Left = 119
    Top = 8
    Width = 122
    Height = 25
    Caption = #1057#1075#1077#1085#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1095#1077#1090#1100
    TabOrder = 4
    OnClick = btnReportClick
  end
  object dsProducts: TDataSource
    DataSet = queryProducts
    Left = 568
    Top = 32
  end
  object queryProducts: TADOQuery
    Connection = MyDataModule.adoConnection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Products')
    Left = 600
    Top = 32
  end
  object frxReport1: TfrxReport
    Version = '2022.2.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45015.808221851800000000
    ReportOptions.LastChange = 45015.941491898150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 496
    Top = 240
    Datasets = <
      item
        DataSet = frxDataSet
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Memo1: TfrxMemoView
        AllowVectorExport = True
        Left = 7.559060000000000000
        Top = 1024.252630000000000000
        Width = 219.212740000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          'Powered by Doston Rakhmatov')
      end
      object Transactions: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Title: TfrxMemoView
          AllowVectorExport = True
          Left = 272.126160000000000000
          Top = 3.779530000000000000
          Width = 132.283550000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1058#1088#1072#1085#1079#1072#1082#1094#1080#1080)
          ParentFont = False
        end
        object SelectedDate: TfrxMemoView
          AllowVectorExport = True
          Left = 442.205010000000000000
          Top = 37.795300000000000000
          Width = 317.480520000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1077' '#1086#1090#1095#1077#1090#1072' -  [Date]')
          ParentFont = False
        end
      end
      object DataTransactions: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 1
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        DataSet = frxDataSet
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object RowName: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 3.779530000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."ProductName"]')
          ParentFont = False
        end
        object RowID: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."TransactionID"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 287.244280000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."TransactionType"]')
          ParentFont = False
        end
        object RowDate: TfrxMemoView
          AllowVectorExport = True
          Left = 453.543600000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."TransactionDate"]')
          ParentFont = False
        end
        object RowQuantity: TfrxMemoView
          AllowVectorExport = True
          Left = 585.827150000000000000
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."Quantity"]')
          ParentFont = False
        end
      end
      object ColumnTransactions: TfrxColumnHeader
        FillType = ftBrush
        Fill.BackColor = cl3DLight
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Style = fsDot
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 124.724490000000000000
        Width = 718.110700000000000000
        object ColumnID: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ID')
          ParentFont = False
        end
        object ColumnName: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 3.779530000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            #1053#1072#1080#1084#1072#1085#1086#1074#1072#1085#1080#1077)
          ParentFont = False
        end
        object ColumnType: TfrxMemoView
          AllowVectorExport = True
          Left = 287.244280000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            #1058#1080#1087)
          ParentFont = False
        end
        object ColumnDate: TfrxMemoView
          AllowVectorExport = True
          Left = 453.543600000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            #1044#1072#1090#1072)
          ParentFont = False
        end
        object ColumnQuantity: TfrxMemoView
          AllowVectorExport = True
          Left = 585.827150000000000000
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086)
          ParentFont = False
        end
      end
    end
  end
  object frxDataSet: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    DataSetOptions = []
    Left = 528
    Top = 240
  end
  object queryReport: TADOQuery
    Connection = MyDataModule.adoConnection
    Parameters = <>
    Left = 536
    Top = 32
  end
end
