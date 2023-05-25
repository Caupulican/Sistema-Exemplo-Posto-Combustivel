unit DFP.Model.Entities;

interface

uses
  System.RTTI,
  DFP.Model.Utils.RTTI, System.SysUtils;

type
  [TableMap('ABASTECIMENTOS')]
  TAbastecimentos = class
  private
    [PrimaryKey('ABAS_ID')]
    FID: Integer;
    [ColumnMap('ABAS_BOM_ID')]
    FBombaID: Integer;
    [ColumnMap('ABAS_QTD_LITROS')]
    FQtdLitros: Currency;
    [ColumnMap('ABAS_DATA_VENDA')]
    FDataVenda: TDate;
    [ColumnMap('ABAS_PERCENTUAL_IMPOSTO')]
    FPercentualImposto: Currency;
    [ColumnMap('ABAS_TOTAL_ABASTECIDO')]
    FTotalAbastecido : Currency;
    [ColumnMap('ABAS_TOTAL_COM_IMPOSTO')]
    FTotalComImposto : Currency;
    [ColumnMap('ABAS_TIPO')]
    FTipo : string;
  public
    property ID: Integer read FID write FID;
    property BombaID: Integer read FBombaID write FBombaID;
    property QtdLitros: Currency read FQtdLitros write FQtdLitros;
    property DataVenda: TDate read FDataVenda write FDataVenda;
    property PercentualImposto: Currency read FPercentualImposto write FPercentualImposto;
    property TotalAbastecido : Currency read FTotalAbastecido write FTotalAbastecido;
    property TotalComImposto : Currency read FTotalComImposto write FTotalComImposto;
    property Tipo : String read FTipo write FTipo;
  end;

  [TableMap('BOMBAS')]
  TBombas = class
  private
    [ColumnMap('BOM_ID')]
    [PrimaryKey('BOM_ID')]
    FID: Integer;
    [ColumnMap('BOM_DESCRICAO')]
    FDescricao: string;
    [ColumnMap('BOM_TAN_ID')]
    FTanID: Integer;
  public
    property ID: Integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property TanID: Integer read FTanID write FTanID;
  end;

  [TableMap('TANQUES')]
  TTanques = class
  private
    [ColumnMap('TAN_ID')]
    [PrimaryKey('TAN_ID')]
    FID: Integer;
    [ColumnMap('TAN_DESCRICAO')]
    FDescricao: string;
    [ColumnMap('TAN_TIPO')]
    FTipo: Char;
  public
    property ID: Integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property Tipo: Char read FTipo write FTipo;
  end;

implementation

end.
