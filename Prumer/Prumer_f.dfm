object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Pr'#367'm'#283'r'
  ClientHeight = 231
  ClientWidth = 678
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 633
    Height = 57
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 323
    Top = 115
    Width = 342
    Height = 31
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 208
    Top = 8
    Width = 164
    Height = 23
    Caption = 'V'#253'po'#269'et pr'#367'm'#283'ru'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 32
    Top = 112
    Width = 273
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnEnter = Edit1Enter
  end
  object Button1: TButton
    Left = 32
    Top = 160
    Width = 75
    Height = 25
    Caption = '&P'#345'idej'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 160
    Width = 75
    Height = 25
    Caption = '&Vypo'#269'itej'
    TabOrder = 2
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 212
    Width = 678
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'asda'
    ExplicitLeft = 144
    ExplicitTop = 200
    ExplicitWidth = 0
  end
end