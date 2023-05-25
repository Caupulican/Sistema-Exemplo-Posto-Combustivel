unit DFP.Model.DAO.SQL;

interface

uses
  Data.DB,
  System.Generics.Collections,
  DFP.Model.DAO.Interfaces,
  DFP.Model.Connection.Interfaces,
  DFP.Model.Connection.Factory,
  DFP.Model.Utils.RTTI,
  DFP.Model.Types,
  System.SysUtils;

type
  TModelDAOSQL<T: class, constructor> = class(TInterfacedObject, iModelDAO<T>)
  private
    FObject: T;
    FConnDB: iModelConnection;
    FDataSource: TDataSource;
    FInserting: Boolean;
    FState: TState;
  public
    constructor Create(const AConnection: IModelConnection);
    destructor Destroy; override;
    class function New(const AConnection: IModelConnection): iModelDAO<T>;
    function NewObject: T;
    function Current: T;
    function ReloadObject: iModelDAO<T>;
    function Insert: iModelDAO<T>;
    function Update: iModelDAO<T>;
    function Edit : iModelDAO<T>;
    function Delete: iModelDAO<T>;
    function Find: iModelDAO<T>;
    function DataSet: TDataSet;
    function State: TState;
    function Cancel : iModelDAO<T>;
    function FinById(aId: integer): iModelDAO<T>;
    function FindWhere(aWhere: string): iModelDAO<T>;
    function DataSource(aDatasource: TDataSource): iModelDAO<T>;
  end;

implementation

{ TModelDAOSQL<T> }

function TModelDAOSQL<T>.Cancel: iModelDAO<T>;
begin
  FState := sNone;
  if Assigned(FObject) then
    FObject.free;
  FObject := T.Create;
end;

constructor TModelDAOSQL<T>.Create(const AConnection: IModelConnection);
begin
  FObject := T.Create;
  if AConnection=nil then
    FConnDB := TModelConnectionFactory.New.Connection
  else
    FConnDB := AConnection;
  FState := sNone;
end;

function TModelDAOSQL<T>.Current: T;
begin
  Result := FObject;
end;

function TModelDAOSQL<T>.DataSet: TDataSet;
begin
  Result := FConnDB.DataSet;
end;

function TModelDAOSQL<T>.DataSource(aDatasource: TDataSource): iModelDAO<T>;
begin
  Result := Self;
  FDataSource := aDatasource;
  FDataSource.DataSet := FConnDB.DataSet;
end;

function TModelDAOSQL<T>.Delete: iModelDAO<T>;
begin
  Result := Self;
  FConnDB.ExecSQL(TSQLGenerator.GenerateDeleteSQL(FObject));
end;

destructor TModelDAOSQL<T>.Destroy;
begin
  if Assigned(FObject) then
    FObject.Free;
  inherited;
end;

function TModelDAOSQL<T>.Edit: iModelDAO<T>;
begin
  Result := Self;
  FState := sEditing;
  ReloadObject;
end;

function TModelDAOSQL<T>.FinById(aId: integer): iModelDAO<T>;
begin
  Result := Self;
  FConnDB.SQL(TSQLGenerator.GenerateSelectSQL(FObject) + ' where ' + TSQLGenerator.RetrievePrimaryKeyField(FObject) + IntToStr(aId));
  FConnDB.OpenDataSet;
  ReloadObject;
end;

function TModelDAOSQL<T>.Find: iModelDAO<T>;
begin
  Result := Self;
  FConnDB.SQL(FConnDB.SQL(TSQLGenerator.GenerateSelectSQL(FObject)).SQL +' order by 1');
  FConnDB.OpenDataSet;
  ReloadObject;
end;

function TModelDAOSQL<T>.FindWhere(aWhere: string): iModelDAO<T>;
begin
  Result := Self;
  FConnDB.SQL(TSQLGenerator.GenerateSelectSQL(FObject) + ' where ' + aWhere);
  FConnDB.OpenDataSet;
  ReloadObject;
end;

function TModelDAOSQL<T>.Insert: iModelDAO<T>;
begin
  Result := Self;
  FInserting := False;
  FConnDB.ExecSQL(TSQLGenerator.GenerateInsertSQL(FObject));
  FState := sNone;
end;

function TModelDAOSQL<T>.State: TState;
begin
  Result := FState;
end;

class function TModelDAOSQL<T>.New(const AConnection: IModelConnection): iModelDAO<T>;
begin
  Result := Self.Create(aConnection);
end;

function TModelDAOSQL<T>.NewObject: T;
begin
  FState := sInserting;
  if Assigned(FObject) then
    FObject.Free;
  FObject := T.Create;
  Result := FObject;
end;

function TModelDAOSQL<T>.ReloadObject: iModelDAO<T>;
begin
  Result := Self;
  if not (FState = sInserting) then
  begin
    if Assigned(FObject) and (FConnDB.DataSet.Active) then
      TSQLGenerator.MapObjectFromQuery<T>(FConnDB.DataSet, FObject);
  end;
end;

function TModelDAOSQL<T>.Update: iModelDAO<T>;
begin
  Result := Self;
  FState := sNone;
  FConnDB.ExecSQL(TSQLGenerator.GenerateUpdateSQL(FObject));
end;

end.
