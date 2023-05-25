unit DFP.Model.Services.Interfaces;

interface

uses
  Data.Db,
  DFP.Model.DAO.Interfaces,
  DFP.Model.Entities,
  DFP.Model.Types;

type
  iModelServicesCombustivel<T: class, constructor> = interface
    ['{826C4D89-F4A1-4B1A-B836-794EC67F26B5}']
    function Bomba(aNumero: integer): iModelServicesCombustivel<T>;
    function TotalBombas: integer;
    function DataSource(aDataSource: TDataSource): iModelServicesCombustivel<T>;
    function NewObject: T;
    function Current: T;
    function State: TState;
    function Cancel : iModelServicesCombustivel<T>;
    function Insert: iModelServicesCombustivel<T>;
    function Update: iModelServicesCombustivel<T>;
    function Edit: iModelServicesCombustivel<T>;
    function Delete: iModelServicesCombustivel<T>;
    function List: iModelServicesCombustivel<T>;
  end;

  iModelServicesCombustivelFactory = interface
    ['{C1BD3A94-3AA4-4FDA-A1A5-31C575C781C1}']
    function This: iModelServicesCombustivel<TAbastecimentos>;
  end;

  iModelServicesFactory = interface
    ['{6DE7E25F-CF16-4A33-A5C6-8DA2CBDE1D66}']
    function Gasolina: iModelServicesCombustivel<TAbastecimentos>;
    function Diesel: iModelServicesCombustivel<TAbastecimentos>;
    function Tanques: iModelServicesCombustivel<TTanques>;
    function Bombas: iModelServicesCombustivel<TBombas>;
    function Abastecimentos: iModelDAO<TAbastecimentos>;
  end;

implementation

end.
