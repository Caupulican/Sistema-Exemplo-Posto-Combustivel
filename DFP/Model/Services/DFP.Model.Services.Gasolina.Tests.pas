unit DFP.Model.Services.Gasolina.Tests;

interface

uses
  DUnitX.TestFramework,
  DFP.Model.Services.Gasolina,
  DFP.Model.Services.Interfaces,
  DFP.Model.Entities,
  Data.DB,
  DFP.Model.Types,
  DFP.Model.Exceptions,
  DFP.Model.Connection.Mock,
  DFP.Model.Connection.Interfaces;

type
  [TestFixture]
  TModelServicesGasolinaTests = class
  private
    FDBConncetionMock : iModelConnection;
    FDataSource: TDataSource;
    FServices: iModelServicesCombustivel<TAbastecimentos>;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestBomba;
    [Test]
    procedure TestTotalBombas;
    [Test]
    procedure TestDataSource;
    [Test]
    procedure TestNewObject;
    [Test]
    procedure TestCurrent;
    [Test]
    procedure TestIsInserting;
    [Test]
    procedure TestEdit;
    [Test]
    procedure TestInsert;
    [Test]
    procedure TestUpdate;
    [Test]
    procedure TestDelete;
    [Test]
    procedure TestList;
  end;

implementation

uses
  System.SysUtils,
  Vcl.Dialogs;

procedure TModelServicesGasolinaTests.Setup;
begin
   FDBConncetionMock := nil; //Padrão para teste com o banco de dados
//  FDBConncetionMock := TModelConnectionMock.New;   // Ao usar o mock os métodos de Insert, Update e Edit vão falhar pois dependem do objeto Bombas instanciado
  FDataSource := TDataSource.Create(nil);
  FServices := TModelServicesGasolina.New(FDBConncetionMock);
end;

procedure TModelServicesGasolinaTests.TearDown;
begin
  FServices := nil;
  FDataSource.Free;
end;

procedure TModelServicesGasolinaTests.TestBomba;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FServices.Bomba(1);
    end, Exception, 'Exception no método Bomba.');
end;

procedure TModelServicesGasolinaTests.TestTotalBombas;
var
  TotalBombas: Integer;
begin
  TotalBombas := FServices.TotalBombas;
  Assert.AreEqual(2, TotalBombas);
end;

procedure TModelServicesGasolinaTests.TestDataSource;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FServices.DataSource(FDataSource);
    end, Exception, 'Exception no método DataSource.');
end;

procedure TModelServicesGasolinaTests.TestNewObject;
var
  Abastecimentos: TAbastecimentos;
begin
  Abastecimentos := FServices.NewObject;
  Assert.IsNotNull(Abastecimentos, 'Falha na criação do objeto TAbastecimentos');
  Abastecimentos := nil;
end;

procedure TModelServicesGasolinaTests.TestCurrent;
var
  CurrentAbastecimentos: TAbastecimentos;
begin
  CurrentAbastecimentos := FServices.Current;
  Assert.IsNotNull(CurrentAbastecimentos, 'Objeto TAbastecimentos interno está nulo!');
  CurrentAbastecimentos := nil;
end;

procedure TModelServicesGasolinaTests.TestIsInserting;
var
  LState: TState;
begin
  FServices.Cancel;
  LState := FServices.State;
  Assert.IsFalse(LState = sInserting);
  FServices.NewObject;
  LState := FServices.State;
  Assert.IsTrue(LState = sInserting);
end;

procedure TModelServicesGasolinaTests.TestEdit;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FServices.Edit;
    end,
    Exception,
    'Exception no método Edit.');
end;

procedure TModelServicesGasolinaTests.TestInsert;
begin
  Assert.WillRaise(
    procedure
    begin
      FServices.NewObject;
      FServices.Insert;
    end,
    EObjetoNulo);

  Assert.WillRaise(
    procedure
    begin
      FServices.Bomba(1).NewObject;
      FServices.Insert;
    end,
    ETotalLitros);

  Assert.WillRaise(
    procedure
    begin
      with FServices.NewObject do
      begin
        QtdLitros := 1;
        TotalAbastecido := -10;
      end;
      FServices.Insert;
    end,
    ETotalAbastecido);
end;

procedure TModelServicesGasolinaTests.TestUpdate;
begin
  Assert.WillRaise(
    procedure
    begin
      FServices.Update;
    end, EObjetoNulo);

  Assert.WillRaise(
    procedure
    begin
      FServices.Bomba(1);
      FServices.Current.QtdLitros := 0;
      FServices.Update;
    end,
    ETotalLitros);

  Assert.WillRaise(
    procedure
    begin
      FServices.Bomba(1);
      with FServices.Current do
      begin
        QtdLitros := 1;
        TotalAbastecido := -10;
      end;
      FServices.Update;
    end,
    ETotalAbastecido);
end;

procedure TModelServicesGasolinaTests.TestDelete;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FServices.Delete;
    end, Exception, 'Exception no método Delete.');
end;

procedure TModelServicesGasolinaTests.TestList;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FServices.List;
    end, Exception, 'Exception no método List.');
end;

end.
