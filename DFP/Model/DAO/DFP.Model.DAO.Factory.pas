unit DFP.Model.DAO.Factory;

interface

uses
  DFP.Model.DAO.Interfaces,
  DFP.Model.DAO.SQL,
  DFP.Model.Connection.Interfaces;

type
  TModelDAOFactory<T: class, constructor> = class(TInterfacedObject, iModelDAOFactory<T>)
  private
    [weak]
    FConnection : iModelConnection;
    FDAO: iModelDAO<T>;
  public
    constructor Create(const AConnection: IModelConnection);
    destructor Destroy; override;
    class function New(const AConnection: IModelConnection): iModelDAOFactory<T>;
    function DAO: iModelDAO<T>;
  end;

implementation

{ TModelDAOFactory<T> }

constructor TModelDAOFactory<T>.Create(const AConnection: IModelConnection);
begin
  FConnection := aConnection;
  FDAO := TModelDAOSQL<T>.New(FConnection);
end;

function TModelDAOFactory<T>.DAO: iModelDAO<T>;
begin
  Result := FDAO;
end;

destructor TModelDAOFactory<T>.Destroy;
begin

  inherited;
end;

class function TModelDAOFactory<T>.New(const AConnection: IModelConnection): iModelDAOFactory<T>;
begin
  Result := Self.Create(aConnection);
end;

end.
