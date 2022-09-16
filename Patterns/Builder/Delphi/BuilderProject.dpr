program BuilderProject;

//*****************************
//
// Builder made by template form this guide
//
// https://refactoring.guru/ru/design-patterns/builder
//
// Pixel 16.09.2022
//
//*****************************

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  THouse = class
    private
      houseComplection: string;
    public
      procedure AddComplection(str: string);
      function GetComplection: string;
  end;

  TManual = class
    private
      houseComplection: string;
    public
      procedure AddComplection(str: string);
      function GetComplection: string;
  end;

  IBuilder = interface
    procedure reset();
    procedure SetRoof(val: integer);
    procedure SetWalls(val: integer);
    procedure SetWindows(val: integer);
    procedure SetPool(val: integer);
  end;
  //������� ���
  THouseBuilder = class(TInterfacedObject, IBuilder)
    house: THouse;
    procedure reset();
    procedure SetRoof(val: integer);
    procedure SetWalls(val: integer);
    procedure SetWindows(val: integer);
    procedure SetPool(val: integer);
    function GetResult: THouse;
  end;
  //������� ��������� �� ���
  THouseManualBuilder = class(TInterfacedObject, IBuilder)
    manual: TManual;
    procedure reset();
    procedure SetRoof(val: integer);
    procedure SetWalls(val: integer);
    procedure SetWindows(val: integer);
    procedure SetPool(val: integer);
    function GetResult: TManual;
  end;
  //��������
  TDirector = class
    procedure ConstructSimpleHouse(biulder: IBuilder);
    procedure ConstructModernHouse(biulder: IBuilder);
  end;

{ house }

procedure THouse.AddComplection(str: string);
begin
  houseComplection := houseComplection + ' ' + str;
end;

{ HouseBilder }

function THouseBuilder.GetResult: THouse;
begin
  Result := house;
end;

procedure THouseBuilder.reset;
begin
  house := THouse.Create;
end;

procedure THouseBuilder.SetPool(val: integer);
begin
  house.AddComplection('�������: ' + val.ToString	+ '.' + #13#10);
end;

procedure THouseBuilder.SetRoof(val: integer);
begin
  house.AddComplection('������ �����: ' + val.ToString	+ '.' + #13#10);
end;

procedure THouseBuilder.SetWalls(val: integer);
begin
  house.AddComplection('�����: ' + val.ToString	+ '.' + #13#10);
end;

procedure THouseBuilder.SetWindows(val: integer);
begin
  house.AddComplection('����: ' + val.ToString	+ '.' + #13#10);
end;

{ THouseManualBilder }

function THouseManualBuilder.GetResult: TManual;
begin
  Result := manual;
end;

procedure THouseManualBuilder.reset;
begin
  manual := TManual.Create;
end;

procedure THouseManualBuilder.SetPool(val: integer);
begin
  manual.AddComplection('����������� �������� ��������� � ������� ' + val.ToString	+ ' ��.' + #13#10);
end;

procedure THouseManualBuilder.SetRoof(val: integer);
begin
  manual.AddComplection('����������� �������� ����� � ������� ' + val.ToString	+ ' ��.' + #13#10);
end;

procedure THouseManualBuilder.SetWalls(val: integer);
begin
  manual.AddComplection('����������� �������� ���� � ������� ' + val.ToString	+ ' ��.' + #13#10);
end;

procedure THouseManualBuilder.SetWindows(val: integer);
begin
  manual.AddComplection('����������� ��������� � ���� ���� � ������� ' + val.ToString	+ ' ��.' + #13#10);
end;

{ TManual }

procedure TManual.AddComplection(str: string);
begin
  houseComplection := houseComplection + ' ' + str;
end;

function TManual.GetComplection: string;
begin
  Result := houseComplection;
end;

{ TDirector }

procedure TDirector.ConstructModernHouse(biulder: IBuilder);
begin
  biulder.reset;
  biulder.SetWalls(10);
  biulder.SetRoof(8);
  biulder.SetWindows(15);
  biulder.SetPool(1);
end;

procedure TDirector.ConstructSimpleHouse(biulder: IBuilder);
begin
  biulder.reset;
  biulder.SetWalls(4);
  biulder.SetRoof(1);
  biulder.SetWindows(5);
end;

var
  director: TDirector;
  houseBuilder: THouseBuilder;
  houseManualBuilder: THouseManualBuilder;

  house: THouse;
  manual: TManual;

function THouse.GetComplection: string;
begin
  Result := houseComplection;
end;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    director := TDirector.Create;
   //������� ���
    houseBuilder := THouseBuilder.Create;
    director.ConstructSimpleHouse(houseBuilder);
    house := houseBuilder.GetResult;
    Writeln('� ���� ����������: ' + #13#10 + house.GetComplection);

    houseManualBuilder := THouseManualBuilder.Create;
    director.ConstructSimpleHouse(houseManualBuilder);
    manual := houseManualBuilder.GetResult;
    Writeln('������������ �� ���: ' + #13#10 + manual.GetComplection);
   //����������� ����
    houseBuilder := THouseBuilder.Create;
    director.ConstructModernHouse(houseBuilder);
    house := houseBuilder.GetResult;
    Writeln('� ���� ����������: ' + #13#10 + house.GetComplection);

    houseManualBuilder := THouseManualBuilder.Create;
    director.ConstructModernHouse(houseManualBuilder);
    manual := houseManualBuilder.GetResult;
    Writeln('������������ �� ���: ' + #13#10 + manual.GetComplection);

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
