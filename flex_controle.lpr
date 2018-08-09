program flex_controle;

{$mode objfpc}{$H+}

uses
  //{$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
 // {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,tachartlazaruspkg, uii2c, usobre, LazSerialPort;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TformSobre, formSobre);
  Application.Run;
end.

