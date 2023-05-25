program DFPTests;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  DFP.Model.Factory.Tests in 'Model\DFP.Model.Factory.Tests.pas',
  DFP.Model.Factory in 'Model\DFP.Model.Factory.pas',
  DFP.Model.Interfaces in 'Model\DFP.Model.Interfaces.pas',
  DFP.Model.Connection.Interfaces in 'Model\Connection\DFP.Model.Connection.Interfaces.pas',
  DFP.Model.Connection.Factory in 'Model\Connection\DFP.Model.Connection.Factory.pas',
  DFP.Model.Connection.FireDac in 'Model\Connection\DFP.Model.Connection.FireDac.pas',
  DFP.Model.Services.Interfaces in 'Model\Services\DFP.Model.Services.Interfaces.pas',
  DFP.Model.Utils.RTTI in 'Model\Utils\DFP.Model.Utils.RTTI.pas',
  DFP.Model.Services.Bombas in 'Model\Services\DFP.Model.Services.Bombas.pas',
  DFP.Model.Services.Diesel in 'Model\Services\DFP.Model.Services.Diesel.pas',
  DFP.Model.Services.Factory in 'Model\Services\DFP.Model.Services.Factory.pas',
  DFP.Model.Services.Gasolina in 'Model\Services\DFP.Model.Services.Gasolina.pas',
  DFP.Model.Services.Tanques in 'Model\Services\DFP.Model.Services.Tanques.pas',
  DFP.Model.Entities.Factory in 'Model\Entities\DFP.Model.Entities.Factory.pas',
  DFP.Model.Entities in 'Model\Entities\DFP.Model.Entities.pas',
  DFP.Model.Entities.Interfaces in 'Model\Entities\DFP.Model.Entities.Interfaces.pas',
  DFP.Model.Types in 'Model\Types\DFP.Model.Types.pas',
  DFP.Model.DAO.Factory in 'Model\DAO\DFP.Model.DAO.Factory.pas',
  DFP.Model.DAO.Interfaces in 'Model\DAO\DFP.Model.DAO.Interfaces.pas',
  DFP.Model.DAO.SQL in 'Model\DAO\DFP.Model.DAO.SQL.pas',
  DFP.Model.Services.Gasolina.Tests in 'Model\Services\DFP.Model.Services.Gasolina.Tests.pas',
  DFP.Model.Services.Diesel.Tests in 'Model\Services\DFP.Model.Services.Diesel.Tests.pas',
  DFP.Model.Exceptions in 'Model\Exceptions\DFP.Model.Exceptions.pas',
  DFP.Model.Connection.Mock in 'Model\Connection\DFP.Model.Connection.Mock.pas';

{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := True;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end.
