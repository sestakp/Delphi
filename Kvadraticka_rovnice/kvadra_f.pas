unit kvadra_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;
  a,b,c,d,x1,x2: real;


implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin

label10.Caption := '';
label8.Caption := '';
label6.Caption := '';
label7.Caption := '';

a := Strtofloat(Edit3.Text);
b := Strtofloat(Edit2.Text);
c := Strtofloat(Edit1.Text);

d := sqr(b) -4*a*c;

if d < 0 then begin
                Label8.Caption := 'Rovnice nem� �e�en� v re�ln�ch ��slech.';
                label10.Caption := '';
                label6.Caption := '';
                label7.Caption := '';
              end
else if d = 0 then begin
                    x1 :=-b/(2*a);
                    label6.Caption := FloattoStr(x1);
                    label7.Caption := FloattoStr(x1);
                   end

else
      begin
       label6.Caption := FloattoStr((-b + (sqrt(d)))/(2*a));
       label7.Caption := FloattoStr((-b - (sqrt(d)))/(2*a));
      end;

Label10.Caption := FloattoStr(d);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
label10.Caption := '';
label8.Caption := '';
label6.Caption := '';
label7.Caption := '';
Edit1.Text := '';
Edit2.Text := '';
Edit3.Text := '';
end;

end.
