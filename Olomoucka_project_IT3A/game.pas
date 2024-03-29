unit game;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.UITypes,
  Vcl.Imaging.pngimage;

type

  //set a own data types

  Tactive = array [1..9] of boolean; //array of booleans for rabbits status
  Tdata = record  //record for saving a data in to statistics
         Nickname    : string[20];
         sminute     : integer;
         ssec        : integer;
         stenth      : integer;
         Tminute     : integer;
         Tsec        : integer;
         Ttenth      : integer;
         Thour       : integer;
         interval    : integer;
         highscore   : integer;
         Tscore      : longint;
         Ttime       : integer;
         rounds      : integer;
         dinterval   : integer;
         percent     : integer;
  end;
  TForm1 = class(TForm)
    Edit1: TEdit;
    start: TButton;
    reset: TButton;
    bg: TPanel;
    Timer1: TTimer;
    Timer3: TTimer;
    btn_settings: TButton;
    Button10: TButton;
    Label2: TLabel;
    Timer2: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    header: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Image10: TImage;
    Label8: TLabel;
    Label9: TLabel;
    procedure clock(tenth:integer; sec:integer; minute:integer); //procedure with 3 parameters
    procedure status(ch:boolean); //procedure 
    procedure klik(Sender: TObject);
    procedure res; //procedure for reset values
    procedure startClick(Sender: TObject);
    procedure resetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_settingsClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  x,tim: integer;
  activated:Tactive;
  tenth, sec, minute, poc, akt:byte;
  full: boolean;
  f:file of Tdata;
  data: Tdata;

  public
    { Public declarations }
    points:integer;
    nick: string[20];
    percent:byte;
  end;

  var Form1: TForm1;

implementation

{$R *.dfm}


uses settings, stats;

const multi:byte = 100;

procedure Tform1.clock(tenth:integer; sec:integer; minute:integer);

{clock procedure
 this procedure is performed every tenth of a second
 and add one tenth
}
begin
  tenth := tenth +1;
  label7.Caption := inttostr(tenth); //add a number of tenth to tenth label
  if tenth = 9 then begin //condition if number of tenth is 9
                      tenth := 0; //reset a variable tenth
                      sec := sec +1; //add a sec
                      if sec < 10 then label5.Caption := '0' +inttostr(sec) //if variable seconds is lower than 10, add to label before variable number 0, so that the clock format remains the same
                                  else label5.Caption := inttostr(sec);  //else just set a Caption in label for varable sec
                      if sec = 59 then begin  //condition for check if sec = 59
                                          sec := 0; //reset a number of sec
                                          minute := minute + 1;  //add one minute
                                          if minute < 10 then label3.Caption := '0' + inttostr(minute) //same condition like in sec
                                                         else label3.Caption := inttostr(minute);
                                       end;
                    end;
end;

procedure Tform1.status(ch:boolean);
var i:byte; //variable to cycle for
begin
          for i := 1 to 9 do TImage(FindComponent('Image'+Inttostr(i))).visible := false;  //nastavi visible u tlacitek 1-9 na false.
          Image1.Visible := false;
          //condition for on/off timers
          if ch then for i := 1 to 3 do TTimer(FindComponent('Timer'+inttostr(i))).Enabled := true
          else for i:= 1 to 3 do TTimer(FindComponent('Timer'+inttostr(i))).Enabled := False;
end;

procedure Tform1.klik(Sender: TObject);
var i: integer;
begin
//find a pressed button and change visible to false
  for i := 1 to 9 do begin
  if sender = TImage(FindComponent('Image'+inttostr(i))) then TImage(FindComponent('Image'+inttostr(i))).Visible := false;
   activated[i] := false;
  end;
  points := points + 1;
  Edit1.Text := Inttostr(points);
end;

procedure Tform1.res;

//procedure for reset a game values and set a default

begin
  points := 0;
  tenth := 0;
  sec := 0;
  minute := 0;
  label3.Caption := '00';
  label5.Caption := '00';
  label7.Caption := '0';
  bg.Color := ClLime;
  Header.Color := ClLime;
  Timer1.Interval := tim;
  label1.Caption := inttostr(tim);
  label2.Caption := '';
end;

procedure TForm1.btn_settingsClick(Sender: TObject);

//button for open a Settings form

var
  f: TForm2;
begin
  f := TForm2.Create(Self); //set a form2 to a variable f
  f.TrackBar1.Position := Timer1.Interval div multi;  //set a default trackbar position in Settings
  try
    f.ShowModal;
    tim := f.TrackBar1.Position * multi; //
    Label1.Caption := Inttostr(f.TrackBar1.Position * multi);
    nick := f.Edit1.Text; //get a nick from a settings Form to statistics
    percent := f.TrackBar2.Position;  //get a percent from trackbar2 for speed a game
  finally
    f.Release;
  end;
end;

procedure TForm1.Button10Click(Sender: TObject);

//button for open a Stats form

var
  f:TForm3;
begin
  f := TForm3.Create(Self);
  try
    f.ShowModal;
  finally
    f.Close;
  end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin

  //prepared for saving data to file
 { AssignFile(f, 'settings.dat');
    FileMode := fmOpenRead;
    Rewset(f);
    Read(f, data);   //read from file }


    with stats.Form3.stat do
    begin
      nickname := data.Nickname;
      sminute := data.sminute;
      ssec := data.ssec;
      stenth := data.stenth;
      Tminute := data.Tminute;
      Tsec := data.Tsec;
      Ttenth := data.Ttenth;
      Thour := data.Thour;
      interval := data.interval;
      highscore := data.highscore;
      Tscore := data.Tscore;
      Ttime := data.Ttime;
      rounds := data.rounds;
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);

begin
with stats.Form3.stat do
    begin
      data.Nickname := nickname;
      data.sminute := sminute;
      data.ssec := ssec;
      data.stenth := stenth;
      data.Tminute := Tminute;
      data.Tsec := Tsec;
      data.Ttenth := Ttenth;
      data.Thour := Thour;
      data.interval := interval;
      data.highscore := highscore;
      data.Tscore := Tscore;
      data.Ttime := Ttime;
      data.rounds := rounds;
    end;

  //prepared for saving data to file  
 { AssignFile(f, 'nastaveni.dat');
  try
    Rewrite(f);
    write(f, data);   // read from file
  finally
    CloseFile(f);
  end; }

end;

procedure TForm1.FormCreate(Sender: TObject);

  //set a default value when Form is created

begin
points:=0;
tim := 500;
nick := 'Unknown';
percent := 5;
end;

procedure TForm1.resetClick(Sender: TObject);

  //reset a logical variables
  begin
    Edit1.Text:= 'NEW GAME';
    status(false);
    res;
  end;

procedure TForm1.startClick(Sender: TObject);
var i:byte;
  begin

      //dialog if you want create a new game

      if MessageDlg('Do you want to start the new game?',mtInformation,[mbYES,mbNO],0) = mrYES then
        begin
          res;
          Edit1.Text := '0';
          for i := 1 to 9 do activated[i] := false;
          status(true);    //reset procedure
       end;
  end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i:byte;
    pomo:integer;
begin
    poc :=0;
    akt := 0;
    randomize;
    repeat  //generate a random number in interval 1-9
    x:= 1 + random(9);
    poc := poc +1;
    until (activated[x] = false) or (poc = 9);  //check if randomly selected rabbit isn't visible

    TImage(FindComponent('Image'+inttostr(x))).Visible := true; //set a visible to true on random selected rabbit
    activated[x] := true;

        for i := 1 to 9 do if activated[i] = true then akt := akt +1;
          if full then begin
                            {Game over}
                            full := false;
                            bg.Color := ClYellow;
                            Header.Color := ClYellow;
                            label2.Caption := 'GAME OVER:' + #10#13 + 'YOUR SCORE: ' + inttostr(points) +#10#13 + 'IN TIME: ' + label3.Caption + label4.Caption + label5.Caption + label6.caption + label7.caption + #10#13 + 'User: ' + nick;
                            with stats.Form3.stat do
                            begin
                              if points > highscore then highscore := points;
                              if Timer1.Interval < interval then interval := Timer1.Interval;
                              Nickname := Nick;
                              Tscore := Tscore + points;
                              rounds := rounds + 1;
                              if minute >= sminute then
                                if sec >= ssec then
                                  if tenth > stenth then
                                                      begin
                                                        stenth  := tenth;
                                                        ssec    := sec;
                                                        sminute := minute;
                                                                      end;
                            //celkovy nahrany �as - p�epo�et
                            if (Ttenth + tenth) >= 10 then begin
                                                            pomo := ((Ttenth+tenth) div 10);
                                                            Ttenth := (Ttenth+tenth) mod 10;
                                                           end
                                                           else Ttenth := Ttenth+tenth;

                            if (Tsec + sec + pomo) >= 60 then begin
                                                               pomo := (Tsec+sec) div 60;
                                                               Tsec := (Tsec+sec) mod 60;
                                                             end
                                                             else Tsec := Tsec+sec;

                            if (Tminute + minute + pomo) >= 60 then begin
                                                                     pomo := (Tminute+minute) div 60;
                                                                     Tminute := (Tminute+minute) mod 60;
                                                                     Thour := Thour + pomo;
                                                                   end
                                                                   else Tminute := Tminute+minute;
                            end;
                            status(false); //procedura pro reset
                       end
          else if akt = 9 then full := true;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
tenth := tenth +1;
label7.Caption := inttostr(tenth);
if tenth = 9 then begin
                  tenth := 0;
                  sec := sec +1;
                  if sec < 10 then label5.Caption := '0' +inttostr(sec)
                  else label5.Caption := inttostr(sec);
                  if sec = 59 then begin
                                   sec := 0;
                                   minute := minute + 1;
                                   if minute < 10 then label3.Caption := '0' + inttostr(minute)
                                   else label3.Caption := inttostr(minute);
                                   end;
                  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
Timer1.Interval := Timer1.Interval - (timer1.Interval div 100)*percent;
label1.Caption := inttostr(Timer1.Interval);
end;

end.
