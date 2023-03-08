unit UfrmSistema;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.ListBox, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts,
  FMX.MultiView, UService.Imagem;

type
  TfrmSistema = class(TForm)
    rectPrincipal: TRectangle;
    btnMenu: TSpeedButton;
    lytContainer: TLayout;
    imgNovaVisao: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCliente: TEdit;
    edtCaminhoIMG: TEdit;
    cmbVariacoes: TComboBox;
    btnBuscar: TButton;
    rectAvancar: TRectangle;
    Label4: TLabel;
    MultiView1: TMultiView;
    Rectangle1: TRectangle;
    lytLogo: TLayout;
    imgLogo: TImage;
    lstMenu: TListBox;
    rectVoltar: TRectangle;
    Label5: TLabel;
    btnProcurar1: TButton;
    procedure rectAvancarClick(Sender: TObject);
    procedure rectVoltarClick(Sender: TObject);
    procedure lstMenuItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure btnProcurar1Click(Sender: TObject);
    procedure imgNovaVisaoClick(Sender: TObject);
  private
    { Private declarations }

    procedure btnBuscarClick(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ProcurarImagem;
  public
    { Public declarations }
    procedure AbrirCadastro;
    procedure AbrirEnviar;
  end;

var
  frmSistema: TfrmSistema;

implementation

uses
  UUtils.Enum, UfrmEnviar, UfrmCadastrar;

{$R *.fmx}
{ TForm2 }

procedure TfrmSistema.AbrirCadastro;
begin
  if not Assigned(frmCadastrar) then
  begin
    Application.CreateForm(TfrmCadastrar, frmCadastrar);
  end;
  frmCadastrar.Show();
  Self.Hide;
end;

procedure TfrmSistema.AbrirEnviar;
begin
  if not Assigned(frmEnviar) then
  begin
    Application.CreateForm(TfrmEnviar, frmEnviar);
  end;
  frmEnviar.Show();
  Self.Hide;
end;

procedure TfrmSistema.btnBuscarClick(Sender: TObject);
begin
  // Buscar Cliente no Banco utilizando como referencia texto do edtCliente
end;



procedure TfrmSistema.btnProcurar1Click(Sender: TObject);
begin
  ProcurarImagem;
end;

procedure TfrmSistema.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  FreeAndNil(frmSistema);
end;

procedure TfrmSistema.imgNovaVisaoClick(Sender: TObject);
begin
  MultiView1.HideMaster;
end;

procedure TfrmSistema.lstMenuItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin

  case TEnumMenu(Item.Index) of
    mnuHome:
      Self.Close;
    mnuCadastrar:
      Self.AbrirCadastro;
    mnuSair:
      Self.Close;
  end;

  MultiView1.HideMaster;
end;

procedure TfrmSistema.ProcurarImagem;
var
  xImagem: TServiceImagem;
begin
  xImagem := TServiceImagem.Create;
  try
    xImagem.CarregarImagem;
    edtCaminhoIMG.Text := xImagem.CaminhoImagem;
    xImagem.CriarImagemTemporaria;
  finally
    FreeAndNil(xImagem);
  end;
end;

procedure TfrmSistema.rectAvancarClick(Sender: TObject);
begin
  Self.AbrirEnviar;
end;

procedure TfrmSistema.rectVoltarClick(Sender: TObject);
begin
  Self.Close;
end;

end.
