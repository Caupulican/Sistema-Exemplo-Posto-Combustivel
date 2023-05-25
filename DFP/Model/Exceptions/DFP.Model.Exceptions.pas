unit DFP.Model.Exceptions;

interface

uses
  System.SysUtils;

type
  ETotalLitros = class(Exception)
  public
    constructor Create;
  end;
  ETotalAbastecido = class(Exception)
  public
    constructor Create;
  end;
  EObjetoNulo = class(Exception)
  public
    constructor Create(const AMessage: string);
  end;


implementation

{ ETotalLitros }

constructor ETotalLitros.Create;
begin
  inherited Create('� preciso informar uma quantidade de litros maior que zero para o lan�amento!');
end;

{ ETotalAbastecido }

constructor ETotalAbastecido.Create;
begin
  inherited Create('N�o � permitido valores menos que 0 para o total abastecido!');
end;

{ EObjetoNulo }

constructor EObjetoNulo.Create(const AMessage: string);
begin
  inherited Create('Inst�ncia de '+aMessage+' nula!');
end;

end.
