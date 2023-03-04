unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
  private
    procedure teste;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }
uses
  system.JSON;
procedure TForm1.teste;
var
  xjson: tjsonobject;
  xJSONArray: TJSONArray;
  xString: string;
  xStringList: TStringList;
  i: integer;
begin
  //xStringList := TStringList.Create;
  //xStringList.LoadFromFile('teste.json');
  xString := '{"created": 1677878896,"data": [{"url": "https://www.palhacinhos.com"},{"url": "https://www.teste.com"}]}';

  xjson := tjsonobject.create;
  xjson := TJSonObject.ParseJSONValue(xstring) as TJSONObject;


  xJSONArray := xjson.ParseJSONValue('data') as TJSONArray;



  xJSONArray.Get(0).GetValue<String>('url');

  //xstringlist := TStringList.Create;
  for I := 0 to pred(xJSONArray.count) do
  begin
    memo1.lines.add(xJSONArray.Get(i).GetValue<String>('url'));
  end;



end;

end.
