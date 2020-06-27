unit UtilesBingo;

interface

uses FMX.Media, System.SysUtils;

type
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
    TotalGanadores: byte;      //el total de ganadores de una partida
    ModoDeCantado: string;
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
  //sonidos usados en el sistema.
  TSonidos = record
    AudioActivo: boolean;
    const
    Ganador='Audio\fanfarria.mp3';
    Punto=  'Audio\xilofono.mp3';
  end;

  procedure Sonido(MPlay: TMediaPlayer; Arch: string; Volumen: single);

var
  Sonidos: TSonidos;
  Bingo: TBingo;
  CartJuego: array of TCartJuego;       //<-- los cartones ya escogidos;
  Ganador: array of TGanador;           //<-- el/los ganador(es) de partida

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

end.
