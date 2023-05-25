unit DFP.View.Cadastros.Bombas;

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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  DFP.Controller.Interfaces,
  DFP.Controller;

type
  TViewCadastrosBombas = class(TForm)
    DBGrid1: TDBGrid;
    Listar: TButton;
    DSBombas: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ListarClick(Sender: TObject);
  private
    { Private declarations }
    FController: iController;
  public
    { Public declarations }
  end;

var
  ViewCadastrosBombas: TViewCadastrosBombas;

implementation

{$R *.dfm}

procedure TViewCadastrosBombas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  ViewCadastrosBombas := nil;
end;

procedure TViewCadastrosBombas.FormCreate(Sender: TObject);
begin
  FController := TController.Create;
end;

procedure TViewCadastrosBombas.ListarClick(Sender: TObject);
begin
  FController.Services.Bombas.DataSource(DSBombas).List;
end;

end.
