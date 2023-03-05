unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, System.Net.Mime, System.Net.HttpClient,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
    Button1: TButton;
    IdHTTP1: TIdHTTP;
    Memo1: TMemo;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure TesteAPIChatGPT;
    function Send: String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses
  {IdMultipartFormDataStream TIdHTTP, REST.Types, REST.Client,} REST.Response.Adapter;
{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  TesteAPIChatGPT;
end;

{procedure TForm1.TesteAPIChatGPT;
var

  XParams: TMultipartFormData;
begin
  xParams := TMultipartFormData.Create;
  try
    try
      RESTClient1.BaseURL := 'https://api.openai.com/v1/images/variations';
      // add the file to the request
      xParams.AddFile('image', ExtractFilePath(ParamStr(0))+'/resized_file.png', 'image/png');
      //xParams.AddField('image', 'resized_file.png');
      // add any additional parameters to the request
      xParams.AddField('n', '2');
      xParams.AddField('size', '256x256');
      RESTRequest1.Method := rmPOST;
      RESTRequest1.Params.AddHeader('Authorization', 'Bearer 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');
      RESTRequest1.Params.ParameterByName('Authorization').Options := [poDoNotEncode];
      //RESTRequest1.AddParameter('Content-Type', 'multipart/form-data', TRESTRequestParameterKind.pkHTTPHEADER);
      //RESTRequest1.Params.ParameterByName('Content-Type').Options := [poDoNotEncode];
      // configure the request
      //RESTRequest1.AddParameter('image', 'resized_file.png', TRESTRequestParameterKind.pkREQUESTBODY);
      //RESTRequest1.AddParameter('n', '2', TRESTRequestParameterKind.pkREQUESTBODY);
      //RESTRequest1.AddParameter('size', '256x256', TRESTRequestParameterKind.pkREQUESTBODY);
      //STRequest1.AddParameter('filename', 'file.ext', TRESTRequestParameterKind.pkHTTPHEADER);
      //STRequest1.AddParameter('Content-Disposition', 'attachment; filename="file.ext"', TRESTRequestParameterKind.pkHTTPHEADER);
      //RESTRequest1.AddParameter('Content-Disposition', 'form-data; name="image"; filename="resized_file.png"', TRESTRequestParameterKind.pkHTTPHEADER);
      //RESTRequest1.AddParameter('Content-Disposition', 'form-data; name="image"; filename="resized_file.png"', TRESTRequestParameterKind.pkHTTPHEADER);
      //RESTRequest1.AddParameter('multipart/form-data', xParams.Stream, TRESTRequestParameterKind.pkREQUESTBODY);
      // send the request
      RESTRequest1.Execute;
      // handle the response
      Memo1.Lines.Add(RESTResponse1.Content);
    except
      on e:Exception  do
        raise Exception.Create(e.Message);

    end;
  finally
    xParams.Free;
  end;
end;}

{procedure TForm1.TesteAPIChatGPT;
var
  Stream: TMemoryStream;
  Boundary: string;
  FormData: string;
  ImagePath: string;
begin
  try
    RESTClient1.BaseURL := 'https://api.openai.com/v1/images/variations';
    RESTClient1.Accept := 'application/json';
    RESTRequest1.Method := rmPOST;
    RESTRequest1.Params.AddHeader('Authorization', 'Bearer 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');
    RESTRequest1.Params.ParameterByName('Authorization').Options := [poDoNotEncode];
    // set the request body as multipart/form-data
    Boundary := '------------------------' + FormatDateTime('yymmddhhmmsszzz', Now);
    RESTRequest1.Params.AddHeader('Content-Type', 'multipart/form-data; boundary=' + Boundary);
    Stream := TMemoryStream.Create;
    try
      // add the form data to the request body
      FormData := '--' + Boundary + #13#10;
      FormData := FormData + 'Content-Disposition: form-data; name="n"' + #13#10;
      FormData := FormData + #13#10;
      FormData := FormData + '2' + #13#10;
      FormData := FormData + '--' + Boundary + #13#10;
      FormData := FormData + 'Content-Disposition: form-data; name="size"' + #13#10;
      FormData := FormData + #13#10;
      FormData := FormData + '256x256' + #13#10;
      FormData := FormData + '--' + Boundary + #13#10;
      // add the image file to the request body
      ImagePath := ExtractFilePath(ParamStr(0))+'/resized_file.png';
      FormData := FormData + 'Content-Disposition: form-data; name="image"; filename="'+ ExtractFileName(ImagePath) +'"' + #13#10;
      FormData := FormData + 'Content-Type: image/png' + #13#10;
      FormData := FormData + #13#10;
      Stream.Write(FormData[1], Length(FormData));
      with TFileStream.Create(ImagePath, fmOpenRead or fmShareDenyWrite) do
        try
          Stream.CopyFrom(TFileStream.Create(ImagePath, fmOpenRead or fmShareDenyWrite), Size);
        finally
          Free;
      end;
      FormData := #13#10 + '--' + Boundary + '--' + #13#10;
      Stream.Write(FormData[1], Length(FormData));
      Stream.Position := 0;
      RESTRequest1.AddBody(Stream, TRESTContentType.ctNone);
    finally
      Stream.Free;
    end;
    RESTRequest1.Execute;
    Memo1.Lines.Add(RESTResponse1.Content);
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;}




procedure TForm1.TesteAPIChatGPT;
begin
  memo1.lines.add(send);
end;

function TForm1.Send: string;
var
  LClient: THTTPClient;
  //LRequest: THTTPRequest;
  LFormData: TMultipartFormData;
  LResponse: TStringStream;
begin
  LClient := THTTPClient.Create;
  //LRequest := THTTPRequest.Create;
  LFormData := TMultipartFormData.Create();
  LResponse := TStringStream.Create;
  try
    LClient.CustomHeaders['Authorization'] := 'Bearer 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';

    //LFormData.AddField('Authorization', 'Bearer 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');
    LFormData.AddFile('image', 'resized_file.png'); // You can also use the AddStream method if it's available
    LFormData.AddField('n', '2');
    LFormData.AddField('size', '256x256');
    LClient.Post('https://api.openai.com/v1/images/variations', LFormData, LResponse);
    Result := LResponse.DataString;
  finally
    LClient.Free;
    LFormData.Free;
    LResponse.Free;
    //LRequest.Free;
  end;
end;

end.
