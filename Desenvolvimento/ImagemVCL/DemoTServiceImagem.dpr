program DemoTServiceImagem;

uses
  Vcl.Forms,
  UfrmTeste in 'UfrmTeste.pas' {Form1},
  UService.Imagem in 'UService.Imagem.pas',
  UChatGPT in 'UChatGPT.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
