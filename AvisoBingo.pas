unit AvisoBingo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti, FMX.Grid, FMX.Layouts, FMX.Grid.Style, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Media, FMX.ExtCtrls;

type
  TFAvisoBingo = class(TForm)
    SGrid: TStringGrid;
    SCol1: TStringColumn;
    SCol2: TStringColumn;
    SCol3: TStringColumn;
    BTerminar: TButton;
    MPlayer: TMediaPlayer;
    ImageViewer1: TImageViewer;
    procedure FormCreate(Sender: TObject);
    procedure BTerminarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAvisoBingo: TFAvisoBingo;

implementation

{$R *.fmx}

uses Principal,UtilesBingo;

procedure TFAvisoBingo.BTerminarClick(Sender: TObject);
begin
  FPrinc.PanelTablero.Enabled:=false;
  FPrinc.PanelAuto.Enabled:=false;
  Close;
end;

procedure TFAvisoBingo.FormCreate(Sender: TObject);
var
  I: byte;
begin
  for I:=0 to Length(Ganador)-1 do
  begin
    SGrid.Cells[0,I]:=Ganador[I].Jugador;
    SGrid.Cells[1,I]:=Ganador[I].NumCarton;
    SGrid.Cells[2,I]:=Ganador[I].Patron;
  end;
end;

procedure TFAvisoBingo.FormShow(Sender: TObject);
begin
  if Sistema.SonidoActivo then Sonido(MPlayer,Sistema.Sonido.Ganador,0.7);
end;

end.
