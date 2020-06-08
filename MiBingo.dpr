program MiBingo;

uses
  FMX.Forms,
  Principal in 'Principal.pas' {FPrinc},
  NvoCarton in 'NvoCarton.pas' {FNvoCarton};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFPrinc, FPrinc);
  Application.CreateForm(TFNvoCarton, FNvoCarton);
  Application.Run;
end.
