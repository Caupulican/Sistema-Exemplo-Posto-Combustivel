unit DFP.Model.Factory;

interface

uses
  DFP.Model.Interfaces,
  DFP.Model.Connection.Interfaces,
  DfP.Model.Connection.Factory,
  DFP.Model.Services.Interfaces,
  DFP.Model.Services.Factory;

type
  TModelFactory = class(TInterfacedObject,iModelFactory)
    private
      FConnection : iModelConnection;
      FServicesFactory : iModelServicesFactory;
      FConnectionFactory : iModelConnectionFactory;
    public
    constructor Create(AConnection: IModelConnection = nil);
    destructor Destroy; override;
    class function New(AConnection: IModelConnection = nil): iModelFactory;
    function ServicesFactory : iModelServicesFactory;
    function ConnectionFactory : iModelConnectionFactory;
  end;

implementation

{ TModelFactory }

function TModelFactory.ConnectionFactory: iModelConnectionFactory;
begin
  if not Assigned(FConnectionFactory) then
    FConnectionFactory := TModelConnectionFactory.New;
  Result := FConnectionFactory;
end;

constructor TModelFactory.Create(AConnection: IModelConnection = nil);
begin
  FConnection := AConnection;
  if not Assigned(FConnection) then
    FConnection := ConnectionFactory.Connection;
end;

destructor TModelFactory.Destroy;
begin

  inherited;
end;

class function TModelFactory.New(AConnection: IModelConnection = nil): iModelFactory;
begin
  Result := Self.Create(aConnection);
end;

function TModelFactory.ServicesFactory: iModelServicesFactory;
begin
  if not Assigned(FServicesFactory) then
    FServicesFactory := TModelServicesFactory.New(FConnection);
  Result := FServicesFactory;
end;

end.
