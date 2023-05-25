unit DFP.Model.Services.Gasolina;

interface

uses
  Data.DB,
  DFP.Model.Services.Interfaces,
  DFP.Model.Entities.Interfaces,
  DFP.Model.Entities.Factory,
  DFP.Model.Types,
  DFP.Model.Entities,
  System.SysUtils,
  Vcl.Dialogs,
  DFP.Model.Exceptions,
  DFP.Model.Connection.Interfaces;

type
  TModelServicesGasolina = class(TInterfacedObject, iModelServicesCombustivel<TAbastecimentos>)
  private
    [weak]
    FConnection : iModelConnection;
    FLimiteBomba: integer;
    FBomba: integer;
    FDataSource: TDataSource;
    FDAOAbastecimentos: IModelEntityFactory<TAbastecimentos>;
    FDAOBombas: IModelEntityFactory<TBombas>;
    FDAOTanques: IModelEntityFactory<TTanques>;
    procedure RevisarDados;
  public
    constructor Create(const AConnection: IModelConnection); // mock connection
    destructor Destroy; override;
    class function New(const AConnection: IModelConnection): iModelServicesCombustivel<TAbastecimentos>;
    function Bomba(aNumero: integer): iModelServicesCombustivel<TAbastecimentos>;
    function TotalBombas: integer;
    function DataSource(aDataSource: TDataSource): iModelServicesCombustivel<TAbastecimentos>;
    function NewObject: TAbastecimentos;
    function Current: TAbastecimentos;
    function State: TState;
    function Cancel : iModelServicesCombustivel<TAbastecimentos>;
    function Edit: iModelServicesCombustivel<TAbastecimentos>;
    function Insert: iModelServicesCombustivel<TAbastecimentos>;
    function Update: iModelServicesCombustivel<TAbastecimentos>;
    function Delete: iModelServicesCombustivel<TAbastecimentos>;
    function List: iModelServicesCombustivel<TAbastecimentos>;
  end;

implementation

{ TModelServicesGasolina }

function TModelServicesGasolina.Bomba(aNumero: integer): iModelServicesCombustivel<TAbastecimentos>;
begin
  Result := Self;
  if (aNumero <= 0) or (aNumero > FLimiteBomba) then
    raise Exception.Create('Informe uma número de bomba válido');
  FBomba := aNumero;
  FDAOBombas.DAO.FindWhere('BOM_TAN_ID=' + FDAOTanques.DAO.Current.ID.ToString + ' and BOM_DESCRICAO LIKE ' + QuotedStr('%0' + IntToStr(FBomba))).ReloadObject;
end;

function TModelServicesGasolina.Cancel: iModelServicesCombustivel<TAbastecimentos>;
begin
  Result := Self;
  FDAOAbastecimentos.DAO.Cancel;
end;

constructor TModelServicesGasolina.Create(const AConnection: IModelConnection);
begin
  FConnection := aConnection;
  FDAOAbastecimentos := TModelEntitiesFactory<TAbastecimentos>.New(FConnection);
  FDAOBombas := TModelEntitiesFactory<TBombas>.New(FConnection);
  FDAOTanques := TModelEntitiesFactory<TTanques>.New(FConnection);
  FLimiteBomba := TTipoServicoCombustivel.tcGasolina.TotalBombas;
  FDAOTanques.DAO.FindWhere('TAN_TIPO=' + QuotedStr(TTipoServicoCombustivel.tcGasolina.Tipo)).ReloadObject;
end;

function TModelServicesGasolina.Current: TAbastecimentos;
begin
  Result := FDAOAbastecimentos.DAO.Current;
end;

function TModelServicesGasolina.DataSource(aDataSource: TDataSource): iModelServicesCombustivel<TAbastecimentos>;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAOAbastecimentos.DAO.DataSource(FDataSource);
end;

function TModelServicesGasolina.Delete: iModelServicesCombustivel<TAbastecimentos>;
begin
  FDAOAbastecimentos.DAO.Delete;
end;

destructor TModelServicesGasolina.Destroy;
begin

  inherited;
end;

function TModelServicesGasolina.Edit: iModelServicesCombustivel<TAbastecimentos>;
begin
  Result := Self;
  FDAOAbastecimentos.DAO.ReloadObject;
end;

function TModelServicesGasolina.Insert: iModelServicesCombustivel<TAbastecimentos>;
begin
  Result := Self;
  RevisarDados;
  FDAOAbastecimentos.DAO.Insert;
end;

function TModelServicesGasolina.State: TState;
begin
  Result := FDAOAbastecimentos.DAO.State;
end;

function TModelServicesGasolina.List: iModelServicesCombustivel<TAbastecimentos>;
begin
  Result := Self;
  FDAOAbastecimentos.DAO.Find;
  FDAOBombas.DAO.FindWhere('BOM_TAN_ID=' + FDAOTanques.DAO.Current.ID.ToString + ' and BOM_DESCRICAO LIKE ' + QuotedStr('%0' + IntToStr(FBomba))).ReloadObject;
end;

class function TModelServicesGasolina.New(const AConnection: IModelConnection): iModelServicesCombustivel<TAbastecimentos>;
begin
  Result := Self.Create(aConnection);
end;

function TModelServicesGasolina.NewObject: TAbastecimentos;
begin
  Result := FDAOAbastecimentos.DAO.NewObject;
end;

procedure TModelServicesGasolina.RevisarDados;
begin
  FDAOBombas.DAO.ReloadObject;
  with FDAOAbastecimentos.DAO.Current do
  begin
    if ID = 0 then
      ID := -1;
    Tipo := 'G';
    PercentualImposto := 15;
    if FDAOBombas.DAO.Current.ID=0 then
      raise EObjetoNulo.Create(TBombas.ClassName);

    BombaID := FDAOBombas.DAO.Current.ID;
    if QtdLitros <= 0 then
      raise ETotalLitros.Create;
    if TotalAbastecido < 0 then
      raise ETotalAbastecido.Create;

    if TotalAbastecido > 0 then
      TotalComImposto := TotalAbastecido + (TotalAbastecido * (PercentualImposto / 100));
  end;
end;

function TModelServicesGasolina.TotalBombas: integer;
begin
  Result := 2;
end;

function TModelServicesGasolina.Update: iModelServicesCombustivel<TAbastecimentos>;
begin
  Result := Self;
  RevisarDados;
  FDAOAbastecimentos.DAO.Update;
end;

end.
