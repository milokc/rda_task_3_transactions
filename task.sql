USE ShopDB;

INSERT INTO Products (Name, Description, Price, WarehouseAmount)
VALUES ('AwersomeProduct', 'Our Awersome Product', 2.5, 10);

INSERT INTO Customers (FirstName, LastName, Email, Address)
VALUES ('John', 'Doe', 'doe@home.com', 'HOBO');

START TRANSACTION;
INSERT INTO Orders (CustomerID, Date)
VALUES ('1', '2023-01-01');

INSERT INTO OrderItems (OrderID, ProductID)
VALUES ('1', '1');

UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE Name = 'AwersomeProduct';
COMMIT;
