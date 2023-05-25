unit DFP.Model.Connection.Mock;

interface

uses
  Data.DB,
  FireDAC.Comp.Client,
  DFP.Model.Connection.Interfaces;

type
  TModelConnectionMock = class(TInterfacedObject, iModelConnection)
  private
    FMockCustomConncetion: TCustomConnection;
    FMockDataSet: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConnection;
    function This: TCustomConnection;
    function ReadIni: iModelConnection;
    function SQL(aSql: string): iModelConnection; overload;
    function SQL: string; overload;
    function OpenDataSet: iModelConnection;
    function DataSet: TDataSet;
    function CloseDS: iModelConnection;
    function ExecSQL(aSql: string): iModelConnection;
  end;

implementation

{ TModelConnectionMock }

function TModelConnectionMock.CloseDS: iModelConnection;
begin
  Result := Self;
end;

constructor TModelConnectionMock.Create;
begin
  FMockCustomConncetion := TCustomConnection.Create(nil);
  FMockDataSet := TFDQuery.Create(nil);
end;

function TModelConnectionMock.DataSet: TDataSet;
begin
  Result := FMockDataSet;
end;

destructor TModelConnectionMock.Destroy;
begin
  FMockCustomConncetion.Free;
  FMockDataSet.Free;
  inherited;
end;

function TModelConnectionMock.ExecSQL(aSql: string): iModelConnection;
begin
  Result := Self;
end;

class function TModelConnectionMock.New: iModelConnection;
begin
  Result := Self.Create;
end;

function TModelConnectionMock.OpenDataSet: iModelConnection;
begin
  Result := Self;
end;

function TModelConnectionMock.ReadIni: iModelConnection;
begin
  Result := Self;
end;

function TModelConnectionMock.SQL(aSql: string): iModelConnection;
begin
  Result := Self;
end;

function TModelConnectionMock.SQL: string;
begin
  Result := '';
end;

function TModelConnectionMock.This: TCustomConnection;
begin
  Result := FMockCustomConncetion;
end;

end.
