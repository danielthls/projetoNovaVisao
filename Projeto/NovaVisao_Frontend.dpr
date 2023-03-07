program NovaVisao_Frontend;

uses
  System.StartUpCopy,
  FMX.Forms,
  UfrmHome in 'views\UfrmHome.pas' {frmHome},
  UEnum in 'Utils\UEnum.pas',
  UfrmEnviar in 'views\UfrmEnviar.pas' {Form1},
  UService.Imagem in 'service\UService.Imagem.pas',
  UfrmCadastrar in 'views\UfrmCadastrar.pas' {frmCadastro},
  UfrmSistema in 'views\UfrmSistema.pas' {frmSistema},
  UfrmImagens in 'views\UfrmImagens.pas' {frmImagens},
  UService.ChatGPT in 'service\UService.ChatGPT.pas',
  UConsts in 'consts\UConsts.pas',
  UService.Notificacao in 'service\UService.Notificacao.pas',
  UNotificacaoApp in 'units\UNotificacaoApp.pas',
  UNotificacaoEmail in 'units\UNotificacaoEmail.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TfrmHome, frmHome);
  Application.Run;
end.
