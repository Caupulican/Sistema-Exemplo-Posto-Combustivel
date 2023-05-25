unit DFP.View.Relatorios.Abastecimentos;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  RLReport,
  Vcl.StdCtrls,
  Vcl.Mask,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  DFP.Model.Factory;

type
  TViewRelatoriosAbastecimentos = class(TForm)
    RLReport1: TRLReport;
    Panel1: TPanel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    RLGroup1: TRLGroup;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel21: TRLLabel;
    rllblPeriodo: TRLLabel;
    RLLabel11: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel13: TRLLabel;
    DsAbastecimentos: TDataSource;
    FDQuery1: TFDQuery;
    RLBand3: TRLBand;
    rlTotal: TRLLabel;
    rlData: TRLLabel;
    rlTanque: TRLLabel;
    rlBomba: TRLLabel;
    rlPercentImposto: TRLLabel;
    rlTotimposto: TRLLabel;
    RLBand6: TRLBand;
    RLSubDetail1: TRLSubDetail;
    RLBand4: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    rlTotalGeral: TRLLabel;
    rlTotalGeralCImposto: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    rgAgrupamentos: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
  { Private declarations }
    const
    SQLReport = ' select' + ' aba.*,' + ' bom.*,' + ' tq.*,' + ' sum(aba.abas_total_abastecido) over() TotalAbastecido,' +
      ' sum(aba.abas_total_com_imposto) over() TotalAbastecidoImposto' + ' from abastecimentos aba' + ' join bombas bom on bom.bom_id=aba.abas_bom_id' +
      ' join tanques tq on tq.tan_id=bom.bom_tan_id';
  public
    { Public declarations }
  end;

var
  ViewRelatoriosAbastecimentos: TViewRelatoriosAbastecimentos;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TViewRelatoriosAbastecimentos.Button1Click(Sender: TObject);
var
  WindowsList: Pointer;
begin
  FDQuery1.Close;
  FDQuery1.Connection := TFDConnection(TModelFactory.New.ConnectionFactory.Connection.This);
  FDQuery1.SQL.Text := SQLReport;
  if MaskEdit1.Text<>'  /  /    ' then
    FDQuery1.SQL.Text := FDQuery1.SQL.Text + ' and aba.abas_data_venda>=' + QuotedStr(StringReplace(MaskEdit1.Text,'/','.',[rfReplaceAll]));

  if MaskEdit2.Text <> '  /  /    ' then
    FDQuery1.SQL.Text := FDQuery1.SQL.Text + ' and aba.abas_data_venda<=' + QuotedStr(StringReplace(MaskEdit2.Text,'/','.',[rfReplaceAll]));
  case rgAgrupamentos.ItemIndex of
    0: FDQuery1.SQL.Text := FDQuery1.SQL.Text + ' order by aba.abas_data_venda';
    1: FDQuery1.SQL.Text := FDQuery1.SQL.Text + ' order by tq.tan_id';
    2: FDQuery1.SQL.Text := FDQuery1.SQL.Text + ' order by bom.bom_id';
  end;
  FDQuery1.Open;

  try
    WindowsList := DisableTaskWindows(RLReport1.Handle);
    RLReport1.PreviewOptions.WindowState := wsMaximized;
    RLReport1.PreviewModal;
  finally
    EnableTaskWindows(WindowsList);
  end;
end;

procedure TViewRelatoriosAbastecimentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  ViewRelatoriosAbastecimentos := nil;
end;

procedure TViewRelatoriosAbastecimentos.MaskEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_BACK) and (TMaskEdit(Sender).Text = TMaskEdit(Sender).EditMask) then
  begin
    TMaskEdit(Sender).Text := '';
    Key := 0;
  end;
end;

procedure TViewRelatoriosAbastecimentos.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  rllblPeriodo.Caption := MaskEdit1.Text + ' a ' + MaskEdit2.Text;
end;

procedure TViewRelatoriosAbastecimentos.RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLLabel5.Caption := FormatFloat('0.00', FDQuery1.FieldByName('TotalAbastecido').AsInteger);
  RLLabel4.Caption := FormatFloat('0.00',FDQuery1.FieldByName('TotalAbastecidoImposto').AsInteger);
end;

end.
