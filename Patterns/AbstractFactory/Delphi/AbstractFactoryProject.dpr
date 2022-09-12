program AbstractFactoryProject;

//*****************************
//
// Abstract Factory made by template form this guide
//
// https://refactoring.guru/ru/design-patterns/abstract-factory
//
// Pixel 12.09.2022
//
//*****************************

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Classes in 'Classes.pas';

type
  TFurnitureFactory = class
    function CreateChair: TChair; virtual; abstract;
    function CreateSofa: TSofa; virtual; abstract;
    function CreateBed: TBed; virtual; abstract;
  end;

  TModerFabric = class(TFurnitureFactory)
    function CreateChair: TChair; override;
    function CreateSofa: TSofa; override;
    function CreateBed: TBed; override;
  end;

  TClassicFabric = class(TFurnitureFactory)
    function CreateChair: TChair; override;
    function CreateSofa: TSofa; override;
    function CreateBed: TBed; override;
  end;

  TVictorianFabric = class(TFurnitureFactory)
    function CreateChair: TChair; override;
    function CreateSofa: TSofa; override;
    function CreateBed: TBed; override;
  end;

  TApplication = class
    factory: TFurnitureFactory;
    chair: TChair;
    sofa: TSofa;
    bed: TBed;

    Constructor Create(styleFactory: TFurnitureFactory);

    procedure CreateFurniture;
    procedure ShowAll;
  end;



{ TModerFabric }

function TModerFabric.CreateBed: TBed;
begin
  Result := TModerBed.Create();
end;

function TModerFabric.CreateChair: TChair;
begin
  Result := TModerChair.Create();
end;

function TModerFabric.CreateSofa: TSofa;
begin
  Result := TModerSofa.Create();
end;

{ TClassicFabric }

function TClassicFabric.CreateBed: TBed;
begin
  Result := TClassicBed.Create();
end;

function TClassicFabric.CreateChair: TChair;
begin
  Result := TClassicChair.Create();
end;

function TClassicFabric.CreateSofa: TSofa;
begin
  Result := TClassicSofa.Create();
end;

{ TVictorianFabric }

function TVictorianFabric.CreateBed: TBed;
begin
  Result := TVictorianBed.Create();
end;

function TVictorianFabric.CreateChair: TChair;
begin
  Result := TVictorianChair.Create();
end;

function TVictorianFabric.CreateSofa: TSofa;
begin
  Result := TVictorianSofa.Create();
end;

{ TApplication }

constructor TApplication.Create(styleFactory: TFurnitureFactory);
begin
  factory := styleFactory;
end;

procedure TApplication.CreateFurniture;
begin
  chair := factory.CreateChair();
  bed := factory.CreateBed();
  sofa := factory.CreateSofa();
end;

procedure TApplication.ShowAll;
begin
  Writeln('|**Your order**|');
  Writeln('| - ' + chair.ShowMyself);
  Writeln('| - ' + bed.ShowMyself);
  Writeln('| - ' + sofa.ShowMyself);
  Writeln('|*************|');
  Writeln('');
end;

var
  app: TApplication;
  fac: TFurnitureFactory;
  tmp: string;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }

    app := nil;
    fac := nil;
    tmp := '';

    while (tmp <> '4') do
    begin
      tmp := '';
      Writeln('Please, select the furniture style for order: ');
      Writeln('- 1 - Classic');
      Writeln('- 2 - Moder');
      Writeln('- 3 - Victorian');
      Writeln('- 4 - Exit');
      Writeln('');

      ReadLn(tmp);

      fac := nil;

      if (tmp = '1') then
        fac := TClassicFabric.Create
      else if (tmp = '2') then
        fac := TModerFabric.Create
      else if (tmp = '3') then
        fac := TVictorianFabric.Create;

      if (fac <> nil) then
      begin
        app := TApplication.Create(fac);
        app.CreateFurniture;
        app.ShowAll;
      end else
        Writeln('Error! Make another choice!');

      if (fac <> nil) then
        FreeAndNil(fac);
      if (app <> nil) then
        FreeAndNil(app);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
