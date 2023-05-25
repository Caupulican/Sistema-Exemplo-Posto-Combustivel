unit DFP.Model.Entities.Factory;

interface

uses
  DFP.Model.Entities.Interfaces,
  DFp.model.DAO.Interfaces,
  DFP.model.DAO.Factory,
  DFP.Model.Connection.Interfaces;

type
  TModelEntitiesFactory<T : class, constructor> = class(TInterfacedObject, IModelEntityFactory<T>)
  private
    [weak]
    FConnection : iModelConnection;
    FDAO : iModelDAO<T>;
  public
    constructor Create(const AConnection: IModelConnection);
    destructor Destroy; override;
    class function New(const AConnection: IModelConnection): IModelEntityFactory<T>;
     function DAO: iModelDAO<T>;
  end;

implementation

{ TModelEntitiesFactory }

constructor TModelEntitiesFactory<T>.Create(const AConnection: IModelConnection);
begin
  FConnection := aConnection;
  FDAO := TModelDAOFactory<T>.New(FConnection).DAO;
end;

function TModelEntitiesFactory<T>.DAO: iModelDAO<T>;
begin
  Result := FDAO;
end;

destructor TModelEntitiesFactory<T>.Destroy;
begin

  inherited;
end;

class function TModelEntitiesFactory<T>.New(const AConnection: IModelConnection): IModelEntityFactory<T>;
begin
  Result := Self.Create(aConnection);
end;

end.
