unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Data.DB, Data.Win.ADODB, SettingsFormUnit, Registry, AddProductFormUnit,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, frxClass, frxDBSet, frxDesgn, DateUtils, ProjectModulesUnit, TransactionFormUnit;

type
  TfrmMain = class(TForm)
    btnSettingsFrm: TButton;
    dbGrid: TDBGridEh;
    dsProducts: TDataSource;
    queryProducts: TADOQuery;
    btnAddProduct: TButton;
    dtReportDate: TDateTimePicker;
    btnReport: TButton;
    frxReport1: TfrxReport;
    frxDataSet: TfrxDBDataset;
    queryReport: TADOQuery;
    procedure btnSettingsFrmClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtReportDateChange(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure btnAddProductClick(Sender: TObject);
    procedure dbGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbGridKeyPress(Sender: TObject; var Key: Char);
    procedure dbGridDblClick(Sender: TObject);

  private
    FDataModule: TMyDataModule;
  public
    property DataModule: TMyDataModule read FDataModule write FDataModule;
    procedure RefreshTable;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnAddProductClick(Sender: TObject);
var
  AddProductForm: TAddProductForm;
begin
  AddProductForm := TAddProductForm.Create(nil);
  AddProductForm.Left := (AddProductForm.Monitor.Width  - AddProductForm.Width)  div 2;
  AddProductForm.Top  := (AddProductForm.Monitor.Height - AddProductForm.Height) div 2;
  try
    if AddProductForm.ShowModal = mrOK then
      begin
        RefreshTable;
      end;
  finally
    AddProductForm.Free;
  end;
end;

procedure TfrmMain.RefreshTable;
begin
  queryProducts.SQL.Text :=
            'SELECT Products.ProductID, Products.ProductName, ' +
            'COALESCE(SUM(CASE WHEN Transactions.TransactionType = ''Income'' THEN Transactions.Quantity ELSE -Transactions.Quantity END), 0) AS Quantity ' +
            'FROM Products ' +
            'LEFT JOIN Transactions ON Products.ProductID = Transactions.ProductID AND Transactions.TransactionDate <= :SelectedDate ' +
            'GROUP BY Products.ProductID, Products.ProductName, Products.Quantity';
  queryProducts.Parameters.ParamByName('SelectedDate').Value := FormatDateTime('yyyy-mm-dd', dtReportDate.Date);
  queryProducts.Open;
end;

procedure TfrmMain.btnReportClick(Sender: TObject);
begin
  frxReport1 := TfrxReport.Create(nil); // create the report object
  try
    frxReport1.LoadFromFile('Report.fr3');
    queryReport.SQL.Text := 'EXEC GetTransactionsByDate :SelectedDate';
    queryReport.Parameters.ParamByName('SelectedDate').Value := datetostr(dtReportDate.Date); // set the selected date parameter
    queryReport.Open;
    //frxDataSet := TfrxDBDataset.Create(nil);
    frxDataSet.DataSet := queryReport;
    frxDataSet.Open;
    frxReport1.Variables['SelectedDate'] := FormatDateTime('dd.mm.yyyy', dtReportDate.Date); // set the selected date parameter for the report
    frxReport1.DataSets.Add(frxDataSet);
    frxReport1.ShowReport;
  finally
    //queryReport.Free;
    //frxReport1.Free; // explicitly free the report object after it has been shown
  end;
end;

procedure TfrmMain.btnSettingsFrmClick(Sender: TObject);
begin
  frmSettings.ShowModal;
end;

procedure TfrmMain.dbGridDblClick(Sender: TObject);
var
  ProductID: Integer;
  TransactionForm: TfrmTransaction;
begin
  if not dbGrid.DataSource.DataSet.IsEmpty then
  begin
    ProductID := dbGrid.DataSource.DataSet.FieldByName('ProductID').AsInteger;
    TransactionForm := TfrmTransaction.Create(nil);
    TransactionForm.Left := (TransactionForm.Monitor.Width  - TransactionForm.Width)  div 2;
    TransactionForm.Top  := (TransactionForm.Monitor.Height - TransactionForm.Height) div 2;
    try
      TransactionForm.SetProductID(ProductID); // pass the ProductID to the new form
      if TransactionForm.ShowModal = mrOK then
      begin
        RefreshTable;
      end;
    finally
      TransactionForm.Free;
    end;
  end;
end;

procedure TfrmMain.dbGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = []) then
  begin
    if MessageDlg('�� ������ ������� ������?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      dbGrid.DataSource.DataSet.Delete;
    Key := 0; // Prevent the default action of the Delete key
  end;
end;

procedure TfrmMain.dbGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then // Check if the Enter key was pressed
    begin
      if dbGrid.DataSource.State in [dsInsert, dsEdit] then // Check if the dataset is in insert or edit mode
         begin
          dbGrid.DataSource.DataSet.Post; // Save changes to the database
          dbGrid.DataSource.DataSet.Refresh; // Refresh the dataset to reflect the changes
         end;
      Key := #0; // Set the key to 0 to prevent the default Enter key behavior
    end;
end;

procedure TfrmMain.dtReportDateChange(Sender: TObject);
begin
  RefreshTable;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  Reg: TRegistry;
  userName, databaseName, password, serverName, connectionString: string;
begin
  Reg := TRegistry.Create;
  frmMain.Constraints.MinWidth := 620;
  dtReportDate.Date := DateOf(Now);
  //��� ��� ����� ����
  frmMain.Left := (frmMain.Monitor.Width  - frmMain.Width)  div 2;
  frmMain.Top  := (frmMain.Monitor.Height - frmMain.Height) div 2;

  //�������� ������������ ���� ������ �� ������
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('Software\ASKLEPIY', False) then
    begin
      serverName := Reg.ReadString('Server');
      databaseName := Reg.ReadString('DatabaseName');
      userName := Reg.ReadString('Username');
      password := Reg.ReadString('Password');
    end;
  finally
    Reg.Free;
  end;

  try
    connectionString := 'Provider=SQLOLEDB.1' +
          ';Data Source=' + serverName +
          ';Initial Catalog=' + databaseName +
          ';User ID=' + userName +
          ';Password=' + password + ';Persist Security Info=False;';
    //�������� ����������� � ���� ������
    inherited;
    MyDataModule := TMyDataModule.Create(Self);
    MyDataModule.SetConnectionString(connectionString);


    dbGrid.AutoFitColWidths := True;

  except
    on E: Exception do
    begin
      MessageDlg('������ ����������� � ���� ������!, ' + E.Message, mtWarning, [mbOK], 0);
    end;
  end;

  RefreshTable;
end;

end.
