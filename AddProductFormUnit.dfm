object AddProductForm: TAddProductForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088
  ClientHeight = 305
  ClientWidth = 229
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel
    Left = 8
    Top = 21
    Width = 77
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object txtName: TEdit
    Left = 8
    Top = 40
    Width = 213
    Height = 21
    TabOrder = 0
  end
  object btnSave: TButton
    Left = 8
    Top = 248
    Width = 213
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object commandAdd: TADOCommand
    Connection = MyDataModule.adoConnection
    Parameters = <>
    Left = 40
    Top = 152
  end
end
