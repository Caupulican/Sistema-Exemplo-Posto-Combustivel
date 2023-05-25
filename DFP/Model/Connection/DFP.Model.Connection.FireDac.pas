unit DFP.Model.Connection.FireDac;

interface

uses
  Data.DB,
  FireDac.Stan.Intf,
  FireDac.Stan.Option,
  FireDac.Stan.Error,
  FireDac.UI.Intf,
  FireDac.Phys.Intf,
  FireDac.Stan.Def,
  FireDac.Stan.Pool,
  FireDac.Stan.Async,
  FireDac.Phys,
  FireDac.VCLUI.Wait,
  FireDac.Stan.Param,
  FireDac.DatS,
  FireDac.DApt.Intf,
  FireDac.DApt,
  FireDac.Phys.FBDef,
  FireDac.Phys.IBBase,
  FireDac.Phys.FB,
  FireDac.Comp.DataSet,
  FireDac.Comp.Client,
  FireDac.Comp.UI,
  IniFiles,
  DFP.Model.Connection.Interfaces,
  System.SysUtils,
  Vcl.Forms,
  Vcl.Dialogs;

type
  TModelConnectionFireDac = class(TInterfacedObject, iModelConnection)
  private
    FFDQuery: TFDQuery;
    FSQLExecutor : TFDQuery;
    FFDPhysFBDriverLink: TFDPhysFBDriverLink;
    FFDGuixWaitCursor: TFDGUIxWaitCursor;
    FFDConnection: TFDConnection;
    function Query: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConnection;
    function This : TCustomConnection;
    function ReadIni : iModelConnection;
    function SQL(aSql : string) : iModelConnection; overload;
    function SQL : string; overload;
    function OpenDataSet : iModelConnection;
    function DataSet : TDataSet;
    function CloseDS : iModelConnection;
    function ExecSQL(aSQL : string) : iModelConnection;
  end;

implementation

{ TModelConnectionFireDac }

function TModelConnectionFireDac.CloseDS: iModelConnection;
begin
  Result := Self;
  FFDQuery.Close;
end;

constructor TModelConnectionFireDac.Create;
begin
  FFDConnection := TFDConnection.Create(nil);
  FFDPhysFBDriverLink := TFDPhysFBDriverLink.Create(FFDConnection);
  FFDGuixWaitCursor := TFDGUIxWaitCursor.Create(FFDConnection);
  FFDPhysFBDriverLink.ThreadSafe := True;
  FFDQuery := TFDQuery.Create(nil);
  FFDQuery.Connection := FFDConnection;
  FSQLExecutor := TFDQuery.Create(nil);
  FSQLExecutor.Connection := FFDConnection;
end;

function TModelConnectionFireDac.DataSet: TDataSet;
begin
  Result := FFDQuery;
end;

destructor TModelConnectionFireDac.Destroy;
begin
  FFDConnection.Free;
  FFDQuery.Free;
  FSQLExecutor.Free;
  inherited;
end;

function TModelConnectionFireDac.ExecSQL(aSQL: string): iModelConnection;
begin
  Result := Self;
  FSQLExecutor.ExecSQL(aSQL);
end;

class function TModelConnectionFireDac.New: iModelConnection;
begin
  Result := Self.Create;
end;

function TModelConnectionFireDac.OpenDataSet: iModelConnection;
begin
  Result := Self;
  FFDQuery.Open;
end;

function TModelConnectionFireDac.Query: TFDQuery;
begin
  Result := FFDQuery;
end;

function TModelConnectionFireDac.ReadIni: iModelConnection;
var
  LIniFile: TIniFile;
  LDBPath,LDbUser, LDBPassword: string;
begin
  Result := Self;
  LIniFile := TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'DFP.ini');
  try
    LDBPath := LIniFile.ReadString('Config', 'DBPath', '');
    LDbUser := LIniFile.ReadString('Config', 'DBUser', '');
    LDBPassword := LIniFile.ReadString('Config', 'DBPass', '');
    if LDBPath.Trim.IsEmpty then
    begin
      raise Exception.Create('Configure o arquivo DFP.ini localizado ele junto à este executável. Exemplo:'+sLineBreak+
      '[Config]'+sLineBreak+
      'DBPath=C:\MeuDB.db'+sLineBreak+
      'DBUser=SYSDBA'+sLineBreak+
      'DBPass=masterkey');
      Application.Terminate;
    end;
    FFDConnection.Params.Clear;
    FFDConnection.LoginPrompt := False;
    FFDConnection.Params.Add('CharacterSet-win1252');
    FFDConnection.Params.UserName := LDbUser;
    FFDConnection.Params.Password := LDBPassword;
    FFDConnection.Params.DriverID := 'FB';
    FFDConnection.Params.Add('Database=' + LDBPath);
    FFDConnection.Connected := True;
  finally
    LIniFile.Free;
  end;
end;


function TModelConnectionFireDac.SQL: string;
begin
  Result := FFDQuery.SQL.Text;
end;

function TModelConnectionFireDac.SQL(aSql: string): iModelConnection;
begin
  Result := Self;
  FFDQuery.Close;
  FFDQuery.SQL.Clear;
  FFDQuery.SQL.Text := aSql;
end;

function TModelConnectionFireDac.This: TCustomConnection;
begin
  Result := FFDConnection;
end;

end.
