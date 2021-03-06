unit ConsCarton;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, Data.DB, ABSMain, FMX.ListBox, FMX.NumberBox, FMX.EditBox,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ExtCtrls, UtilesBingo;

type
  TFConsCarton = class(TForm)
    BConsultar: TButton;
    BSalir: TButton;
    Label1: TLabel;
    LJugador: TLabel;
    CBNumC: TComboBox;
    ImageViewer1: TImageViewer;
    L1: TLabel;
    L2: TLabel;
    L3: TLabel;
    L5: TLabel;
    L4: TLabel;
    L10: TLabel;
    L9: TLabel;
    L8: TLabel;
    L7: TLabel;
    L6: TLabel;
    L15: TLabel;
    L14: TLabel;
    L12: TLabel;
    L11: TLabel;
    L22: TLabel;
    L23: TLabel;
    L24: TLabel;
    L25: TLabel;
    L20: TLabel;
    L19: TLabel;
    L18: TLabel;
    L17: TLabel;
    L21: TLabel;
    L16: TLabel;
    LPatron: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BConsultarClick(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsCarton: TFConsCarton;
  Indice: byte;

implementation

{$R *.fmx}

uses Principal;

procedure TFConsCarton.BConsultarClick(Sender: TObject);
var
  Lbl: TComponent;
  Ind,I,X,Y: byte;
begin
  if Bingo.EsConsCrtGanador then
    Ind:=Ganador[CBNumC.ItemIndex].Indice
  else Ind:=CBNumC.ItemIndex;
  I:=0;
  for X:=1 to 5 do
    for Y:=1 to 5 do
    begin
      I:=I+1;
      if I<>13 then
      begin
        Lbl:=FindComponent('L'+I.ToString);
        if CartJuego[Ind].Carton[X,Y].Activo then
        begin
          TLabel(Lbl).TextSettings.FontColor:=4294901760;
          TLabel(Lbl).TextSettings.Font.Style:=[TFontStyle.fsBold]
        end
        else
        begin
          TLabel(Lbl).TextSettings.FontColor:=4278190080;
          TLabel(Lbl).TextSettings.Font.Style:=[]
        end;
        TLabel(Lbl).Text:=CartJuego[Ind].Carton[X,Y].Num.ToString;
      end;
    end;
  if Bingo.EsConsCrtGanador then
  begin
    LJUgador.Text:='Jugador: '+Ganador[CBNumC.ItemIndex].Jugador;
    LPatron.Text:='Patr�n: '+Ganador[CBNumC.ItemIndex].Patron
  end
  else LJUgador.Text:='Jugador: '+CartJuego[CBNumC.ItemIndex].Nombre;
end;

procedure TFConsCarton.BSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFConsCarton.FormShow(Sender: TObject);
var
  I: byte;
begin
  LPatron.Visible:=Bingo.EsConsCrtGanador;
  //crea la lista de los cartones...
  if Bingo.EsConsCrtGanador then   //... ganadores:
    for I:=0 to Length(Ganador)-1 do
      CBNumC.Items.Add(Ganador[I].NumCarton)
  else
    if Length(CartJuego)>0 then    //... en juego:
      for I:=0 to Length(CartJuego)-1 do
        CBNumC.Items.Add(CartJuego[I].NumCarton.ToString);
  BConsultar.Enabled:=CBNumC.Count>0;
end;

end.

(*
procedure TFConsCarton.BConsultarClick(Sender: TObject);
var
  NBx: TComponent;
  I,X,Y: byte;
begin
  I:=0;
  for X:=1 to 5 do
    for Y:=1 to 5 do
    begin
      I:=I+1;
      if I<>13 then
      begin
        NBx:=FindComponent('NB'+IntToStr(I));
        TNumberBox(NBx).Value:=FPrinc.CartJuego[CBNumC.ItemIndex].Carton[X,Y].Num;
        if FPrinc.CartJuego[CBNumC.ItemIndex].Carton[X,Y].Activo then
        begin
          TNumberBox(NBx).TextSettings.FontColor:=4294901760;
          TNumberBox(NBx).TextSettings.Font.Style:=[TFontStyle.fsBold]
        end
        else
        begin
          TNumberBox(NBx).TextSettings.FontColor:=4278190080;
          TNumberBox(NBx).TextSettings.Font.Style:=[]
        end;
      end;
    end;
  LJUgador.Text:='Jugador: '+FPrinc.CartJuego[CBNumC.ItemIndex].Nombre;
end;

procedure TFConsCarton.BConsultarClick(Sender: TObject);
var
  Lbl: TComponent;
  Ind,I,X,Y: byte;
begin
  Ind:=0;
  while CBNumC.Selected.Text.ToInteger<>FPrinc.CartJuego[Ind].NumCarton do
    Ind:=Ind+1;
  I:=0;
  for X:=1 to 5 do
    for Y:=1 to 5 do
    begin
      I:=I+1;
      if I<>13 then
      begin
        Lbl:=FindComponent('L'+I.ToString);
        //TLabel(Lbl).Text:=FPrinc.CartJuego[CBNumC.ItemIndex].Carton[X,Y].Num.ToString;
        if FPrinc.CartJuego[CBNumC.ItemIndex].Carton[X,Y].Activo then
        begin
          TLabel(Lbl).TextSettings.FontColor:=4294901760;
          TLabel(Lbl).TextSettings.Font.Style:=[TFontStyle.fsBold]
        end
        else
        begin
          TLabel(Lbl).TextSettings.FontColor:=4278190080;
          TLabel(Lbl).TextSettings.Font.Style:=[]
        end;
        TLabel(Lbl).Text:=FPrinc.CartJuego[CBNumC.ItemIndex].Carton[X,Y].Num.ToString;
      end;
    end;
  //LJUgador.Text:='Jugador: '+FPrinc.CartJuego[CBNumC.ItemIndex].Nombre;
  LJUgador.Text:='Jugador: '+FPrinc.Ganador[CBNumC.ItemIndex].Jugador;
  LPatron.Text:='Patr�n: '+FPrinc.Ganador[CBNumC.ItemIndex].Patron;
end;
*)
