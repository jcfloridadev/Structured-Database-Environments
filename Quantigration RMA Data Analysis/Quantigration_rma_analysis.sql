-- ====================================
-- RMA DATA ANALYSIS PROJECT
-- ====================================
-- This script analyzes return activity by state and product type
-- using relational joins and aggregation.

USE QuantigrationRMA;

-- ====================================
-- 1. Verify Tables and Structure
-- ====================================

SHOW TABLES;

DESCRIBE Customers;
DESCRIBE Orders;
DESCRIBE RMA;

-- ====================================
-- 2. Total Number of Returns
-- ====================================

SELECT COUNT(*) AS TotalReturns
FROM RMA;

-- ====================================
-- 3. Returns by State
-- ====================================

SELECT 
    c.State,
    COUNT(*) AS TotalReturns
FROM RMA r
JOIN Orders o 
    ON r.OrderID = o.OrderID
JOIN Customers c 
    ON o.CustomerID = c.CustomerID
GROUP BY c.State
ORDER BY TotalReturns DESC;

-- ====================================
-- 4. Returns by Product Type
-- ====================================

SELECT 
    o.Description AS ProductType,
    COUNT(*) AS TotalReturns
FROM RMA r
JOIN Orders o 
    ON r.OrderID = o.OrderID
GROUP BY o.Description
ORDER BY TotalReturns DESC;

-- ====================================
-- 5. Return Percentage by Product Type
-- ====================================

SELECT 
    o.Description AS ProductType,
    COUNT(*) AS TotalReturns,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM RMA), 2) AS ReturnPercentage
FROM RMA r
JOIN Orders o 
    ON r.OrderID = o.OrderID
GROUP BY o.Description
ORDER BY ReturnPercentage DESC;

-- ====================================
-- 6. Top 3 States with Highest Returns
-- ====================================

SELECT 
    c.State,
    COUNT(*) AS TotalReturns
FROM RMA r
JOIN Orders o 
    ON r.OrderID = o.OrderID
JOIN Customers c 
    ON o.CustomerID = c.CustomerID
GROUP BY c.State
ORDER BY TotalReturns DESC
LIMIT 3;

-- ====================================
-- 7. Data Validation
-- ====================================

SELECT COUNT(*) AS TotalCustomers FROM Customers;
SELECT COUNT(*) AS TotalOrders FROM Orders;
SELECT COUNT(*) AS TotalRMARecords FROM RMA;