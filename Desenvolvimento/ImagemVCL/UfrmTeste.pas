unit UfrmTeste;

interface

uses
  UService.Imagem,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Image1: TImage;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    var xImagem: TImagem;
    procedure carregarImagem;
    procedure salvarImagemTemporaria;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  carregarImagem;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  salvarImagemTemporaria;
end;

procedure TForm1.carregarImagem;
begin
  xImagem.CarregarImagem;
  label1.Caption := xImagem.CaminhoImagem;
  image1.Picture := xImagem.Picture;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  freeAndNil(xImagem);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  xImagem := TImagem.Create;
  Label1.Caption := xImagem.CaminhoImagem;
end;

procedure TForm1.salvarImagemTemporaria;
begin
  xImagem.CriarImagemTemporaria;
end;

end.
