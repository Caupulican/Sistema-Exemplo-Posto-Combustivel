unit DFP.Controller;

interface

uses
  DFP.Controller.Interfaces,
  DFP.Model.Services.Interfaces,
  DFP.Model.Factory;

type
  TController = class(TInterfacedObject,iController)
    private
      FServices : iModelServicesFactory;
    public
    constructor Create;
    destructor Destroy; override;
    class function New : iController;
    function Services : iModelServicesFactory;
  end;

implementation

{ TController }

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.Services: iModelServicesFactory;
begin
  if not Assigned(FServices) then
    FServices := TModelFactory.New.ServicesFactory;
  Result := FServices;
end;

end.
