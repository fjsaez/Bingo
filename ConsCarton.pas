unit ConsCarton;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, Data.DB, ABSMain, FMX.ListBox, FMX.NumberBox, FMX.EditBox,
  FMX.Controls.Presentation;

type
  TFConsCarton = class(TForm)
    BConsultar: TButton;
    Label7: TLabel;
    BSalir: TButton;
    NB21: TNumberBox;
    NB22: TNumberBox;
    NB23: TNumberBox;
    NB24: TNumberBox;
    NB25: TNumberBox;
    NB20: TNumberBox;
    NB19: TNumberBox;
    NB18: TNumberBox;
    NB17: TNumberBox;
    NB16: TNumberBox;
    NB15: TNumberBox;
    NB14: TNumberBox;
    NB12: TNumberBox;
    NB11: TNumberBox;
    NB10: TNumberBox;
    NB9: TNumberBox;
    NB8: TNumberBox;
    NB7: TNumberBox;
    NB6: TNumberBox;
    NB5: TNumberBox;
    NB4: TNumberBox;
    NB3: TNumberBox;
    NB2: TNumberBox;
    NB1: TNumberBox;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    LJugador: TLabel;
    CBNumC: TComboBox;
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

procedure TFConsCarton.BSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFConsCarton.FormShow(Sender: TObject);
var
  I: byte;
begin
  for I:=0 to Length(FPrinc.CartJuego)-1 do
    CBNumC.Items.Add(IntToStr(FPrinc.CartJuego[I].NumCarton));
end;

end.
