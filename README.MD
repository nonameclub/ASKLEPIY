# Tестовые задание для компании ASKLEPIY

Программа для учета прихода и расхода товаров на складе, а также генерации отчетности по остаткам товаров на дату.

## Кредиты

- Rad Studio 10.2
- Ehlib 9.4
- FastReport D25

## Старт программы

После запуска вам придется вводить данные для базы данных при нажатие ``Настройки`` в главном окне.
<br> После того создайте базу данных и выполните sql запросы указан на ниже 
<br> Для удалении продукты вам нужно выбрать нужную товар и нажимать ``Delete`` на клавиатуре
<br> А что бы изменить товарь вам нужно нажимать на Имю товара один раз с мишкой
<br> А что бы добавить Приход/Расход вам нужно нажимать нужную товар два раза с мишкой

[Демо](https://user-images.githubusercontent.com/15018727/229076439-54ee42fc-28c6-47ee-b6de-2df46c11fb16.mp4)

## Таблицы, Триггери, Процедуры

Таблица транзакции(Для хранение Приход/Расход)

```sql
CREATE TABLE Transactions (
TransactionID INT IDENTITY(1,1) PRIMARY KEY,
ProductID INT,
TransactionType VARCHAR(10),
TransactionDate DATE,
Quantity INT,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)
```

Таблица Продуктов
```sql
CREATE TABLE Products (
  ProductID INT IDENTITY(1,1) PRIMARY KEY,
  ProductName VARCHAR(50),
  Quantity INT
)
```

Триггер для обновлении остаток в таблице Продукты

```sql
CREATE TRIGGER [dbo].[trg_Transactions_UpdateProductQuantity] 
ON [dbo].[Transactions] 
AFTER INSERT 
AS 
BEGIN
    IF @@ROWCOUNT = 0
        RETURN;

    DECLARE @ProductID INT, @Quantity INT, @TransactionType NVARCHAR(10);
    
    SELECT @ProductID = i.ProductID, @Quantity = i.Quantity, @TransactionType = i.TransactionType
    FROM inserted i;

    IF @TransactionType = 'Income'
        UPDATE Products SET Quantity = Quantity + @Quantity WHERE ProductID = @ProductID;
    ELSE IF @TransactionType = 'Expense'
        UPDATE Products SET Quantity = Quantity - @Quantity WHERE ProductID = @ProductID;
END;
```

Триггер для получение текушую остаток и записать при создание транзакции (Что бы узнать сколько было До создание транзакции)
```sql
CREATE TRIGGER tr_UpdateRealQuantity
ON Transactions
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO Transactions (TransactionID, ProductID, TransactionDate, TransactionType, Quantity, RealQuantity)
    SELECT i.TransactionID, i.ProductID, i.TransactionDate, i.TransactionType, i.Quantity, p.Quantity
    FROM inserted i
    INNER JOIN Products p ON i.ProductID = p.ProductID
END
```

Триггер при удалении Продукта удаляет все транзакции этого товара
```sql
CREATE TRIGGER DeleteProductTrigger
ON Products
INSTEAD OF DELETE
AS
BEGIN
  SET NOCOUNT ON;
  
  -- Удаление связанных транзакций
  DELETE FROM Transactions WHERE ProductID IN (SELECT deleted.ProductID FROM deleted);
  
  -- Удаление продукта
  DELETE FROM Products WHERE ProductID IN (SELECT deleted.ProductID FROM deleted);
END;
```

Процедура для отчета FastReport
```sql
SELECT Transactions.TransactionID, Transactions.TransactionDate, Transactions.TransactionType, Transactions.Quantity,
Products.ProductName 
FROM Transactions 
LEFT JOIN Products ON Transactions.ProductID = Products.ProductID 
WHERE Transactions.TransactionDate <= :SelectedDate 
ORDER BY Transactions.TransactionID
``` 

