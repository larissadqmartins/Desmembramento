unit uii2c;

{$mode objfpc}{$H+}

interface

uses


 cthreads,
 Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
 Dialogs, StdCtrls, ExtCtrls, ComCtrls, Menus, usobre, Unix, BaseUnix, Types,
 {MQTT} LazSerial,{laz_synapse,}strUtils;


type
    controle_teclas = record
    id:integer;
      x:real;
      y:real;
      z:real;
    modelo:string;
    end;


    TH = class(TTHREAD)
              Public
                constructor create(createsuspended:boolean);
                procedure atualizaform;
                protected
                  procedure execute;override;
         end;

   THA = class(TTHREAD)
              Public
                constructor create(createsuspended:boolean);
                procedure atualizaform;
                protected
                  procedure execute;override;
         end;

    THB = class(TTHREAD)
                Public
                  constructor create(createsuspended:boolean);
                  procedure atualizaform;
                  protected
                    procedure execute;override;
          end;


    THC = class(TTHREAD)
                Public
                  constructor create(createsuspended:boolean);
                  procedure atualizaform;
                  protected
                    procedure execute;override;
          end;


  { TForm1 }

    TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;

    btnStart_1a_6: TButton;
    Button26: TButton;

    Label_STATUS_SENSOR: TLabel;
    ler_tabelas: TButton;
    Button17: TButton;
    Button2: TButton;
    Button21: TButton;
    Button22: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    eposicaoz: TEdit;
    eposicaoY: TEdit;
    eposicaoX: TEdit;
    Escreve_i2c: TButton;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ler_i2c: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    CheckBox_esteira: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox_guia_placa: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    CheckBox32: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox_CC: TCheckBox;
    CheckBox_CB: TCheckBox;
    CheckBox_CA: TCheckBox;
    CheckBox_Limiador_Placa: TCheckBox;
    CheckBox9: TCheckBox;
    cbposicao: TComboBox;
    eporta: TEdit;
    Edit8: TEdit;
    Elido1: TEdit;
    Elido2: TEdit;
    Elido3: TEdit;
    End1read: TEdit;
    End1write: TEdit;
    End2read: TEdit;
    End2write: TEdit;
    End3read: TEdit;
    end3write: TEdit;
    end4write: TEdit;
    Erec1: TEdit;
    Erec2: TEdit;
    erec3: TEdit;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label9: TLabel;
    MemoSerial: TMemo;
    PageControl1: TPageControl;
    serial: TLazSerial;
    Shape1: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape2: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shpthread2: TShape;
    Shpthread3: TShape;
    Shpthread4: TShape;
    Shpthread1: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    StatusBar1: TStatusBar;
    TabSheet3: TTabSheet;
    Relogio: TTimer;
    Timer1: TTimer;
    procedure alimentacaoTimer(Sender: TObject);
    procedure babrirClick(Sender: TObject);
    procedure baportaClick(Sender: TObject);
    procedure bfecharClick(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);

    procedure Button16Click(Sender: TObject);

    procedure btnStart_1a_6Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);

    procedure Elido1Change(Sender: TObject);
    procedure End1readChange(Sender: TObject);

    procedure Label_STATUS_SENSORClick(Sender: TObject);

    procedure ler_tabelasClick(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure CheckBox25Change(Sender: TObject);
    procedure CheckBox26Change(Sender: TObject);
    procedure CheckBox27Change(Sender: TObject);
    procedure CheckBox28Change(Sender: TObject);
    procedure CheckBox29Change(Sender: TObject);
    procedure CheckBox30Change(Sender: TObject);
    procedure CheckBox31Change(Sender: TObject);
    procedure CheckBox32Change(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure elevador_2Timer(Sender: TObject);
    procedure fechamentoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupBox3Click(Sender: TObject);
    procedure MemoSerialChange(Sender: TObject);
    procedure open_portClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Escreve_i2cClick(Sender: TObject);
    procedure ler_i2cClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure CheckBox10Change(Sender: TObject);
    procedure CheckBox11Change(Sender: TObject);
    procedure CheckBox12Change(Sender: TObject);
    procedure CheckBox13Change(Sender: TObject);
    procedure CheckBox14Change(Sender: TObject);
    procedure CheckBox15Change(Sender: TObject);
    procedure CheckBox16Change(Sender: TObject);
    procedure CheckBox17Change(Sender: TObject);
    procedure CheckBox18Change(Sender: TObject);
    procedure CheckBox19Change(Sender: TObject);
  //  procedure Button9Click(Sender: TObject);
    procedure CheckBox_esteiraChange(Sender: TObject);
   // procedure CheckBox1KeyPress(Sender: TObject; var Key: char);
    procedure CheckBox20Change(Sender: TObject);
    procedure CheckBox21Change(Sender: TObject);
    procedure CheckBox22Change(Sender: TObject);
    procedure CheckBox23Change(Sender: TObject);
    procedure CheckBox24Change(Sender: TObject);
    procedure CheckBox_guia_placaChange(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox_CCChange(Sender: TObject);
    procedure CheckBox_CBChange(Sender: TObject);
    procedure CheckBox_CAChange(Sender: TObject);

    procedure CheckBox_Limiador_PlacaChange(Sender: TObject);

    procedure CheckBox9Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupBox9Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PrecisaoChange(Sender: TObject);
    procedure serialRxData(Sender: TObject);
    procedure Shape1ChangeBounds(Sender: TObject);
    procedure Shape4ChangeBounds(Sender: TObject);
    procedure Shape7ChangeBounds(Sender: TObject);
   // procedure SerialRxData(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
  //  procedure TabSheet2ContextPopup(Sender: TObject; MousePos: TPoint;
  //    var Handled: Boolean);
    procedure TabSheet2Show(Sender: TObject);
  //  procedure TabSheet3ContextPopup(Sender: TObject; MousePos: TPoint;
   //   var Handled: Boolean);
    procedure TabSheet3Enter(Sender: TObject);
    procedure TabSheet3Exit(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
  //  procedure TabSheet3StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure Tempo1Timer(Sender: TObject);
    procedure TestadorTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RelogioTimer(Sender: TObject);
    procedure motorTimeTimer(Sender: TObject);
    procedure tempo2Timer(Sender: TObject);
    procedure ZConnection1AfterConnect(Sender: TObject);
  private
     procedure atualiza_table_entrada(j:integer;modelo:string);
     function get_a_bit(const avalue:cardinal;const bit:byte):boolean;
  public

  end;  //end TForm1 = class(TForm)

const
      PIN_PULSO   : Pchar = '16';
      PIN_DIRECAO : Pchar = '20';
      PIN_ENABLE  : Pchar = '21';

      PIN_ON        : Pchar = '1';
      PIN_OFF       : Pchar = '0';
      OUT_DIRECTION : Pchar = 'out';
      IN_DIRECTION  : Pchar = 'in';


var               //Variáveis Globais
  Form1: TForm1;

  gReturnCode : longint;
  cont_pulsos : longint = 0;

  flag    : integer = 0;
  DEV_IMU : integer;
  quantidades_teclas : integer;

  I2cR1,I2cR2,I2cR3       : integer;
  I2cw1,I2cw2,I2cw3,I2cw4 : integer;

  lido         : array[1..900] of string;
  teclas_vetor : array[1..100] of controle_teclas;


  leds1 : byte = $FF;
  leds2 : byte = $FF;
  leds3 : byte = $FF;
  leds4 : byte = $FF;


  addr : byte;// =$23;
  add1r,add2r,add3r       : byte;
  add1w,add2w,add3w,add4w : byte;

  data    : byte = 255;
  dataI2c : byte;

  dadosI2c_sensor1 : byte = 255;
  dadosI2c_sensor2 : byte = 255;
  dadosI2c_sensor3 : byte = 255;

  CurPos   : integer;
  posicaox : real = 0;
  posicaoy : real = 0;
  posicaoz : real = 0;

  producao,produzido,defeito : string;

  FTempStr : string;
  end1r,end2r,end3r : string;
  end1w,end2w,end3w,end4w : string;
  b_database,b_ip,b_user,b_password : string;

  exnum : longint = 0;
  eynum : longint = 0;
  eznum : longint = 0;
  totalLinhas : integer = 0;

  ib       : integer = 0;
  flag_ok  : boolean = false;
  flag_oka : boolean = false;
  flag_okb : boolean = false;
  flag_okc : boolean = false;

  finalizar : boolean=true;


implementation

{$R *.lfm}


{ TForm1 }
  //-----------------Implementacao da Thread------
constructor th.create(createsuspended:boolean);
begin
     FreeOnTerminate:=true;
     INHeRIted create(createsuspended);
 end;

procedure th.atualizaform;
begin
     form1.btnStart_1a_6.OnClick(self);    //inicia o desmenbramento

     if flag_ok then
      begin
           form1.shpthread1.brush.color:=clgreen;
           Form1.CheckBox4.Checked:=true;
      end
         else
         begin
              Form1.CheckBox4.Checked:=false;
              form1.shpthread1.brush.color:=clyellow;
         end;
end;




procedure th.execute;
begin
  while finalizar = true do
  begin
    Synchronize(@atualizaform);
    flag_ok:= not flag_ok;
 //   form1.btnStart_1a_6.OnClick(self);
    sleep(100);
  end;
end;
 //-----------------------------------------------
 constructor tha.create(createsuspended:boolean);
begin
 FreeOnTerminate:=true;
 INHeRIted create(createsuspended);
 end;

procedure tha.atualizaform;
begin
 if flag_oka then
  begin
  form1.shpthread2.brush.color:=clgreen;
    Form1.CheckBox3.Checked:=true;
  end
 else
    begin
    form1.shpthread2.brush.color:=clyellow;
    Form1.CheckBox3.Checked:=false;
     end;
  end;


procedure tha.execute;
begin
  while finalizar = true do
  begin
    Synchronize(@atualizaform);
    flag_oka:= not flag_oka;
    sleep(500);
  end;
end;
//------------------------------------------------
constructor thb.create(createsuspended:boolean);
begin
 FreeOnTerminate:=true;
 INHeRIted create(createsuspended);
 end;

procedure thb.atualizaform;
begin
 if flag_okb then
   form1.shpthread3.brush.color:=clgreen
 else
   form1.shpthread3.brush.color:=clyellow;

  end;

procedure thb.execute;
begin
  while finalizar = true do
  begin
    Synchronize(@atualizaform);
    flag_okb:= not flag_okb;
    sleep(300);
  end;
end;
//------------------------------------------------
constructor thc.create(createsuspended:boolean);
begin
 FreeOnTerminate:=true;
 INHeRIted create(createsuspended);
 end;

procedure thc.atualizaform;
begin

  if form1.get_a_bit(dadosI2c_sensor1,4) = false then
    Begin
          form1.StatusBar1.Panels[1].text:= 'Minimo Y';
    end;

    if form1.get_a_bit(dadosI2c_sensor1,5) = false then
    Begin
          form1.StatusBar1.Panels[1].text:= 'Maximo Y';
    end;


     if flag_okc then
       form1.shpthread4.brush.color:=clgreen
     else
       form1.shpthread4.brush.color:=clyellow;

end;

procedure thc.execute;
begin
  while finalizar = true do
  begin
    Synchronize(@atualizaform);
    flag_okc:= not flag_okc;
    sleep(100);
  end;

end;

//------------------------------------------------
function tform1.get_a_bit(const avalue:cardinal;const bit:byte):boolean;

begin

Result:= (avalue and (1 shl bit)) <> 0;

end;

function SubStringOccurences(const substring,sourceString:string):boolean;
var
  pex:integer;
  begin
  result:=false;
  pEx:=PosEx(substring,sourcestring,1);
   if pEx <> 0 then
             result:=true
   else
             result:=false;
  end;

function OpenPort(porta,direcao:Pchar):integer;
var
  fileDesc:integer;
  s:string;
begin
try
    fileDesc:=fpopen('/sys/class/gpio/export',O_WrOnly);
    gReturnCode:=fpwrite(fileDesc,porta[0],3);
  finally
    gReturnCode:=fpclose(fileDesc);
  end;
  try
     s:= '/sys/class/gpio/gpio' + porta + '/direction';
    fileDesc:=fpopen(s,O_WrOnly);
     if(direcao = 'in') then
       gReturnCode:=fpwrite(fileDesc,direcao[0],2)
     else
       gReturnCode:=fpwrite(fileDesc,direcao[0],3);
  finally
     gReturnCode:=fpclose(fileDesc);
  end;
end;

function ClosePort(porta:Pchar):integer;
var
  fileDesc:integer;

begin

  try
    fileDesc:=fpopen('/sys/class/gpio/unexport',O_WrOnly);
    gReturnCode:=fpwrite(fileDesc,porta[0],3);
   finally
    gReturnCode:=fpclose(fileDesc);
   end;
end;

function ouport_high(porta:Pchar):integer;
var
 fileDesc:integer;
 s:string;
begin
   try
     s:= '/sys/class/gpio/gpio'+ porta + '/value';
    fileDesc:=fpopen(s,O_WrOnly);
    gReturnCode:=fpwrite(fileDesc,PIN_ON[0],1);

  finally
    gReturnCode:=fpclose(fileDesc);
   end;

end;
function input_port(porta:Pchar):integer;
var
 fileDesc:integer;
 entrada:string[1] = '1';
 s:string;
begin
   try
     s:= '/sys/class/gpio/gpio'+ porta + '/value';
    fileDesc:=fpopen(s,O_RdOnly);
    if fileDesc > 0 then
      begin
    gReturnCode:=fpread(fileDesc,entrada[1],1);
       if (entrada = '1') then
         result := 1
       else
         result := 0;
      end;
  finally
    gReturnCode:=fpclose(fileDesc);
   end;

end;

function ouport_low(porta:Pchar):integer;
 var
 fileDesc:integer;
 s:string;
begin
    try
     s:= '/sys/class/gpio/gpio'+ porta + '/value';
    fileDesc:=fpopen(s,O_WrOnly);
    gReturnCode:=fpwrite(fileDesc,PIN_OFF[0],1);

  finally
    gReturnCode:=fpclose(fileDesc);

  end;

end;



//------------------------------------------------
function EscreveI2c(reg,data:byte):integer;
 var
    buffer : array [1..2] of byte;
    count : integer;
begin
    try
    buffer[1] := reg;
     buffer[2] := data;

     count := fpwrite(I2cw1,buffer,2);
   //  sleep(10);
   //  count := fpwrite(I2cw1,buffer,2);
  //   sleep(10);
    // count := fpwrite(I2cw1,buffer,2);

     except
     if count <> 2 then
              begin

                  form1.StatusBar1.Panels[0].text:= 'Error na escrita: i2cread.txt';
              end
     else
              form1.StatusBar1.Panels[0].text:= 'Error na abertura: i2cread.txt';

     end;
end;

function EscreveI2c_2(reg,data:byte):integer;
 var
    buffer : array [1..2] of byte;
    count : integer;
begin
    try
     buffer[1] := reg;
     buffer[2] := data;

     count := fpwrite(I2cw2,buffer,2);
    // sleep(10);
    // count := fpwrite(I2cw2,buffer,2);
    // sleep(10);
    // count := fpwrite(I2cw2,buffer,2);

     except
     if count <> 2 then
              begin

                  form1.StatusBar1.Panels[0].text:= 'Error na escrita: i2cread.txt';
              end
     else
              form1.StatusBar1.Panels[0].text:= 'Error na abertura: i2cread.txt';

     end;
end;
   function EscreveI2c_3(reg,data:byte):integer;
 var
    buffer : array [1..2] of byte;
    count : integer;
begin
    try
     buffer[1] := reg;
     buffer[2] := data;

     count := fpwrite(I2cw3,buffer,2);
    // sleep(10);
     //count := fpwrite(I2cw3,buffer,2);
   //  sleep(10);
    // count := fpwrite(I2cw3,buffer,2);

     except
     if count <> 2 then
              begin

                  form1.StatusBar1.Panels[0].text:= 'Error na escrita: i2cread.txt';
              end
     else
              form1.StatusBar1.Panels[0].text:= 'Error na abertura: i2cread.txt';

     end;
end;

     function EscreveI2c_4(reg,data:byte):integer;
 var
    buffer : array [1..2] of byte;
    count : integer;
begin
    try
     buffer[1] := reg;
     buffer[2] := data;

     count := fpwrite(I2cw4,buffer,2);
   //  sleep(10);
 ////    count := fpwrite(I2cw4,buffer,2);
   //  sleep(10);
   //  count := fpwrite(I2cw4,buffer,2);

     except
     if count <> 2 then
              begin

                  form1.StatusBar1.Panels[0].text:= 'Error na escrita: i2cread.txt';
              end
     else
              form1.StatusBar1.Panels[0].text:= 'Error na abertura: i2cread.txt';

     end;
end;

function desliga_1(l:integer):integer;
begin
   if(l = 1) then
        leds1:=leds1 or 1; //0b1111 1110
   if(l = 2) then
        leds1:=leds1 or 2; //0b1111 1110
   if(l = 3) then
        leds1:=leds1 or 4; //0b1111 1110
   if(l = 4) then
        leds1:=leds1 or 8; //0b1111 1110
   if(l = 5) then
        leds1:=leds1 or 16; //0b1111 1110
   if(l = 6) then
        leds1:=leds1 or 32; //0b1111 1110
   if(l = 7) then
        leds1:=leds1 or 64; //0b1111 1110
   if(l = 8) then
        leds1:=leds1 or 128; //0b1111 1110

 //  writebytePlaca1($ff,leds);
   EscreveI2c($ff,leds1);

end;

function liga_1(l:integer):integer;
begin

  if(l = 1) then
        leds1:=leds1 and $FE; //0b1111 1110
   if(l = 2) then
        leds1:=leds1 and $FD; //0b1111 1101
   if(l = 3) then
        leds1:=leds1 and $FB; //0b1111 1011
   if(l = 4) then
        leds1:=leds1 and $F7; //0b1111 0111
   if(l = 5) then
        leds1:=leds1 and $EF; //0b1110 1111
   if(l = 6) then
        leds1:=leds1 and $DF; //0b1101 1111
   if(l = 7) then
        leds1:=leds1 and $BF; //0b1011 1111
   if(l = 8) then
        leds1:=leds1 and $7F; //0b0111 1111

   EscreveI2c($ff,leds1);

end;

function lersensorp1(l:integer):integer;
var
   flag:boolean;
   count:integer;
begin

    flag:=true;
   repeat
       count := fpread(I2cR1,dataI2C,l);
       sleep(1);
       flag := form1.get_a_bit(dataI2c,l-1);
       form1.StatusBar1.Panels[1].text:= 'Aguarde sensor ' + IntToStr(l);
   until (flag = false);

end;

function lersensorp2(l:integer):integer;
var
   flag:boolean;
   count:integer;
begin

    flag:=true;
   repeat
       count := fpread(I2cR2,dataI2C,l);
       sleep(1);
       flag := form1.get_a_bit(dataI2c,l-1);
       form1.StatusBar1.Panels[1].text:= 'Aguarde sensor ' + IntToStr(l);
   until (flag = false);

end;

function desliga_2(l:integer):integer;
begin
   if(l = 1) then
        leds2:=leds2 or 1; //0b1111 1110
   if(l = 2) then
        leds2:=leds2 or 2; //0b1111 1110
   if(l = 3) then
        leds2:=leds2 or 4; //0b1111 1110
   if(l = 4) then
        leds2:=leds2 or 8; //0b1111 1110
   if(l = 5) then
        leds2:=leds2 or 16; //0b1111 1110
   if(l = 6) then
        leds2:=leds2 or 32; //0b1111 1110
   if(l = 7) then
        leds2:=leds2 or 64; //0b1111 1110
   if(l = 8) then
        leds2:=leds2 or 128; //0b1111 1110

 //  writebytePlaca1($ff,leds);
   EscreveI2c_2($ff,leds2);

end;

function liga_2(l:integer):integer;
begin

  if(l = 1) then
        leds2:=leds2 and $FE; //0b1111 1110
   if(l = 2) then
        leds2:=leds2 and $FD; //0b1111 1101
   if(l = 3) then
        leds2:=leds2 and $FB; //0b1111 1011
   if(l = 4) then
        leds2:=leds2 and $F7; //0b1111 0111
   if(l = 5) then
        leds2:=leds2 and $EF; //0b1110 1111
   if(l = 6) then
        leds2:=leds2 and $DF; //0b1101 1111
   if(l = 7) then
        leds2:=leds2 and $BF; //0b1011 1111
   if(l = 8) then
        leds2:=leds2 and $7F; //0b0111 1111

   EscreveI2c_2($ff,leds2);

end;
  function desliga_3(l:integer):integer;
begin
   if(l = 1) then
        leds3:=leds3 or 1; //0b1111 1110
   if(l = 2) then
        leds3:=leds3 or 2; //0b1111 1110
   if(l = 3) then
        leds3:=leds3 or 4; //0b1111 1110
   if(l = 4) then
        leds3:=leds3 or 8; //0b1111 1110
   if(l = 5) then
        leds3:=leds3 or 16; //0b1111 1110          3
   if(l = 6) then
        leds3:=leds3 or 32; //0b1111 1110
   if(l = 7) then
        leds3:=leds3 or 64; //0b1111 1110
   if(l = 8) then
        leds3:=leds3 or 128; //0b1111 1110

 //  writebytePlaca1($ff,leds);
   EscreveI2c_3($ff,leds3);

end;

function liga_3(l:integer):integer;
begin

  if(l = 1) then
        leds3:=leds3 and $FE; //0b1111 1110
   if(l = 2) then
        leds3:=leds3 and $FD; //0b1111 1101
   if(l = 3) then
        leds3:=leds3 and $FB; //0b1111 1011
   if(l = 4) then
        leds3:=leds3 and $F7; //0b1111 0111
   if(l = 5) then
        leds3:=leds3 and $EF; //0b1110 1111
   if(l = 6) then
        leds3:=leds3 and $DF; //0b1101 1111
   if(l = 7) then
        leds3:=leds3 and $BF; //0b1011 1111
   if(l = 8) then
        leds3:=leds3 and $7F; //0b0111 1111

   EscreveI2c_3($ff,leds3);

end;
//------------------------------------------------------------------------------
  function desliga_4(l:integer):integer;
begin
   if(l = 1) then
        leds4:=leds4 or 1; //0b1111 1110
   if(l = 2) then
        leds4:=leds4 or 2; //0b1111 1110
   if(l = 3) then
        leds4:=leds4 or 4; //0b1111 1110
   if(l = 4) then
        leds4:=leds4 or 8; //0b1111 1110
   if(l = 5) then
        leds4:=leds4 or 16; //0b1111 1110          3
   if(l = 6) then
        leds4:=leds4 or 32; //0b1111 1110
   if(l = 7) then
        leds4:=leds4 or 64; //0b1111 1110
   if(l = 8) then
        leds4:=leds4 or 128; //0b1111 1110

 //  writebytePlaca1($ff,leds);
   EscreveI2c_4($ff,leds4);

end;

function liga_4(l:integer):integer;
begin

  if(l = 1) then
        leds4:=leds4 and $FE; //0b1111 1110
   if(l = 2) then
        leds4:=leds4 and $FD; //0b1111 1101
   if(l = 3) then
        leds4:=leds4 and $FB; //0b1111 1011
   if(l = 4) then
        leds4:=leds4 and $F7; //0b1111 0111
   if(l = 5) then
        leds4:=leds4 and $EF; //0b1110 1111
   if(l = 6) then
        leds4:=leds4 and $DF; //0b1101 1111
   if(l = 7) then
        leds4:=leds4 and $BF; //0b1011 1111
   if(l = 8) then
        leds4:=leds4 and $7F; //0b0111 1111

   EscreveI2c_4($ff,leds4);

end;
//-----------------------------------------------------------------------------

function move_eixo_x(l:integer):integer;
begin
    if l > 0 then
       form1.serial.writeData('G91 X' + IntToStr(l))
    else
       form1.serial.writeData('G91 X' + IntToStr(l));
    sleep(100);

end;
function move_eixo_y(l:integer):integer;
begin
    if l > 0 then
       form1.serial.writeData('G91 Y' + IntToStr(l))
    else
       form1.serial.writeData('G91 Y' + IntToStr(l));
    sleep(100);

end;
function move_eixo_z(l:integer):integer;
begin
    if l > 0 then
       form1.serial.writeData('G91 Z' + IntToStr(l))
    else
       form1.serial.writeData('G91 Z' + IntToStr(l));
    sleep(100);

end;

function comando(f:string;arg:string):integer;
begin
 if f = 'inicio' then
   begin
     //form1.Memo1.lines.Add('Inicio');
   end
 else

 if f = 'lersensor_p1' then
    begin
        lersensorp1(StrToInt(arg));
    end
 else

 if f = 'lersensor_p2' then
    begin
        lersensorp2(StrToInt(arg));
    end
 else
  if f = 'liga_valvula_p1' then
   begin

      liga_1(StrToInt(arg));

   end
 else
 if f = 'desliga_valvula_p1' then
   begin

      desliga_2(StrToInt(arg));
   end
 else
  if f = 'liga_valvula_p2' then
   begin

      liga_2(StrToInt(arg));

   end
 else
 if f = 'desliga_valvula_p2' then
   begin

      desliga_2(StrToInt(arg));
   end
 else
  if f = 'liga_valvula_p3' then
   begin

      liga_3(StrToInt(arg));

   end
 else
 if f = 'desliga_valvula_p3' then
   begin

      desliga_3(StrToInt(arg));
   end
 else
 if f = 'movex' then
   begin
        move_eixo_x(StrToInt(arg));
   end
 else
 if f = 'movey' then
   begin
      move_eixo_y(StrToInt(arg));
   end
 else
 if f = 'movez' then
   begin
      move_eixo_z(StrToInt(arg));
   end
 else

  if f = 'atraso' then
   begin
     sleep(StrToInt(arg));
   end
 else
    begin
     form1.StatusBar1.Panels[1].text:= 'Função não definida!'
    end;



end;



function executa(s:string;tka:char;tkd:char):integer;
var
 mago:string;
 info:string;
 arg:string ;
begin
   mago:= copy(s,1,Pos(tka,S)-1);
   info:= copy(s,Pos(tka,S)+1,Length(s)-Pos(tka,s));
   arg:= copy(info,1,Pos(tkd,info)-1);

  // form1.memo1.lines.add(' >'+ mago + ' >' + arg);

   comando(mago,arg);
   //form1.memo1.lines.add('Func: '+ mago +' Arg: ' + arg);

end;

procedure lerarquivoProducao();
  var
  arq1:Textfile;
  begin
   assignFile(arq1,'producao.txt');
   Reset(arq1);
   if IOResult <> 0 then
       form1.StatusBar1.Panels[0].text:= 'Error na abertura: producao.txt'
   else
     begin
       while (not eof(arq1)) do
         begin
            readln(arq1,producao);
            readln(arq1,produzido);
            readln(arq1,defeito);


         end;
       closefile(arq1);

    end;
 end;

//procedure Delay(dwmillisecunds:LongInt);
//
//var
//i:longint;
////atickCount:Qword;//Dword;
//begin
////AtickCount:= gettickCount64 + dwmillisecunds;
//
// i:=1;
// dwmillisecunds:=dwmillisecunds * 100;
// while i > dwmillisecunds  do
//   begin
//       Application.ProcessMessages;
//       Application.ProcessMessages;
//       inc(i);
//
// //while atickCount > GetTickCount64 do
//  //   Application.ProcessMessages;
//   end;
//
////sleep(dwmillisecunds);
//
//end;

procedure lerarquivosI2c();
var
arq1,arq2:Textfile;
begin
        try
 assignFile(arq1,'i2cread.txt');
 Reset(arq1);
 if IOResult <> 0 then
     form1.StatusBar1.Panels[0].text:= 'Error na abertura: i2cread.txt'
 else
   begin
     while (not eof(arq1)) do
       begin
          readln(arq1,end1r);
          readln(arq1,end2r);
          readln(arq1,end3r);


       end;
     closefile(arq1);

  end;
//----------------------------------------
 assignFile(arq2,'i2cwrite.txt');
  Reset(arq2);
  if IOResult <> 0 then
      form1.StatusBar1.Panels[0].text:= 'Error na abertura: i2cwrite.txt'
  else
    begin
      while (not eof(arq2)) do
        begin
           readln(arq2,End1w);
           readln(arq2,End2w);
           readln(arq2,End3w);
              readln(arq2,End4w);
        end;
      closefile(arq2);

   end;

  //----------------------------------------
   assignFile(arq2,'banco.txt');
    Reset(arq2);
    if IOResult <> 0 then
        form1.StatusBar1.Panels[0].text:= 'Error na abertura: i2cwrite.txt'
    else
      begin
        while (not eof(arq2)) do
          begin
             readln(arq2,b_database);
             readln(arq2,b_ip);
             readln(arq2,b_user);
             readln(arq2,b_password);


          end;
        closefile(arq2);

     end;
        except
            form1.StatusBar1.Panels[0].text:= 'Error na abertura de Arquivos'
        end;

end;

Procedure InitI2cDevice();
//const
 // p : PChar;     //Characters to sent 8=RAM Register 9=Value
  //I2C_SLAVE = 1795;     //?? Got 1795 from C-Funtcion

     var
   count : integer;
   data: byte;
   reg : byte;
   iwf,iio : integer;
begin
  DEV_IMU:= fpopen('/dev/i2c-1',O_RDWR);
  if DEV_IMU= -1 then begin
             // we couldn’t open the bus
              exit;
              end
else
 begin
   // associate this handle with an address on the bus
   // addr:=$21;
    iwf:=fpioCTL(DEV_IMU,1795, pointer(addr));
    //Ecomando.text:= IntToStr(iwf);
   // form1.memo1.lines.add(IntToStr(iwf));

 end;
end;

Procedure InitI2cDevice1();

     var
   count : integer;
   data: byte;
   reg : byte;
   iwf,iio : integer;
begin
  I2cr1:= fpopen('/dev/i2c-1',O_RDWR);
  if I2cr1= -1 then begin
             // we couldn’t open the bus
              exit;
              end
else
 begin
    iwf:=fpioCTL(I2cr1,1795, pointer(add1r));
 end;
end;
 Procedure InitI2cDevice2();

     var
   count : integer;
   data: byte;
   reg : byte;
   iwf,iio : integer;
begin
  I2cr2:= fpopen('/dev/i2c-1',O_RDWR);
  if I2cr2= -1 then begin
             // we couldn’t open the bus
              exit;
              end
else
 begin
    iwf:=fpioCTL(I2cr2,1795, pointer(add2r));
 end;
end;

 Procedure InitI2cDevice3();

     var
   count : integer;
   data: byte;
   reg : byte;
   iwf,iio : integer;
begin
  I2cr3:= fpopen('/dev/i2c-1',O_RDWR);
  if I2cr3= -1 then begin
             // we couldn’t open the bus
              exit;
              end
else
 begin
    iwf:=fpioCTL(I2cr3,1795, pointer(add3r));
 end;
end;

 Procedure InitI2cDevice4();

      var
    count : integer;
    data: byte;
    reg : byte;
    iwf,iio : integer;
 begin
   I2cw1:= fpopen('/dev/i2c-1',O_RDWR);
   if I2cw1= -1 then begin
              // we couldn’t open the bus
               exit;
               end
 else
  begin
     iwf:=fpioCTL(I2cw1,1795, pointer(add1w));
  end;
 end;

 Procedure InitI2cDevice5();

       var
     count : integer;
     data: byte;
     reg : byte;
     iwf,iio : integer;
  begin
    I2cw2:= fpopen('/dev/i2c-1',O_RDWR);
    if I2cw2= -1 then begin
               // we couldn’t open the bus
                exit;
                end
  else
   begin
      iwf:=fpioCTL(I2cw2,1795, pointer(add2w));
   end;
  end;

 Procedure InitI2cDevice6();

       var
     count : integer;
     data: byte;
     reg : byte;
     iwf,iio : integer;
  begin
    I2cw3:= fpopen('/dev/i2c-1',O_RDWR);
    if I2cw3= -1 then begin
               // we couldn’t open the bus
                exit;
                end
  else
   begin
      iwf:=fpioCTL(I2cw3,1795, pointer(add3w));
   end;
  end;

  Procedure InitI2cDevice7();

       var
     count : integer;
     data: byte;
     reg : byte;
     iwf,iio : integer;
  begin
    I2cw4:= fpopen('/dev/i2c-1',O_RDWR);
    if I2cw4= -1 then begin
               // we couldn’t open the bus
                exit;
                end
  else
   begin
      iwf:=fpioCTL(I2cw4,1795, pointer(add4w));
   end;
  end;

function HexToInt(Hexadecimal:String):integer;
begin
  result:= StrToInt('$'+Hexadecimal);
end;

function readbyte2(reg:word):word;
 var
    count : integer;
    data : byte;
begin

     count := fpread(I2cR2,data,1);
    form1.elido2.text:= IntToStr(data);
       dadosI2c_sensor2:= data;


     if data = 254 then
              form1.shape16.brush.color:=clgreen
     else
             form1.shape16.brush.color:=clGray;
     if data = 253 then
              form1.shape15.brush.color:=clgreen
      else
             form1.shape15.brush.color:=clGray;
     if data = 251 then
              form1.shape14.brush.color:=clgreen
      else
             form1.shape14.brush.color:=clGray;
     if data = 247 then
              form1.shape13.brush.color:=clgreen
      else
             form1.shape13.brush.color:=clGray;
     if data = 239 then
              form1.shape12.brush.color:=clgreen
      else
             form1.shape12.brush.color:=clGray;
     if data = 223 then
              form1.shape11.brush.color:=clgreen
      else
             form1.shape11.brush.color:=clGray;
     if data = 191 then
              form1.shape10.brush.color:=clgreen
      else
             form1.shape10.brush.color:=clGray;
     if data = 127 then
              form1.shape9.brush.color:=clgreen
      else
             form1.shape9.brush.color:=clGray;

     if count =0 then begin
              // nothing came back
              exit;
              end
  else result := data;
end;

function readbyte3(reg:word):word;
 var
    count : integer;
    data : byte;
begin

     count := fpread(I2cR3,data,1);
     form1.elido3.text:=IntToStr(data);
     dadosI2c_sensor3:= data;


     if data = 254 then
              form1.shape24.brush.color:=clgreen
     else
             form1.shape24.brush.color:=clGray;
     if data = 253 then
              form1.shape23.brush.color:=clgreen
      else
             form1.shape23.brush.color:=clGray;
     if data = 251 then
              form1.shape22.brush.color:=clgreen
      else
             form1.shape22.brush.color:=clGray;
     if data = 247 then
              form1.shape21.brush.color:=clgreen
      else
             form1.shape21.brush.color:=clGray;
     if data = 239 then
              form1.shape20.brush.color:=clgreen
      else
             form1.shape20.brush.color:=clGray;
     if data = 223 then
              form1.shape19.brush.color:=clgreen
      else
             form1.shape19.brush.color:=clGray;
     if data = 191 then
              form1.shape18.brush.color:=clgreen
      else
             form1.shape18.brush.color:=clGray;
     if data = 127 then
              form1.shape17.brush.color:=clgreen
      else
             form1.shape17.brush.color:=clGray;

     if count =0 then begin
              // nothing came back
              exit;
              end
  else result := data;
end;

function readbyte(reg:word):word;
var
    count : integer;
   // data : byte;
    i:byte=255;
begin

     count := fpread(I2cR1,data,1);
     form1.elido1.text:=IntToStr(data);
       dadosI2c_sensor1:= data;

     for i:=1 to 8 do
     begin

          if i = 1 then
          begin
          if form1.get_a_bit(data,i) = true then
            form1.shape1.brush.color:=clgreen
          else
            form1.shape1.brush.color:=clgray;
          end;

          if i = 2 then
          begin
          if form1.get_a_bit(data,i) = true then
            form1.shape2.brush.color:=clgreen
          else
            form1.shape2.brush.color:=clgray;
          end;

        if i = 3 then
          begin
          if form1.get_a_bit(data,i) = true then
            form1.shape3.brush.color:=clgreen
          else
            form1.shape3.brush.color:=clgray;
          end;

        if i = 4 then          //bit 4 --> sensor óptico
          begin
          if form1.get_a_bit(data,i) = true then    //não tem placa
             begin
                 form1.shape4.brush.color:=clgreen;
               //form1.Label_STATUS_SENSOR.Caption:= '<< SEM PLACA >>'
            end

          else                                      //tem placa
              begin
                   form1.shape4.brush.color:=clgray;
            //       form1.Label_STATUS_SENSOR.Caption:= '<< COM PLACA >>';
              //    form1.btnStart_1a_6.OnClick(self);

              end
          end;

          if i = 5 then
          begin
          if form1.get_a_bit(data,i) = true then
            form1.shape5.brush.color:=clgreen
          else
            form1.shape5.brush.color:=clgray;
          end;

        if i = 6 then
          begin
          if form1.get_a_bit(data,i) = true then
            form1.shape6.brush.color:=clgreen
          else
            form1.shape6.brush.color:=clgray;
          end;

         if i = 7 then
          begin
          if form1.get_a_bit(data,i) = true then
            form1.shape7.brush.color:=clgreen
          else
            form1.shape7.brush.color:=clgray;
          end;

        if i = 8 then
          begin
          if form1.get_a_bit(data,i) = true then
            form1.shape8.brush.color:=clgreen
          else
            form1.shape8.brush.color:=clgray;
          end;


     end;




end;

procedure I2c_write();
 var
      buffer : array [1..2] of byte;
    count:integer;
    reg:byte= $FF;
 begin
     buffer[1] := reg;
     buffer[2] :=leds1;
     count := fpwrite(I2cw1,buffer,2);
     count := fpwrite(I2cw1,buffer,2);
     count := fpwrite(I2cw1,buffer,2);

   //  sleep(10);
   // count := fpwrite(I2cw1,buffer,2);
   //  sleep(10);
   //  count := fpwrite(I2cw1,buffer,2);

     buffer[1] := reg;
     buffer[2] := leds2;
     count := fpwrite(I2cw2,buffer,2);
    // sleep(10);
    // count := fpwrite(I2cw2,buffer,2);
    // sleep(10);
    // count := fpwrite(I2cw2,buffer,2);

     buffer[1] := reg;
     buffer[2] := leds3;
     count := fpwrite(I2cw3,buffer,2);
     sleep(10);
   //  count := fpwrite(I2cw3,buffer,2);
   //  sleep(10);
    /// count := fpwrite(I2cw3,buffer,2);


     buffer[1] := reg;
     buffer[2] := leds4;
     count := fpwrite(I2cw4,buffer,2);
     sleep(10);

end;

procedure writebytePlaca1(reg,data:byte);

begin

    leds1:=data;
    i2c_write();


end;

procedure writebytePlaca2(reg,data:byte);

begin
  leds2:=data;
 i2c_write();

end;
 procedure writebytePlaca3(reg,data:byte);

begin
  leds3:=data;
   i2c_write();


end;

 procedure writebytePlaca4(reg,data:byte);

 begin
   leds4:=data;
    i2c_write();


 end;

procedure motor_avanco(j:integer;x:real;y:real;z:real);
begin

  // serial.WriteData('X 0 ' + floatToStr(x) +  chr(10));
 //  serial.WriteData('Y 0 ' + floatToStr(y) +  chr(10));
  // serial.WriteData('X 0 ' + floatToStr(z) +  chr(10));

 form1.MemoSerial.Lines.add(IntToStr(j) + '-> '+ FloatToStr(x) +' ' + FloatToStr(y) + ' ' + FloatToStr(z));


end;

procedure Tform1.atualiza_table_entrada(j:integer;modelo:string);
  begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 //Close;
// finalizar:=true;
   fpclose(I2cR1);
     fpclose(I2cR2);
       fpclose(I2cR3);
         fpclose(I2cw1);
           fpclose(I2cw2);
            fpclose(I2cw3);
             fpclose(I2cw4);

            // ZConnection1.Connected:=false;
 application.Terminate;
end;

//-----------(INICIO)-SUB-ROTINA PARA GERAÇÃO DE DELAY--------------------------

procedure delay(dt : DWORD);   //cria uma sub-rotina para gerar DELAY

  var tc :DWORD;
 begin
      tc := GetTickCount64;
      while(GetTickCount64 < tc + dt) and (not Application.Terminated) do
      Application.ProcessMessages;
 end;

//-----------(FIM)-SUB-ROTINA PARA GERAÇÃO DE DELAY-----------------------------


procedure TForm1.Button20Click(Sender: TObject);
begin
  CheckBox_esteira.Checked:=True;   //habilita a esteira


{testa leitura do sensor óptico}

  //if form1.get_a_bit(data,4) = true then
  //   CheckBox_esteira.Checked:= true         // não tem placa!  e esteira continua funcionando!
  //   else
  //
  //     if form1.get_a_bit(data,4) = false then
  //
  //    CheckBox_esteira.Checked:= false;        // tem placa!   e esteira PARA!


{end - testa leitura do sensor óptico}



end;

procedure TForm1.Button21Click(Sender: TObject);
 var
     t:th;
     a:tha;
     b:thb;
     c:thc;


     { [BEGIN] procedimento_para utilzar com SENSOR Ótico - LARISSA}

    //procedure Start_Sensor_Optico;
    //
    //begin
    //     if form1.get_a_bit(dadosI2c_sensor1,4) = false then
    //     Begin
    //          CheckBox_CB.Checked := true ;
    //     end;
    //
    //end;
    { [END] procedimento_para utilzar com SENSOR Ótico - LARISSA}


 begin

 // ZConnection1.Database:=edit2.text;
 // ZConnection1.HostName:=edit3.text;
 // ZConnection1.User:=edit4.Text;
 // ZConnection1.Password:=edit5.text;

 // ZConnection1.Connected:=true;


 //ler_tabelasClick(self);

   escreve_i2cClick(self);
   ler_i2cClick(self);

       t:=th.create(true);
       t.start;
       a:=tha.create(true);
       a.start;
       b:=thb.create(true);
       b.start;
       c:=thc.create(true);
       c.start;




       //insira o seu coadigo
           //vá oaraa a poisição hoMe
           serial.WriteData('Y 1 10.0' + chr(10));
           //delay(10);
           btnStart_1a_6.OnClick(self);
  try

   serial.Device:= eporta.text;
  serial.Open;
  serial.Active:=true;



     //vá para a poisição hoMe (sentido de recuo = 1)
       serial.WriteData('Y 1 10.0' + chr(10));
       btnStart_1a_6.OnClick(self);

   except
      StatusBar1.Panels[1].Text:= 'Porta USB ' + eporta.Text + ' Error';

  end;


    end;

procedure TForm1.Button22Click(Sender: TObject);
begin
 MemoSerial.clear;
end;

procedure TForm1.Button23Click(Sender: TObject);
var
t:th;
begin

     serial.WriteData('Y 0 0.74' + chr(10));     //POSIÇÃO 4
    // t:=th.create(true);
     //t.start;
   end;

procedure TForm1.Button24Click(Sender: TObject);
begin
  serial.WriteData('Y 0 0.74' + chr(10));     //POSIÇÃO 5
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
          serial.WriteData('Y 0 0.74' + chr(10));     //POSIÇÃO 6
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
  CheckBox_Limiador_Placa.Checked:=true;
end;

procedure TForm1.Button28Click(Sender: TObject);
begin

end;

procedure TForm1.Button29Click(Sender: TObject);
begin


end;

procedure TForm1.babrirClick(Sender: TObject);
begin

end;

procedure TForm1.alimentacaoTimer(Sender: TObject);
begin
end;

procedure TForm1.baportaClick(Sender: TObject);
begin

end;

//procedure TForm1.baportaClick(Sender: TObject);
//begin
//
//end;

procedure TForm1.bfecharClick(Sender: TObject);
begin
     //babrir.Enabled:=true;
  //bfechar.Enabled:=false;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  posicaoz:=posicaoz + StrTofloat(cbposicao.Text);
eposicaoz.text:= format('%2.3f',[posicaoz]);

serial.WriteData('Z 1 ' + cbposicao.text + chr(10));
MemoSerial.lines.Add('Z 1 ' + FloatToStr(posicaoz) +  chr(10));
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
 posicaoz:=posicaoz + StrTofloat(cbposicao.Text);
eposicaoz.text:= format('%2.3f',[posicaoz]);

serial.WriteData('Z 0 ' + cbposicao.text + chr(10));
MemoSerial.lines.Add('Z 0 ' + FloatToStr(posicaoz) +  chr(10));

end;

procedure TForm1.Button12Click(Sender: TObject);
begin
 eposicaox.text:='0';
 posicaox:=0;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
   eposicaoy.text:='0';
   posicaoy:=0;
 end;

procedure TForm1.Button14Click(Sender: TObject);
begin
   eposicaoz.text:='0';
   posicaoz:=0;
  end;

procedure TForm1.Button15Click(Sender: TObject);
begin
if serial.Active = true then
       serial.WriteData(edit1.Text + chr(10));
  end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  //CheckBox3.Checked:=true;

  serial.WriteData('Y 0 0.900' + chr(10));     //POSIÇÃO 3                                                                                   //serial.WriteData('Y 0 3.30' + chr(10));     // avança 3.30 em Y

end;



Procedure Estado_inicial_solenoides;

 begin

      form1.CheckBox_Limiador_Placa.Checked:=false;                //DESENERGIZA PISTAO LIMITADOR DE PLACA
       delay(500);                             //ESPERA 0.5 SEGUNDOS
       form1.CheckBox_CB.Checked:=false;             //DESABILITA O CILINDRO B (MEIO)
     delay(500);                              // ESPERA DE 0.5S
     form1.CheckBox_CC.Checked:=false;              // HABILITA O CILINDRO C (SAÍDA)
     delay(500);                              // ESPERA 1 S
     form1.CheckBox_CA.Checked:=false;              // HABILITA CILINDRO A (Entrada)
     delay(500);
 end;



 function delay(dt : DWORD):integer;   //cria uma sub-rotina para gerar DELAY
  //var tc :DWORD;
 begin
      //tc := GetTickCount64;
      //while(GetTickCount64 < tc + dt) and (not Application.Terminated) do
      //Application.ProcessMessages;
     //sleep(dt);
 end;

procedure TForm1.btnStart_1a_6Click(Sender: TObject); //  EVENTO botao Start 1 a 6
begin // botao Start 1 a 6
//-----------(INICIO)-PRIMEIRA QUEBRA DO PROCESSO (BORDAS)----------------------


if form1.get_a_bit(data,4) = false then    // tem placa
begin

     form1.Label_STATUS_SENSOR.Caption:= '<< COM PLACA >>';

   //repeat
   //     begin
   //          CheckBox_esteira.Checked:=true;   //mantém a esteira ligada até que
   //                                          //o sensor não detecte mais a placa
   //     end;
   //until(form1.get_a_bit(data,4) = true); //sensor não detecta mais a placa
//end;

delay(6000);
CheckBox_esteira.Checked:=false;
delay(500);
 CheckBox_Limiador_Placa.Checked:= true;
 delay(500);

     CheckBox_guia_placa.Checked:=true;           //ENERGIZA PISTAO DA GUIA DA PLACA
     serial.WriteData('Y 0 2.780' + chr(10));      //VAI PARA POSIÇÃO 2
     delay(3000);                                //ESPERA 2 SEGUNDOS
     serial.WriteData('Y 1 2.0' + chr(10));     //VOLTA MOTOR PARA POSIÇÃO INICIAL para não bater com o cilindro do meio
     delay(2000);
     CheckBox_CB.Checked:=true;                  //HABILITA O CILINDRO B (MEIO)
     delay(1000);                              // ESPERA DE 1S
     CheckBox_Limiador_Placa.Checked:=false;                   // DESABILITA PISTÃO LIMITADOR
      delay(500);
     CheckBox_CC.Checked:=true;                // HABILITA O CILINDRO C (SAÍDA)
     delay(500);                              // ESPERA 1 S
     CheckBox_CA.Checked:=true;                // HABILITA CILINDRO A (Entrada)

//-----------(FIM)-PRIMEIRA QUEBRA DO PROCESSO (BORDAS)-------------------------


   Estado_inicial_solenoides;   // DESENERIZÇÃO DAS SOLENOIDES


//-----------(INICIO)-SEGUNDA QUEBRA DO PROCESSO---(LIBERA PRIMEIRO CONTROLE)---


     serial.WriteData('Y 0 2.95' + chr(10));     //VAI PARA POSIÇÃO 3  [3.73]
     delay(3000);                                //ESPERA 1 SEGUNDO

     CheckBox_CB.Checked:=true;                  //HABILITA O CILINDRO B (MEIO)
     delay(1000);                              // ESPERA DE 0.5S

     CheckBox_CC.Checked:=true;                // HABILITA O CILINDRO C (SAÍDA)
     delay(500);                              // ESPERA 1 S



//-----------(FIM)-SEGUNDA QUEBRA DO PROCESSO (LIBERA PRIMEIRO CONTROLE)--------

  Estado_inicial_solenoides;   // DESENERIZÇÃO DAS SOLENOIDES


//-----------(INICIO)-TERCEIRA QUEBRA DO PROCESSO-(LIBERA SEGUNDO CONTROLE)-----


     serial.WriteData('Y 0 0.710' + chr(10));     //VAI PARA POSIÇÃO 3
     delay(3000);                                //ESPERA 1.5 SEGUNDO

     CheckBox_CB.Checked:=true;                  //HABILITA O CILINDRO B (MEIO)
     delay(1000);                              // ESPERA DE 1S

     CheckBox_CC.Checked:=true;                // HABILITA O CILINDRO C (SAÍDA)
     delay(500);                              // ESPERA 0.5S



//-----------(FIM)-TERCEIRA QUEBRA DO PROCESSO---(LIBERA SEGUNDO CONTROLE)------

 Estado_inicial_solenoides;   // DESENERIZÇÃO DAS SOLENOIDES


 //-----------(INICIO)- QUARTA QUEBRA DO PROCESSO-(LIBERA A JUNÇÃO)-------------


     serial.WriteData('Y 0 0.740' + chr(10));     //VAI PARA POSIÇÃO 4
     delay(3000);                                //ESPERA 1.5 SEGUNDO

     CheckBox_CB.Checked:=true;                  //HABILITA O CILINDRO B (MEIO)
     delay(1000);                              // ESPERA DE 1S

     CheckBox_CC.Checked:=true;                // HABILITA O CILINDRO C (SAÍDA)
     delay(500);                              // ESPERA 0.5S



//-----------(FIM)-QUARTA QUEBRA DO PROCESSO---(LIBERA A JUNÇÃO)----------------


 Estado_inicial_solenoides;   // DESENERIZÇÃO DAS SOLENOIDES


//-----------(INICIO)- QUINTA QUEBRA DO PROCESSO-(LIBERA O TERCEIRO CONTROLE )--


      serial.WriteData('Y 0 0.120' + chr(10));     //VAI PARA POSIÇÃO 5
      delay(3000);                                //ESPERA 1.5 SEGUNDO

      CheckBox_CB.Checked:=true;                  //HABILITA O CILINDRO B (MEIO)
      delay(1000);                              // ESPERA DE 1S

      CheckBox_CC.Checked:=true;                // HABILITA O CILINDRO C (SAÍDA)
      delay(500);                              // ESPERA 0.5S



 //-----------(FIM)-QUINTA QUEBRA DO PROCESSO---(LIBERA O  TERCEIRO CONTROLE)---

  Estado_inicial_solenoides;   // DESENERIZÇÃO DAS SOLENOIDES

 //-----------(INICIO)- SEXTA QUEBRA DO PROCESSO-(LIBERA O QUARTO CONTROLE )---


        serial.WriteData('Y 0 0.730' + chr(10));     //VAI PARA POSIÇÃO 6
        delay(3000);                                //ESPERA 1.5 SEGUNDO

        CheckBox_CB.Checked:=true;                  //HABILITA O CILINDRO B (MEIO)
        delay(1000);                              // ESPERA DE 1S

        CheckBox_CC.Checked:=true;                // HABILITA O CILINDRO C (SAÍDA)
        delay(500);                              // ESPERA 0.5S



//-----------(FIM)-QUINTA QUEBRA DO PROCESSO---(LIBERA O QUARTO CONTROLE)----

  Estado_inicial_solenoides;   // DESENERIZÇÃO DAS SOLENOIDES


//-----------(INICIO)- "SEXTA QUEBRA" DO PROCESSO-(EMPURRA O QUINTO CONTROLE )---


        serial.WriteData('Y 0 0.74' + chr(10));     //VAI PARA POSIÇÃO 6
        delay(3000);                                //ESPERA 1.5 SEGUNDO


//-----------(FIM)- "SEXTA QUEBRA" DO PROCESSO---(EMPURRA O QUINTO CONTROLE)----



   serial.WriteData('Y 1 10.0' + chr(10)); //RETORNA O MOTOR PRA POSIÇÃO INICIAL
   //delay(600);

   CheckBox_guia_placa.Checked:=false;
   delay(600);


   delay(3000);
   CheckBox_esteira.Checked:=true;

 end    //form1.get_a_bit(data,4) = false then    // tem placa
 else
 begin
      form1.Label_STATUS_SENSOR.Caption:= '<< SEM PLACA >>';
      //motor esteira ligado!!!
      CheckBox_esteira.Checked:=true;
 end;

end;  // botao Start 1 a 6

procedure TForm1.Button26Click(Sender: TObject);  //JH
begin

  serial.WriteData('Y 1 10' + chr(10));
  delay(5600);
  CheckBox_guia_placa.Checked := true;
  delay(500);

  serial.WriteData('Y 0 3.08' + chr(10));
  delay(500);

  serial.WriteData('Y 1 10' + chr(10));

  CheckBox_CB.Checked := true;
  delay(1000);

  CheckBox_CC.Checked := true;
    delay(1000);

  CheckBox_CA.Checked := true;
  delay(1000);

  CheckBox_CA.Checked := false;
    delay(1000);

  CheckBox_CB.Checked := false;
    delay(1000);

  CheckBox_CC.Checked := false;
    delay(1000);


end;

procedure TForm1.Elido1Change(Sender: TObject);
begin



end;

procedure TForm1.End1readChange(Sender: TObject);
begin

end;

procedure TForm1.Label_STATUS_SENSORClick(Sender: TObject);
begin

end;

procedure TForm1.ler_tabelasClick(Sender: TObject);
begin
end;

procedure TForm1.Button17Click(Sender: TObject);
  var
arq:TExtFile;
begin

   try

    assignFile(arq,'banco.txt');
    rewrite(arq);

          writeln(arq,edit2.text);
           writeln(arq,edit3.text);
           writeln(arq,edit4.text);
            writeln(arq,edit5.text);
     closefile(arq);


 except
    StatusBar1.Panels[0].Text:= 'Arquivo nao pode ser salvo';
 end;


  end;

procedure TForm1.Button18Click(Sender: TObject); //[POS1]
begin
     if form1.get_a_bit(data,4) = true then    //não tem placa
     begin
           form1.shape4.brush.color:=clgreen;
           form1.Label_STATUS_SENSOR.Caption:= '<< SEM PLACA >>'
     end
        else                                      //tem placa
        begin
                form1.shape4.brush.color:=clgray;
                form1.Label_STATUS_SENSOR.Caption:= '<< COM PLACA >>';
              //form1.btnStart_1a_6.OnClick(self);
        end
end;



procedure TForm1.Button19Click(Sender: TObject);  //[POS 2]

begin

    serial.WriteData('Y 0 3.08' + chr(10));     //POSIÇÃO 2
  //CheckBox_CC.Checked:= true;


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  timer1.Enabled:=true;

end;

procedure TForm1.Button30Click(Sender: TObject);
begin


end;

procedure TForm1.Button31Click(Sender: TObject);
begin

end;

procedure TForm1.Button32Click(Sender: TObject);
begin

end;

procedure TForm1.Button33Click(Sender: TObject);
begin

end;

procedure TForm1.Button34Click(Sender: TObject);
begin


end;

procedure TForm1.Button35Click(Sender: TObject);
begin
  memoserial.Clear;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if posicaox >= 0.0 then
begin
 posicaox:=posicaox - StrTofloat(cbposicao.Text);

 eposicaox.text:= format('%2.3f',[posicaox]);
     end
        else posicaox:=0;

serial.WriteData('X 0 ' + cbposicao.text +  chr(10));
MemoSerial.lines.Add('X 0 ' + FloatToStr(posicaox) +  chr(10));

end;

procedure TForm1.Button6Click(Sender: TObject);
begin

posicaox:=posicaox + StrTofloat(cbposicao.Text);
eposicaox.text:= format('%2.3f',[posicaox]);

serial.WriteData('X 1 ' + cbposicao.text + chr(10));
MemoSerial.lines.Add('X 1 ' + FloatToStr(posicaox) +  chr(10));
end;

procedure TForm1.CheckBox25Change(Sender: TObject);
begin
   if  checkbox25.Checked = true then
      begin
      leds4:=leds4 and $FE; //0b1111 1110
      writebytePlaca4($ff,leds4);
      edit8.Text:=IntToStr(leds4);
      end
    else
       begin
       leds4:=leds4 or 1;  //0b0000 0001
        writebytePlaca4($ff,leds4);
        edit8.Text:=IntToStr(leds4);
       end;
end;

procedure TForm1.CheckBox26Change(Sender: TObject);
begin
   if  checkbox26.Checked = true then
      begin
      leds4:=leds4 and $FD; //0b1111 1110
      writebytePlaca4($ff,leds4);
      edit8.Text:=IntToStr(leds4);
      end
    else
       begin
       leds4:=leds4 or 2;  //0b0000 0001
        writebytePlaca4($ff,leds4);
        edit8.Text:=IntToStr(leds4);
       end;
end;

procedure TForm1.CheckBox27Change(Sender: TObject);
begin
  if  checkbox27.Checked = true then
      begin
      leds4:=leds4 and $FB; //0b1111 1110
      writebytePlaca4($ff,leds4);
      edit8.Text:=IntToStr(leds4);
      end
    else
       begin
       leds4:=leds4 or 4;  //0b0000 0001
        writebytePlaca4($ff,leds4);
        edit8.Text:=IntToStr(leds4);
       end;
end;

procedure TForm1.CheckBox28Change(Sender: TObject);
begin
   if  checkbox28.Checked = true then
      begin
      leds4:=leds4 and $F7; //0b1111 1110
      writebytePlaca4($ff,leds4);
      edit8.Text:=IntToStr(leds4);
      end
    else
       begin
       leds4:=leds4 or 8;  //0b0000 0001
        writebytePlaca4($ff,leds4);
        edit8.Text:=IntToStr(leds4);
       end;
end;

procedure TForm1.CheckBox29Change(Sender: TObject);
begin
  //if  checkbox29.Checked = true then
  //    begin
  //    leds4:=leds4 and $EF; //0b1111 1110
  //    writebytePlaca4($ff,leds4);
  //    edit8.Text:=IntToStr(leds4);
  //    end
  //  else
  //     begin
  //     leds4:=leds4 or 16;  //0b0000 0001
  //      writebytePlaca4($ff,leds4);
  //      edit8.Text:=IntToStr(leds4);
  //     end;

end;

procedure TForm1.CheckBox30Change(Sender: TObject);
begin
  if  checkbox30.Checked = true then
      begin
      leds4:=leds4 and $DF; //0b1111 1110
      writebytePlaca4($ff,leds4);
      edit8.Text:=IntToStr(leds4);
      end
    else
       begin
       leds4:=leds4 or 32;  //0b0000 0001
        writebytePlaca4($ff,leds4);
        edit8.Text:=IntToStr(leds4);
       end;
end;

procedure TForm1.CheckBox31Change(Sender: TObject);
begin
  if  checkbox31.Checked = true then
      begin
      leds4:=leds4 and $BF; //0b1111 1110
      writebytePlaca4($ff,leds4);
      edit8.Text:=IntToStr(leds4);
      end
    else
       begin
       leds4:=leds4 or 64;  //0b0000 0001
        writebytePlaca4($ff,leds4);
        edit8.Text:=IntToStr(leds4);
       end;
end;

procedure TForm1.CheckBox32Change(Sender: TObject);
begin
  if  checkbox32.Checked = true then
      begin
      leds4:=leds4 and $7F; //0b0111 1111
      writebytePlaca4($ff,leds4);
      edit8.Text:=IntToStr(leds4);
      end
    else
       begin
       leds4:=leds4 or 128;  //0b1000 0000
        writebytePlaca4($ff,leds4);
        edit8.Text:=IntToStr(leds4);
       end;
end;

procedure TForm1.ClearClick(Sender: TObject);
begin


end;

procedure TForm1.elevador_2Timer(Sender: TObject);
  begin
end;

procedure TForm1.fechamentoTimer(Sender: TObject);
begin
    end;

procedure TForm1.FormShow(Sender: TObject);
begin
  // Executa o botao conectar ele mesmo!
  //  button21.OnClick(self);
end;

//end;


procedure TForm1.GroupBox3Click(Sender: TObject);
begin

end;

procedure TForm1.MemoSerialChange(Sender: TObject);
begin

end;

procedure TForm1.open_portClick(Sender: TObject);
begin

end;


procedure TForm1.Button3Click(Sender: TObject);
var
arq:TExtFile;

begin
   try

 assignFile(arq,'i2cread.txt');
 rewrite(arq);
 //Reset(arq);
// if IOResult <> 0 then
   //  StatusBar1.Panels[0].text:= 'Error na abertura do arquivo'
 //else
   //begin
    // while (not eof(arq)) do
       //begin
          //readln(arq,linha);
          writeln(arq,end1read.text);
           writeln(arq,end2read.text);
            writeln(arq,end3read.text);
         // MemoSerial.lines.add(linha);
       //end;
     closefile(arq);


 except
    StatusBar1.Panels[0].Text:= 'Arquivo nao pode ser gravado';
 end;
end;

procedure TForm1.Button4Click(Sender: TObject);
 var
arq:TExtFile;

begin
   try

 assignFile(arq,'i2cwrite.txt');
 rewrite(arq);

          writeln(arq,end1write.text);
           writeln(arq,end2write.text);
           writeln(arq,end3write.text);
            writeln(arq,end4write.text);
     closefile(arq);


 except
    StatusBar1.Panels[0].Text:= 'Arquivo nao pode ser gravado';
 end;

end;

procedure TForm1.Escreve_i2cClick(Sender: TObject);
begin
  timer1.Enabled:=false;
  add1w:=HexToInt(end1write.text);

  add2w:=HexToInt(end2write.text);

  add3w:= HexToInt(end3write.text);

  add4w:= HexToInt(end4write.text);


 if add1w > 0 then
    InitI2cDevice4;
 if add2w > 0 then
    InitI2cDevice5;

  if add3w > 0 then
    InitI2cDevice6;

    if add4w > 0 then
        InitI2cDevice7;

      writebytePlaca1($ff,255);
        writebytePlaca2($ff,255);
          writebytePlaca3($ff,255);
            writebytePlaca4($ff,255);

          //   alimentacao.Enabled:=true;
           //  fechamento.Enabled:=true;
           //  testador.Enabled:=true;
           //  elevador_2.Enabled:=true;

end;

procedure TForm1.ler_i2cClick(Sender: TObject);
begin

//  button7.Enabled:=false;
  //button8.Enabled:=true;
 // addr:= StrToInt(Edefeito.text);
  //InitI2cDevice;
 add1r:=HexToInt(end1read.text);
 add2r:=HexToInt(end2read.text);
 add3r:=HexToInt(end3read.text);


 if add1r > 0 then
    InitI2cDevice1;
 if add2r > 0 then
    InitI2cDevice2;
 if add3r > 0 then
    InitI2cDevice3;


  timer1.Enabled:=true;

end;

procedure TForm1.Button7Click(Sender: TObject);

begin

posicaoy:=posicaoy - StrTofloat(cbposicao.Text);
eposicaoy.text:= format('%2.3f',[posicaoy]);
serial.WriteData('Y 1 ' + cbposicao.text +  chr(10));
//MemoSerial.lines.Add('Y 1 ' + FloatToStr(posicaoy) +  chr(10));

end;

procedure TForm1.Button8Click(Sender: TObject);

begin

 posicaoy:=posicaoy + StrTofloat(cbposicao.Text);
 eposicaoy.text:= format('%2.3f',[posicaoy]);
 serial.WriteData('Y 0 ' + cbposicao.text + chr(10));
 //MemoSerial.lines.Add('Y 0 ' + FloatToStr(posicaoy) +  chr(10));

end;


procedure TForm1.Button9Click(Sender: TObject);

begin
    finalizar:=false;
    serial.close;
    //ZConnection1.Connected:=false;
end;

procedure TForm1.CheckBox10Change(Sender: TObject);
begin
    if  checkbox10.Checked = true then
      begin
      leds2:=leds2 and $FD; //0b1111 1101
    //  End2read.Text:=IntToStr(leds);
       writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
      end
    else
       begin
       leds2:=leds2 or 2;  //0b0000 0010
     //  End2read.Text:=IntToStr(leds);
        writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
       end;
end;

procedure TForm1.CheckBox11Change(Sender: TObject);
begin
   if  checkbox11.Checked = true then
      begin
      leds2:=leds2 and $FB; //0b11111011;
    //  End2read.Text:=IntToStr(leds);
       writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
      end
    else
       begin
       leds2:=leds2 or 4;  //0b0000 0100
     //  End2read.Text:=IntToStr(leds);
        writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
       end;
end;

procedure TForm1.CheckBox12Change(Sender: TObject);
begin
   if  checkbox12.Checked = true then
      begin
      leds2:=leds2 and $F7; //0b11110111;
     // End2read.Text:=IntToStr(leds);
      writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
      end
    else
       begin
       leds2:=leds2 or 8;  //0b0000 1000
      // End2read.Text:=IntToStr(leds);
        writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
       end;
end;

procedure TForm1.CheckBox13Change(Sender: TObject);
begin
  if  checkbox13.Checked = true then
      begin
      leds2:=leds2 and $EF; //0b1110 1111
     // End2read.Text:=IntToStr(leds);
      writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
      end
    else
       begin
       leds2:=leds2 or 16;  //0b0001 0000
     //  End2read.Text:=IntToStr(leds);
        writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
       end;
end;

procedure TForm1.CheckBox14Change(Sender: TObject);
begin
   if  checkbox14.Checked = true then
      begin
      leds2:=leds2 and $DF; //0b1101 1111
     // End2read.Text:=IntToStr(leds);
       writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
      end
    else
       begin
       leds2:=leds2 or 32;  //0b0010 0000
     //  End2read.Text:=IntToStr(leds);
       writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
       end;
end;

procedure TForm1.CheckBox15Change(Sender: TObject);
begin
   if  checkbox15.Checked = true then
      begin
      leds2:=leds2 and $BF; //0b1011 1111
    //  End2read.Text:=IntToStr(leds);
      writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
      end
    else
       begin
       leds2:=leds2 or 64;  //0b0100 0000
      // End2read.Text:=IntToStr(leds);
      writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
       end;
end;

procedure TForm1.CheckBox16Change(Sender: TObject);
begin
     if  checkbox16.Checked = true then
      begin
      leds2:=leds2 and $7F; //0b0111 1111
     // End2read.Text:=IntToStr(leds);
    writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
      end
    else
       begin
       leds2:=leds2 or 128;  //0b1000 0000
     //  End2read.Text:=IntToStr(leds);
      writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
       end;
end;

procedure TForm1.CheckBox17Change(Sender: TObject);
begin
   if  checkbox17.Checked = true then
      begin
      leds3:=leds3 and $FE; //0b1111 1110
     // End2read.Text:=IntToStr(leds);
      writebytePlaca3($ff,leds3);
      erec3.Text:=IntToStr(leds3);
      end
    else
       begin
       leds3:=leds3 or 1;  //0b0000 0001
      // End2read.Text:=IntToStr(leds);
       writebytePlaca3($ff,leds3);
        erec3.Text:=IntToStr(leds3);
       end;
end;

procedure TForm1.CheckBox18Change(Sender: TObject);
begin
    if  checkbox18.Checked = true then
      begin
      leds3:=leds3 and $FD; //0b1111 1110
     // End2read.Text:=IntToStr(leds);
      writebytePlaca3($ff,leds3);
      erec3.Text:=IntToStr(leds3);
      end
    else
       begin
       leds3:=leds3 or 2;  //0b0000 0001
      // End2read.Text:=IntToStr(leds);
       writebytePlaca3($ff,leds3);
        erec3.Text:=IntToStr(leds3);
       end;
end;

procedure TForm1.CheckBox19Change(Sender: TObject);
begin
   if  checkbox19.Checked = true then
      begin
      leds3:=leds3 and $FB; //0b1111 1110
     // End2read.Text:=IntToStr(leds);
      writebytePlaca3($ff,leds3);
      erec3.Text:=IntToStr(leds3);
      end
    else
       begin
       leds3:=leds3 or 4;  //0b0000 0001
      // End2read.Text:=IntToStr(leds);
       writebytePlaca3($ff,leds3);
        erec3.Text:=IntToStr(leds3);
       end;
end;



procedure TForm1.CheckBox_esteiraChange(Sender: TObject);
begin
    if  CheckBox_esteira.Checked = true then
    begin
          leds1:=leds1 and $FE; //0b1111 1110
         // End2read.Text:=IntToStr(leds);
          writebytePlaca1($ff,leds1);
          erec1.Text:=IntToStr(leds1);
     end
     else
         begin
              leds1:=leds1 or 1;  //0b0000 0001
              //End2read.Text:=IntToStr(leds);
              writebytePlaca1($ff,leds1);
              erec1.Text:=IntToStr(leds1);
         end;
end;



procedure TForm1.CheckBox20Change(Sender: TObject);
begin
     if  checkbox20.Checked = true then
      begin
      leds3:=leds3 and $F7; //0b1111 1110
     // End2read.Text:=IntToStr(leds);
      writebytePlaca3($ff,leds3);
      erec3.Text:=IntToStr(leds3);
      end
    else
       begin
       leds3:=leds3 or 8;  //0b0000 0001
      // End2read.Text:=IntToStr(leds);
       writebytePlaca3($ff,leds3);
        erec3.Text:=IntToStr(leds3);
       end;
end;

procedure TForm1.CheckBox21Change(Sender: TObject);
begin
    if  checkbox21.Checked = true then
      begin
      leds3:=leds3 and $EF; //0b1111 1110
     // End2read.Text:=IntToStr(leds);
      writebytePlaca3($ff,leds3);
      erec3.Text:=IntToStr(leds3);
      end
    else
       begin
       leds3:=leds3 or 16;//0b0000 0001
      // End2read.Text:=IntToStr(leds);
       writebytePlaca3($ff,leds3);
        erec3.Text:=IntToStr(leds3);
       end;
end;

procedure TForm1.CheckBox22Change(Sender: TObject);
begin
    if  checkbox22.Checked = true then
      begin
      leds3:=leds3 and $DF; //0b1111 1110
     // End2read.Text:=IntToStr(leds);
      writebytePlaca3($ff,leds3);
      erec3.Text:=IntToStr(leds3);
      end
    else
       begin
       leds3:=leds3 or 32;//0b0000 0001
      // End2read.Text:=IntToStr(leds);
       writebytePlaca3($ff,leds3);
        erec3.Text:=IntToStr(leds3);
       end;
end;

procedure TForm1.CheckBox23Change(Sender: TObject);
begin
  if  checkbox23.Checked = true then
      begin
      leds3:=leds3 and $BF; //0b1111 1110
     // End2read.Text:=IntToStr(leds);
      writebytePlaca3($ff,leds3);
      erec3.Text:=IntToStr(leds3);
      end
    else
       begin
       leds3:=leds3 or 64;//0b0000 0001
      // End2read.Text:=IntToStr(leds);
       writebytePlaca3($ff,leds3);
        erec3.Text:=IntToStr(leds3);
       end;
end;

procedure TForm1.CheckBox24Change(Sender: TObject);
begin
if  checkbox24.Checked = true then
      begin
      leds3:=leds3 and $7F; //0b1111 1110
     // End2read.Text:=IntToStr(leds);
      writebytePlaca3($ff,leds3);
      erec3.Text:=IntToStr(leds3);
      end
    else
       begin
       leds3:=leds3 or 128;//0b0000 0001
      // End2read.Text:=IntToStr(leds);
       writebytePlaca3($ff,leds3);
        erec3.Text:=IntToStr(leds3);
       end;
end;

procedure TForm1.CheckBox_guia_placaChange(Sender: TObject);
begin
    if  CheckBox_guia_placa.Checked = true then
      begin
      leds1:=leds1 and $FD; //0b1111 1101
    //  End2read.Text:=IntToStr(leds);
      writebytePlaca1($ff,leds1);
      erec1.Text:=IntToStr(leds1);
      end
    else
       begin
       leds1:=leds1 or 2;  //0b0000 0010
     //  End2read.Text:=IntToStr(leds);
       writebytePlaca1($ff,leds1);
       erec1.Text:=IntToStr(leds1);
       end;
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
     if  checkbox3.Checked = true then
      begin
      leds1:=leds1 and $FB; //0b11111011;
    //  End2read.Text:=IntToStr(leds);
      writebytePlaca1($ff,leds1);
      erec1.Text:=IntToStr(leds1);
      end
    else
       begin
       leds1:=leds1 or 4;  //0b0000 0100
     //  End2read.Text:=IntToStr(leds);
       writebytePlaca1($ff,leds1);
       erec1.Text:=IntToStr(leds1);
       end;
end;

procedure TForm1.CheckBox4Change(Sender: TObject);
begin
     if  checkbox4.Checked = true then
      begin
      leds1:=leds1 and $F7; //0b11110111;
     // End2read.Text:=IntToStr(leds);
      writebytePlaca1($ff,leds1);
      erec1.Text:=IntToStr(leds1);
      end
    else
       begin
       leds1:=leds1 or 8;  //0b0000 1000
      // End2read.Text:=IntToStr(leds);
       writebytePlaca1($ff,leds1);
       erec1.Text:=IntToStr(leds1);
       end;
end;

procedure TForm1.CheckBox_CCChange(Sender: TObject);
begin
  if  CheckBox_CC.Checked = true then
      begin
      leds1:=leds1 and $EF; //0b1110 1111
     // End2read.Text:=IntToStr(leds);
      writebytePlaca1($ff,leds1);
      erec1.Text:=IntToStr(leds1);
      end
    else
       begin
       leds1:=leds1 or 16;  //0b0001 0000
     //  End2read.Text:=IntToStr(leds);
       writebytePlaca1($ff,leds1);
       erec1.Text:=IntToStr(leds1);
       end;
end;

procedure TForm1.CheckBox_CBChange(Sender: TObject);
begin
   if  CheckBox_CB.Checked = true then
      begin
      leds1:=leds1 and $DF; //0b1101 1111
     // End2read.Text:=IntToStr(leds);
      writebytePlaca1($ff,leds1);
      erec1.Text:=IntToStr(leds1);
      end
    else
       begin
       leds1:=leds1 or 32;  //0b0010 0000
     //  End2read.Text:=IntToStr(leds);
        writebytePlaca1($ff,leds1);
       erec1.Text:=IntToStr(leds1);
       end;
end;

procedure TForm1.CheckBox_CAChange(Sender: TObject);
begin
    if  CheckBox_CA.Checked = true then           // Aciona o pistão 01
      begin
      leds1:=leds1 and $BF; //0b1011 1111
    //  End2read.Text:=IntToStr(leds);
      writebytePlaca1($ff,leds1);
      erec1.Text:=IntToStr(leds1);
      end
    else
       begin
       leds1:=leds1 or 64;  //0b0100 0000
      // End2read.Text:=IntToStr(leds);
       writebytePlaca1($ff,leds1);
       erec1.Text:=IntToStr(leds1);
       end;
end;

procedure TForm1.CheckBox_Limiador_PlacaChange(Sender: TObject);
begin
     if  CheckBox_Limiador_Placa.Checked = true then         // Pistôes que determinam o limite da placa
      begin
      leds1:=leds1 and $7F; //0b0111 1111
     // End2read.Text:=IntToStr(leds);
      writebytePlaca1($ff,leds1);
      erec1.Text:=IntToStr(leds1);

      end
    else
       begin
       leds1:=leds1 or 128;  //0b1000 0000
     //  End2read.Text:=IntToStr(leds);
       writebytePlaca1($ff,leds1);
       erec1.Text:=IntToStr(leds1);
       end;
end;

procedure TForm1.CheckBox9Change(Sender: TObject);
begin
    if  checkbox9.Checked = true then
      begin
      leds2:=leds2 and $FE; //0b1111 1110
     // End2read.Text:=IntToStr(leds);
      writebytePlaca2($ff,leds2);
      erec2.Text:=IntToStr(leds2);
      end
    else
       begin
       leds2:=leds2 or 1;  //0b0000 0001
      // End2read.Text:=IntToStr(leds);
       writebytePlaca2($ff,leds2);
        erec2.Text:=IntToStr(leds2);
       end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin

end;

procedure TForm1.Edit3Change(Sender: TObject);
begin

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  timer1.Enabled:=false;
  //   Relogio.Enabled:=false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.GroupBox9Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  formSobre.ShowModal;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

procedure TForm1.PrecisaoChange(Sender: TObject);
begin
  //memo1.Lines.add(precisao.text);
end;

procedure TForm1.serialRxData(Sender: TObject);
var
   Str : string;
begin
     //flag_ok:=false;
     Str :=  serial.ReadData;
     CurPos := Pos( Char(10) ,Str);
  if CurPos = 0 then
  begin
       FTempStr:= FTempStr + Str;
  end
  else begin
        FTempStr := FTempStr + Copy( Str, 1, CurPos-1);
        MemoSerial.Lines.BeginUpdate;
        MemoSerial.Lines.Add('>' + FtempStr);
    //----------------------------------
     if SubStringOccurences('home(X)',FTempStr) then
       begin
           posicaox:= 0;
           eposicaoX.text:= '0';
       end;
     if SubStringOccurences('home(Y)',FTempStr) then
       begin
            posicaoy:= 0;
            eposicaoY.text:= '0'
       end;
     if SubStringOccurences('home(Z)',FTempStr) then
       begin
            posicaoZ:= 0;
            eposicaoZ.text:= '0';
       end;
    //----------------------------------
     MemoSerial.Lines.EndUpdate;
    MemoSerial.SelStart := Length(MemoSerial.Lines.Text)-1;
    MemoSerial.SelLength:=0;
    FTempStr := Copy(Str,CurPos +1, Length(Str) - CurPos);
   // memoserial.Lines.add('2 -' + FTempSTR);
   // flag_ok:=SubStringOccurences('ok',FTempStr);
  end;
end;

procedure TForm1.Shape1ChangeBounds(Sender: TObject);
begin

end;

procedure TForm1.Shape4ChangeBounds(Sender: TObject);
begin
  form1.StatusBar1.Panels[1].Text:= 'teste';
end;

procedure TForm1.Shape7ChangeBounds(Sender: TObject);
begin

end;


procedure TForm1.TabSheet1Exit(Sender: TObject);
begin
  //.Close;
end;

procedure TForm1.TabSheet1Show(Sender: TObject);
begin

end;


procedure TForm1.TabSheet2Show(Sender: TObject);
begin
     lerarquivosI2c;
     End3read.Text:= end3r;
     add3r:=HexToInt(end3read.text);

    if add3r > 0 then
      InitI2cDevice3;

 StatusBar1.Panels[0].Text:= 'Abrindo a porta I2C Placa 3';

end;


procedure TForm1.TabSheet3Enter(Sender: TObject);
begin
  //button8.Enabled:=false;
  // lerarquivosI2c;

end;

procedure TForm1.TabSheet3Exit(Sender: TObject);
begin
  // button7.Enabled:=true;
  // button8.Enabled:=false;
  //fpclose(DEV_IMU);
end;

procedure TForm1.TabSheet3Show(Sender: TObject);
begin
//   button7.Enabled:=true;
  // button8.Enabled:=false;
    timer1.Enabled:=false;
    lerarquivosI2c;
    End1read.Text:= end1r;
    End2read.Text:= end2r;
    End3read.Text:= end3r;
    End1write.text := end1w;
    End2write.text := end2w;
    End3write.text := end3w;
    End4write.text := end4w;

    edit2.text:= b_database;
    edit3.text:= b_ip;
    edit4.text:= b_user;
    edit5.Text:= b_password;

   // Button5Click(self);
    //Button6Click(self);
end;


procedure TForm1.TabSheet4Show(Sender: TObject);
begin


end;

procedure TForm1.Tempo1Timer(Sender: TObject);
  //var
  //    msg : TMQTTMessage;
    //  ack : TMQTTMessageAck;
begin
{
  repeat
            msg := MQTTClient.getMessage;
            if Assigned(msg) then
              begin
                MemoSerial.Lines.add(msg.payload);
               // writeln ('getMessage: ' + msg.topic + ' Payload: ' + msg.payload);

               //MRV Super importante
               // if msg.PayLoad = 'stop' then
                  //terminate := true;

                // Important to free messages here.
                msg.free;
              end;
          until not Assigned(msg);

 // Read incomming MQTT message acknowledgments
          repeat
            ack := MQTTClient.getMessageAck;
            if Assigned(ack) then
              begin
                case ack.messageType of
                  CONNACK :
                            begin
                              if ack.returnCode = 0 then
                                begin
                                  // Make subscriptions
                                  MQTTClient.Subscribe(MQTT_Topic);
                                  // Enter the running state
                                  state := RUNNING;
                                end
                              else
                                state := FAILING;
                            end;
                  PINGRESP :
                             begin
                               MemoSerial.lines.add ('PING! PONG!');
                               // Reset ping counter to indicate all is OK.
                               pingCounter := 0;
                             end;
                  SUBACK :
                           begin
                             MemoSerial.lines.add   ('SUBACK: ' + IntToStr(ack.messageId)
                             + ', ' + IntToStr(ack.qos));
                           end;
                  UNSUBACK :
                             begin
                               MemoSerial.lines.add('UNSUBACK: '+ IntToStr(ack.messageId));
                             end;
                end;
              end;
            // Important to free messages here.
            ack.free;
          until not Assigned(ack);
 }
end;

procedure TForm1.TestadorTimer(Sender: TObject);

begin
    end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
 if add1r > 0 then
    readbyte($43);

 if add2r > 0 then
    readbyte2($43);

 if add3r > 0 then
       readbyte3($43);
 //  form1.btnStart_1a_6.OnClick(self);
// form1.btnStart_1a_6.OnClick(self);

end;

procedure TForm1.RelogioTimer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text:= '       '+ timetoStr(time);
end;

procedure TForm1.motorTimeTimer(Sender: TObject);
begin
end;

procedure TForm1.tempo2Timer(Sender: TObject);
 begin

          end;

procedure TForm1.ZConnection1AfterConnect(Sender: TObject);
begin

end;


end.

