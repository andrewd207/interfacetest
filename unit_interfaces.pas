unit unit_interfaces;

{$mode objfpc}{$H+}
{$interfaces corba}

interface

uses
  Classes, SysUtils;

type
  IMyInterface = interface
    ['{639E0E84-7191-431F-85FB-0ED98244142A}']
    procedure DoSomething;
    function GetObject: TObject;
  end;

implementation

end.

