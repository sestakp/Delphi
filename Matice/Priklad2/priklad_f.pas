unit priklad_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Edit3: TEdit;
    Label3: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

var n,m,i,j:integer;

begin
 n:= strtoint(Edit1.Text);
 m:= strtoint(Edit2.Text);

 for i := 1 to n do StringGrid1.Cells[0,i] := '��dek '+i;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0] := 'Matice';
end;

end.
