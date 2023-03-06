unit UfrmEnviar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox,
  FMX.MultiView;

type
  TfrmEnviar = class(TForm)
    rectPrincipal: TRectangle;
    lytContainer: TLayout;
    imgNovavisao: TImage;
    GroupBox1: TGroupBox;
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
  private
    { Private declarations }
    procedure VoltarSistema;
  public
    { Public declarations }
  end;

var
  frmEnviar: TfrmEnviar;

implementation

uses
  UfrmSistema,
  UfrmImagens;

{$R *.fmx}

procedure TfrmEnviar.VoltarSistema;
begin
  if not Assigned(frmSistema) then
  begin
    Application.CreateForm(TfrmSistema, frmSistema);
  end;
  frmSistema.Show();
  Self.Close;
end;

procedure TfrmEnviar.rectExibirImagensClick(Sender: TObject);
begin
  if not Assigned(frmImagens) then
  begin
    Application.CreateForm(TfrmImagens, frmImagens);
  end;
  frmImagens.Show();
  Self.Close;
end;

procedure TfrmEnviar.rectVoltarClick(Sender: TObject);
begin
  Self.VoltarSistema;
end;

end.