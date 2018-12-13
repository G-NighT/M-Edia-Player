unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, MPlayer, Menus, StdCtrls, Buttons, MMSYSTEM,
  ImgList, CoolTrayIcon;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N2: TMenuItem;
    Close1: TMenuItem;
    Open1: TMenuItem;
    Edit1: TEdit;
    MediaPlayer1: TMediaPlayer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    N1: TMenuItem;
    N3: TMenuItem;
    ImageList1: TImageList;
    Timer1: TTimer;
    CoolTrayIcon1: TCoolTrayIcon;
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure Open1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure ProgressBar1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ProgressBar1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Open1Click(Sender: TObject);
begin
if opendialog1.Execute then
begin
  mediaplayer1.FileName:=opendialog1.FileName;
  Edit1.Text:=MediaPlayer1.FileName;
  mediaplayer1.Open;
end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
if opendialog1.filename<>'' then
begin
mediaplayer1.Stop;
bitbtn1.Enabled:=true;
mediaplayer1.Position:=0;
end
else messagedlg('Откройте музыкальный файл'+#13+#10+'в меню: Файл > Открыть'+#13+#10+'или комбинацией Ctrl+O',mtInformation,[mbOk],0);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
if opendialog1.filename<>'' then
begin
mediaplayer1.Pause;
bitbtn1.Enabled:=true;
end
else messagedlg('Откройте музыкальный файл'+#13+#10+'в меню: Файл > Открыть'+#13+#10+'или комбинацией Ctrl+O',mtInformation,[mbOk],0);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
if opendialog1.filename<>'' then
begin
mediaplayer1.Play;
bitbtn1.Enabled:=false;
PostMessage(ProgressBar1.Handle, $0409, 0, clLime );
end
else messagedlg('Откройте музыкальный файл'+#13+#10+'в меню: Файл > Открыть'+#13+#10+'или комбинацией Ctrl+O',mtInformation,[mbOk],0);
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
if opendialog1.filename<>'' then
begin
edit1.Text:='Путь к файлу';
mediaplayer1.Stop;
end;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.ProgressBar1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos:integer;
begin
  pos:=round((100 / ProgressBar1.Width)*x);
  MediaPlayer1.Position:=(MediaPlayer1.Length div 100)*pos;
  MediaPlayer1.Play;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if bitbtn1.Enabled=false then
begin
progressbar1.Position:=progressbar1.Position+1;
end;
end;

procedure TForm1.ProgressBar1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
progressbar1.Max:=MediaPlayer1.Length;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
halt;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
form1.show;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
form2.Show;
end;

end.
