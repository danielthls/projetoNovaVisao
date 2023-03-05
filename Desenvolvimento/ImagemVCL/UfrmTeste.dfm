object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 373
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 269
    Width = 43
    Height = 13
  end
  object Image1: TImage
    Left = 80
    Top = 32
    Width = 297
    Height = 201
    Stretch = True
  end
  object Button1: TButton
    Left = 256
    Top = 320
    Width = 121
    Height = 25
    Caption = 'Carregar Imagem'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 56
    Top = 320
    Width = 121
    Height = 25
    Caption = 'Salvar Temporario'
    TabOrder = 1
    OnClick = Button2Click
  end
end
