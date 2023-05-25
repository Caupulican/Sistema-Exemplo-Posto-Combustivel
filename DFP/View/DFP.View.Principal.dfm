object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  Caption = 'DFP'
  ClientHeight = 430
  ClientWidth = 974
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 24
    Top = 40
    object Cadastro1: TMenuItem
      Caption = 'Cadastros'
      object MenTanques: TMenuItem
        Caption = 'Tanques'
        OnClick = MenTanquesClick
      end
      object MenBombas: TMenuItem
        Caption = 'Bombas'
        OnClick = MenBombasClick
      end
    end
    object Lanamentos1: TMenuItem
      Caption = 'Lan'#231'amentos'
      object Abastecimentos1: TMenuItem
        Caption = 'Abastecimentos'
        OnClick = Abastecimentos1Click
      end
    end
    object Relatorios1: TMenuItem
      Caption = 'Relatorios'
      object Abastecimentos2: TMenuItem
        Caption = 'Abastecimentos'
        OnClick = Abastecimentos2Click
      end
    end
  end
end
