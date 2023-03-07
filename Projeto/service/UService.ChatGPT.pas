unit UService.ChatGPT;
interface
uses
  System.JSON, System.Net.HttpClient, Classes, UService.Imagem, SysUtils,
  System.Net.Mime, Data.Bind.Components, Data.Bind.ObjectScope, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Dataset.Serialize,
  //TESTE
  System.IOUtils;
type
  TServiceChatGPT = class
  private
    FToken: String;
    FOpenAIAPIURL: String;
    FImage: String;
    FN: String;
    FSize: String;
    FClient: THTTPClient;
    FJSONObject: TJSONObject;
    FJSONArray: TJSONArray;
    FmtResponse: TFDMemTable;
    mtData: TFDMemTable;
    FdsResponse: TDataSource;
    FListaLinks: TStringList;
    //function GetN: string;
    function GetListaLinks: TStringList;
    procedure RemoverBarraJSON;
    function GetmtData: TFDMemTable;
    procedure SetmtData(const Value: TFDMemTable);
    Const
      SIZE = '256x256';
      IMAGE = 'imagemTemporaria.png';
      URL = 'https://api.openai.com/v1/images/variations';
      TOKEN = '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';
      DATA_KEY = 'data';
  public
    //property N: string read GetN;
    property ListaLinks: TStringList read GetListaLinks;
    //property mtData: TFDMemTable read mtData write SetmtData;
    //constructor Create(aN: String; aTabelaPrincipal, aTabelaData: TFDMemTable; aDataSource: TDataSource);
    constructor Create(aN: String);
    destructor Destroy; override;
    procedure ConfigurarTabelas;
    procedure FormarRequest;
    function ObterLinks: TStringList;

  end;
implementation
{ TServiceChatGPT }

procedure TServiceChatGPT.ConfigurarTabelas;
begin
  FdsResponse.DataSet := FmtResponse;

  // Set the dataset for mtData
  mtData.Active := true;
  mtData.Close;
  mtData.FieldDefs.Clear;
  mtData.FieldDefs.Assign(FmtResponse.FieldDefs);
  mtData.CreateDataSet;
  mtData.MasterSource := FdsResponse;
  mtData.MasterFields := 'data';

  FmtResponse.Open;
  mtData.Open;
end;

constructor TServiceChatGPT.Create(aN: String);
//constructor TServiceChatGPT.Create(aN: String; aTabelaPrincipal, aTabelaData: TFDMemTable; aDataSource: TDataSource);
begin
  FClient := THTTPClient.Create;
  //FRequest := TStringStream.Create;
  FListaLinks := TStringList.Create;
  FOpenAIAPIURL := URL;
  FImage := IMAGE;
  FN := aN;
  FSize := SIZE;
  FToken := TOKEN;
  {FmtResponse := aTabelaPrincipal;
  mtData := aTabelaData;
  FdsResponse := aDataSource;}

end;

destructor TServiceChatGPT.Destroy;
begin
  FreeAndNil(FClient);
  //FreeAndNil(FRequest);
  FreeAndNil(FListaLinks);
  FreeAndNil(FmtResponse);
  FreeAndNil(mtData);
  FreeAndNil(FdsResponse);
  FreeAndNil(FJSONObject);
  FreeAndNil(FJSONArray);
  inherited;
end;

procedure TServiceChatGPT.FormarRequest;
var
  xFormData: TMultipartFormData;
  xResponse: TStringStream;
  xStreamTest: TStreamReader;
  //TESTE
  xJSONFile: String;
begin

  xFormData := TMultipartFormData.Create;
  xResponse :=  TStringStream.Create;
  xStreamTest := TStreamReader.Create('file.json');
  try
    FClient.CustomHeaders['Authorization'] := 'Bearer ' + TOKEN;
    xFormData.AddFile('image', IMAGE);
    xFormData.AddField('n', FN);
    xFormData.AddField('size',SIZE);
    FClient.Post(URL, xFormData, xResponse);
    TServiceImagem.ExcluirImagemTemporaria;

    FJSONObject := TJSONObject.ParseJSONValue(xResponse.DataString) as TJSONObject;
    FJSONArray := FJSONObject.GetValue<TJSONArray>('data');


    //FmtResponse.LoadFromJson(xResponse.DataString);
    //xJSONFile := xResponse.DataString;
    //TFile.WriteAllText('file.json', xJSONFile);
    //xStreamTest := TStreamReader.Create('file.json');



    FmtResponse.LoadFromJSON(xJSONFile);
    ConfigurarTabelas;
  finally
    FreeAndNil(xFormData);
    FreeAndNil(xResponse);
    FreeAndNil(xStreamTest);
  end;
end;

function TServiceChatGPT.GetListaLinks: TStringList;
begin
  Result := FListaLinks;
end;

function TServiceChatGPT.GetmtData: TFDMemTable;
begin
  Result := mtData;
end;

{function TServiceChatGPT.GetN: string;
begin
  Result := FN;
end;}


function TServiceChatGPT.ObterLinks: TStringList;
var
  //xJSONArray: TJSONArray;
  i, j: Integer;
  ConteudoCampo: string;

begin
  FormarRequest;

  {for i := 0 to mtData.RecordCount - 1 do
    begin
      mtData.RecNo := i + 1;
      for j := 0 to mtData.FieldCount - 1 do
      begin
        ConteudoCampo := mtData.Fields[j].AsString;
        FListaLinks.Add(ConteudoCampo);
      end;
    end;
  }

  for I := 0 to Pred(FJSONArray.Count) do
    FListaLinks.Add(FJSONArray.GetValue<string>('url'));

  Result := FListaLinks;

end;

procedure TServiceChatGPT.RemoverBarraJSON;
var
  I: Integer;
begin
  {for I := 0 to Pred(FListaLinks.Count) do
    FListaLinks[I].Replace('\/', '/', [rfReplaceAll]);}
end;

procedure TServiceChatGPT.SetmtData(const Value: TFDMemTable);
begin
  mtData := Value;
end;

end.
