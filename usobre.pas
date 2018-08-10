unit usobre;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls;

type

  { TformSobre }

  TformSobre = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  formSobre: TformSobre;

implementation

{$R *.lfm}

{ TformSobre }

procedure TformSobre.BitBtn1Click(Sender: TObject);
begin

end;

procedure TformSobre.Button1Click(Sender: TObject);
begin
  formSobre.Close;
end;

procedure TformSobre.Image1Click(Sender: TObject);
begin

end;

end.

