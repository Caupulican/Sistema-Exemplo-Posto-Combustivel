unit DFP.Model.Services.Bombas;

interface

uses
  Data.DB,
  DFP.Model.Services.Interfaces,
  DFP.Model.Entities,
  DFP.Model.Entities.Factory,
  DFP.Model.Entities.Interfaces,
  DFP.Model.Types,
  DFP.Model.Connection.Interfaces;

type
  TModelServicesBombas = class(TInterfacedObject, iModelServicesCombustivel<TBombas>)
  private
    [weak]
    FConnection : iModelConnection;
    FDAOBombas: IModelEntityFactory<TBombas>;
  public
    constructor Create(const AConnection: IModelConnection);
    destructor Destroy; override;
    class function New(const AConnection: IModelConnection): iModelServicesCombustivel<TBombas>;
    function Bomba(aNumero: integer): iModelServicesCombustivel<TBombas>;
    function TotalBombas: integer;
    function DataSource(aDataSource: TDataSource): iModelServicesCombustivel<TBombas>;
    function NewObject: TBombas;
    function Current: TBombas;
    function State: TState;
    function Cancel : iModelServicesCombustivel<TBombas>;
    function Edit: iModelServicesCombustivel<TBombas>;
    function Insert: iModelServicesCombustivel<TBombas>;
    function Update: iModelServicesCombustivel<TBombas>;
    function Delete: iModelServicesCombustivel<TBombas>;
    function List: iModelServicesCombustivel<TBombas>;
  end;

implementation

{ TModelServicesBombas }

function TModelServicesBombas.Bomba(aNumero: integer): iModelServicesCombustivel<TBombas>;
begin

end;

function TModelServicesBombas.Cancel: iModelServicesCombustivel<TBombas>;
begin
  Result := Self;
  FDAOBombas.DAO.Cancel;
end;

constructor TModelServicesBombas.Create(const AConnection: IModelConnection);
begin
  FConnection := aConnection;
  FDAOBombas := TModelEntitiesFactory<TBombas>.New(FConnection);
end;

function TModelServicesBombas.Current: TBombas;
begin

end;

function TModelServicesBombas.DataSource(aDataSource: TDataSource): iModelServicesCombustivel<TBombas>;
begin
  Result := Self;
  FDAOBombas.DAO.DataSource(aDataSource);
end;

function TModelServicesBombas.Delete: iModelServicesCombustivel<TBombas>;
begin

end;

destructor TModelServicesBombas.Destroy;
begin

  inherited;
end;

function TModelServicesBombas.Edit: iModelServicesCombustivel<TBombas>;
begin
  Result := Self;
end;

function TModelServicesBombas.Insert: iModelServicesCombustivel<TBombas>;
begin
  Result := Self;

end;

function TModelServicesBombas.State: TState;
begin
  Result := FDAOBombas.DAO.State;
end;

function TModelServicesBombas.List: iModelServicesCombustivel<TBombas>;
begin
  Result := Self;
  FDAOBombas.DAO.Find;
end;

class function TModelServicesBombas.New(const AConnection: IModelConnection): iModelServicesCombustivel<TBombas>;
begin
  Result := Self.Create(aConnection);
end;

function TModelServicesBombas.NewObject: TBombas;
begin

end;

function TModelServicesBombas.TotalBombas: integer;
begin

end;

function TModelServicesBombas.Update: iModelServicesCombustivel<TBombas>;
begin

end;

end.
