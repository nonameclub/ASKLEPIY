unit AddProductFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB, ProjectModulesUnit;

type
  TAddProductForm = class(TForm)
    txtName: TEdit;
    lblName: TLabel;
    btnSave: TButton;
    commandAdd: TADOCommand;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDataModule: TMyDataModule;
  public
    property DataModule: TMyDataModule read FDataModule write FDataModule;
  end;

var
  AddProductForm: TAddProductForm;

implementation

{$R *.dfm}

procedure TAddProductForm.btnSaveClick(Sender: TObject);
begin
  if Length(txtName.Text) > 0 then
   begin
    try
      commandAdd.CommandText := 'INSERT INTO Products (ProductName, Quantity) VALUES (:ProductName, 0)';
      commandAdd.Parameters.ParamByName('ProductName').Value := txtName.Text;
      commandAdd.Execute;
      ModalResult := mrOk;
      Close;
    finally
      commandAdd.Free;
    end;
  end else ShowMessage('������� ��� ������!');
end;

procedure TAddProductForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ModalResult := mrOk;
end;

procedure TAddProductForm.FormCreate(Sender: TObject);
begin
  //��� ��� ����� ����
  AddProductForm.Left := (AddProductForm.Monitor.Width  - AddProductForm.Width)  div 2;
  AddProductForm.Top  := (AddProductForm.Monitor.Height - AddProductForm.Height) div 2;
end;

end.
