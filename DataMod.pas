unit DataMod;

interface

uses
  System.SysUtils, System.Classes, ABSMain;

type
  TDMod = class(TDataModule)
    AbsDB: TABSDatabase;
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
end;

end.
