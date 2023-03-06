unit UfrmImagens;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
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
    CheckBox1: TCheckBox;
    Image2: TImage;
    CheckBox2: TCheckBox;
    Image3: TImage;
    CheckBox3: TCheckBox;
    Image4: TImage;
    CheckBox4: TCheckBox;
    Image5: TImage;
    CheckBox5: TCheckBox;
    Image6: TImage;
    CheckBox6: TCheckBox;
    Image7: TImage;
    CheckBox7: TCheckBox;
    Image8: TImage;
    CheckBox8: TCheckBox;
    Image9: TImage;
    CheckBox9: TCheckBox;
    Image10: TImage;
    CheckBox10: TCheckBox;
    imgNovavisao: TImage;
    procedure FormCreate(Sender: TObject);
    procedure rectVoltarClick(Sender: TObject);
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
  xStringList : TStringList;
  //variaveis de controle
  i,j : integer;
begin
  xStringList := TStringList.Create;
  // Parte Feita Somente para Teste
  xStringList.add('https://conexaoplaneta.com.br/wp-content/uploads/2023/01/imagens-redes-sociais-ajudam-descobertas-especies-australia-conexao-planeta-800x445.jpg');
  xStringList.Add('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.Add('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.Add('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.Add('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.Add('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.Add('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.Add('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.Add('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  xStringList.Add('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4TMwB3gGcl7GWyy8qHg4dyaQ9Iw3NlnOa-3WHiNvvkfq2mFjLowkmKEgcUVDS4tLFZs&usqp=CAU');
  // Fim Testes

  // For percorrendo o Stringlist com urls,importando elas para um TImage
  // as redimensionando enquanto coloca os componentes visiveis
  try
  j := -1;
  for i := 0 to xStringList.Count -1 do
  begin
    inc(J);
    while not (frmImagens.Components[j] is TImage) or (frmImagens.Components[i] = imgNovavisao)  do
      Inc(j);
    if frmImagens.Components[j] is TImage then
      begin
        TImage(frmImagens.Components[j]).Bitmap.LoadFromUrl(xStringList[i]);
        //TImage(frmImagens.Components[j]).Bitmap.LoadThumbnailFromUrl(xStringList[i], 90, 90);
        TImage(frmImagens.Components[j]).Visible := true;
      end;
  end;
  finally
    xStringList.Free;
  end;
end;

procedure TfrmImagens.FormCreate(Sender: TObject);
begin
  Self.LimpaTImage;
  Self.AdicionaImagensATela;
end;

procedure TfrmImagens.LimpaTImage;
var
  I: Integer;
begin
  //Limpa todos o TImage, novamente exceto o frmImagens (LOGO)
  for i := 0 to frmImagens.ComponentCount -1 do
    if (frmImagens.Components[i] is TImage) and not (frmImagens.Components[i] = imgNovavisao) then
    begin
      TImage(frmImagens.Components[i]).Bitmap := nil;
      TImage(frmImagens.Components[i]).Visible := false;
    end;
end;

procedure TfrmImagens.VoltarSistema;
begin
  if not Assigned(frmEnviar) then
  begin
    Application.CreateForm(TfrmEnviar, frmEnviar);
  end;
  frmEnviar.Show();
  Self.Close;;
end;

procedure TfrmImagens.rectVoltarClick(Sender: TObject);
begin
  Self.LimpaTImage;
  Self.VoltarSistema;
  Self.Close;
end;

end.
