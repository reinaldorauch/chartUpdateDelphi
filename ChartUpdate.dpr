program ChartUpdate;

uses
  Vcl.Forms,
  Princ in 'Princ.pas' {FmPrinc};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmPrinc, FmPrinc);
  Application.Run;
end.
