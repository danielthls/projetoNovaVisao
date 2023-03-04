unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Net.Mime, System.Net.HttpClient, System.JSON;

type


  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    //function StringStreamParaJSON: TJSONObject;
    function getData2(JsonString: String; Field: String): String;
    procedure Test1;
  public
    { Public declarations }
  end;




  var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
begin
  //StringStreamParaJSON;
end;

{function TForm1.StringStreamParaJSON: TJSONObject;
var
  xStringStream: TStringStream;
  xValorJson, xValorData, xURLData: TJSONValue;
  xArrayData: TJSONArray;
  I: Integer;
  xListaURL: TStringList;
begin}
  //xStringStream := TStringStream.Create('{"created": 1677849474,"data": [ {      "url": "https://www.sitetest1.com"    },    {      "url": "https://www.palhacinhos.com"    }  ]}');

  {xValorJson := TJSONObject.ParseJSONValue(xStringStream.DataString);
  try
    xValorData := xValorJson.GetValue<TJsonArray>('data');
    if xValorData is TJSONArray then
    begin
      xArrayData := TJSONArray(xValorData);

      xListaURL := TStringList.Create;

      try
        for I := 0 to pred(xArrayData.Count) do
        begin
          xURLData := xArrayData[I].GetValue<TJsonValue>('url');
          xListaURL.Add(xURLData.ToString);
        end;

        for I := 0 to pred(xListaURL.Count) do
        begin
        // Now UrlList contains the URL values
        memo1.lines.add(xListaURL[I]);

        end;
      finally
        //freeAndNil(xListaUrl);
        freeAndNil(xURLData);
        freeAndNil(xValorData);
        freeAndNil(xArrayData);

      end;
    end;
  finally

    freeAndNil(xListaUrl);
    freeAndNil(xStringStream);
    freeAndNil(xValorJson);

  end;
end;}

function TForm1.getData2(JsonString, Field: String): String;
var
  xJSonValue, xDataValue: TJSonValue;
  xDataArray: TJSONArray;
  xArrayElement: TJSonValue;
  xFoundValue: TJSonValue;
  xListaURL: TStringList;
begin
  Result :='';

  xListaURL := TStringList.Create;
  try
    // create TJSonObject from string
    xJSonValue := TJSonObject.ParseJSONValue(JsonString);

    xDataValue := xJsonValue.GetValue<TJSONValue>('data');

    // get the array
    xDataArray := xJSonValue as TJSONArray;

    // iterate the array
    for xArrayElement in xDataArray do begin
      xFoundValue := xArrayElement.FindValue(Field);
      if xFoundValue <> nil then begin
        Result := xArrayElement.GetValue<string>(Field);
        xListaURL.Add(Result);
      end;
    end;
  finally
    FreeAndNil(xListaURL);
  end;
end;

procedure TForm1.Test1;
var
  xAPIResposta: TStringStream;
begin
  xAPIResposta := TSTringStream.Create('{"created": 1677849474,"data": [ {      "url": "https://www.sitetest1.com"    },    {      "url": "https://www.palhacinhos.com"    }  ]}');
  try
    getData2(xAPIResposta.DataString, 'URL');
  finally
    FreeAndNil(xAPIResposta);
  end;
end;

end.