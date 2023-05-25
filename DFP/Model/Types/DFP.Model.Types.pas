unit DFP.Model.Types;

interface

type
  TFormType = (tpCadTanques,tpCadBombas,tpLanAbastecimentos,tpRelAbastecimentos);
  TTipoServicoCombustivel = (tcGasolina,tcDiesel);
  TState = (sNone,sInserting,sEditing,sDeleting);

  TTipoServicoCombustivelHelper = record helper for TTipoServicoCombustivel
    function TotalBombas : integer;
    function Tipo : string;
    function FromTipo(aTipo : string) : TTipoServicoCombustivel;
  end;

implementation

{ TTipoServicoCombustivelHelper }

function TTipoServicoCombustivelHelper.FromTipo(aTipo: string): TTipoServicoCombustivel;
begin
  if aTipo='G' then
    Self := tcGasolina;
  if aTipo='D' then
    Self := tcDiesel;
  Result := Self;
end;

function TTipoServicoCombustivelHelper.Tipo: string;
begin
  case Self of
    tcGasolina: Result := 'G';
    tcDiesel: Result := 'D';
  end;
end;

function TTipoServicoCombustivelHelper.TotalBombas: integer;
begin
  Result := 2;
end;

end.
