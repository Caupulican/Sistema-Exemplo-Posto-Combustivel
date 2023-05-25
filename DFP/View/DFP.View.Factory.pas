unit DFP.View.Factory;

interface

uses
  System.Classes,
  DFP.View.Cadastros.Tanques,
  DFP.View.Cadastros.Bombas,
  DFP.Model.Types,
  DFP.View.Lancamentos.Abastecimentos,
  DFP.View.Relatorios.Abastecimentos;

type
  iViewFactory = interface
    ['{196419EB-EEE9-4E93-96EE-1F14F4F0B23D}']
    function CallForm(aForm : TFormType; aOwner : TComponent) : iViewFactory;
  end;

  TViewFactory = class(TInterfacedObject, iViewFactory)
    private
      procedure CallViewTanques(aOwner : TComponent);
      procedure CallViewBombas(aOwner : TComponent);
      procedure CallViewAbastecimentos(aOwner : TComponent);
      procedure CallViewRelatorios(aOwner : TComponent);
    class var FThis : iViewFactory;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iViewFactory;
      function CallForm(aForm : TFormType; aOwner : TComponent) : iViewFactory;
  end;

implementation


{ TViewFactory }

function TViewFactory.CallForm(aForm : TFormType; aOwner : TComponent) : iViewFactory;
begin
  case aForm of
    tpCadTanques: CallViewTanques(aOwner);
    tpCadBombas: CallViewBombas(aOwner);
    tpLanAbastecimentos: CallViewAbastecimentos(aOwner);
    tpRelAbastecimentos: CallViewRelatorios(aOwner);
  end;
end;

procedure TViewFactory.CallViewAbastecimentos(aOwner : TComponent);
begin
  if ViewLancamentosAbastecimentos=nil then
    ViewLancamentosAbastecimentos := TViewLancamentosAbastecimentos.Create(aOwner);
  ViewLancamentosAbastecimentos.Show;
  ViewLancamentosAbastecimentos.BringToFront;
end;

procedure TViewFactory.CallViewBombas(aOwner : TComponent);
begin
  if ViewCadastrosBombas=nil then
    ViewCadastrosBombas := TViewCadastrosBombas.Create(aOwner);
  ViewCadastrosBombas.Show;
  ViewCadastrosBombas.BringToFront;
end;

procedure TViewFactory.CallViewRelatorios(aOwner: TComponent);
begin
  if ViewRelatoriosAbastecimentos=nil then
    ViewRelatoriosAbastecimentos := TViewRelatoriosAbastecimentos.Create(aOwner);
  ViewRelatoriosAbastecimentos.Show;
  ViewRelatoriosAbastecimentos.BringToFront;
end;

procedure TViewFactory.CallViewTanques(aOwner : TComponent);
begin
  if ViewCadastrosTanques=nil then
    ViewCadastrosTanques := TViewCadastrosTanques.Create(aOwner);
  ViewCadastrosTanques.Show;
  ViewCadastrosTanques.BringToFront;
end;

constructor TViewFactory.Create;
begin

end;

class function TViewFactory.New : iViewFactory;
begin
  if not Assigned(FThis) then
    FThis := Self.Create;
  Result := FThis;
end;

destructor TViewFactory.Destroy;
begin

  inherited;
end;

Initialization
  TViewFactory.New;

end.
