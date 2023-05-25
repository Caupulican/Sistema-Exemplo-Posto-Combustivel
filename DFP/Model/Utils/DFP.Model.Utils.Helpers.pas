unit DFP.Model.Utils.Helpers;

interface

uses
  Vcl.StdCtrls,
  System.SysUtils,
  Vcl.Dialogs;

type
  TEditHelper = class helper for TEdit
    function AsFloat: Currency;
    function AsInteger: Integer;
  end;

implementation

{ TEditHelper }

function TEditHelper.AsFloat: Currency;
begin
  Result := StrToFloatDef(Text, 0);
end;

function TEditHelper.AsInteger: Integer;
begin
  try
    Result := StrToInt(Text);
  except
    on E: Exception do
    begin
      Showmessage('Nesta versão não é permitido trabalhar com valores quebrados! Informe somente valores inteiros, ex 1,2,4,10.');
      Self.SetFocus;
    end;
  end;
end;

end.
