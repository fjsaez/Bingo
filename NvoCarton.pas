{
 - al hacer la modificación de un cartón en la bd, también hay que modificarlo
   en el array general. igualmente para cuando se inserta o se elimina.
}

unit NvoCarton;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, Data.DB, ABSMain, FMX.EditBox, FMX.NumberBox, FMX.ExtCtrls,
  FMX.Controls.Presentation, FMX.Layouts, UtilesBingo;

type
  TFNvoCarton = class(TForm)
    Label1: TLabel;
    NBNumC: TNumberBox;
    BConsultar: TButton;
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
    NB21: TNumberBox;
    NB22: TNumberBox;
    NB23: TNumberBox;
    NB24: TNumberBox;
    NB25: TNumberBox;
    BGuardar: TButton;
    BSalir: TButton;
    Query: TABSQuery;
    ImageViewer1: TImageViewer;
    RBModificar: TRadioButton;
    RBEliminar: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure BGuardarClick(Sender: TObject);
    procedure BConsultarClick(Sender: TObject);
    procedure NB1ChangeTracking(Sender: TObject);
    procedure RBModificarClick(Sender: TObject);
    procedure RBEliminarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValInicial;
    procedure ActivaNumeros(Opcion: boolean);
    procedure GuardarCarton(Opcion: byte);
    procedure ModificarCarton;
    procedure EliminarCarton;
  public
    { Public declarations }
  end;

  function CartonEsValido: boolean;
  function CartonRepetido(var NumCart: byte): boolean;

var
  FNvoCarton: TFNvoCarton;
  Carton: array [1..25] of byte;
  CartonHallado: boolean;

implementation

{$R *.fmx}

{Valida que no se repita ningún número en el cartón a guardar en la BD}
function CartonEsValido: boolean;
var
  I,J,K,Indice: byte;
  RepiteNumColumna: boolean;
begin
  RepiteNumColumna:=false;
  Indice:=1;
  //se chequea que cada columna no se repita
  for I:=1 to 5 do           //B(1..5),I(6..10),N(11..15),G(16..20),O(21..25)
  begin
    for J:=Indice to Indice+4 do
    begin
      for K:=J+1 to Indice+5 do
      begin
        RepiteNumColumna:=Carton[J]=Carton[K];
        if RepiteNumColumna then Break;
      end;
      if RepiteNumColumna then Break;
    end;
    if RepiteNumColumna then Break;
    Indice:=Indice+5;
  end;
  result:=not RepiteNumColumna;
end;

{Valida que el cartón no coincida en la misma estructura con otro de la BD}
function CartonRepetido(var NumCart: byte): boolean;
var
  I,J,X,Y,Cont: byte;
  EsRepetido: boolean;
begin
  EsRepetido:=false;
  for I:=0 to Length(Cartones)-1 do   //se recorren los cartones:
  begin
    Cont:=0;
    J:=0;
    for X:=1 to 5 do   //se recorre un cartón y se compara con el recién creado
      for Y:=1 to 5 do
      begin
        J:=J+1;
        if Cartones[I].Numero[X,Y].Num=Carton[J] then Cont:=Cont+1;
      end;
    EsRepetido:=Cont=25;
    if EsRepetido then
    begin
      NumCart:=Cartones[I].NumCarton;
      Break;
    end;
  end;
  result:=EsRepetido;
end;

procedure TFNvoCarton.ValInicial;
var
  I: byte;
  NBx: TComponent;
begin
  RBModificar.Visible:=false;
  RBEliminar.Visible:=false;
  BGuardar.Text:='Guardar';
  for I:=1 to 25 do
  begin
    if I<>13 then NBx:=FindComponent('NB'+I.ToString);
    TNumberBox(NBx).Value:=1;
  end;
  ActivaNumeros(false);
  NBNumC.Value:=0;
  NBNumC.SetFocus;
end;

procedure TFNvoCarton.GuardarCarton(Opcion: byte);
var
  NBx: TComponent;
  I,NCart: byte;
  Campos,Valores,Pregunta,QueryText,Mensaje: string;
begin
  if Opcion=1 then
  begin
    Pregunta:='¿Desea guardar el cartón?';
    Mensaje:='Cartón guardado exitosamente';
  end
  else
  begin
    Pregunta:='¿Desea modificar el cartón?';
    Mensaje:='Cartón modificado exitosamente';
  end;
  if CartonEsValido then
    if not CartonRepetido(NCart) then
      if (MessageDlg(Pregunta,TMsgDlgType.mtConfirmation,
         [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0)=mrYes) then
      begin
        Campos:='';  Valores:='';
        if Opcion=1 then  //modificar
        begin
          for I:=1 to 25 do
          begin
            NBx:=FindComponent('NB'+I.ToString);
            if I<>13 then Valores:=Valores+','+TNumberBox(NBx).Text
                     else Valores:=Valores+',0';
            Campos:=Campos+',N'+I.ToString;
          end;
          QueryText:='insert into Carton (NumCart'+Campos+') values (:nc'+Valores+')';
        end
        else
        begin
          for I:=1 to 25 do
          begin
            NBx:=FindComponent('NB'+I.ToString);
            if I<>13 then
              if I>1 then
                Valores:=Valores+',N'+I.ToString+'='+TNumberBox(NBx).Text
              else Valores:='N'+I.ToString+'='+TNumberBox(NBx).Text
            else Valores:=Valores+',N13=0';
          end;
          QueryText:='update Carton set '+Valores+' where NumCart=:nc';
        end;
        showmessage(QueryText);  //prueba
        Query.SQL.Text:=QueryText;//'insert into Carton (NumCart'+Campos+') values (:nc'+Valores+')';
        Query.ParamByName('nc').AsInteger:=StrToInt(NBNumC.Text);
        Query.ExecSQL;
        ShowMessage(Mensaje);
        ValInicial;
      end
      else ShowMessage('El cartón NO fue guardado')
    else ShowMessage('Ya existe uno igual (Cartón Nº '+NCart.ToString+')')
  else ShowMessage('El cartón repite número(s). Corregir, por favor');
end;

procedure TFNvoCarton.ModificarCarton;
begin

end;

procedure TFNvoCarton.EliminarCarton;
begin
  if (MessageDlg('¿Desea guardar el cartón?',TMsgDlgType.mtConfirmation,
     [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0)=mrYes) then
  begin
    Query.SQL.Text:='delete from Carton where NumCart=:nc';
    Query.ParamByName('nc').AsInteger:=Trunc(NBNumC.Value);
    Query.ExecSQL;
    ShowMessage('El cartón '+Trunc(NBNumC.Value).ToString+' fue eliminado');
  end
  else ShowMessage('El cartón '+Trunc(NBNumC.Value).ToString+' NO fue eliminado');

end;

procedure TFNvoCarton.BSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFNvoCarton.BConsultarClick(Sender: TObject);
var
  NBx: TComponent;
  X,Y,I: byte;
begin
  Query.SQL.Text:='select * from Carton where NumCart=:nc';
  Query.ParamByName('nc').AsInteger:=StrToInt(NBNumC.Text);
  Query.Open;
  if Query.RecordCount>0 then
  begin     //se carga el cartón en caso de existir:
    BGuardar.Text:='Modificar';
    I:=0;
    for X:=1 to 5 do
      for Y:=1 to 5 do
      begin
        I:=I+1;
        if I<>13 then
        begin
          NBx:=FindComponent('NB'+I.ToString);
          TNumberBox(NBx).Value:=Query['N'+I.ToString];
        end;
      end;
    ShowMessage('Ya existe');
  end
  else
  begin
    BGuardar.Text:='Guardar';
    I:=0;
    for X:=1 to 5 do
      for Y:=1 to 5 do
      begin
        I:=I+1;
        if I<>13 then
        begin
          NBx:=FindComponent('NB'+I.ToString);
          TNumberBox(NBx).Value:=1;
        end;
      end;

  end;
  RBModificar.Visible:=Query.RecordCount>0;
  RBEliminar.Visible:=Query.RecordCount>0;
  CartonHallado:=Query.RecordCount>0;
  ActivaNumeros(true);
  NB1.SetFocus;
end;

procedure TFNvoCarton.BGuardarClick(Sender: TObject);
begin
//  if RBModificar.IsVisible and RBModificar.IsChecked or
  //   not RBModificar.IsVisible then GuardarCarton;
  if CartonHallado and RBEliminar.IsChecked then EliminarCarton
  else
    if CartonHallado then GuardarCarton(2)
                     else GuardarCarton(1);
end;

procedure TFNvoCarton.FormShow(Sender: TObject);
begin
  ValInicial;
end;

procedure TFNvoCarton.NB1ChangeTracking(Sender: TObject);
var
  Ind: byte;
begin
  Ind:=StrToInt(Copy(TNumberBox(Sender).Name,3,Length(TNumberBox(Sender).Name)-2));
  Carton[Ind]:=Trunc(TNumberBox(Sender).Value);
end;

procedure TFNvoCarton.RBEliminarClick(Sender: TObject);
begin
  BGuardar.Text:='Eliminar';
end;

procedure TFNvoCarton.RBModificarClick(Sender: TObject);
begin
  BGuardar.Text:='Modificar';
end;

procedure TFNvoCarton.ActivaNumeros(Opcion: boolean);
var
  I: byte;
  NBx: TComponent;
begin
  //se (des)habilitan los numberboxes:
  for I:=1 to 25 do
  begin
    if I<>13 then NBx:=FindComponent('NB'+I.ToString);
    TNumberBox(NBx).Enabled:=Opcion;
  end;
end;

end.
