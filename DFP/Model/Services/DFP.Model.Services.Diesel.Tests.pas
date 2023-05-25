unit DFP.Model.Services.Diesel.Tests;

interface

uses
  DUnitX.TestFramework,
  DFP.Model.Services.Diesel,
  DFP.Model.Services.Interfaces,
  DFP.Model.Entities,
  Data.DB,
  DFP.Model.Types,
  DFP.Model.Exceptions,
  DFP.Model.Connection.Interfaces,
  FireDAC.Comp.Client,
  DFP.Model.Connection.Mock;

type

  [TestFixture]
  TModelServicesDieselTests = class
  private
    FDBConncetionMock: iModelConnection;
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

procedure TModelServicesDieselTests.Setup;
begin
  FDBConncetionMock := nil; //Padrão para teste com o banco de dados
//  FDBConncetionMock := TModelConnectionMock.New;   // Ao usar o mock os métodos de Insert, Update e Edit vão falhar pois dependem do objeto Bombas instanciado
  FDataSource := TDataSource.Create(nil);
  FServices := TModelServicesDiesel.New(FDBConncetionMock);
end;

procedure TModelServicesDieselTests.TearDown;
begin
  FServices := nil;
  FDataSource.Free;
end;

procedure TModelServicesDieselTests.TestBomba;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FServices.Bomba(1);
    end, Exception, 'Exception no método Bomba.');
end;

procedure TModelServicesDieselTests.TestTotalBombas;
var
  TotalBombas: Integer;
begin
  TotalBombas := FServices.TotalBombas;
  Assert.AreEqual(2, TotalBombas);
end;

procedure TModelServicesDieselTests.TestDataSource;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FServices.DataSource(FDataSource);
    end, Exception, 'Exception no método DataSource.');
end;

procedure TModelServicesDieselTests.TestNewObject;
begin
  Assert.IsNotNull(FServices.NewObject, 'Falha na criação do objeto TAbastecimentos');
end;

procedure TModelServicesDieselTests.TestCurrent;
begin
  Assert.IsNotNull(FServices.Current, 'Objeto TAbastecimentos interno está nulo!');
end;

procedure TModelServicesDieselTests.TestIsInserting;
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

procedure TModelServicesDieselTests.TestEdit;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FServices.Edit;
    end, Exception, 'Exception no método Edit.');
end;

procedure TModelServicesDieselTests.TestInsert;
begin
  Assert.WillRaise(
    procedure
    begin
      FServices.NewObject;
      FServices.Insert;
    end, EObjetoNulo);

  Assert.WillRaise(
    procedure
    begin
      FServices.Bomba(1).NewObject;
      FServices.Insert;
    end, ETotalLitros);

  Assert.WillRaise(
    procedure
    begin
      FServices.Bomba(1).NewObject;
      FServices.Current.QtdLitros := 1;
      FServices.Current.TotalAbastecido := -10;
      FServices.Insert;
    end, ETotalAbastecido);
end;

procedure TModelServicesDieselTests.TestUpdate;
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
    end, ETotalLitros);

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
    end, ETotalAbastecido);
end;

procedure TModelServicesDieselTests.TestDelete;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FServices.Delete;
    end, Exception, 'Exception no método Delete.');
end;

procedure TModelServicesDieselTests.TestList;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FServices.List;
    end, Exception, 'Exception no método List.');
end;

end.
