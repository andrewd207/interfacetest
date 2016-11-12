unit unit_a;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, unit_interfaces;

type
  TArray = class(TList)
  private
    function GetItems(AIndex: Integer): IMyInterface;
    procedure SetItems(AIndex: Integer; AValue: IMyInterface);
  public
    destructor Destroy; override;
    function Add(Item: IMyInterface): Integer; reintroduce;
    procedure PrintListInfo;
    procedure PrintListInfoAsTObject;
    procedure PrintListInfoAsTMyObject;
    property Items[AIndex: Integer] : IMyInterface read GetItems write SetItems;

  end;


implementation
uses
  unit_obj;

{ TArray }

function TArray.GetItems(AIndex: Integer): IMyInterface;
begin
  Result := IMyInterface(Inherited Items[AIndex]);
end;

procedure TArray.SetItems(AIndex: Integer; AValue: IMyInterface);
begin
  Inherited Items[AIndex] := AValue;

end;

destructor TArray.Destroy;
var
  i: Integer;
begin
  for i := 0 to Count-1 do
    Items[i].GetObject.Free;
  inherited Destroy;
end;

function TArray.Add(Item: IMyInterface): Integer;
begin
  Result := inherited Add(Item);
end;

procedure TArray.PrintListInfo;
var
  i: Integer;
begin
  for i := 0 to Count-1 do
  begin
    Items[i].DoSomething;
  end;
end;

procedure TArray.PrintListInfoAsTObject;
var
  i: Integer;
begin
  for i := 0 to Count-1 do
  begin
    // Esentially casting IMyInterface(TObject)
   (Items[i].GetObject as IMyInterface).DoSomething;
  end;
end;

procedure TArray.PrintListInfoAsTMyObject;
var
  i: Integer;
begin
  for i := 0 to Count-1 do
  begin
    // Esentially casting IMyInterface(TMyObject)
    IMyInterface(TMyObject(Items[i].GetObject)).DoSomething;
  end;
end;

end.

