program interfacetest;

{$mode objfpc}{$H+}

uses
  Classes, unit_a, unit_interfaces, unit_obj;

var
  Arr: TArray;

procedure CreateItems;
var
  I: Integer;
  Item: TMyObject;
begin
  for I := 0 to 10 do
  begin
    Item := TMyObject.Create(I);
    Arr.Add(Item);
  end;
end;

begin
  Arr := TArray.Create;
  CreateItems;
  Arr.PrintListInfo;
  Arr.PrintListInfoAsTMyObject;
  Arr.PrintListInfoAsTObject;
  Arr.Free;
end.

