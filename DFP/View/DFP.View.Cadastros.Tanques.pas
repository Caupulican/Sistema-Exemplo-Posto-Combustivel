unit DFP.View.Cadastros.Tanques;

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
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  DFP.Controller.Interfaces,
  DFP.Controller;

type
  TViewCadastrosTanques = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    DSTanques: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FController: iController;
  public
    { Public declarations }
  end;

var
  ViewCadastrosTanques: TViewCadastrosTanques;

implementation

{$R *.dfm}

procedure TViewCadastrosTanques.Button1Click(Sender: TObject);
begin
  FController.Services.Tanques.DataSource(DSTanques).List;
end;

procedure TViewCadastrosTanques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  ViewCadastrosTanques := nil;
end;

procedure TViewCadastrosTanques.FormCreate(Sender: TObject);
begin
  FController := TController.New;
end;

end.
