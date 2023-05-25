unit DFP.View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.StdCtrls,
  DFP.model.Types,
  DFP.View.Factory;

type
  TViewPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Lanamentos1: TMenuItem;
    MenTanques: TMenuItem;
    MenBombas: TMenuItem;
    Abastecimentos1: TMenuItem;
    Relatorios1: TMenuItem;
    Abastecimentos2: TMenuItem;
    procedure Abastecimentos1Click(Sender: TObject);
    procedure MenTanquesClick(Sender: TObject);
    procedure MenBombasClick(Sender: TObject);
    procedure Abastecimentos2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

procedure TViewPrincipal.Abastecimentos1Click(Sender: TObject);
begin
  TViewFactory.New.CallForm(tpLanAbastecimentos,Self);
end;

procedure TViewPrincipal.MenTanquesClick(Sender: TObject);
begin
  TViewFactory.New.CallForm(tpCadTanques,Self);
end;

procedure TViewPrincipal.Abastecimentos2Click(Sender: TObject);
begin
  TViewFactory.New.CallForm(tpRelAbastecimentos,Self);
end;

procedure TViewPrincipal.MenBombasClick(Sender: TObject);
begin
  TViewFactory.New.CallForm(tpCadBombas,Self);
end;

end.
