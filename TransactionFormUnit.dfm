object frmTransaction: TfrmTransaction
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1056#1072#1089#1093#1086#1076'/'#1055#1088#1080#1093#1086#1076
  ClientHeight = 316
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblProduct: TLabel
    Left = 8
    Top = 45
    Width = 22
    Height = 13
    Caption = #1058#1080#1087':'
  end
  object Label1: TLabel
    Left = 8
    Top = 104
    Width = 64
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
  end
  object lblProductName: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 285
    Height = 310
    Align = alClient
    Alignment = taCenter
    Caption = 'lblProductName'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = 8
    ExplicitTop = 8
  end
  object lblResidue: TLabel
    Left = 220
    Top = 104
    Width = 48
    Height = 13
    Caption = 'lblResidue'
  end
  object cmType: TComboBox
    Left = 8
    Top = 64
    Width = 275
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = #1055#1088#1080#1093#1086#1076
    Items.Strings = (
      #1055#1088#1080#1093#1086#1076
      #1056#1072#1089#1093#1086#1076)
  end
  object txtQuantity: TEdit
    Left = 8
    Top = 123
    Width = 275
    Height = 21
    TabOrder = 1
    OnKeyPress = txtQuantityKeyPress
  end
  object btnSave: TButton
    Left = 8
    Top = 272
    Width = 275
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object getProductQuery: TADOQuery
    Connection = MyDataModule.adoConnection
    Parameters = <>
    Left = 224
    Top = 224
  end
  object commandAdd: TADOCommand
    Connection = MyDataModule.adoConnection
    Parameters = <>
    Left = 136
    Top = 224
  end
end
