unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Layouts, FMX.Memo, System.Actions, FMX.ActnList, System.Rtti,
  FMX.Grid, FMX.ExtCtrls, FMX.ListBox, Data.DB, ABSMain, FMX.Objects, FMX.Header,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Controls.Presentation, FMX.Menus,
  System.ImageList, FMX.ImgList, FMX.Media, UtilesBingo;

type
  
  TFPrinc = class(TForm)
    Panel: TPanel;
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
    ActLst: TActionList;
    Action1: TAction;
    Action2: TAction;
    BIniciar: TButton;
    Grid: TStringGrid;
    SColNom: TStringColumn;
    SColCart: TStringColumn;
    Query: TABSQuery;
    BConsCarton: TButton;
    Action3: TAction;
    PpMenuJug: TPopupMenu;
    MIModificar: TMenuItem;
    MenuItem2: TMenuItem;
    MIEliminar: TMenuItem;
    EStBar: TEdit;
    ImageViewer1: TImageViewer;
    ImageList: TImageList;
    Circle1: TCircle;
    TxNumero: TText;
    Timer: TTimer;
    TrackBar: TTrackBar;
    PanelAuto: TPanel;
    LIntervalo: TLabel;
    CirclePlay: TCircle;
    BReiniciarTodo: TButton;
    LCantadas: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Expander3: TExpander;
    RBManual: TRadioButton;
    RBAutomatico: TRadioButton;
    Expander1: TExpander;
    ChBLnVt: TCheckBox;
    ChBLnHz: TCheckBox;
    ChBDgNr: TCheckBox;
    ChBDgIn: TCheckBox;
    ChTodo: TCheckBox;
    ChB4Esq: TCheckBox;
    ChBCdGr: TCheckBox;
    ChBCdPq: TCheckBox;
    ChBCrGr: TCheckBox;
    ChBCrPq: TCheckBox;
    Line1: TLine;
    Expander2: TExpander;
    LBDisp: TListBox;
    SBAsig: TSpeedButton;
    SBNoAsig: TSpeedButton;
    BAgregar: TButton;
    LBAsig: TListBox;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    ENombre: TEdit;
    BConsGanador: TButton;
    LTotJug: TLabel;
    LTotCartJuego: TLabel;
    LModoCantado: TLabel;
    LLetra: TLabel;
    MPlayer: TMediaPlayer;
    MPlayer2: TMediaPlayer;
    SwAudio: TSwitch;
    LAudio: TLabel;
    ExpCartones: TExpander;
    BAgrCarton: TButton;
    BElmCarton: TButton;
    procedure FormShow(Sender: TObject);
    procedure CBt1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure BIniciarClick(Sender: TObject);
    procedure BAgregarClick(Sender: TObject);
    procedure SBAsigClick(Sender: TObject);
    procedure SBNoAsigClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ENombreChangeTracking(Sender: TObject);
    procedure ChTodoChange(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MIModificarClick(Sender: TObject);
    procedure MIEliminarClick(Sender: TObject);
    procedure BReiniciarTodoClick(Sender: TObject);
    procedure ENombreEnter(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
    procedure RBManualChange(Sender: TObject);
    procedure CirclePlayClick(Sender: TObject);
    procedure BConsGanadorClick(Sender: TObject);
    procedure SwAudioClick(Sender: TObject);
    procedure BElmCartonClick(Sender: TObject);
    procedure BAgrCartonClick(Sender: TObject);
    procedure BModCartonClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValInicial;
    procedure ChequearPatrones;
    procedure MensajesSBar;
    procedure EliminarCartJuego(const Nombre: string); overload;
    procedure EliminarCartJuego(const NumCarton: integer); overload;
    procedure ActualizaDisponibles(Indice: integer);
  public
    { Public declarations }
    //procedure MostrarVentana(AClass: TFmxObjectClass);
    procedure InicializarDatosBingo;
  end;

var
  FPrinc: TFPrinc;
  NombreAnterior: string;

implementation

{$R *.fmx}

uses DataMod, NvoCarton, ConsCarton, AvisoBingo;

//// Utilidades ////

{Inicializa todos los valores del registro Bingo a sus valores predeterminados}
procedure TFPrinc.InicializarDatosBingo;
begin
  Bingo.EsNuevo:=true;
  Bingo.EsBingo:=false;
  Bingo.EsPlay:=false;
  Bingo.TotalCantados:=0;
  Bingo.TotalCartones:=Length(Cartones);
  Bingo.TotalGanadores:=0;
  Bingo.TotalJugadores:=Grid.RowCount;
  Bingo.TotalCartEnJuego:=Length(CartJuego);
end;

{Elimina los cartones asignados en el array CartJuego a partir del nombre}
procedure TFPrinc.EliminarCartJuego(const Nombre: string);
var
  I,Ind: integer;
  Nvo: array of TCartJuego;
begin
  Ind:=0;
  for I:=0 to Length(CartJuego)-1 do
    if CartJuego[I].Nombre<>Nombre then
    begin
      Ind:=Ind+1;
      SetLength(Nvo,Ind);
      Nvo[Ind-1]:=CartJuego[I];
    end
    else ActualizaDisponibles(I);
  LBDisp.Repaint;
  SetLength(CartJuego,Length(Nvo));
  for I:=0 to Length(Nvo)-1 do CartJuego[I]:=Nvo[I];
  Nvo:=nil;
end;

{Elimina los cartones asignados en el array CartJuego a partir del núm cartón}
procedure TFPrinc.EliminarCartJuego(const NumCarton: integer);
var
  I,Ind: integer;
  Nvo: array of TCartJuego;
begin
  Ind:=0;
  for I:=0 to Length(CartJuego)-1 do
    if CartJuego[I].NumCarton<>NumCarton then
    begin
      Ind:=Ind+1;
      SetLength(Nvo,Ind);
      Nvo[Ind-1]:=CartJuego[I];
    end
    else ActualizaDisponibles(I);
  LBDisp.Repaint;
  SetLength(CartJuego,Length(Nvo));
  for I:=0 to Length(Nvo)-1 do CartJuego[I]:=Nvo[I];
  Nvo:=nil;
end;

{Actualiza el listbox con los cartones disponibles}
procedure TFPrinc.ActualizaDisponibles(Indice: integer);
begin
  if CartJuego[Indice].NumCarton<10 then
    LBDisp.Items.Add('0'+CartJuego[Indice].NumCarton.ToString)
  else LBDisp.Items.Add(CartJuego[Indice].NumCarton.ToString);
end;

procedure TFPrinc.ValInicial;
var
  I: byte;
  CBt: TComponent;
begin
  Bingo.EsNuevo:=true;
  Expander1.Enabled:=true;
  Expander2.Enabled:=true;
  Expander3.Enabled:=true;
  ExpCartones.Enabled:=true;
  Expander1.IsExpanded:=false;
  Expander2.IsExpanded:=false;
  Expander3.IsExpanded:=false;
  ExpCartones.IsExpanded:=false;
  BAgregar.Enabled:=false;
  BConsGanador.Enabled:=false;
  BIniciar.Enabled:=Grid.RowCount>1;
  //pone los botones del cartón general a sus valores iniciales
  for I:=1 to 75 do
  begin
    CBt:=FindComponent('CBt'+I.ToString);
    TCornerButton(CBt).IsPressed:=false;
    TCornerButton(CBt).TextSettings.FontColor:=4278190080;  //color negro
  end;
end;

{Chequea los patrones en todos los cartones en juego para determinar un ganador}
procedure TFPrinc.ChequearPatrones;
var
  I: byte;
begin
  for I:=0 to Length(CartJuego)-1 do
  begin
    if ChTodo.IsChecked then TodoCarton(I)
    else
    begin
      if ChB4Esq.IsChecked then CuatroEsquinas(I);
      if ChBCdGr.IsChecked then CuadroGrande(I);
      if ChBCdPq.IsChecked then CuadroChiquito(I);
      if ChBCrGr.IsChecked then CruzGrande(I);
      if ChBCrPq.IsChecked then CruzChiquita(I);
      if ChBLnVt.IsChecked then LineaVert(I);
      if ChBLnHz.IsChecked then LineaHoriz(I);
      if ChBDgNr.IsChecked then DiagNormal(I);
      if ChBDgIn.IsChecked then DiagInversa(I);
    end;
  end;
  BIniciar.Enabled:=Bingo.EsBingo;
  BConsGanador.Enabled:=Bingo.EsBingo;
  Expander1.Enabled:=Bingo.EsBingo;
  Expander2.Enabled:=Bingo.EsBingo;
  Expander3.Enabled:=Bingo.EsBingo;
  Timer.Enabled:=not Bingo.EsBingo and RBAutomatico.IsChecked;
  if Bingo.EsBingo then
  begin
    with TFAvisoBingo.Create(Self) do
      try ShowModal;
      finally Free
    end;
  end;
end;

{Muestra mensajes en un TEdit con efectos de StatusBar}
procedure TFPrinc.MensajesSBar;
begin
  with Bingo do
    EStBar.Text:=' Total cartones en juego: '+TotalCartEnJuego.ToString+' -- '+
    'Total cartones disponibles: '+(TotalCartones-TotalCartEnJuego).ToString;
end;

//// Sorteo automático ////

procedure TFPrinc.CirclePlayClick(Sender: TObject);
begin
  Bingo.EsPlay:=not Bingo.EsPlay;
  Timer.Enabled:=Bingo.EsPlay;
  if Bingo.EsPlay then
    CirclePlay.Fill.Bitmap.Bitmap.LoadFromFile('Imagen\pausa.png')
  else CirclePlay.Fill.Bitmap.Bitmap.LoadFromFile('Imagen\play.png');
end;

procedure TFPrinc.TimerTimer(Sender: TObject);
var
  Cbt: TComponent;
  Num: byte;
begin
  Num:=Random(75)+1;   //se obtiene el número de la bola obtenido aleatoriamente
  CBt:=FindComponent('CBt'+Num.ToString);
  //se filtra para que los números repetidos no se cuenten:
  if not TCornerButton(CBt).IsPressed then
  begin
    case Num of
      01..15: LLetra.Text:='B';
      16..30: LLetra.Text:='I';
      31..45: LLetra.Text:='N';
      46..60: LLetra.Text:='G';
      61..75: LLetra.Text:='O';
    end;
    TxNumero.Text:=Num.ToString;
    Bingo.TotalCantados:=Bingo.TotalCantados+1;
    LCantadas.Text:='Cantadas: '+Bingo.TotalCantados.ToString;
    //se marcan las bolas cantadas en el tablero general:
    TCornerButton(CBt).SetFocus;
    TCornerButton(CBt).IsPressed:=true;
    TCornerButton(CBt).TextSettings.FontColor:=4294901760;
    //los audios:
    if Sonidos.AudioActivo then
    begin
      Sonido(MPlayer2,Sonidos.Punto,0.6);
      if Num<10 then
        Sonido(MPlayer,'Audio\'+LLetra.Text+'-0'+Num.ToString+'.mp3',1)
      else Sonido(MPlayer,'Audio\'+LLetra.Text+'-'+Num.ToString+'.mp3',1);
    end;
    //se 'ficha' el número cantado en los cartones y se chequean patrones:
    MarcaNumeros(Num,true);
    ChequearPatrones;
    Timer.Interval:=Trunc(TrackBar.Value)*1000;
  end
  else Timer.Interval:=1;
end;

procedure TFPrinc.TrackBarChange(Sender: TObject);
begin
  Timer.Interval:=Trunc(TrackBar.Value)*1000;
  LIntervalo.Text:='Intervalo: '+Trunc(TrackBar.Value).ToString+' seg.';
end;

//// Botones ////

procedure TFPrinc.BAgregarClick(Sender: TObject);
var
  I: byte;
  ListaCarts: string;
begin
  ListaCarts:='';
  for I:=0 to LBAsig.Count-1 do ListaCarts:=ListaCarts+LBAsig.Items[I]+' - ';
  if Bingo.EsNuevo then
  begin
    Grid.RowCount:=Grid.RowCount+1;
    Grid.Cells[0,Grid.RowCount-1]:=ENombre.Text;
    Grid.Cells[1,Grid.RowCount-1]:=ListaCarts
  end
  else
  begin
    Grid.Cells[0,Grid.Row]:=ENombre.Text;
    Grid.Cells[1,Grid.Row]:=ListaCarts;
    //se sustituye el nombre anterior por el nuevo en array CartJuego:
    if ENombre.Text<>NombreAnterior then
      for I:=0 to High(CartJuego) do
        if CartJuego[I].Nombre=NombreAnterior then
          CartJuego[I].Nombre:=ENombre.Text;
  end;
  BIniciar.Enabled:=Grid.RowCount>1;
  BConsGanador.Visible:=Grid.RowCount>1;
  LBAsig.Clear;
  NombreAnterior:='';
  ENombre.Text:='';
  ENombre.SetFocus;
  Bingo.EsNuevo:=true;
  BAgregar.Text:='Agregar jugador';
  MensajesSBar;
end;

procedure TFPrinc.BConsGanadorClick(Sender: TObject);
begin
  Bingo.EsConsCrtGanador:=TButton(Sender).Text='Consultar ganadores...';
  Action1Execute(Self);
end;

procedure TFPrinc.BIniciarClick(Sender: TObject);
var
  I,X,Y: byte;
  ModoCantado: string;
  CBt: TComponent;
begin
  Ganador:=nil;
  ValInicial;
  Expander1.Enabled:=false;
  Expander2.Enabled:=false;
  Expander3.Enabled:=false;
  //se 'quitan' las fichas del cartón:
  for I:=0 to Length(CartJuego)-1 do
    for X:=1 to 5 do
      for Y:=1 to 5 do CartJuego[I].Carton[X,Y].Activo:=(X=3) and (Y=3);
  LTotJug.Text:='Total jugadores: '+Grid.RowCount.ToString;
  LTotCartJuego.Text:='Total cartones en juego: '+Bingo.TotalCartEnJuego.ToString;
  LModoCantado.Text:='Modo de cantado: '+Bingo.ModoDeCantado;
  //los controles correspondientes:
  Panel.Enabled:=true;
  PanelAuto.Enabled:=RBAutomatico.IsChecked;
  BIniciar.Enabled:=false;
  BConsGanador.Enabled:=false;
  Bingo.EsBingo:=false;
  Bingo.EsPlay:=false;
  for I:=1 to 75 do
  begin
    CBt:=FindComponent('CBt'+I.ToString);
    TCornerButton(CBt).Enabled:=RBManual.IsChecked;
  end;
  if RBAutomatico.IsChecked then
  begin
    LLetra.Text:='X';
    TxNumero.Text:='0';
    if FileExists('Imagen\play.png') then
      CirclePlay.Fill.Bitmap.Bitmap.LoadFromFile('Imagen\play.png');
    Randomize;
  end;
  InicializarDatosBingo;
  MensajesSBar;
end;

procedure TFPrinc.BAgrCartonClick(Sender: TObject);
begin
//
end;

procedure TFPrinc.BModCartonClick(Sender: TObject);
begin
//
end;

procedure TFPrinc.BElmCartonClick(Sender: TObject);
begin
  if MessageDlg('Tenga en cuenta que este paso es irreversible. ¿Realmente '+
    'desea eliminar todos los cartones? ',TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0)=mrYes then
  begin
    Query.SQL.Text:='truncate table Carton';
    Query.ExecSQL;
    InicializarDatosBingo;
    MensajesSBar;
    ShowMessage('Todas las tablas fueron eliminadas. Deberá cargar otras nuevas');
  end;
end;

procedure TFPrinc.BReiniciarTodoClick(Sender: TObject);
var
  I: integer;
begin
  for I:=0 to Length(CartJuego)-1 do ActualizaDisponibles(I);
  ValInicial;
  Grid.RowCount:=0;
  CartJuego:=nil;
  MensajesSBar;
end;

procedure TFPrinc.CBt1Click(Sender: TObject);
var
  I,Num: byte;
  Activo: boolean;
  Cbt: TComponent;
begin
  Num:=TCornerButton(Sender).Text.ToInteger;
  Activo:=TCornerButton(Sender).IsPressed;
  if Activo then
  begin
    TCornerButton(Sender).TextSettings.FontColor:=4294901760;  //rojo
    Bingo.TotalCantados:=Bingo.TotalCantados+1;
  end
  else
  begin
    TCornerButton(Sender).TextSettings.FontColor:=4278190080; //negro
    Bingo.TotalCantados:=Bingo.TotalCantados-1;
  end;
  Sonido(MPlayer,Sonidos.Punto,0.6);
  LCantadas.Text:='Cantadas: '+Bingo.TotalCantados.ToString;
  MarcaNumeros(Num,Activo); //se 'ficha' el número cantado en los cartones
  ChequearPatrones;
end;

procedure TFPrinc.SBAsigClick(Sender: TObject);
var
  I,J,K,X,Y: byte;
begin
  I:=0;
  J:=Length(CartJuego);
  while LBDisp.Count>I do
  begin
    LBDisp.ItemIndex:=I;
    if LBDisp.ListItems[I].IsChecked then
    begin
      LBAsig.Items.Add(LBDisp.Items[I]);
      //se carga el arreglo con los datos del jugador:
      J:=J+1;
      SetLength(CartJuego,J);
      CartJuego[J-1].Nombre:=ENombre.Text;
      CartJuego[J-1].NumCarton:=LBDisp.Items[I].ToInteger;
      //se carga el arreglo con los datos del cartón:
      for K:=0 to Length(Cartones)-1 do
        if Cartones[K].NumCarton=CartJuego[J-1].NumCarton then
        begin
          for X:=1 to 5 do
            for Y:=1 to 5 do
            begin
              CartJuego[J-1].Carton[X,Y].Num:=Cartones[K].Numero[X,Y].Num;
              CartJuego[J-1].Carton[X,Y].Activo:=Cartones[K].Numero[X,Y].Activo;
            end;
          Break;
        end;
      LBDisp.Items.Delete(I);
      I:=0;
    end
    else I:=I+1;
  end;
  LBDisp.ItemIndex:=0;
  BAgregar.Enabled:=(Length(ENombre.Text.Trim)>0) and (LBAsig.Items.Count>0);
  Bingo.TotalCartEnJuego:=Length(CartJuego);
  MensajesSBar;
end;

procedure TFPrinc.SBNoAsigClick(Sender: TObject);
var
  I: byte;
begin
  I:=0;
  while LBAsig.Count>I do
  begin
    LBAsig.ItemIndex:=I;
    if LBAsig.ListItems[I].IsChecked then
    begin
      //se carga el arreglo con los datos del jugador:
      EliminarCartJuego(LBAsig.ListItems[I].Text.ToInteger);
      LBAsig.Items.Delete(I);
      I:=0;
    end
    else I:=I+1;
  end;
  BAgregar.Enabled:=(Length(ENombre.Text.Trim)>0) and (LBAsig.Items.Count>0);
  Bingo.TotalCartEnJuego:=Length(CartJuego);
  MensajesSBar;
end;

//// PopUp Menú ////

{Modificar jugador}
procedure TFPrinc.MIModificarClick(Sender: TObject);
var
  I: integer;
begin
  if Grid.RowCount>0 then
  begin
    Expander2.IsExpanded:=true;
    LBAsig.Clear;
    ENombre.Text:=Grid.Cells[0,Grid.row];
    ENombre.SetFocus;
    for I:=0 to Length(CartJuego)-1 do
      if CartJuego[I].Nombre=ENombre.Text then
        if CartJuego[I].NumCarton<10 then
          LBAsig.Items.Add('0'+CartJuego[I].NumCarton.ToString)
        else LBAsig.Items.Add(CartJuego[I].NumCarton.ToString);
    Bingo.EsNuevo:=false;
    if Bingo.EsNuevo then BAgregar.Text:='Agregar jugador'
                     else BAgregar.Text:='Modificar jugador';
  end;
end;

{Eliminar jugador}
procedure TFPrinc.MIEliminarClick(Sender: TObject);
type
  TLista = record
    Nombre,Cartones: string;
  end;
var
  I,Indice: integer;
  Lista: array of TLista;
begin
  if Grid.RowCount>0 then
  begin
    EliminarCartJuego(Grid.Cells[0,Grid.Row]);
    //se crea y carga el array
    if Grid.Row>-1 then
    begin
      Indice:=0;
      SetLength(Lista,Grid.RowCount-1);
      for I:=0 to Grid.RowCount-1 do
        if I<>Grid.Row then
        begin
          Lista[Indice].Nombre:=Grid.Cells[0,I];
          Lista[Indice].Cartones:=Grid.Cells[1,I];
          Indice:=Indice+1;
        end;
      Grid.RowCount:=0;   //se borra el grid
      //se carga el grid con el array
      for I:=0 to Length(Lista)-1 do
      begin
        Grid.RowCount:=Grid.RowCount+1;
        Grid.Cells[0,I]:=Lista[I].Nombre;
        Grid.Cells[1,I]:=Lista[I].Cartones;
      end;
      Lista:=nil;
    end;
    MensajesSBar;
  end;
end;

//// Lo demás... ////

procedure TFPrinc.RBManualChange(Sender: TObject);
begin
  if RBManual.IsChecked then Bingo.ModoDeCantado:='manual'
                        else Bingo.ModoDeCantado:='automático';
end;

procedure TFPrinc.ENombreChangeTracking(Sender: TObject);
var
  Estado: boolean;
begin
  BAgregar.Enabled:=(Length(ENombre.Text.Trim)>0) and (LBAsig.Items.Count>0);
  Estado:=ENombre.Text.Trim<>'';
  LBDisp.Enabled:=Estado;
  SBAsig.Enabled:=Estado;
  SBNoAsig.Enabled:=Estado;
  LBAsig.Enabled:=Estado;
end;

procedure TFPrinc.ENombreEnter(Sender: TObject);
begin
  NombreAnterior:=ENombre.Text;
end;

procedure TFPrinc.Action1Execute(Sender: TObject);
begin
  with TFConsCarton.Create(Self) do
    try ShowModal;
    finally Free
  end;
end;

procedure TFPrinc.Action2Execute(Sender: TObject);
begin
  with TFNvoCarton.Create(Self) do
    try ShowModal;
    finally Free
  end;
end;

procedure TFPrinc.Action3Execute(Sender: TObject);
begin
//
end;

procedure TFPrinc.SwAudioClick(Sender: TObject);
begin
  if SwAudio.IsChecked then LAudio.Text:='Audio SÍ'
                       else LAudio.Text:='Audio NO';
  Sonidos.AudioActivo:=SwAudio.IsChecked;
end;

procedure TFPrinc.ChTodoChange(Sender: TObject);
begin
  ChB4Esq.Enabled:=not ChTodo.IsChecked;
  ChBCdGr.Enabled:=not ChTodo.IsChecked;
  ChBCdPq.Enabled:=not ChTodo.IsChecked;
  ChBCrGr.Enabled:=not ChTodo.IsChecked;
  ChBCrPq.Enabled:=not ChTodo.IsChecked;
  ChBLnVt.Enabled:=not ChTodo.IsChecked;
  ChBLnHz.Enabled:=not ChTodo.IsChecked;
  ChBDgNr.Enabled:=not ChTodo.IsChecked;
  ChBDgIn.Enabled:=not ChTodo.IsChecked;
end;

procedure TFPrinc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('¿Desea salir de la aplicación?',TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0)=mrYes then
    DMod.AbsDB.Connected:=false;
  CanClose:=not DMod.AbsDB.Connected;
end;

procedure TFPrinc.FormCreate(Sender: TObject);
begin
  Sonidos.AudioActivo:=SwAudio.IsChecked;
  Expander3.IsExpanded:=true;
  Expander2.IsExpanded:=true;
  Expander1.IsExpanded:=true;
  ExpCartones.IsExpanded:=true;
  Expander3.Height:=90;
  Expander2.Height:=275;
  Expander1.Height:=225;
  ExpCartones.Height:=135;
  RBManualChange(Self);
  ValInicial;
end;

procedure TFPrinc.FormShow(Sender: TObject);
var
  I,J,X,Y: byte;
  CBt: TComponent;
begin
  //se colocan los números de cada botón:
  for I:=1 to 75 do
  begin
    CBt:=FindComponent('CBt'+I.ToString);
    TCornerButton(CBt).Text:=I.ToString;
  end;
  //se cargan todos los cartones guardados en BD y el listbox con los disponibles:
  Query.SQL.Text:='select * from Carton order by NumCart';
  Query.Open;
  I:=0;
  SetLength(Cartones,Query.RecordCount);
  Query.First;
  while not Query.Eof do
  begin
    //carga del listbox:
    if Query['NumCart']>=10 then
      LBDisp.Items.Add(Query.FieldByName('NumCart').AsString)
    else LBDisp.Items.Add('0'+Query.FieldByName('NumCart').AsString);
    //carga del array:
    Cartones[I].NumCarton:=Query.FieldByName('NumCart').AsInteger;
    J:=0;
    for X:=1 to 5 do
      for Y:=1 to 5 do
      begin
        J:=J+1;
        Cartones[I].Numero[X,Y].Num:=Query['N'+J.ToString];
        Cartones[I].Numero[X,Y].Activo:=J=13;     //se activa el "libre"
      end;
    I:=I+1;
    Query.Next;
  end;
  InicializarDatosBingo;
  MensajesSBar;
end;

end.      //922    782


(*
procedure TFPrinc.MostrarVentana(AClass: TFmxObjectClass {TFormClass});
begin
  with AClass.Create(Application) do
    try ShowModal
    finally Free
  end;
end; }   *)

(*
//este método es una alternativa a ActiveControl, ya que en FireMonkey siempre
  //tiene valor nil, lo que genera un error. con ActiveControl sería más fácil:
  {for I:=1 to 75 do
  begin
    CBt:=FindComponent('CBt'+I.ToString);
    if TCornerButton(CBt).IsFocused then
    begin
      Num:=I;
      Activo:=TCornerButton(CBt).IsPressed;
      if Activo then
        TCornerButton(CBt).TextSettings.FontColor:=4294901760  //rojo
      else
        TCornerButton(CBt).TextSettings.FontColor:=4278190080; //negro
      Break;
    end;
  end;}

*)
