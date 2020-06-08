unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, {FMX.Graphics,} FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Layouts, FMX.Memo, {System.Actions, FMX.ActnList,} System.Rtti,
  FMX.Grid, System.Actions, FMX.ActnList;

type
  TNumero = record
    Num: byte;
    Activo: boolean;
  end;
  TCarton = record
    Numero: array [1..5,1..5] of TNumero;
    NumCarton: byte;
  end;
  TFPrinc = class(TForm)
    Button2: TButton;
    Panel2: TPanel;
    CBt1: TCornerButton;
    CBt2: TCornerButton;
    CBt4: TCornerButton;
    CBt3: TCornerButton;
    CBt5: TCornerButton;
    Cbt10: TCornerButton;
    Cbt8: TCornerButton;
    Cbt9: TCornerButton;
    Cbt7: TCornerButton;
    Cbt6: TCornerButton;
    Cbt15: TCornerButton;
    Cbt13: TCornerButton;
    Cbt14: TCornerButton;
    Cbt12: TCornerButton;
    Cbt11: TCornerButton;
    CBt16: TCornerButton;
    CBt17: TCornerButton;
    CBt19: TCornerButton;
    CBt18: TCornerButton;
    CBt20: TCornerButton;
    CBt25: TCornerButton;
    CBt23: TCornerButton;
    CBt24: TCornerButton;
    CBt22: TCornerButton;
    CBt21: TCornerButton;
    CBt30: TCornerButton;
    CBt28: TCornerButton;
    CBt29: TCornerButton;
    CBt27: TCornerButton;
    CBt26: TCornerButton;
    CBt60: TCornerButton;
    CBt56: TCornerButton;
    CBt57: TCornerButton;
    CBt59: TCornerButton;
    CBt58: TCornerButton;
    CBt51: TCornerButton;
    CBt52: TCornerButton;
    CBt54: TCornerButton;
    CBt53: TCornerButton;
    CBt55: TCornerButton;
    CBt50: TCornerButton;
    CBt48: TCornerButton;
    CBt49: TCornerButton;
    CBt47: TCornerButton;
    CBt46: TCornerButton;
    CBt41: TCornerButton;
    CBt42: TCornerButton;
    CBt44: TCornerButton;
    CBt43: TCornerButton;
    CBt45: TCornerButton;
    CBt36: TCornerButton;
    CBt37: TCornerButton;
    CBt39: TCornerButton;
    CBt38: TCornerButton;
    CBt40: TCornerButton;
    CBt35: TCornerButton;
    CBt33: TCornerButton;
    CBt34: TCornerButton;
    CBt32: TCornerButton;
    CBt31: TCornerButton;
    CBt75: TCornerButton;
    CBt71: TCornerButton;
    CBt72: TCornerButton;
    CBt74: TCornerButton;
    CBt73: TCornerButton;
    CBt66: TCornerButton;
    CBt67: TCornerButton;
    CBt69: TCornerButton;
    CBt68: TCornerButton;
    CBt70: TCornerButton;
    CBt65: TCornerButton;
    CBt63: TCornerButton;
    CBt64: TCornerButton;
    CBt62: TCornerButton;
    CBt61: TCornerButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CornerButton1: TCornerButton;
    ActLst: TActionList;
    Action1: TAction;
    Grid1: TGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    CheckColumn1: TCheckColumn;
    CornerButton2: TCornerButton;
    Action2: TAction;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CBt1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    { Private declarations }
    procedure InicializaCarton;
    procedure CargaCarton;
    procedure MarcaNumeros(Num: byte; Activo: boolean);
    procedure CuatroEsquinas;
    procedure CuadroGrande;
    procedure CuadroChiquito;
    procedure CruzGrande;
    procedure CruzChiquita;
    procedure LineaVert;
    procedure LineaHoriz;
    procedure DiagNormal;
    procedure DiagInversa;
  public
    { Public declarations }
  end;

var
  FPrinc: TFPrinc;
  ArchCarton: file of TCarton;
  mCarton: array [1..5,1..5] of TNumero;
  CrtGeneral: array [1..5,1..15] of TNumero;

implementation

{$R *.fmx}

uses NvoCarton;

procedure TFPrinc.CargaCarton;
begin
  //precargado de un cartón cualquiera. sólo para hacer la prueba de los patrones:
    //letra B:
  mCarton[1,1].Num:=8;  mCarton[1,2].Num:=9;  mCarton[1,3].Num:=14;
  mCarton[1,4].Num:=10;  mCarton[1,5].Num:=15;
    //letra I:
  mCarton[2,1].Num:=28;  mCarton[2,2].Num:=19;  mCarton[2,3].Num:=22;
  mCarton[2,4].Num:=20;  mCarton[2,5].Num:=18;
    //letra N:
  mCarton[3,1].Num:=31;  mCarton[3,2].Num:=36;  mCarton[3,3].Num:=0;
  mCarton[3,4].Num:=39;  mCarton[3,5].Num:=37;
    //letra G:
  mCarton[4,1].Num:=50;  mCarton[4,2].Num:=48;  mCarton[4,3].Num:=46;
  mCarton[4,4].Num:=57;  mCarton[4,5].Num:=54;
    //letra O:
  mCarton[5,1].Num:=75;  mCarton[5,2].Num:=73;  mCarton[5,3].Num:=63;
  mCarton[5,4].Num:=74;  mCarton[5,5].Num:=64;
end;

{Pone los cartones a sus valores iniciales}
procedure TFPrinc.InicializaCarton;
var
  I,X,Y: byte;
  CBt: TComponent;
begin
  for X:=1 to 5 do
    for Y:=1 to 5 do mCarton[X,Y].Activo:=false;
  mCarton[3,3].Activo:=true;  //el libre...
  //se inicializa el cartón general:
  for I := 1 to 75 do
  begin
    CBt:=FindComponent('CBt'+IntToStr(I));
    TCornerButton(CBt).IsPressed:=false;
  end;
end;

{'pone' una ficha al número existente en el cartón}
procedure TFPrinc.MarcaNumeros(Num: byte; Activo: boolean);
var
  X,Y: byte;
begin
  for X:=1 to 5 do
    for Y:=1 to 5 do
      //if StrToInt(ENumero.Text)=mCarton[X,Y].Num then mCarton[X,Y].Activo:=true;
      if Num=mCarton[X,Y].Num then mCarton[X,Y].Activo:=Activo;
end;

/// los patrones: ////

procedure TFPrinc.CuatroEsquinas;
begin
  if mCarton[1,1].Activo and mCarton[1,5].Activo and
     mCarton[5,1].Activo and mCarton[5,5].Activo then
    ShowMessage('¡¡¡ B I N G O !!! - Cuatro Esquinas');
end;

procedure TFPrinc.CuadroGrande;
var
  X,Y: Integer;
begin
  for X:=1 to 3 do
    for Y:=1 to 3 do
      if mCarton[X,Y].Activo and mCarton[X+2,Y].Activo and
        mCarton[X,Y+2].Activo and mCarton[X+2,Y+2].Activo then
          ShowMessage('¡¡¡ B I N G O !!! - Cuadro Grande');
end;

procedure TFPrinc.CuadroChiquito;
var
  X,Y: Integer;
begin
  for X:=1 to 4 do
    for Y:=1 to 4 do
      if mCarton[X,Y].Activo and mCarton[X+1,Y].Activo and
        mCarton[X,Y+1].Activo and mCarton[X+1,Y+1].Activo then
          ShowMessage('¡¡¡ B I N G O !!! - Cuadro Chiquito');
end;

procedure TFPrinc.CruzGrande;
begin
  if mCarton[3,1].Activo and mCarton[3,5].Activo and
     mCarton[1,3].Activo and mCarton[5,3].Activo then
    ShowMessage('¡¡¡ B I N G O !!! - Cruz Grande');
end;

procedure TFPrinc.CruzChiquita;
var
  X,Y: Integer;
begin
  for X:=1 to 2 do
    for Y:=1 to 2 do
      if mCarton[X+1,Y].Activo and mCarton[X+1,Y+2].Activo and
        mCarton[X,Y+1].Activo and mCarton[X+2,Y+1].Activo then
          ShowMessage('¡¡¡ B I N G O !!! - Cruz Chiquita');
end;

procedure TFPrinc.LineaVert;
var
  X: byte;
begin
  for X:=1 to 5 do
    if mCarton[X,1].Activo and mCarton[X,2].Activo and
       mCarton[X,3].Activo and mCarton[X,4].Activo and
       mCarton[X,5].Activo then
      ShowMessage('¡¡¡ B I N G O !!! - Linea Vertical');
end;

procedure TFPrinc.LineaHoriz;
var
  Y: byte;
begin
  for Y:=1 to 5 do
    if mCarton[1,Y].Activo and mCarton[2,Y].Activo and
       mCarton[3,Y].Activo and mCarton[4,Y].Activo and
       mCarton[5,Y].Activo then
      ShowMessage('¡¡¡ B I N G O !!! - Linea Horizontal');
end;

procedure TFPrinc.DiagNormal;
begin
  if mCarton[1,1].Activo and mCarton[2,2].Activo and
     mCarton[4,4].Activo and mCarton[5,5].Activo then
    ShowMessage('¡¡¡ B I N G O !!! - Macheteao derecho');
end;

procedure TFPrinc.DiagInversa;
begin
  if mCarton[5,1].Activo and mCarton[4,2].Activo and
     mCarton[2,4].Activo and mCarton[1,5].Activo then
    ShowMessage('¡¡¡ B I N G O !!! - Macheteao al revés');
end;

/// fin patrones ///

procedure TFPrinc.Action1Execute(Sender: TObject);
begin
  ShowMessage('xxxx');
end;

procedure TFPrinc.Action2Execute(Sender: TObject);
begin
  FNvoCarton.ShowModal;
end;

procedure TFPrinc.Button2Click(Sender: TObject);
begin
  InicializaCarton;
end;

procedure TFPrinc.CBt1Click(Sender: TObject);
var
  I,Num: byte;
  Activo: boolean;
  Cbt: TComponent;
begin
  //este método es una alternativa a ActiveControl, ya que en FireMonkey siempre
  //tiene valor nil, lo que genera un error:
  for I:=1 to 75 do
  begin
    CBt:=FindComponent('CBt'+IntToStr(I));
    if TCornerButton(CBt).IsFocused then
    begin
      Num:=I;
      Activo:=TCornerButton(CBt).IsPressed;
      //aquí cambio las propiedades del botón clickeado:

    end;
  end;
  MarcaNumeros(Num,Activo);
  //los patrones:
  CuatroEsquinas;  CuadroGrande;  CuadroChiquito;  CruzGrande;  CruzChiquita;
  LineaVert;  LineaHoriz;  DiagNormal;  DiagInversa;
  //
end;

procedure TFPrinc.FormShow(Sender: TObject);
var
  I: byte;
  CBt: TComponent;
  ArchCarton: TFileStream;
begin
  //se crea (de no existir) el archivo binario contentivo de los cartones:
  if not FileExists('cartones.dat') then
  begin
    ArchCarton:=TFileStream.Create('cartones.dat',fmCreate);
    ArchCarton.Free;
  end;
  //
  InicializaCarton;
  CargaCarton;
  //se colocan los números de cada botón:
  for I := 1 to 75 do
  begin
    CBt:=FindComponent('CBt'+IntToStr(I));
    TCornerButton(CBt).Text:=IntToStr(I);
  end;
end;

end.
