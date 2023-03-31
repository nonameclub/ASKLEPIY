object frmSettings: TfrmSettings
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1073#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 283
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblServerName: TLabel
    Left = 16
    Top = 68
    Width = 41
    Height = 13
    Caption = #1057#1077#1088#1074#1077#1088':'
  end
  object lblDatabaseName: TLabel
    Left = 16
    Top = 16
    Width = 69
    Height = 13
    Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093':'
  end
  object lblUsername: TLabel
    Left = 16
    Top = 128
    Width = 70
    Height = 13
    Caption = #1055#1086#1083#1079#1086#1074#1072#1090#1077#1083#1100':'
  end
  object lblPassword: TLabel
    Left = 16
    Top = 187
    Width = 41
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100':'
  end
  object txtDatabaseName: TEdit
    Left = 16
    Top = 32
    Width = 246
    Height = 21
    TabOrder = 0
  end
  object txtServer: TEdit
    Left = 16
    Top = 87
    Width = 246
    Height = 21
    TabOrder = 1
  end
  object txtUsername: TEdit
    Left = 16
    Top = 147
    Width = 246
    Height = 21
    TabOrder = 2
  end
  object txtPassword: TEdit
    Left = 16
    Top = 206
    Width = 246
    Height = 21
    TabOrder = 3
  end
  object btnSave: TButton
    Left = 96
    Top = 240
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = btnSaveClick
  end
end
