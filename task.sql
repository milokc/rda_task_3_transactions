USE ShopDB;

INSERT INTO Products (Name, Description, Price, WarehouseAmount)
VALUES ('AwersomeProduct', 'Our Awersome Product', 2.5, 10);

INSERT INTO Customers (FirstName, LastName, Email, Address)
VALUES ('John', 'Doe', 'doe@home.com', 'HOBO');

START TRANSACTION;
INSERT INTO Orders (CustomerID, Date)
VALUES ('1', '2023-01-01');

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES ('1', '1', 2);

UPDATE Products SET WarehouseAmount = (
  SELECT Count FROM OrderItems WHERE OrderID = 1)
WHERE ID = 1;
COMMIT;
