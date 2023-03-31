unit TransactionFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ProjectModulesUnit, Vcl.StdCtrls,
  Vcl.DBCtrls, Data.DB, Data.Win.ADODB, Vcl.Mask, DBCtrlsEh, DateUtils;

type
  TfrmTransaction = class(TForm)
    lblProduct: TLabel;
    getProductQuery: TADOQuery;
    cmType: TComboBox;
    Label1: TLabel;
    txtQuantity: TEdit;
    btnSave: TButton;
    lblProductName: TLabel;
    lblResidue: TLabel;
    commandAdd: TADOCommand;
    procedure FormShow(Sender: TObject);
    procedure txtQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDataModule: TMyDataModule;
    FProductID: Integer;
    FResidue: Integer;
  public
    property DataModule: TMyDataModule read FDataModule write FDataModule;
    procedure SetProductID(ProductID: Integer);
  end;

var
  frmTransaction: TfrmTransaction;

implementation

{$R *.dfm}

procedure TfrmTransaction.btnSaveClick(Sender: TObject);
var
  transactionType: string;
  selIndex: Integer;
begin
  if cmType.ItemIndex <> -1 then
   begin
      selIndex := cmType.ItemIndex;
      if(selIndex = 0) then transactionType := 'Income'
       else transactionType := 'Expense';
   end;

   if txtQuantity.Text <> '' then
    begin
      if (transactionType = 'Expense') AND (FResidue < StrToInt(txtQuantity.Text)) then
        ShowMessage('Колчичество дольжен быть менщее чем остаток')
       else begin
          commandAdd.CommandText := 'INSERT INTO Transactions (ProductID,TransactionType,TransactionDate,Quantity) VALUES (:ProductID, :TransactionType, :TransactionDate, :Quantity)';
          commandAdd.Parameters.ParamByName('ProductID').Value := FProductID;
          commandAdd.Parameters.ParamByName('TransactionType').Value := transactionType;
          commandAdd.Parameters.ParamByName('TransactionDate').Value := DateOf(Now);
          commandAdd.Parameters.ParamByName('Quantity').Value := txtQuantity.Text;
          commandAdd.Execute;
          ModalResult := mrOk;
          Close;
       end;

    end;

end;

procedure TfrmTransaction.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ModalResult := mrOk;
end;

procedure TfrmTransaction.FormShow(Sender: TObject);
var
  ProductName: string;
  Quantity: Integer;
begin
  // Retrieve the product information from the database using FProductID
  getProductQuery.SQL.Text := 'SELECT ProductName, Quantity FROM Products WHERE ProductID = :ProductID';
  getProductQuery.Parameters.ParamByName('ProductID').Value := FProductID;
  getProductQuery.Open;

  lblProductName.Caption := getProductQuery.FieldByName('ProductName').AsString;
  lblResidue.Caption := 'Остаток: ' + getProductQuery.FieldByName('Quantity').AsString;
  FResidue := getProductQuery.FieldByName('Quantity').AsInteger;

end;

procedure TfrmTransaction.SetProductID(ProductID: Integer);
begin
  FProductID := ProductID;
  // use the FProductID to load the details of the selected product and display them in the form
end;

procedure TfrmTransaction.txtQuantityKeyPress(Sender: TObject; var Key: Char);
begin
  // Filter out non-numeric characters
  if not (Key in ['0'..'9', #8, #9, #13, #27, #127]) then
  begin
    Key := #0;
  end;
end;

end.
