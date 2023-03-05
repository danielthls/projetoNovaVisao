unit UService.Imagem;

interface

uses vcl.Dialogs, SysUtils, vcl.Graphics, PNGImage, Classes;
type
  TImagem = class
  private
    FPNG: TPNGImage;
    FBitmap: TBitmap;
    FOpenDialog: TOpenDialog;
    FPicture: TPicture;
    FCaminhoImagem: String;
    function GetCaminhoImagem: String;
    function GetPicture: TPicture;
  public
    property Picture: TPicture read GetPicture;
    property CaminhoImagem: String read GetCaminhoImagem;
    constructor Create;
    destructor Destroy; override;
    procedure CarregarImagem;
    procedure RedimensionarImagem;
    procedure CriarImagemTemporaria;
    class procedure ExcluirImagemTemporaria;
end;

implementation

{ TImagem }

procedure TImagem.CarregarImagem;
begin
  if FOpenDialog.Execute then
  begin
    FCaminhoImagem := FOpenDialog.FileName;
    FPNG.LoadFromFile(FCaminhoImagem);
    FPicture.Graphic := FPNG;
  end;
end;

constructor TImagem.Create;
begin
  FCaminhoImagem := 'Nenhuma imagem selectionada';
  FOpenDialog := TOpenDialog.Create(nil);
  FOpenDialog.Filter := 'Arquivos PNG (*.png)|*.png';
  FPicture := TPicture.Create;
  FPNG := TPNGImage.Create;
end;

procedure TImagem.CriarImagemTemporaria;
begin
  if not ((FPNG.Width = 0) and (FPNG.Height = 0)) then
    FPNG.SaveToFile('ImagemTemporaria.png')
  else
    raise Exception.Create('Erro: Nenhuma imagem foi carregada');
end;

destructor TImagem.Destroy;
begin
  FreeAndNil(FPNG);
  FreeAndNil(FPicture);
  FreeAndNil(FOpenDialog);
  inherited;
end;

class procedure TImagem.ExcluirImagemTemporaria;
begin
  if FileExists('ImagemTemporaria.png') then
    DeleteFile('ImagemTemporaria.png')

end;

function TImagem.GetCaminhoImagem: String;
begin
  Result := FCaminhoImagem;
end;

function TImagem.GetPicture: TPicture;
begin
  Result := FPicture;
end;

procedure TImagem.RedimensionarImagem;
const
  ALTURA = 256;
  LARGURA = 256;
begin
  FBitmap.SetSize(256, 256); //Altera as dimensões do TBitmap vazio
  FBitmap.Canvas.StretchDraw(Rect(0, 0, 256, 256), FPNG); // Redimensiona e desenha a imagem carregada no bitmap
  FPng.Assign(FBitmap); // Passa a imagem para o FPNG
end;

end.
