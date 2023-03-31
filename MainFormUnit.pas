unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Data.DB, Data.Win.ADODB, SettingsFormUnit, Registry,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, frxClass, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.DApt,
  frxDBSet, FireDAC.Phys.IB, FireDAC.Phys.IBDef,frxDesgn;

type
  TfrmMain = class(TForm)
    dbConnection: TADOConnection;
    btnSettingsFrm: TButton;
    dbGrid: TDBGridEh;
    dsProducts: TDataSource;
    queryProducts: TADOQuery;
    btnAddProduct: TButton;
    btnTransaction: TButton;
    dtReportDate: TDateTimePicker;
    btnReport: TButton;
    reportTransaction: TfrxReport;
    procedure btnSettingsFrmClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtReportDateChange(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnReportClick(Sender: TObject);
var
  Query: TADOQuery;
  DataSet: TfrxDBDataset;
begin
  try
    reportTransaction.LoadFromFile('Report.fr3');
    Query := TADOQuery.Create(nil);
    Query.Connection := dbConnection; // set the ADOConnection component
    Query.SQL.Text := 'SELECT Transactions.TransactionID, Transactions.TransactionDate, Transactions.TransactionType, Transactions.Quantity, ' +
      'Products.ProductName ' +
      'FROM Transactions ' +
      'LEFT JOIN Products ON Transactions.ProductID = Products.ProductID ' +
      'WHERE Transactions.TransactionDate <= :SelectedDate ' +
      'ORDER BY Transactions.TransactionID';
//    Query.Parameters.ParamByName('SelectedDate').Value := FormatDateTime('yyyy-mm-dd', dtReportDate.Date); // set the selected date parameter
    Query.Open;
    DataSet := TfrxDBDataset.Create(nil);
    DataSet.DataSet := Query;
    reportTransaction.Variables['TransactionDate'] := dtReportDate.Date; // set the selected date parameter for the report
    reportTransaction.DataSets.Add(DataSet);
    DataSet.Open;
    reportTransaction.ShowReport;
  finally
    Query.Free;
    reportTransaction.Free;
  end;
end;

procedure TfrmMain.btnSettingsFrmClick(Sender: TObject);
begin
  frmSettings.ShowModal;
end;

procedure TfrmMain.dtReportDateChange(Sender: TObject);
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

procedure TfrmMain.FormCreate(Sender: TObject);
var
  Reg: TRegistry;
  userName, databaseName, password, serverName, connectionString: string;
begin
  Reg := TRegistry.Create;
  frmMain.Constraints.MinWidth := 620;
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
    ConnectionString := 'Provider=SQLOLEDB.1' +
          ';Data Source=' + serverName +
          ';Initial Catalog=' + databaseName +
          ';User ID=' + userName +
          ';Password=' + password + ';Persist Security Info=False;';

    //�������� ����������� � ���� ������
    dbConnection.ConnectionString := connectionString;
    dbConnection.LoginPrompt := False;
    dbConnection.Connected := True;

    dbGrid.AutoFitColWidths := True;

  except
    on E: Exception do
    begin
      MessageDlg('������ ����������� � ���� ������!, ' + E.Message, mtWarning, [mbOK], 0);
    end;
  end;

  queryProducts.SQL.Text :=
      'SELECT Products.ProductID, Products.ProductName, ' +
      'COALESCE(SUM(CASE WHEN Transactions.TransactionType = ''Income'' THEN Transactions.Quantity ELSE -Transactions.Quantity END), 0) AS Quantity ' +
      'FROM Products ' +
      'LEFT JOIN Transactions ON Products.ProductID = Transactions.ProductID AND Transactions.TransactionDate <= :SelectedDate ' +
      'GROUP BY Products.ProductID, Products.ProductName, Products.Quantity';
  queryProducts.Parameters.ParamByName('SelectedDate').Value := FormatDateTime('yyyy-mm-dd', dtReportDate.Date);
  queryProducts.Open;

  //����������� ����� �������

end;

end.