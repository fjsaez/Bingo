unit ConsCarton;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, Data.DB, ABSMain, FMX.ListBox, FMX.NumberBox, FMX.EditBox,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ExtCtrls;

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

implementation

{$R *.fmx}

uses Principal;

procedure TFConsCarton.BConsultarClick(Sender: TObject);
var
  Lbl: TComponent;
  I,X,Y: byte;
begin
  I:=0;
  for X:=1 to 5 do
    for Y:=1 to 5 do
    begin
      I:=I+1;
      if I<>13 then
      begin
        Lbl:=FindComponent('L'+I.ToString);
        TLabel(Lbl).Text:=FPrinc.CartJuego[CBNumC.ItemIndex].Carton[X,Y].Num.ToString;
        if FPrinc.CartJuego[CBNumC.ItemIndex].Carton[X,Y].Activo then
        begin
          TLabel(Lbl).TextSettings.FontColor:=$FFFF0000; //4294901760;
          TLabel(Lbl).TextSettings.Font.Style:=[TFontStyle.fsBold]
        end
        else
        begin
          TLabel(Lbl).TextSettings.FontColor:=4278190080;
          TLabel(Lbl).TextSettings.Font.Style:=[]
        end;
      end;
    end;
  LJUgador.Text:='Jugador: '+FPrinc.CartJuego[CBNumC.ItemIndex].Nombre;
end;

procedure TFConsCarton.BSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFConsCarton.FormShow(Sender: TObject);
var
  I: byte;
begin
  for I:=0 to Length(FPrinc.CartJuego)-1 do
    CBNumC.Items.Add(FPrinc.CartJuego[I].NumCarton.ToString);
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
*)
