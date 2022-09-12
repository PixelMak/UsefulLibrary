program SingletonPatternProject;

//*****************************
//
// Singletone made by template form this guides
//
// https://refactoring.guru/ru/design-patterns/abstract-factory
// https://stackoverflow.com/questions/5392107/delphi-singleton-pattern
//
// Pixel 12.09.2022
//
//*****************************

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  IDatabaseInterface = interface
    function GetConnection(ip: string): string;
  end;

  TDatabaseInterface = class(TInterfacedObject, IDatabaseInterface)
    ip: string;
    function GetConnection(ip: string): string;
  end;

var
  DatabaseInterface: TDatabaseInterface;

  function DB: IDatabaseInterface;
  begin
    if (not Assigned(DatabaseInterface)) then
      DatabaseInterface := TDatabaseInterface.Create;

    Result := DatabaseInterface;
  end;


{ TDatabaseInterface }

function TDatabaseInterface.GetConnection(ip: string): string;
begin
  self.ip := ip;
  Result := 'Connection Granted';
end;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    Writeln(DB.GetConnection('127.0.0.1'));
    Readln;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
