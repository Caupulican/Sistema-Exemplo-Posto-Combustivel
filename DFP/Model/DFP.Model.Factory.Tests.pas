unit DFP.Model.Factory.Tests;

interface

uses
  DUnitX.TestFramework,
  DFP.Model.Interfaces,
  DFP.Model.Connection.Interfaces,
  DFP.Model.Services.Interfaces,
  DFP.Model.Factory;

type
  [TestFixture]
  TModelFactoryTest = class
  private
    FModelFactory : iModelFactory;
    FServicesFactory : iModelServicesFactory;
    FConnectionFactory : iModelConnectionFactory;
  public
    [Setup]
    procedure Setup;
    [Test]
    procedure CreateFactoryServices;
    [Test]
    procedure CreateFactoryConnection;
  end;

implementation

{ TModelFactoryTest }

procedure TModelFactoryTest.CreateFactoryConnection;
begin
  FConnectionFactory := FModelFactory.ConnectionFactory;
  Assert.IsNotNull(FConnectionFactory,'Factory de Conexões não criada.');
end;

procedure TModelFactoryTest.CreateFactoryServices;
begin
  FServicesFactory := FModelFactory.ServicesFactory;
  Assert.IsNotNull(FServicesFactory,'Factory de Serviços não criada.');
end;

procedure TModelFactoryTest.Setup;
begin
  FModelFactory := TModelFactory.New;
  FServicesFactory := nil;
  FConnectionFactory := nil;
end;

initialization
  TDUnitX.RegisterTestFixture(TModelFactoryTest);

end.
