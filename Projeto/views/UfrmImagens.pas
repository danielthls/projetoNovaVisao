unit UfrmImagens;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmImagens = class(TForm)
    rectPrincipal: TRectangle;
    rectVoltar: TRectangle;
    Label5: TLabel;
    recImagens: TRectangle;
    Label1: TLabel;
    lytImagens: TLayout;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    imgNovavisao: TImage;
    procedure rectVoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    procedure AdicionaImagensATela;
    procedure LimpaTImage;
    procedure VoltarSistema;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImagens: TfrmImagens;

implementation

{$R *.fmx}

uses
  UfrmEnviar,
  uBitmapHelper;

procedure TfrmImagens.AdicionaImagensATela;
var
  xStringList: TStringList;
  // variaveis de controle
  i, j: integer;
begin
  xStringList := TStringList.Create;
  // Parte Feita Somente para Teste
  xStringList.add
    ('https://conexaoplaneta.com.br/wp-content/uploads/2023/01/imagens-redes-sociais-ajudam-descobertas-especies-australia-conexao-planeta-800x445.jpg');
  xStringList.add
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.add
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.add
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.add
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.add
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.add
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.add
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.add
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.add
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  // Fim Testes

  // For percorrendo o Stringlist com urls,importando elas para um TImage
  // as redimensionando enquanto coloca os componentes visiveis
  try
    j := -1;
    for i := 0 to xStringList.Count - 1 do
    begin
      inc(j);
      while not(frmImagens.Components[j] is TImage) or
        (frmImagens.Components[i] = imgNovavisao) do
        inc(j);
      if frmImagens.Components[j] is TImage then
      begin
        TImage(frmImagens.Components[j]).Bitmap.LoadFromUrl(xStringList[i]);
      end;
    end;
  finally
    xStringList.Free;
  end;
end;

procedure TfrmImagens.FormActivate(Sender: TObject);
begin
  Self.LimpaTImage;
  Self.AdicionaImagensATela;
end;

procedure TfrmImagens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  FreeAndNil(frmImagens);
end;

procedure TfrmImagens.LimpaTImage;
var
  i: integer;
begin
  // Limpa todos o TImage, novamente exceto o frmImagens (LOGO)
  for i := 0 to frmImagens.ComponentCount - 1 do
    if (frmImagens.Components[i] is TImage) and
      not(frmImagens.Components[i] = imgNovavisao) then
    begin
      TImage(frmImagens.Components[i]).Bitmap := nil;
    end;
end;

procedure TfrmImagens.VoltarSistema;
begin
  if not Assigned(frmEnviar) then
  begin
    Application.CreateForm(TfrmEnviar, frmEnviar);
  end;
  frmEnviar.Show();
end;

procedure TfrmImagens.rectVoltarClick(Sender: TObject);
begin
  Self.LimpaTImage;
  Self.VoltarSistema;
end;

end.
