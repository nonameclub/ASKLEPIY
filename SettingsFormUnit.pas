unit SettingsFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Registry;

type
  TfrmSettings = class(TForm)
    txtDatabaseName: TEdit;
    txtServer: TEdit;
    lblServerName: TLabel;
    lblDatabaseName: TLabel;
    lblUsername: TLabel;
    txtUsername: TEdit;
    lblPassword: TLabel;
    txtPassword: TEdit;
    btnSave: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSettings: TfrmSettings;

implementation

{$R *.dfm}

procedure TfrmSettings.btnSaveClick(Sender: TObject);
var
  Reg: TRegistry;
begin
  //Сохраним конфигурации базу данных на Реестр
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('Software\ASKLEPIY', True) then
    begin
      Reg.WriteString('Server', txtServer.Text);
      Reg.WriteString('DatabaseName', txtDatabaseName.Text);
      Reg.WriteString('Username', txtUsername.Text);
      Reg.WriteString('Password', txtPassword.Text);
    end;
  finally
    Reg.Free;
  end;

  frmSettings.Close;
end;

procedure TfrmSettings.FormCreate(Sender: TObject);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;

  //Код для центр форм
  frmSettings.Left := (frmSettings.Monitor.Width  - frmSettings.Width)  div 2;
  frmSettings.Top  := (frmSettings.Monitor.Height - frmSettings.Height) div 2;

  //Получаем конфигурации базу данных из Реестр
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('Software\ASKLEPIY', False) then
    begin
      txtServer.Text := Reg.ReadString('Server');
      txtDatabaseName.Text := Reg.ReadString('DatabaseName');
      txtUsername.Text := Reg.ReadString('Username');
      txtPassword.Text := Reg.ReadString('Password');
    end;
  finally
    Reg.Free;
  end;
end;

end.
