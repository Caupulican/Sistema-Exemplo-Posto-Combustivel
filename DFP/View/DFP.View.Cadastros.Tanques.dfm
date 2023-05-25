object ViewCadastrosTanques: TViewCadastrosTanques
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Tanques'
  ClientHeight = 298
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 609
    Height = 257
    DataSource = DSTanques
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 8
    Top = 271
    Width = 609
    Height = 25
    Caption = 'Listar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DSTanques: TDataSource
    Left = 264
    Top = 96
  end
end
