unit DFP.Model.Connection.Interfaces;

interface

uses
  Data.DB;

type
  iModelConnection = interface
    ['{2BAA2361-6A78-44E5-AB94-CF3A0E01665B}']
    function This : TCustomConnection;
    function ReadIni : iModelConnection;
    function SQL(aSql : string) : iModelConnection; overload;
    function SQL : string; overload;
    function OpenDataSet : iModelConnection;
    function DataSet : TDataSet;
    function CloseDS : iModelConnection;
    function ExecSQL(aSQL : string) : iModelConnection;
  end;

  iModelConnectionFactory = interface
    ['{C316215B-A8AC-461D-9E47-6C6E23ACB29D}']
    function Connection : iModelConnection;
  end;


implementation

end.
