unit NvoCarton;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit;

type
  TNumero = record
    Num: byte;
    Activo: boolean;
  end;
  TCarton = record
    Numero: array [1..5,1..5] of TNumero;
    NumCarton: byte;
  end;
  TFNvoCarton = class(TForm)
    Label1: TLabel;
    NBNumC: TNumberBox;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    NB1: TNumberBox;
    NB2: TNumberBox;
    NB3: TNumberBox;
    NB4: TNumberBox;
    NB5: TNumberBox;
    NB6: TNumberBox;
    NB7: TNumberBox;
    NB8: TNumberBox;
    NB9: TNumberBox;
    NB10: TNumberBox;
    NB11: TNumberBox;
    NB12: TNumberBox;
    NB14: TNumberBox;
    NB15: TNumberBox;
    NB16: TNumberBox;
    NB17: TNumberBox;
    NB18: TNumberBox;
    NB19: TNumberBox;
    NB20: TNumberBox;
    NB25: TNumberBox;
    NB24: TNumberBox;
    NB23: TNumberBox;
    NB22: TNumberBox;
    NB21: TNumberBox;
    BGuardar: TButton;
    BSalir: TButton;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure BGuardarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ActivaNumeros(Opcion: boolean);
  public
    { Public declarations }
  end;

var
  FNvoCarton: TFNvoCarton;

implementation

{$R *.fmx}

procedure TFNvoCarton.BSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFNvoCarton.Button1Click(Sender: TObject);
var
  Carton: TCarton;
  ArchCarton: TFileStream;
  NBx: TComponent;
  X,Y,I: byte;
  Hallado: boolean;
begin
  //se busca en el archivo para ver si ya el cartón está cargado:
  Hallado:=false;
  ArchCarton:=TFileStream.Create('cartones.dat',fmOpenRead);
  while (ArchCarton.Position<ArchCarton.Size) and not Hallado do
  begin
    ArchCarton.Read(Carton,SizeOf(Carton));
    Hallado:=Carton.NumCarton=NBNumC.Value;
  end;
  ArchCarton.Free;
  if Hallado then
  begin     //se carga la tabla en caso de existir:
    ShowMessage('Ya existe');
    I:=0;
    for X:=1 to 5 do
      for Y:=1 to 5 do
      begin
        I:=I+1;
        if I<>13 then NBx:=FindComponent('NB'+IntToStr(I));
        if (X<>3) and (Y<>3) then
          TNumberBox(NBx).Value:=Carton.Numero[X,Y].Num
        else TNumberBox(NBx).Value:=0;
        Carton.Numero[X,Y].Activo:=false;
      end;
  end
  else
  begin
    BGuardar.Enabled:=true;
    ActivaNumeros(true);
    NB1.SetFocus;
  end;


end;

procedure TFNvoCarton.BGuardarClick(Sender: TObject);
var
  Carton: TCarton;
  ArchCarton: TFileStream;
  NBx: TComponent;
  X,Y,I: byte;
  Cadena: string;
begin
  ArchCarton:=TFileStream.Create('cartones.dat',fmOpenWrite);
  I:=0;
  for X:=1 to 5 do
    for Y:=1 to 5 do
    begin
      I:=I+1;
      if I<>13 then NBx:=FindComponent('NB'+IntToStr(I));
      Cadena:=FloatToStr(TNumberBox(NBx).Value);
      if (X<>3) and (Y<>3) then Carton.Numero[X,Y].Num:=StrToInt(Cadena)
                           else Carton.Numero[X,Y].Num:=0;
      Carton.Numero[X,Y].Activo:=false;
    end;
  Cadena:=FloatToStr(NBNumC.Value);
  Carton.NumCarton:=StrToInt(Cadena);
  ArchCarton.Position:=ArchCarton.Size;
  ArchCarton.Write(Carton,SizeOf(Carton));
  ArchCarton.Free;
  ShowMessage('Cartón guardado exitosamente');
end;

procedure TFNvoCarton.FormShow(Sender: TObject);
begin
  ActivaNumeros(false);
  NBNumC.Value:=0;
  NBNumC.SetFocus;
end;

procedure TFNvoCarton.ActivaNumeros(Opcion: boolean);
var
  I: byte;
  NBx: TComponent;
begin
  //se (des)habilitan los numberboxes:
  for I:=1 to 25 do
  begin
    if I<>13 then NBx:=FindComponent('NB'+IntToStr(I));
    TNumberBox(NBx).Enabled:=Opcion;
  end;
end;

end.
