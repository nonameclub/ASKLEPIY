unit ProjectModulesUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Dialogs;

type
  TMyDataModule = class(TDataModule)
    adoConnection: TADOConnection;
  private
    { Private declarations }

  public
    { Public declarations }
    procedure ConnectToDatabase;
    procedure SetConnectionString(connectionString: string);
  end;

var
  MyDataModule: TMyDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TMyDataModule.SetConnectionString(connectionString: string);
begin
  adoConnection.Connected := False;
  adoConnection.ConnectionString := connectionString;
  adoConnection.Connected := True;
end;

procedure TMyDataModule.ConnectToDatabase;
begin
  if not adoConnection.Connected then
    adoConnection.Open;
end;

end.
