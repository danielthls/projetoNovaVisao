unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, pngimage;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private

  procedure testSave;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

procedure TForm1.Button1Click(Sender: TObject);
begin
  { Execute an open file dialog. }
  if OpenDialog1.Execute then

    { First check if the file exists. }
    if FileExists(OpenDialog1.FileName) then
      { If it exists, load the data into the memo box. }
      Memo1.Lines.LoadFromFile(OpenDialog1.FileName)
    else
      { Otherwise, raise an exception. }
      raise Exception.Create('File does not exist.');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  { Execute a save file dialog. }
  if SaveDialog1.Execute then
    { First check if the file exists. }
    if FileExists(SaveDialog1.FileName) then
      { If it exists, raise an exception. }
      raise Exception.Create('File already exists. Cannot overwrite.')
    else
      { Otherwise, save the memo box lines into the file. }
      Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;
procedure TForm1.Button3Click(Sender: TObject);
begin
 testSave;
end;

procedure TForm1.testSave;
var
  Png: TPNGImage;
  Bitmap: TBitmap;
  FilePath: String;
begin
  if OpenDialog1.Execute then
  begin
    FilePath := OpenDialog1.FileName;
    Memo1.Lines.Add(FilePath);
    Png := TPNGImage.Create;
    Bitmap := TBitmap.Create;
    try
      Png.LoadFromFile(OpenDialog1.FileName);
      Bitmap.SetSize(256, 256); // Set the new dimensions of the bitmap
      Bitmap.Canvas.StretchDraw(Rect(0, 0, 256, 256), Png); // Resize and draw the image onto the bitmap
      Png.Assign(Bitmap); // Assign the bitmap to the PNG image
      Png.SaveToFile('resized_file.png'); // Save the resized image
    finally
      Png.Free;
      Bitmap.Free;
    end;
  end;
end;

{$R *.dfm}



end.
