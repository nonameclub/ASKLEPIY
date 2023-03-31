program TestProject;

uses
  Vcl.Forms,
  MainFormUnit in 'MainFormUnit.pas' {frmMain},
  SettingsFormUnit in 'SettingsFormUnit.pas' {frmSettings},
  AddProductFormUnit in 'AddProductFormUnit.pas' {AddProductForm},
  ProjectModulesUnit in 'ProjectModulesUnit.pas' {MyDataModule: TDataModule},
  TransactionFormUnit in 'TransactionFormUnit.pas' {frmTransaction};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TAddProductForm, AddProductForm);
  Application.CreateForm(TMyDataModule, MyDataModule);
  Application.CreateForm(TfrmTransaction, frmTransaction);
  Application.Run;
end.
