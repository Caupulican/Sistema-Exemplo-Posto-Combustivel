program DFP;

uses
  Vcl.Forms,
  DFP.View.Principal in 'View\DFP.View.Principal.pas' {ViewPrincipal},
  DFP.Model.Services.Interfaces in 'Model\Services\DFP.Model.Services.Interfaces.pas',
  DFP.Model.Services.Gasolina in 'Model\Services\DFP.Model.Services.Gasolina.pas',
  DFP.Model.Entities in 'Model\Entities\DFP.Model.Entities.pas',
  DFP.Model.Entities.Factory in 'Model\Entities\DFP.Model.Entities.Factory.pas',
  DFP.Model.Entities.Interfaces in 'Model\Entities\DFP.Model.Entities.Interfaces.pas',
  DFP.Model.Interfaces in 'Model\DFP.Model.Interfaces.pas',
  DFP.Model.Factory in 'Model\DFP.Model.Factory.pas',
  DFP.Controller.Interfaces in 'Controller\DFP.Controller.Interfaces.pas',
  DFP.Controller in 'Controller\DFP.Controller.pas',
  DFP.Model.DAO.Interfaces in 'Model\DAO\DFP.Model.DAO.Interfaces.pas',
  DFP.Model.DAO.SQL in 'Model\DAO\DFP.Model.DAO.SQL.pas',
  DFP.Model.DAO.Factory in 'Model\DAO\DFP.Model.DAO.Factory.pas',
  DFP.Model.Connection.Interfaces in 'Model\Connection\DFP.Model.Connection.Interfaces.pas',
  DFP.Model.Services.Factory in 'Model\Services\DFP.Model.Services.Factory.pas',
  DFP.Model.Connection.FireDac in 'Model\Connection\DFP.Model.Connection.FireDac.pas',
  DFP.Model.Connection.Factory in 'Model\Connection\DFP.Model.Connection.Factory.pas',
  DFP.Model.Utils.RTTI in 'Model\Utils\DFP.Model.Utils.RTTI.pas',
  DFP.View.Cadastros.Tanques in 'View\DFP.View.Cadastros.Tanques.pas' {ViewCadastrosTanques},
  DFP.View.Cadastros.Bombas in 'View\DFP.View.Cadastros.Bombas.pas' {ViewCadastrosBombas},
  DFP.View.Lancamentos.Abastecimentos in 'View\DFP.View.Lancamentos.Abastecimentos.pas' {ViewLancamentosAbastecimentos},
  DFP.View.Relatorios.Abastecimentos in 'View\DFP.View.Relatorios.Abastecimentos.pas' {ViewRelatoriosAbastecimentos},
  DFP.View.Factory in 'View\DFP.View.Factory.pas',
  DFP.Model.Services.Diesel in 'Model\Services\DFP.Model.Services.Diesel.pas',
  DFP.Model.Types in 'Model\Types\DFP.Model.Types.pas',
  DFP.Model.Services.Tanques in 'Model\Services\DFP.Model.Services.Tanques.pas',
  DFP.Model.Services.Bombas in 'Model\Services\DFP.Model.Services.Bombas.pas',
  DFP.Model.Utils.Helpers in 'Model\Utils\DFP.Model.Utils.Helpers.pas',
  System.SysUtils,
  DFP.Model.Exceptions in 'Model\Exceptions\DFP.Model.Exceptions.pas';

{$R *.res}

var
  App : TApplication; //avoid auto added forms on project

begin
  App := Application;
  ReportMemoryLeaksOnShutdown:=True;
  App.MainFormOnTaskbar := True;
  FormatSettings.DecimalSeparator := ',';
  FormatSettings.DateSeparator := '/';

  App.CreateForm(TViewPrincipal, ViewPrincipal);
  App.Run;
end.
