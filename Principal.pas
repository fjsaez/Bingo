{  POR HACER:
- la primera modificación la hace, pero la segunda en el mismo jugador
modificado no.
- en esa segunda modificación no carga los cartones escogidos
}
unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Layouts, FMX.Memo, System.Actions, FMX.ActnList, System.Rtti,
  FMX.Grid, FMX.ExtCtrls, FMX.ListBox, Data.DB, ABSMain, FMX.Objects, FMX.Header,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Controls.Presentation, FMX.Menus;

type
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
  end;
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
    CornerButton2: TCornerButton;
    Action2: TAction;
    BIniciar: TButton;
    Grid: TStringGrid;
    SColNom: TStringColumn;
    SColCart: TStringColumn;
    Query: TABSQuery;
    BConsC: TButton;
    Action3: TAction;
    SColAct: TStringColumn;
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
    ENombre: TEdit;
    Label6: TLabel;
    PpMenuJug: TPopupMenu;
    MIModificar: TMenuItem;
    MenuItem2: TMenuItem;
    MIEliminar: TMenuItem;
    EStBar: TEdit;
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
  private
    { Private declarations }
    procedure ValInicial;
    procedure MarcaNumeros(Num: byte; Activo: boolean);
    procedure AvisoBingo(Patron: string; Ind: byte);
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
  public
    { Public declarations }
    var
      CartJuego: array of TCartJuego;       //<-- los cartones ya escogidos;
      Ganador: array of TGanador;           //<-- el/los ganador(es) de partida
    //procedure MostrarVentana(AClass: TFmxObjectClass);
    procedure MensajesSBar;
    procedure EliminarCartJuego(const Nombre: string);
  end;



var
  FPrinc: TFPrinc;
  Cartones: array of TCarton;               //<-- todos los cartones del archivo
  EsNuevo,EsBingo: boolean;

implementation

{$R *.fmx}

uses DataMod, NvoCarton, ConsCarton, AvisoBingo;

{Elimina los cartones asignados en el array CartJuego}
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
    end;
  SetLength(CartJuego,Length(Nvo));
  for I:=0 to Length(Nvo)-1 do CartJuego[I]:=Nvo[I];
  SetLength(Nvo,0);
end;

procedure TFPrinc.ValInicial;
var
  I: byte;
  CBt: TComponent;
begin
  EsNuevo:=true;
  Expander1.Enabled:=true;
  Expander2.Enabled:=true;
  Expander1.IsExpanded:=false;
  Expander2.IsExpanded:=false;
  BAgregar.Enabled:=false;
  BConsC.Enabled:=false;
  BIniciar.Enabled:=Grid.RowCount>1;
  //pone los botones del cartón general a sus valores iniciales
  for I:=1 to 75 do
  begin
    CBt:=FindComponent('CBt'+IntToStr(I));
    TCornerButton(CBt).IsPressed:=false;
    TCornerButton(CBt).TextSettings.FontColor:=4278190080;
  end;
end;

{'pone' una ficha al número existente en el cartón}
procedure TFPrinc.MarcaNumeros(Num: byte; Activo: boolean);
var
  X,Y,I: byte;
begin
  for I:=0 to Length(CartJuego)-1 do
    for X:=1 to 5 do
      for Y:=1 to 5 do
        if Num=CartJuego[I].Carton[X,Y].Num then
          CartJuego[I].Carton[X,Y].Activo:=Activo;
end;

{Muestra mensajes en un TEdit con efectos de StatusBar}
procedure TFPrinc.MensajesSBar;
begin
  EStBar.Text:=' Total cartones en juego: '+Length(CartJuego).ToString+' -- '+
    ' Total cartones disponibles: '+LBDisp.Count.ToString;
end;

{Modificar jugador}
procedure TFPrinc.MIModificarClick(Sender: TObject);
var
  I: integer;
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
  EsNuevo:=false;
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
    SetLength(Lista,0);
  end;
  MensajesSBar;
end;

procedure TFPrinc.AvisoBingo(Patron: string; Ind: byte);
var
  Tamano: byte;
begin
  SetLength(Ganador,Length(Ganador)+1);
  Tamano:=Length(Ganador)-1;
  Ganador[Tamano].Jugador:=CartJuego[Ind].Nombre;
  Ganador[Tamano].NumCarton:=IntToStr(CartJuego[Ind].NumCarton);
  Ganador[Tamano].Patron:=Patron;
  EsBingo:=true;
end;

/// los patrones: ////

procedure TFPrinc.CuatroEsquinas(I: byte);
begin
  if CartJuego[I].Carton[1,1].Activo and CartJuego[I].Carton[1,5].Activo and
     CartJuego[I].Carton[5,1].Activo and CartJuego[I].Carton[5,5].Activo then
       AvisoBingo('Cuatro Esquinas',I);
end;

procedure TFPrinc.CuadroGrande(I: byte);
var
  X,Y: Integer;
begin
  for X:=1 to 3 do
    for Y:=1 to 3 do
      if CartJuego[I].Carton[X,Y].Activo and
         CartJuego[I].Carton[X+2,Y].Activo and
         CartJuego[I].Carton[X,Y+2].Activo and
         CartJuego[I].Carton[X+2,Y+2].Activo then AvisoBingo('Cuadro Grande',I);
end;

procedure TFPrinc.CuadroChiquito(I: byte);
var
  X,Y: Integer;
begin
  for X:=1 to 4 do
    for Y:=1 to 4 do
      if CartJuego[I].Carton[X,Y].Activo and
         CartJuego[I].Carton[X+1,Y].Activo and
         CartJuego[I].Carton[X,Y+1].Activo and
         CartJuego[I].Carton[X+1,Y+1].Activo then
           AvisoBingo('Cuadro Chiquito',I);
end;

procedure TFPrinc.CruzGrande(I: byte);
begin
  if CartJuego[I].Carton[3,1].Activo and CartJuego[I].Carton[3,5].Activo and
     CartJuego[I].Carton[1,3].Activo and CartJuego[I].Carton[5,3].Activo then
       AvisoBingo('Cruz Grande',I);
end;

procedure TFPrinc.CruzChiquita(I: byte);
var
  X,Y: Integer;
begin
  for X:=1 to 2 do
    for Y:=1 to 2 do
      if CartJuego[I].Carton[X+1,Y].Activo and
         CartJuego[I].Carton[X+1,Y+2].Activo and
         CartJuego[I].Carton[X,Y+1].Activo and
         CartJuego[I].Carton[X+2,Y+1].Activo then AvisoBingo('Cruz Chiquita',I);
end;

procedure TFPrinc.LineaVert(I: byte);
var
  X: byte;
begin
  for X:=1 to 5 do
    if CartJuego[I].Carton[X,1].Activo and CartJuego[I].Carton[X,2].Activo and
       CartJuego[I].Carton[X,3].Activo and CartJuego[I].Carton[X,4].Activo and
       CartJuego[I].Carton[X,5].Activo then AvisoBingo('Linea Vertical',I);
end;

procedure TFPrinc.LineaHoriz(I: byte);
var
  Y: byte;
begin
  for Y:=1 to 5 do
    if CartJuego[I].Carton[1,Y].Activo and CartJuego[I].Carton[2,Y].Activo and
       CartJuego[I].Carton[3,Y].Activo and CartJuego[I].Carton[4,Y].Activo and
       CartJuego[I].Carton[5,Y].Activo then AvisoBingo('Linea Horizontal',I);
end;

procedure TFPrinc.DiagNormal(I: byte);
begin
  if CartJuego[I].Carton[1,1].Activo and CartJuego[I].Carton[2,2].Activo and
     CartJuego[I].Carton[4,4].Activo and CartJuego[I].Carton[5,5].Activo then
       AvisoBingo('Macheteao derecho',I);
end;

procedure TFPrinc.DiagInversa(I: byte);
begin
  if CartJuego[I].Carton[5,1].Activo and CartJuego[I].Carton[4,2].Activo and
     CartJuego[I].Carton[2,4].Activo and CartJuego[I].Carton[1,5].Activo then
       AvisoBingo('Macheteao al revés',I);
end;

procedure TFPrinc.TodoCarton(I: byte);
var
  X,Y,Cont: byte;
begin
  Cont:=0;
  for X:=1 to 5 do
    for Y:=1 to 5 do
      if CartJuego[I].Carton[X,Y].Activo then Inc(Cont,1)
      else Break;
  if Cont=25 then AvisoBingo('Cartón FULL',I);
end;

/// fin patrones ///

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
  MensajesSBar;
end;

procedure TFPrinc.SBNoAsigClick(Sender: TObject);
var
  I,J: byte;
begin
  I:=0;
  J:=High(CartJuego);
  while LBAsig.Count>I do
  begin
    LBAsig.ItemIndex:=I;
    if LBAsig.ListItems[I].IsChecked then
    begin
      LBDisp.Items.Add(LBAsig.Items[I]);
      //se carga el arreglo con los datos del jugador:
      EliminarCartJuego(ENombre.Text);
      {J:=J-1;
      SetLength(CartJuego,J);
      LBAsig.Items.Delete(I);}
      I:=0;
    end
    else I:=I+1;
  end;
  BAgregar.Enabled:=(Length(ENombre.Text.Trim)>0) and (LBAsig.Items.Count>0);
  MensajesSBar;
end;

procedure TFPrinc.ENombreChangeTracking(Sender: TObject);
var
  Estado: boolean;
begin
  BAgregar.Enabled:=(Length(Trim(ENombre.Text))>0) and (LBAsig.Items.Count>0);
  Estado:=Trim(ENombre.Text)<>'';
  LBDisp.Enabled:=Estado;
  SBAsig.Enabled:=Estado;
  SBNoAsig.Enabled:=Estado;
  LBAsig.Enabled:=Estado;
end;

procedure TFPrinc.Action1Execute(Sender: TObject);
begin
  with TFConsCarton.Create(Self) do
    try ShowModal;
    finally Free
  end;
  //MostrarVentana(FConsCarton);
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

procedure TFPrinc.BAgregarClick(Sender: TObject);
var
  I: byte;
  ListaCarts: string;
begin
  ListaCarts:='';
  for I:=0 to LBAsig.Count-1 do ListaCarts:=ListaCarts+LBAsig.Items[I]+' - ';
  if EsNuevo then
  begin
    Grid.RowCount:=Grid.RowCount+1;
    Grid.Cells[0,Grid.RowCount-1]:=ENombre.Text;
    Grid.Cells[1,Grid.RowCount-1]:=ListaCarts
  end
  else
  begin
    Grid.Cells[0,Grid.Row]:=ENombre.Text;
    Grid.Cells[1,Grid.Row]:=ListaCarts
  end;
  BIniciar.Enabled:=Grid.RowCount>1;
  BConsC.Visible:=Grid.RowCount>1;
  LBAsig.Clear;
  ENombre.Text:='';
  ENombre.SetFocus;
  EsNuevo:=true;
end;

procedure TFPrinc.BIniciarClick(Sender: TObject);
var
  I,X,Y: byte;
begin
  ValInicial;
  Expander1.Enabled:=false;
  Expander2.Enabled:=false;
  //se 'quitan' las fichas del cartón:
  for I:=0 to Length(CartJuego)-1 do
    for X:=1 to 5 do
      for Y:=1 to 5 do CartJuego[I].Carton[X,Y].Activo:=(X=3) and (Y=3);
  ShowMessage('Total jugadores: '+IntToStr(Grid.RowCount));
  Panel.Enabled:=true;
  BIniciar.Enabled:=false;
  BConsC.Enabled:=true;
  EsBingo:=false;
end;

procedure TFPrinc.CBt1Click(Sender: TObject);
var
  I,Num: byte;
  Activo: boolean;
  Cbt: TComponent;
begin
  //este método es una alternativa a ActiveControl, ya que en FireMonkey siempre
  //tiene valor nil, lo que genera un error. con ActiveControl sería más fácil:
  for I:=1 to 75 do
  begin
    CBt:=FindComponent('CBt'+IntToStr(I));
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
  end;
  //se 'coloca ficha' el número cantado en todas los cartones (donde estuviere):
  MarcaNumeros(Num,Activo);
  //se chequean todos los cartones para ver si coinciden con los patrones:
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
  BIniciar.Enabled:=EsBingo;
  Expander1.Enabled:=EsBingo;
  Expander2.Enabled:=EsBingo;
  if EsBingo then //MostrarVentana(TFAvisoBingo);  {
    with TFAvisoBingo.Create(Self) do
      try ShowModal;
      finally Free
    end;
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
    CBt:=FindComponent('CBt'+IntToStr(I));
    TCornerButton(CBt).Text:=IntToStr(I);
  end;
  //se cargan todos los cartones guardados en la BD y
  //el listbox con los cartones disponibles:
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
        Cartones[I].Numero[X,Y].Num:=Query['N'+IntToStr(J)];
        Cartones[I].Numero[X,Y].Activo:=J=13;     //se activa el "libre"
      end;
    I:=I+1;
    Query.Next;
  end;
  MensajesSBar;
end;

end.


(*
procedure TFPrinc.MostrarVentana(AClass: TFmxObjectClass {TFormClass});
begin
  with AClass.Create(Application) do
    try ShowModal
    finally Free
  end;
end; }   *)
