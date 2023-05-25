unit DFP.Model.Interfaces;

interface

uses
  DFP.Model.Services.Interfaces,
  DFP.model.Connection.Interfaces;

type
  iModelFactory = interface
    ['{18FF5CBC-CFEC-4BB1-8A6C-52CA61F90619}']
    function ServicesFactory : iModelServicesFactory;
    function ConnectionFactory : iModelConnectionFactory;
  end;


implementation

end.
