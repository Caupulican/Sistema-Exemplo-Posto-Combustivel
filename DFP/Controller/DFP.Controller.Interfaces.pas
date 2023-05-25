unit DFP.Controller.Interfaces;

interface

uses
  DFP.Model.Services.Interfaces;

type
  iController = interface
    ['{B4244D7A-2F4B-42E9-9A46-B83BC81BA40E}']
    function Services : iModelServicesFactory;
  end;

implementation

end.
