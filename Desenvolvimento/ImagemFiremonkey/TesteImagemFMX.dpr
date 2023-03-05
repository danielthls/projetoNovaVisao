program TesteImagemFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  UfrmTeste in 'UfrmTeste.pas' {Form1},
  UService.Imagem in 'UService.Imagem.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
