program NovaVisao_Frontend;

uses
  System.StartUpCopy,
  FMX.Forms,
  UfrmHome in 'views\UfrmHome.pas' {frmHome},
  UUtils.Enum in 'Utils\UUtils.Enum.pas',
  UfrmEnviar in 'views\UfrmEnviar.pas' {Form1},
  UService.Imagem in 'service\UService.Imagem.pas',
  UfrmCadastrar in 'views\UfrmCadastrar.pas' {frmCadastro},
  UfrmSistema in 'views\UfrmSistema.pas' {frmSistema},
  UfrmImagens in 'views\UfrmImagens.pas' {frmImagens},
  UService.ChatGPT in 'service\UService.ChatGPT.pas',
  UDao.Cliente in 'Dao\UDao.Cliente.pas',
  uEntity.Cliente in 'Entities\uEntity.Cliente.pas',
  UUtils.Banco in 'Utils\UUtils.Banco.pas',
  UService.Notificacao in 'service\UService.Notificacao.pas',
  UNotificacaoApp in 'units\UNotificacaoApp.pas',
  UNotificacaoEmail in 'units\UNotificacaoEmail.pas',
  UUtils.Consts in 'Utils\UUtils.Consts.pas',
  UDM in 'service\UDM.pas' {DM: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TfrmHome, frmHome);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
