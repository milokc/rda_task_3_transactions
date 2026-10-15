USE ShopDB;

CREATE TABLE Products (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Description VARCHAR(100),
    Price VARCHAR(50),
    WarehouseAmount INT,
    PRIMARY KEY (ID)
);
CREATE TABLE Customers (
    ID INT AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    Address VARCHAR(100),
    PRIMARY KEY (ID)
);
CREATE TABLE Orders (
    ID INT AUTO_INCREMENT,
    CustomerID INT,
    Date DATE,
    PRIMARY KEY (ID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(ID) ON DELETE SET NULL
);
CREATE TABLE OrderItems (
    ID INT AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (OrderID) REFERENCES Orders(ID) ON DELETE SET NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE SET NULL
);

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
