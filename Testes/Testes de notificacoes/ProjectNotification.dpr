program ProjectNotification;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Notify,
  UfrmTelaNotificacao in 'UfrmTelaNotificacao.pas' {frmTelaNotificacao};

begin

  Ntfy.Notification(
    New.Notification
      .Topic('Estudio-Nova-Visao')
      .Title('Suas variações de imagem já estão prontas!')
      .MessageContent('Segue o link de acesso: www.teste.com')
  );

  Ntfy.Publish;

end.
