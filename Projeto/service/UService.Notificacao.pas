unit UServiceNotificacao;

interface

uses
   System.Classes;
type
  TNotificacao = class
    private
      FUsuario: String;//TUsuario;
      FUrlImagem: TStringList;
    public
      constructor Create(aUsuario: String{TUsuario}; aUrlImagem: TStringList);
      destructor Destroy; override;

      procedure SolicitarNotificacao(aTipoNotificacao: Integer);
  end;

implementation

{ TNotificacao }

uses
   UNotificacaoApp,
   UNotificacaoEmail,
   System.SysUtils,
   UEnum;

{Constructor}
constructor TNotificacao.Create(aUsuario: String{TUsuario}; aUrlImagem: TStringList);
begin
  Self.FUsuario   := aUsuario;
  Self.FUrlImagem := aUrlImagem;
end;

{Destructor}
destructor TNotificacao.Destroy;
begin
  //FreeAndNil(Self.FUsuario);
  FreeAndNil(Self.FUrlImagem);
  inherited;
end;

{Solicitar notificação}
procedure TNotificacao.SolicitarNotificacao(aTipoNotificacao: Integer);
begin
  case OpEnumEnviar(aTipoNotificacao) of
    opEnviarPorApp:
      TNotificacaoApp.EnviarNotificacao(Self.FUsuario, Self.FUrlImagem);
    opEnviarPorEmail :
      TNotificacaoEmail.EnviarNotificacao(Self.FUsuario, Self.FUrlImagem);
    opEnviarAmbos :
    begin
      TNotificacaoEmail.EnviarNotificacao(Self.FUsuario, Self.FUrlImagem);;
      TNotificacaoApp.EnviarNotificacao(Self.FUsuario, Self.FUrlImagem);
    end;
  end;
end;


end.
