unit NvoCarton;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, Data.DB, ABSMain, FMX.EditBox, FMX.NumberBox, FMX.Controls.Presentation,
  FMX.Layouts, FMX.ExtCtrls;

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
    procedure FormShow(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure BGuardarClick(Sender: TObject);
    procedure BConsultarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValInicial;
    procedure ActivaNumeros(Opcion: boolean);
  public
    { Public declarations }
  end;

var
  FNvoCarton: TFNvoCarton;

implementation

{$R *.fmx}

procedure TFNvoCarton.ValInicial;
var
  I: byte;
  NBx: TComponent;
begin
  for I:=1 to 25 do
  begin
    if I<>13 then NBx:=FindComponent('NB'+IntToStr(I));
    TNumberBox(NBx).Value:=1;
  end;
  ActivaNumeros(false);
  NBNumC.Value:=0;
  NBNumC.SetFocus;
end;

procedure TFNvoCarton.BSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFNvoCarton.BConsultarClick(Sender: TObject);
var
  NBx: TComponent;
  X,Y,I: byte;
  Hallado: boolean;
begin
  Query.SQL.Text:='select * from Carton where NumCart=:nc';
  Query.ParamByName('nc').AsInteger:=StrToInt(NBNumC.Text);
  Query.Open;
  if Query.RecordCount>0 then
  begin     //se carga el cartón en caso de existir:
    ShowMessage('Ya existe');
    I:=0;
    for X:=1 to 5 do
      for Y:=1 to 5 do
      begin
        I:=I+1;
        if I<>13 then
        begin
          NBx:=FindComponent('NB'+IntToStr(I));
          TNumberBox(NBx).Value:=Query['N'+IntToStr(I)];
        end;
      end;
  end
  else
  begin
    BGuardar.Enabled:=true;
    I:=0;
    for X:=1 to 5 do
      for Y:=1 to 5 do
      begin
        I:=I+1;
        if I<>13 then
        begin
          NBx:=FindComponent('NB'+IntToStr(I));
          TNumberBox(NBx).Value:=1;
        end;
      end;
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
  Campos,Valores: string;
begin
  if (MessageDlg('¿Desea guardar el cartón?',TMsgDlgType.mtConfirmation,
     [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0)=mrYes) then
  begin
    Campos:='';  Valores:='';
    for I:=1 to 25 do
    begin
      NBx:=FindComponent('NB'+IntToStr(I));
      if I<>13 then Valores:=Valores+','+TNumberBox(NBx).Text
               else Valores:=Valores+',0';
      Campos:=Campos+',N'+IntToStr(I);
    end;
    Query.SQL.Text:='insert into Carton (NumCart'+Campos+') values (:nc'+Valores+')';
    Query.ParamByName('nc').AsInteger:=StrToInt(NBNumC.Text);
    Query.ExecSQL;
    ShowMessage('Cartón guardado exitosamente');
    ValInicial;
  end
  else ShowMessage('El cartón NO fue guardado');
end;

procedure TFNvoCarton.FormShow(Sender: TObject);
begin
  ValInicial;
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
