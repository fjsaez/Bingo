unit DataMod;

interface

uses
  System.SysUtils, System.Classes, ABSMain, Data.DB, UtilesBingo;

type
  TDMod = class(TDataModule)
    AbsDB: TABSDatabase;
    Query: TABSQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMod: TDMod;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDMod.DataModuleCreate(Sender: TObject);
begin
  AbsDB.DatabaseFileName:='MiBingo.ABS';
  AbsDB.Connected:=true;
  Query.SQL.Text:='select * from Config';
  Query.Open;
  //se crea el registro de tabla Config en caso de no existir:
  if Query.IsEmpty then
  begin
    Query.SQL.Text:='insert into Config (SonidoActivo,IntervSonido) values '+
      '(True,2)';
    Query.ExecSQL;
  end;
  Sistema.SonidoActivo:=Query.FieldByName('SonidoActivo').AsBoolean;
  Sistema.IntervSonido:=Query.FieldByName('IntervSonido').AsInteger;
end;

end.
