unit ui2cnew;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,unix;
//Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,Unix;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  gReturnCode: longint; {stores the result of the IO operation}

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
   gReturnCode := fpsystem('i2cget -y 1 0x21');
   edit1.Text:= IntToStr(gReturnCode);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.

