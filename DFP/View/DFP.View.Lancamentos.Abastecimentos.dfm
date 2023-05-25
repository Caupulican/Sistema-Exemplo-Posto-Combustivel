object ViewLancamentosAbastecimentos: TViewLancamentosAbastecimentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Lan'#231'amento de Abastecimentos'
  ClientHeight = 405
  ClientWidth = 1002
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1002
    Height = 405
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = -8
    DesignSize = (
      1002
      405)
    object GroupBox1: TGroupBox
      Left = 16
      Top = 3
      Width = 961
      Height = 238
      Anchors = [akLeft]
      Caption = 'Abastecimentos anteriores( G = Gasolina / D = Diesel)'
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 957
        Height = 221
        Align = alClient
        DataSource = DSAbastecimentos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnEnter = DBGrid1Enter
      end
    end
    object Button1: TButton
      Left = 210
      Top = 345
      Width = 113
      Height = 35
      Anchors = [akLeft]
      Caption = 'Incluir'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 329
      Top = 345
      Width = 113
      Height = 35
      Anchors = [akLeft]
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 567
      Top = 345
      Width = 111
      Height = 35
      Anchors = [akLeft]
      Caption = 'Listar'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 448
      Top = 345
      Width = 113
      Height = 35
      Anchors = [akLeft]
      Caption = 'Excuir'
      TabOrder = 4
      OnClick = Button4Click
    end
    object GroupBox2: TGroupBox
      Left = 96
      Top = 246
      Width = 751
      Height = 93
      Anchors = [akLeft]
      Caption = 'Dados do Lan'#231'amento'
      TabOrder = 5
      object Label2: TLabel
        Left = 341
        Top = 20
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label1: TLabel
        Left = 461
        Top = 19
        Width = 26
        Height = 13
        Caption = 'Litros'
      end
      object Label3: TLabel
        Left = 588
        Top = 16
        Width = 40
        Height = 13
        Caption = 'Valor R$'
      end
      object Label4: TLabel
        Left = 461
        Top = 62
        Width = 249
        Height = 13
        Caption = '(Nesta vers'#227'o s'#227'o aceitos somente valores inteiros)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rgBomba: TRadioGroup
        Left = 173
        Top = 15
        Width = 161
        Height = 59
        Caption = 'Bomba'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '01'
          '02')
        TabOrder = 0
      end
      object rgCombustivel: TRadioGroup
        Left = 6
        Top = 17
        Width = 161
        Height = 55
        Caption = 'Combust'#237'vel'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Gasolina'
          'Diesel')
        TabOrder = 1
      end
      object edtLitros: TEdit
        Left = 461
        Top = 35
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 2
        Text = '0'
      end
      object dtData: TDateTimePicker
        Left = 340
        Top = 36
        Width = 115
        Height = 21
        Date = 45069.000000000000000000
        Time = 45069.000000000000000000
        TabOrder = 3
      end
      object edtValor: TEdit
        Left = 588
        Top = 35
        Width = 121
        Height = 21
        Hint = 
          'Valor meramente informativo, para alterar acesse o cadastro das ' +
          'bombas'
        NumbersOnly = True
        TabOrder = 4
        Text = '0'
      end
    end
  end
  object DSAbastecimentos: TDataSource
    Left = 376
    Top = 72
  end
end
