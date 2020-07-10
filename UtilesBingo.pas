unit UtilesBingo;

interface

uses FMX.Media, System.SysUtils, ABSMain;

type
  //sonidos usados en el sistema.
  TSonidos = record
    const
    Ganador='Audio\fanfarria.mp3';
    Punto=  'Audio\xilofono.mp3';
  end;
  //Sistema
  TSistema = record
    Sonido: TSonidos;
    SonidoActivo: boolean;
    IntervSonido: integer;
  end;
  //registro de los datos generales del juego.
  TBingo = record
    EsNuevo,                   //indica si es nuevo un jugador o ya existente
    EsBingo,                   //indica si es bingo o no
    EsPlay,                    //indica si está activo o en pausa el cantado automático
    EsConsCrtGanador: boolean; //indica si es consulta de cartones ganadores
    TotalCantados,             //el total de bolas cantadas
    TotalCartones,             //el total de cartones en la base de datos
    TotalCartEnJuego,          //el total de cartones en juego
    TotalJugadores,            //el total de jugadores en una partida
    TotalGanadores,            //el total de ganadores de una partida
    TotalPatronesSel: byte;    //el total de patrones seleccionados
    ModoDeCantado,             //indica si es manual o automático
    Patrones: string;          //los patrones seleccionados para cantar bingo
  end;
  //registro de los números
  TNumero = record
    Num: byte;                            //indica un número en el cartón
    Activo: boolean;                      //indica si está activo o ya 'cantado'
  end;
  //registro de los cartones en el archivo.
  TCarton = record
    Numero: array [1..5,1..5] of TNumero; //matriz con los 25 nros del cartón
    NumCarton: byte;                      //indica el nro. del cartón
  end;
  //registro con los cartones en juego.
  TCartJuego = record
    Nombre: string;                       //el nombre del jugador
    Carton: array [1..5,1..5] of TNumero; //matriz con los 25 nros del cartón
    NumCarton: byte;                      //indica el nro. del cartón
  end;
  //registro del ganador de la partida.
  TGanador = record
    Patron,NumCarton,Jugador: string;
    Indice: byte;
  end;

  procedure Sonido(MPlay: TMediaPlayer; Arch: string; Volumen: single);
  procedure MarcaNumeros(Num: byte; Activo: boolean);
  procedure AvisoGanador(Patron: string; Ind: byte);
  procedure CargarTodosCartones(Qr: TABSQuery);
  procedure GuardarConfig(Qr: TABSQuery);
  /// los patrones: ////
  procedure CuatroEsquinas(I: byte);
  procedure CuadroGrande(I: byte);
  procedure CuadroChiquito(I: byte);
  procedure CruzGrande(I: byte);
  procedure CruzChiquita(I: byte);
  procedure LineaVert(I: byte);
  procedure LineaHoriz(I: byte);
  procedure DiagNormal(I: byte);
  procedure DiagInversa(I: byte);
  procedure TodoCarton(I: byte);

var
  Bingo: TBingo;
  Sistema: TSistema;
  Cartones: array of TCarton;           //todos los cartones de la BD
  CartJuego: array of TCartJuego;       //los cartones ya escogidos;
  Ganador: array of TGanador;           //el(los) ganador(es) de la partida

implementation

//ejecuta un archivo de audio, si existe:
procedure Sonido(MPlay: TMediaPlayer; Arch: string; Volumen: single);
begin
  if FileExists(Arch) then
  begin
    MPlay.FileName:=Arch;
    MPlay.Volume:=Volumen;
    MPlay.Play;
  end;
end;

procedure MarcaNumeros(Num: byte; Activo: boolean);
var
  X,Y,I: byte;
begin
  for I:=0 to Length(CartJuego)-1 do
    for X:=1 to 5 do
      for Y:=1 to 5 do
        if Num=CartJuego[I].Carton[X,Y].Num then
          CartJuego[I].Carton[X,Y].Activo:=Activo;
end;

procedure AvisoGanador(Patron: string; Ind: byte);
var
  Tamano: byte;
begin
  SetLength(Ganador,Length(Ganador)+1);
  Tamano:=Length(Ganador)-1;
  Ganador[Tamano].Jugador:=CartJuego[Ind].Nombre;
  Ganador[Tamano].NumCarton:=CartJuego[Ind].NumCarton.ToString;
  Ganador[Tamano].Patron:=Patron;
  Ganador[Tamano].Indice:=Ind;
  Bingo.EsBingo:=true;
end;

{Carga todos los cartones de la BD y actualiza los disponibles}
procedure CargarTodosCartones(Qr: TABSQuery);
var
  I,J,X,Y: byte;
begin
  Cartones:=nil;
  //se cargan todos los cartones guardados en BD y el listbox con los disponibles:
  Qr.SQL.Text:='select * from Carton order by NumCart';
  Qr.Open;
  I:=0;
  SetLength(Cartones,Qr.RecordCount);
  Qr.First;
  while not Qr.Eof do
  begin
    Cartones[I].NumCarton:=Qr.FieldByName('NumCart').AsInteger;
    J:=0;
    for X:=1 to 5 do
      for Y:=1 to 5 do
      begin
        J:=J+1;
        Cartones[I].Numero[X,Y].Num:=Qr['N'+J.ToString];
        Cartones[I].Numero[X,Y].Activo:=J=13;     //se activa el "libre"
      end;
    I:=I+1;
    Qr.Next;
  end;
end;

{Actualiza la tabla Config con la configuración del sistema}
procedure GuardarConfig(Qr: TABSQuery);
begin            //agregar aquí los campos que se vayan incorporando
  Qr.SQL.Text:='update Config set SonidoActivo=:sac,IntervSonido=:ins';
  Qr.ParamByName('sac').AsBoolean:=Sistema.SonidoActivo;
  Qr.ParamByName('ins').AsInteger:=Sistema.IntervSonido;
  Qr.ExecSQL;
end;

/// los patrones: ////

procedure CuatroEsquinas(I: byte);
begin
  if CartJuego[I].Carton[1,1].Activo and CartJuego[I].Carton[1,5].Activo and
     CartJuego[I].Carton[5,1].Activo and CartJuego[I].Carton[5,5].Activo then
       AvisoGanador('Cuatro Esquinas',I);
end;

procedure CuadroGrande(I: byte);
var
  X,Y: Integer;
begin
  for X:=1 to 3 do
    for Y:=1 to 3 do
      if CartJuego[I].Carton[X,Y].Activo and
         CartJuego[I].Carton[X+2,Y].Activo and
         CartJuego[I].Carton[X,Y+2].Activo and
         CartJuego[I].Carton[X+2,Y+2].Activo then
           AvisoGanador('Cuadro Grande',I);
end;

procedure CuadroChiquito(I: byte);
var
  X,Y: Integer;
begin
  for X:=1 to 4 do
    for Y:=1 to 4 do
      if CartJuego[I].Carton[X,Y].Activo and
         CartJuego[I].Carton[X+1,Y].Activo and
         CartJuego[I].Carton[X,Y+1].Activo and
         CartJuego[I].Carton[X+1,Y+1].Activo then
           AvisoGanador('Cuadro Chiquito',I);
end;

procedure CruzGrande(I: byte);
begin
  if CartJuego[I].Carton[3,1].Activo and CartJuego[I].Carton[3,5].Activo and
     CartJuego[I].Carton[1,3].Activo and CartJuego[I].Carton[5,3].Activo then
       AvisoGanador('Cruz Grande',I);
end;

procedure CruzChiquita(I: byte);
var
  X,Y: Integer;
begin
  for X:=1 to 2 do
    for Y:=1 to 2 do
      if CartJuego[I].Carton[X+1,Y].Activo and
         CartJuego[I].Carton[X+1,Y+2].Activo and
         CartJuego[I].Carton[X,Y+1].Activo and
         CartJuego[I].Carton[X+2,Y+1].Activo then AvisoGanador('Cruz Chiquita',I);
end;

procedure LineaVert(I: byte);
var
  X: byte;
begin
  for X:=1 to 5 do
    if CartJuego[I].Carton[X,1].Activo and CartJuego[I].Carton[X,2].Activo and
       CartJuego[I].Carton[X,3].Activo and CartJuego[I].Carton[X,4].Activo and
       CartJuego[I].Carton[X,5].Activo then AvisoGanador('Linea Vertical',I);
end;

procedure LineaHoriz(I: byte);
var
  Y: byte;
begin
  for Y:=1 to 5 do
    if CartJuego[I].Carton[1,Y].Activo and CartJuego[I].Carton[2,Y].Activo and
       CartJuego[I].Carton[3,Y].Activo and CartJuego[I].Carton[4,Y].Activo and
       CartJuego[I].Carton[5,Y].Activo then AvisoGanador('Linea Horizontal',I);
end;

procedure DiagNormal(I: byte);
begin
  if CartJuego[I].Carton[1,1].Activo and CartJuego[I].Carton[2,2].Activo and
     CartJuego[I].Carton[4,4].Activo and CartJuego[I].Carton[5,5].Activo then
       AvisoGanador('Diagonal derecha',I);
end;

procedure DiagInversa(I: byte);
begin
  if CartJuego[I].Carton[5,1].Activo and CartJuego[I].Carton[4,2].Activo and
     CartJuego[I].Carton[2,4].Activo and CartJuego[I].Carton[1,5].Activo then
       AvisoGanador('Diagonal inversa',I);
end;

procedure TodoCarton(I: byte);
var
  X,Y,Cont: byte;
begin
  Cont:=0;
  for X:=1 to 5 do
    for Y:=1 to 5 do
      if CartJuego[I].Carton[X,Y].Activo then Inc(Cont,1)
                                         else Break;
  if Cont=25 then AvisoGanador('Cartón FULL',I);
end;

/// fin patrones ///

end.
