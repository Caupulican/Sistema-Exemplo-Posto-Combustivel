unit DFP.Model.Connection.Factory;

interface

uses
  DFP.model.Connection.Interfaces,
  DFP.model.Connection.FireDac;

type
  TModelConnectionFactory = class(TInterfacedObject,iModelConnectionFactory)
    private
      FConnection : iModelConnection;
    public
    constructor Create;
    destructor Destroy; override;
    class function New : iModelConnectionFactory;
    function Connection : iModelConnection;
  end;

implementation

{ TModelConnectionFactory }

function TModelConnectionFactory.Connection: iModelConnection;
begin
  Result := FConnection;
end;

constructor TModelConnectionFactory.Create;
begin
  FConnection := TModelConnectionFireDac.New;
  FConnection.ReadIni;
end;

destructor TModelConnectionFactory.Destroy;
begin

  inherited;
end;

class function TModelConnectionFactory.New: iModelConnectionFactory;
begin
  Result := Self.Create;
end;

end.
