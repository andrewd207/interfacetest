unit unit_obj;

{$mode objfpc}{$H+}


interface

uses
  Classes, SysUtils, unit_interfaces;

type
  TMyObject = class(IMyInterface)
  private
    FSomeData: Integer;
  public
    procedure DoSomething;
    function GetObject: TObject;
    constructor Create(SomeData: Integer);
  end;

implementation

{ TMyObject }

procedure TMyObject.DoSomething;
begin
  // try a couple of thing so to cause a crash if things are not correct.
  WriteLn('Class = ', ClassName, ' SomeData = ', FSomeData);
  WriteLn('InheritsFrom TObject = ', TObject.InheritsFrom(TObject));
end;

function TMyObject.GetObject: TObject;
begin
  Result := Self;
end;

constructor TMyObject.Create(SomeData: Integer);
begin
  FSomeData:=SomeData;
end;

end.

