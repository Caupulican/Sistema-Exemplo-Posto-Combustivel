unit DFP.Model.Services.Factory;

interface

uses
  DFP.Model.Services.Interfaces,
  DFP.Model.Services.Diesel,
  DFP.Model.Services.Gasolina,
  DFP.Model.Services.Tanques,
  DFP.Model.Services.Bombas,
  DFP.Model.DAO.Interfaces,
  DFP.Model.Entities,
  DFP.Model.DAO.Factory,
  DFP.Model.Connection.Interfaces;

type
  TModelServicesFactory = class(TInterfacedObject, iModelServicesFactory)
  private
    [weak]
    FConnection : iModelConnection;
    FGasolina: iModelServicesCombustivel<TAbastecimentos>;
    FDiesel: iModelServicesCombustivel<TAbastecimentos>;
    FTanques: iModelServicesCombustivel<TTanques>;
    FBombas: iModelServicesCombustivel<TBombas>;
    FAbastecimentos: iModelDAO<TAbastecimentos>;
  public
    constructor Create(const AConnection: IModelConnection);
    destructor Destroy; override;
    class function New(const AConnection: IModelConnection): iModelServicesFactory;
    function Gasolina: iModelServicesCombustivel<TAbastecimentos>;
    function Diesel: iModelServicesCombustivel<TAbastecimentos>;
    function Tanques: iModelServicesCombustivel<TTanques>;
    function Bombas: iModelServicesCombustivel<TBombas>;
    function Abastecimentos: iModelDAO<TAbastecimentos>;
  end;

implementation

{ TModelServicesFactory }

function TModelServicesFactory.Abastecimentos: iModelDAO<TAbastecimentos>;
begin
  if not Assigned(FAbastecimentos) then
    FAbastecimentos := TModelDAOFactory<TAbastecimentos>.New(FConnection).DAO;
  Result := FAbastecimentos;
end;

function TModelServicesFactory.Bombas: iModelServicesCombustivel<TBombas>;
begin
  if not Assigned(FBombas) then
    FBombas := TModelServicesBombas.New(FConnection);
  Result := FBombas;
end;

constructor TModelServicesFactory.Create(const AConnection: IModelConnection);
begin
  FConnection := aConnection;
end;

destructor TModelServicesFactory.Destroy;
begin

  inherited;
end;

function TModelServicesFactory.Diesel: iModelServicesCombustivel<TAbastecimentos>;
begin
  if not Assigned(FDiesel) then
    FDiesel := TModelServicesDiesel.New(FConnection);
  Result := FDiesel;
end;

function TModelServicesFactory.Gasolina: iModelServicesCombustivel<TAbastecimentos>;
begin
  if not Assigned(FGasolina) then
    FGasolina := TModelServicesGasolina.New(FConnection);
  Result := FGasolina;
end;

class function TModelServicesFactory.New(const AConnection: IModelConnection): iModelServicesFactory;
begin
  Result := Self.Create(aConnection);
end;

function TModelServicesFactory.Tanques: iModelServicesCombustivel<TTanques>;
begin
  if not Assigned(FTanques) then
    FTanques := TModelServicesTanques.New(FConnection);
  Result := FTanques;
end;

end.
