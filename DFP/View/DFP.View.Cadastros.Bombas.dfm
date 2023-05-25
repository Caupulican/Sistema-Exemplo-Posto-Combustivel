object ViewCadastrosBombas: TViewCadastrosBombas
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Bombas'
  ClientHeight = 306
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 617
    Height = 265
    DataSource = DSBombas
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Listar: TButton
    Left = 8
    Top = 279
    Width = 617
    Height = 25
    Caption = 'Listar'
    TabOrder = 1
    OnClick = ListarClick
  end
  object DSBombas: TDataSource
    Left = 312
    Top = 112
  end
end
