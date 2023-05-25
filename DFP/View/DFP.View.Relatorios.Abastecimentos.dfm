object ViewRelatoriosAbastecimentos: TViewRelatoriosAbastecimentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Abastecimentos'
  ClientHeight = 87
  ClientWidth = 353
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
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 119
    Width = 794
    Height = 1123
    DataSource = DsAbastecimentos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Visible = False
    object RLGroup1: TRLGroup
      Left = 38
      Top = 38
      Width = 718
      Height = 147
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 57
        BandType = btHeader
        BeforePrint = RLBand2BeforePrint
        object RLLabel2: TRLLabel
          Left = 210
          Top = 3
          Width = 298
          Height = 24
          Alignment = taCenter
          Caption = 'Relat'#243'rio de Abastecimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel21: TRLLabel
          Left = 1
          Top = 40
          Width = 65
          Height = 16
          AutoSize = False
          Caption = 'Per'#237'odo de:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object rllblPeriodo: TRLLabel
          Left = 72
          Top = 40
          Width = 145
          Height = 16
          AutoSize = False
          Caption = '00/00/0000 a 00/00/0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object RLLabel11: TRLLabel
          Left = 223
          Top = 40
          Width = 121
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'P'#225'gina '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object RLSystemInfo3: TRLSystemInfo
          Left = 344
          Top = 40
          Width = 41
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Info = itPageNumber
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLLabel3: TRLLabel
          Left = 384
          Top = 40
          Width = 25
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'De '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object RLSystemInfo4: TRLSystemInfo
          Left = 410
          Top = 40
          Width = 41
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Info = itLastPageNumber
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 648
          Top = 40
          Width = 70
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Info = itHour
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 556
          Top = 39
          Width = 88
          Height = 19
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLLabel13: TRLLabel
          Left = 457
          Top = 40
          Width = 100
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = 'Impresso em:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 57
        Width = 718
        Height = 17
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object rlTotal: TRLLabel
          Left = 563
          Top = 1
          Width = 45
          Height = 15
          Align = faRight
          Alignment = taRightJustify
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Total R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlData: TRLLabel
          Left = 1
          Top = 1
          Width = 26
          Height = 14
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rlTanque: TRLLabel
          Left = 124
          Top = 1
          Width = 44
          Height = 14
          Caption = 'Tanque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rlBomba: TRLLabel
          Left = 242
          Top = 1
          Width = 41
          Height = 14
          Caption = 'Bomba'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rlPercentImposto: TRLLabel
          Left = 493
          Top = 1
          Width = 61
          Height = 14
          Caption = '% Imposto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rlTotimposto: TRLLabel
          Left = 608
          Top = 1
          Width = 110
          Height = 15
          Align = faRight
          Alignment = taRightJustify
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Total c/ Imposto R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 99
        Width = 718
        Height = 39
        BandType = btSummary
        BeforePrint = RLBand6BeforePrint
        object rlTotalGeral: TRLLabel
          Left = 528
          Top = 2
          Width = 79
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Total Geral R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlTotalGeralCImposto: TRLLabel
          Left = 608
          Top = 2
          Width = 107
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Tot. G. Imposto R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel4: TRLLabel
          Left = 608
          Top = 20
          Width = 107
          Height = 16
          Alignment = taRightJustify
        end
        object RLLabel5: TRLLabel
          Left = 534
          Top = 20
          Width = 74
          Height = 16
          Alignment = taRightJustify
        end
      end
      object RLSubDetail1: TRLSubDetail
        Left = 0
        Top = 74
        Width = 718
        Height = 25
        DataSource = DsAbastecimentos
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 17
          object RLDBText2: TRLDBText
            Left = 1
            Top = 0
            Width = 65
            Height = 17
            Align = faLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Holder = rlData
            ParentFont = False
            Text = ''
          end
          object RLDBText3: TRLDBText
            Left = 1
            Top = 0
            Width = 117
            Height = 17
            Align = faLeft
            DataField = 'ABAS_DATA_VENDA'
            DataSource = DsAbastecimentos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Holder = rlData
            ParentFont = False
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 124
            Top = 0
            Width = 104
            Height = 17
            Align = faLeft
            DataField = 'TAN_DESCRICAO'
            DataSource = DsAbastecimentos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Holder = rlTanque
            ParentFont = False
            Text = ''
          end
          object RLDBText7: TRLDBText
            Left = 547
            Top = 0
            Width = 171
            Height = 17
            Align = faRight
            Alignment = taRightJustify
            DataField = 'ABAS_TOTAL_COM_IMPOSTO'
            DataSource = DsAbastecimentos
            DisplayMask = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Holder = rlTotimposto
            ParentFont = False
            Text = ''
          end
          object RLDBText8: TRLDBText
            Left = 433
            Top = 0
            Width = 182
            Height = 17
            Align = faRight
            Alignment = taCenter
            DataField = 'ABAS_PERCENTUAL_IMPOSTO'
            DataSource = DsAbastecimentos
            DisplayMask = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Holder = rlPercentImposto
            ParentFont = False
            Text = ''
          end
          object RLDBText9: TRLDBText
            Left = 449
            Top = 0
            Width = 159
            Height = 17
            Align = faRight
            Alignment = taRightJustify
            DataField = 'ABAS_TOTAL_ABASTECIDO'
            DataSource = DsAbastecimentos
            DisplayMask = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Holder = rlTotal
            ParentFont = False
            Text = ''
          end
          object RLDBText10: TRLDBText
            Left = 242
            Top = 0
            Width = 107
            Height = 17
            Align = faLeft
            DataField = 'BOM_DESCRICAO'
            DataSource = DsAbastecimentos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Holder = rlBomba
            ParentFont = False
            Text = ''
          end
        end
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 185
      Width = 718
      Height = 24
      object RLLabel1: TRLLabel
        Left = 3
        Top = 6
        Width = 118
        Height = 11
        Caption = 'Sistema de gest'#227'o DFP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 353
    Height = 201
    Align = alTop
    TabOrder = 1
    ExplicitTop = 1
    ExplicitWidth = 91
    object Label1: TLabel
      Left = 16
      Top = 5
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label2: TLabel
      Left = 89
      Top = 4
      Width = 21
      Height = 13
      Caption = 'At'#233':'
    end
    object MaskEdit1: TMaskEdit
      Left = 16
      Top = 20
      Width = 65
      Height = 21
      EditMask = '!99/99/0000;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnKeyDown = MaskEdit1KeyDown
    end
    object MaskEdit2: TMaskEdit
      Left = 87
      Top = 20
      Width = 66
      Height = 21
      EditMask = '!99/99/0000;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object Button1: TButton
      Left = 14
      Top = 50
      Width = 330
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 2
      OnClick = Button1Click
    end
    object rgAgrupamentos: TRadioGroup
      Left = 159
      Top = 5
      Width = 185
      Height = 39
      Caption = 'Agrupar por'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Data'
        'Tanque'
        'Bomba')
      TabOrder = 3
    end
  end
  object DsAbastecimentos: TDataSource
    DataSet = FDQuery1
    Left = 214
    Top = 84
  end
  object FDQuery1: TFDQuery
    SQL.Strings = (
      
        'select ABA.*, BOM.*, TQ.*, sum(ABA.ABAS_TOTAL_ABASTECIDO) over()' +
        ' TOTALABASTECIDO,'
      
        '       sum(ABA.ABAS_TOTAL_COM_IMPOSTO) over() TOTALABASTECIDOIMP' +
        'OSTO'
      'from ABASTECIMENTOS ABA'
      'join BOMBAS BOM on BOM.BOM_ID = ABA.ABAS_BOM_ID'
      'join TANQUES TQ on TQ.TAN_ID = BOM.BOM_TAN_ID'
      ' ')
    Left = 160
    Top = 80
  end
end
