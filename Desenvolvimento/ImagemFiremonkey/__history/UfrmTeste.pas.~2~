unit UfrmTeste;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, UService.Imagem;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Button1: TButton;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    var xImagem: TServiceImagem;

    procedure CarregarImagem;
    procedure RedimensionarImagem;
    procedure SalvarCopia;
    procedure ExcluirCopia;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  carregarImagem;
end;

procedure TForm1.CarregarImagem;
begin

  xImagem.CarregarImagem;
  label1.Text := xImagem.CaminhoImagem;
  image1.Bitmap := xImagem.BitMapOriginal;

end;

procedure TForm1.ExcluirCopia;
begin

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(xImagem);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  xImagem := TServiceImagem.Create;
end;

procedure TForm1.RedimensionarImagem;
begin

end;

procedure TForm1.SalvarCopia;
begin

end;

end.
