unit UfrmEnviar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, UService.ChatGPT,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox,
  FMX.MultiView, UEntity.Cliente;

type
  TfrmEnviar = class(TForm)
    rectPrincipal: TRectangle;
    lytContainer: TLayout;
    imgNovavisao: TImage;
    gbFormasEnvio: TGroupBox;
    rbEmail: TRadioButton;
    rbCelular: TRadioButton;
    rbAmbos: TRadioButton;
    rectFoto: TRectangle;
    imgFoto: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblNome: TLabel;
    lblCelular: TLabel;
    lblEmail: TLabel;
    rectEnviar: TRectangle;
    Label4: TLabel;
    rectVoltar: TRectangle;
    Label5: TLabel;
    rectExibirImagens: TRectangle;
    Label6: TLabel;
    procedure rectVoltarClick(Sender: TObject);
    procedure rectExibirImagensClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rectEnviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure VoltarSistema;
    procedure ObterLinks;
  public
    { Public declarations }
  end;

var
  frmEnviar: TfrmEnviar;

implementation

uses
  UfrmSistema,
  UDM,
  UfrmImagens;

{$R *.fmx}

procedure TfrmEnviar.VoltarSistema;
begin
  if not Assigned(frmSistema) then
  begin
    Application.CreateForm(TfrmSistema, frmSistema);
  end;
  frmSistema.Show();
  Self.Hide;
end;

procedure TfrmEnviar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;

  frmEnviar := nil;
end;

procedure TfrmEnviar.FormShow(Sender: TObject);
begin
  if DM.xCliente <> nil then
  begin
  lblNome.Text := DM.xCliente.Nome;
  lblEmail.Text := DM.xCliente.Email;
  lblCelular.Text := DM.xCliente.Telefone;
  end;
end;

procedure TfrmEnviar.ObterLinks;
begin
  if not (Assigned(DM.xServiceChatGPT)) then
    DM.xServiceChatGPT := TServiceChatGPT.Create(frmSistema.cmbVariacoes.Items[frmSistema.cmbVariacoes.ItemIndex]);

  if not (DM.xServiceChatGPT.LinksGerados) then
    DM.xServiceChatGPT.FormarRequest;

end;

procedure TfrmEnviar.rectEnviarClick(Sender: TObject);
begin
  ObterLinks;
end;

procedure TfrmEnviar.rectExibirImagensClick(Sender: TObject);
begin
  if not Assigned(frmImagens) then
  begin
    Application.CreateForm(TfrmImagens, frmImagens);
  end;
  frmImagens.Show();
  Self.Hide;
end;

procedure TfrmEnviar.rectVoltarClick(Sender: TObject);
begin
  Self.VoltarSistema;
end;

end.
