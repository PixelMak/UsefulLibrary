program FactoryProject;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  Ttransport = class
    protected
      function ShowMyslef: string; virtual; abstract;
  end;

  Ttruck = class(Ttransport)
    public
      function ShowMyslef: string; override;    
  end;

  TShip = class(Ttransport)
    public
      function ShowMyslef: string; override; 
  end;

  TLogistics = class
    class function CreateTransport(): Ttransport; virtual; abstract;
  
  end;

  TRoadLogistics = class(TLogistics)
    class function CreateTransport(): Ttransport; override;
  end;

  TWaterLogistics = class(TLogistics)
    class function CreateTransport(): Ttransport; override;
  end;

{ Ttruck }

function Ttruck.ShowMyslef: string;
begin
  Result := 'Truck';
end;

{ TShip }

function TShip.ShowMyslef: string;
begin
  Result := 'Ship';
end;

{ TWaterLogistics }

class function TWaterLogistics.CreateTransport: Ttransport;
begin
  Result := TShip.Create;
end;

var
  transport: Ttransport;
  tmp: string;

{ TRoadLogistics }

class function TRoadLogistics.CreateTransport: Ttransport;
begin
  Result := TTruck.Create;
end;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }

    tmp := '';

    transport := nil;

    while (tmp <> '3') do
    begin 
      if (transport <> nil) then
        transport := nil;
       
      Writeln('Choose Transport: ');
      Writeln('1 - For road');
      Writeln('2 - For water');
      Writeln('3 - Exit');
      Readln(tmp);

      if (tmp = '1') then
        transport := TRoadLogistics.CreateTransport
      else
        transport := TWaterLogistics.CreateTransport;
      
      Write('You chosed: ' + transport.ShowMyslef);

      Writeln('');		
    end;
    
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
