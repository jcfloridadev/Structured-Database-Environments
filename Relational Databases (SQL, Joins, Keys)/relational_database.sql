-- Relational Database Project
-- SQL database setup, import, queries, updates, deletes, schema changes, and export

-- 1. Create and use database
CREATE DATABASE QuantigrationUpdates;
USE QuantigrationUpdates;

-- 2. Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    StreetAddress VARCHAR(50),
    City VARCHAR(25),
    State VARCHAR(25),
    ZipCode VARCHAR(10),
    Telephone VARCHAR(15)
);

-- 3. Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    SKU VARCHAR(20),
    Description VARCHAR(75),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 4. Create RMA table
CREATE TABLE RMA (
    RMAID INT PRIMARY KEY,
    OrderID INT,
    Step VARCHAR(50),
    Status VARCHAR(50),
    Reason VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- 5. Import data from CSV files
LOAD DATA INFILE '/home/codio/workspace/customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/home/codio/workspace/orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/home/codio/workspace/rma.csv'
INTO TABLE RMA
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;