unit AvisoBingo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti, FMX.Grid, FMX.Layouts;

type
  TFAvisoBingo = class(TForm)
    SGrid: TStringGrid;
    SCol1: TStringColumn;
    SCol2: TStringColumn;
    SCol3: TStringColumn;
    BTerminar: TButton;
    BContinuar: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTerminarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAvisoBingo: TFAvisoBingo;

implementation

{$R *.fmx}

uses Principal;

procedure TFAvisoBingo.BTerminarClick(Sender: TObject);
begin
  FPrinc.Panel.Enabled:=false;
  Close;
end;

procedure TFAvisoBingo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FPrinc.Ganador:=nil;
end;

procedure TFAvisoBingo.FormCreate(Sender: TObject);
var
  I: byte;
begin
  for I:=0 to Length(FPrinc.Ganador)-1 do
  begin
    SGrid.Cells[0,I]:=FPrinc.Ganador[I].Jugador;
    SGrid.Cells[1,I]:=FPrinc.Ganador[I].NumCarton;
    SGrid.Cells[2,I]:=FPrinc.Ganador[I].Patron;
  end;
end;

end.
