unit DFP.Model.Entities.Interfaces;

interface

uses
  DFP.Model.DAO.Interfaces;

type
  IModelEntityFactory<T> = interface
    ['{24893E30-2198-4143-8F86-6BEF60719039}']
    function DAO: iModelDAO<T>;
  end;

implementation

end.
