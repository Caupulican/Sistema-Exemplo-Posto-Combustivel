unit DFP.View.Lancamentos.Abastecimentos;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.StrUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  DFP.Controller.Interfaces,
  DFP.Controller,
  DFP.Model.Utils.Helpers,
  DFP.Model.Types,
  Vcl.ComCtrls;

type
  TViewLancamentosAbastecimentos = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DSAbastecimentos: TDataSource;
    Button4: TButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    rgBomba: TRadioGroup;
    rgCombustivel: TRadioGroup;
    edtLitros: TEdit;
    Label1: TLabel;
    dtData: TDateTimePicker;
    edtValor: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
  private
    { Private declarations }
    FController: iController;
    FAtualizando : Boolean;
    function DesfazAtualizacaoDados : Boolean;
    procedure SalvarDados;
    procedure ResetaDados;
  public
    { Public declarations }
  end;

var
  ViewLancamentosAbastecimentos: TViewLancamentosAbastecimentos;

implementation

{$R *.dfm}

procedure TViewLancamentosAbastecimentos.Button1Click(Sender: TObject);
begin
  case rgCombustivel.ItemIndex of
    0:
      begin
        FController.Services.Gasolina.NewObject;
        SalvarDados;
        FController.Services.Gasolina.Insert;
      end;
    1:
      begin
        FController.Services.Diesel.NewObject;
        SalvarDados;
        FController.Services.Diesel.Insert;
      end;
  end;
  ResetaDados;
  FController.Services.Abastecimentos.Find;
end;

procedure TViewLancamentosAbastecimentos.Button2Click(Sender: TObject);
var
  LTipo : TTipoServicoCombustivel;
begin
  if (Button2.Caption='Salvar Alterações') then
  begin
    if MessageDlg('Deseja salvar as alterações?', mtConfirmation, [mbYes, mbNo], 0)=mryes then
    begin
      case rgCombustivel.ItemIndex of
        0:
          begin
            FController.Services.Gasolina.Current.ID := FController.Services.Abastecimentos.Current.ID;
            SalvarDados;
            FController.Services.Gasolina.Update;
          end;
        1:
          begin
            FController.Services.Diesel.Current.ID := FController.Services.Abastecimentos.Current.ID;
            SalvarDados;
            FController.Services.Diesel.Update;
          end;
      end;
      ResetaDados;
      FController.Services.Abastecimentos.Find;
      Button2.Caption := 'Alterar';
      FAtualizando := False;
      exit;
    end;
  end;
  if not DesfazAtualizacaoDados then
    exit;
  FAtualizando := True;
  Button2.Caption := 'Salvar Alterações';
  FController.Services.Abastecimentos.ReloadObject;
  dtData.Date := FController.Services.Abastecimentos.Current.DataVenda;
  edtLitros.Text := FloatToStr(FController.Services.Abastecimentos.Current.QtdLitros);
  edtValor.Text := FloatToStr(FController.Services.Abastecimentos.Current.TotalAbastecido);
  rgBomba.ItemIndex := FController.Services.Abastecimentos.Current.BombaID-1;
  LTipo := TTipoServicoCombustivel(LTipo).FromTipo(FController.Services.Abastecimentos.Current.Tipo);
  if (LTipo = tcGasolina) then
    rgCombustivel.ItemIndex := 0
  else
    rgCombustivel.ItemIndex := 1;

  case rgCombustivel.ItemIndex of
    0:
      begin
        FController.Services.Gasolina.Current.ID := FController.Services.Abastecimentos.Current.ID;
        FController.Services.Gasolina.Current.BombaID := FController.Services.Abastecimentos.Current.BombaID;
        FController.Services.Gasolina.Current.QtdLitros := FController.Services.Abastecimentos.Current.QtdLitros;
        FController.Services.Gasolina.Current.DataVenda := FController.Services.Abastecimentos.Current.DataVenda;
        FController.Services.Gasolina.Current.PercentualImposto := FController.Services.Abastecimentos.Current.PercentualImposto;
        FController.Services.Gasolina.Current.TotalAbastecido := FController.Services.Abastecimentos.Current.TotalAbastecido;
        FController.Services.Gasolina.Current.Tipo := FController.Services.Abastecimentos.Current.Tipo;
      end;
    1:
      begin
        FController.Services.Diesel.Current.ID := FController.Services.Abastecimentos.Current.ID;
        FController.Services.Diesel.Current.BombaID := FController.Services.Abastecimentos.Current.BombaID;
        FController.Services.Diesel.Current.QtdLitros := FController.Services.Abastecimentos.Current.QtdLitros;
        FController.Services.Diesel.Current.DataVenda := FController.Services.Abastecimentos.Current.DataVenda;
        FController.Services.Diesel.Current.PercentualImposto := FController.Services.Abastecimentos.Current.PercentualImposto;
        FController.Services.Diesel.Current.TotalAbastecido := FController.Services.Abastecimentos.Current.TotalAbastecido;
        FController.Services.Diesel.Current.Tipo := FController.Services.Abastecimentos.Current.Tipo;
      end;
  end;
end;

procedure TViewLancamentosAbastecimentos.Button3Click(Sender: TObject);
begin
  if DesfazAtualizacaoDados then
    FController.Services.Abastecimentos.Find;
end;

procedure TViewLancamentosAbastecimentos.Button4Click(Sender: TObject);
begin
  if DesfazAtualizacaoDados then
    FController.Services.Abastecimentos.ReloadObject.Delete.Find;
end;

procedure TViewLancamentosAbastecimentos.DBGrid1Enter(Sender: TObject);
begin
  DesfazAtualizacaoDados;
end;

function TViewLancamentosAbastecimentos.DesfazAtualizacaoDados: Boolean;
begin
  if not FAtualizando then
    exit(True);
  Result := ((FAtualizando) and (MessageDlg('As informações sendo alteradas serão pedidas, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0)=mryes));
  if Result then
  begin
    Button2.Caption := 'Alterar';
    FAtualizando := False;
    ResetaDados;
  end;
end;

procedure TViewLancamentosAbastecimentos.ResetaDados;
begin
  edtLitros.Text := '0';
  edtValor.Text := '0';
  rgBomba.ItemIndex := 0;
  rgCombustivel.ItemIndex := 0;
  dtData.Date := now;
end;

procedure TViewLancamentosAbastecimentos.SalvarDados;
begin
  case rgCombustivel.ItemIndex of
    0:
      begin
        FController.Services.Gasolina.Bomba(rgBomba.ItemIndex + 1);
        FController.Services.Gasolina.Current.QtdLitros := edtLitros.AsFloat;
        FController.Services.Gasolina.Current.DataVenda := dtData.Date;
        FController.Services.Gasolina.Current.TotalAbastecido := edtValor.AsFloat;
      end;
    1:
      begin
        FController.Services.Diesel.Bomba(rgBomba.ItemIndex + 1);
        FController.Services.Diesel.Current.QtdLitros := edtLitros.AsFloat;
        FController.Services.Diesel.Current.DataVenda := dtData.Date;
        FController.Services.Diesel.Current.TotalAbastecido := edtValor.AsFloat;
      end;
  end;
end;

procedure TViewLancamentosAbastecimentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  ViewLancamentosAbastecimentos := nil;
end;

procedure TViewLancamentosAbastecimentos.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  FController.Services.Abastecimentos.DataSource(DSAbastecimentos).Find;
end;

end.
