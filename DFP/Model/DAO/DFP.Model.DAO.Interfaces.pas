unit DFP.Model.DAO.Interfaces;

interface

uses
  Data.DB,
  DFP.Model.Types;

type
  iModelDAO<T> = interface
    ['{9CB93AD7-227B-484F-8A13-EED97F525B3C}']
    function NewObject: T;
    function Current: T;
    function ReloadObject: iModelDAO<T>;
    function Insert: iModelDAO<T>;
    function Update: iModelDAO<T>;
    function Edit: iModelDAO<T>;
    function Delete: iModelDAO<T>;
    function Find: iModelDAO<T>;
    function DataSet: TDataSet;
    function State: TState;
    function Cancel : iModelDAO<T>;
    function FinById(aId: integer): iModelDAO<T>;
    function FindWhere(aWhere: string): iModelDAO<T>;
    function DataSource(aDatasource: TDataSource): iModelDAO<T>;
  end;

  iModelDAOFactory<T> = interface
    ['{D7B0F2B5-5ABE-444C-ADBF-CD3FB1BB5D4F}']
    function DAO: iModelDAO<T>;
  end;

implementation

end.
