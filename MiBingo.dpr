program MiBingo;

uses
  FMX.Forms,
  Principal in 'Principal.pas' {FPrinc},
  NvoCarton in 'NvoCarton.pas' {FNvoCarton},
  DataMod in 'DataMod.pas' {DMod: TDataModule},
  ConsCarton in 'ConsCarton.pas' {FConsCarton},
  AvisoBingo in 'AvisoBingo.pas' {FAvisoBingo},
  UtilesBingo in 'UtilesBingo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMod, DMod);
  Application.CreateForm(TFPrinc, FPrinc);
  Application.Run;
end.
