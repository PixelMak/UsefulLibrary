unit Classes;

interface

//Chair, Sofa, Bed
//Modern, Classic, Victorian

type
//Chair
  TChair = class
    function ShowMyself: string; virtual; abstract;
  end;

  TModerChair = class(TChair)
    function ShowMyself: string; override;
  end;

  TClassicChair = class(TChair)
    function ShowMyself: string; override;
  end;

  TVictorianChair = class(TChair)
    function ShowMyself: string; override;
  end;

//Sofa
  TSofa = class
    function ShowMyself: string; virtual; abstract;
  end;

  TModerSofa = class(TSofa)
    function ShowMyself: string; override;
  end;

  TClassicSofa = class(TSofa)
    function ShowMyself: string; override;
  end;

  TVictorianSofa = class(TSofa)
    function ShowMyself: string; override;
  end;

//Bed
  TBed = class
    function ShowMyself: string; virtual; abstract;
  end;

  TModerBed = class(TBed)
    function ShowMyself: string; override;
  end;

  TClassicBed = class(TBed)
    function ShowMyself: string; override;
  end;

  TVictorianBed = class(TBed)
    function ShowMyself: string; override;
  end;

implementation

{ TModerChair }

function TModerChair.ShowMyself: string;
begin
  Result := 'Modern Chair';
end;

{ TVictorianChair }

function TVictorianChair.ShowMyself: string;
begin
  Result := 'Victorian Chair';
end;

{ TClassicChair }

function TClassicChair.ShowMyself: string;
begin
  Result := 'Classic Chair';
end;

{ TModerSofa }

function TModerSofa.ShowMyself: string;
begin
  Result := 'Modern Sofa';
end;

{ TClassicSofa }

function TClassicSofa.ShowMyself: string;
begin
  Result := 'Clasic Sofa';
end;

{ TVictorianSofa }

function TVictorianSofa.ShowMyself: string;
begin
  Result := 'Victorian Sofa';
end;

{ TModerBed }

function TModerBed.ShowMyself: string;
begin
  Result := 'Modern Bed';
end;

{ TClassicBed }

function TClassicBed.ShowMyself: string;
begin
  Result := 'Classic Bed';
end;

{ TVictorianBed }

function TVictorianBed.ShowMyself: string;
begin
  Result := 'Victorian Bed';
end;

end.
