unit DFP.Model.Services.Tanques;

interface

uses
  Data.DB,
  DFP.Model.Services.Interfaces,
  DFP.Model.Entities,
  DFP.Model.Entities.Interfaces,
  DFP.Model.Entities.Factory,
  DFP.Model.Types, DFP.Model.Connection.Interfaces;

type
  TModelServicesTanques = class(TInterfacedObject, iModelServicesCombustivel<TTanques>)
  private
    [weak]
    FConnection : iModelConnection;
    FDAOTanques: IModelEntityFactory<TTanques>;
  public
    constructor Create(const AConnection: IModelConnection);
    destructor Destroy; override;
    class function New(const AConnection: IModelConnection): iModelServicesCombustivel<TTanques>;
    function Bomba(aNumero: integer): iModelServicesCombustivel<TTanques>;
    function TotalBombas: integer;
    function DataSource(aDataSource: TDataSource): iModelServicesCombustivel<TTanques>;
    function NewObject: TTanques;
    function Current: TTanques;
    function State: TState;
    function Cancel : iModelServicesCombustivel<TTanques>;
    function Edit: iModelServicesCombustivel<TTanques>;
    function Insert: iModelServicesCombustivel<TTanques>;
    function Update: iModelServicesCombustivel<TTanques>;
    function Delete: iModelServicesCombustivel<TTanques>;
    function List: iModelServicesCombustivel<TTanques>;
  end;

implementation

{ TModelServicesTanques }

function TModelServicesTanques.Bomba(aNumero: integer): iModelServicesCombustivel<TTanques>;
begin

end;

function TModelServicesTanques.Cancel: iModelServicesCombustivel<TTanques>;
begin
  Result := Self;
end;

constructor TModelServicesTanques.Create(const AConnection: IModelConnection);
begin
  FConnection := aConnection;
  FDAOTanques := TModelEntitiesFactory<TTanques>.New(FConnection);
end;

function TModelServicesTanques.Current: TTanques;
begin
  Result := FDAOTanques.DAO.Current;
end;

function TModelServicesTanques.DataSource(aDataSource: TDataSource): iModelServicesCombustivel<TTanques>;
begin
  Result := Self;
  FDAOTanques.DAO.DataSource(aDataSource);
end;

function TModelServicesTanques.Delete: iModelServicesCombustivel<TTanques>;
begin
  Result := Self;
end;

destructor TModelServicesTanques.Destroy;
begin

  inherited;
end;

function TModelServicesTanques.Edit: iModelServicesCombustivel<TTanques>;
begin
  Result := Self;
end;

function TModelServicesTanques.Insert: iModelServicesCombustivel<TTanques>;
begin
  Result := Self;
end;

function TModelServicesTanques.State: TState;
begin
  Result := FDAOTanques.DAO.State;
end;

function TModelServicesTanques.List: iModelServicesCombustivel<TTanques>;
begin
  Result := Self;
  FDAOTanques.DAO.Find;
end;

class function TModelServicesTanques.New(const AConnection: IModelConnection): iModelServicesCombustivel<TTanques>;
begin
  Result := Self.Create(aConnection);
end;

function TModelServicesTanques.NewObject: TTanques;
begin
  Result := FDAOTanques.DAO.NewObject;
end;

function TModelServicesTanques.TotalBombas: integer;
begin
  Result := 0;
end;

function TModelServicesTanques.Update: iModelServicesCombustivel<TTanques>;
begin
  Result := Self;
end;

end.
