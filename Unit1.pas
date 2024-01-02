unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,  dateutils,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
    timework:boolean;
implementation

{$R *.dfm}


procedure resershtime;
var h,m,d:integer;
newday,endday:boolean;
begin
d:=7;
newday:=false;
endday:=false;
d:=DayOfWeek(now()) ; // Form1.label1.caption:=inttostr(d);
h:=HourOf(now())   ; // Form1.label2.caption:=inttostr(h);
m:=MinuteOf(now()); // Form1.label3.caption:=inttostr(m);

 if ((h=7)and(m<40))
 or ((h=20)and(m>20))
 or (h<7)
 or (h>20)
 or (d=7)
 or (d=1) then begin endday:=true; newday:=false; end
 else  begin newday:=true; endday:=false; end;

if newday then
begin
  timework:=true;
  SendMessage(GetForegroundWindow, WM_SYSCOMMAND, SC_MONITORPOWER, -1);
end;

if endday then
begin
  timework:=false;
  SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 0); 
  SendMessage(GetForegroundWindow, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
end;
 

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
resershtime;
Button1.Visible:=not Button1.Visible;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  timework:=true;
end;

end.
