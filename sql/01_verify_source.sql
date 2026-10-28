-- Run in MySQL Workbench against the drogeriemarkt schema.
USE drogeriemarkt;

-- 1. Row counts: every table must have rows before you extract.
SELECT 'Customer' AS tbl, COUNT(*) AS n FROM Customer
UNION ALL SELECT 'DrogerieMarkt',    COUNT(*) FROM DrogerieMarkt
UNION ALL SELECT 'Employee',         COUNT(*) FROM Employee
UNION ALL SELECT 'Order',            COUNT(*) FROM `Order`
UNION ALL SELECT 'OrderDescription', COUNT(*) FROM OrderDescription
UNION ALL SELECT 'Product',          COUNT(*) FROM Product
UNION ALL SELECT 'ProductType',      COUNT(*) FROM ProductType
UNION ALL SELECT 'Supplier',         COUNT(*) FROM Supplier;

-- 2. Column type of Price. DECIMAL(5) means DECIMAL(5,0): whole euros, no cents.
SHOW COLUMNS FROM Product LIKE 'Price';

-- 3. Order date range.
SELECT MIN(dateOrder) AS first_order, MAX(dateOrder) AS last_order FROM `Order`;

-- 4. The source-of-truth numbers. The warehouse must reproduce these exactly.
SELECT COUNT(*)                          AS order_lines,
       SUM(od.QuantityOrdered * p.Price) AS total_revenue
FROM OrderDescription AS od
JOIN Product          AS p ON p.idProduct = od.Product_idProduct;