USE  heartland_escapes

GO

--CHECK TO SEE IF TABLE EXISTS AND IF SO, DROP AND RECREATE TABLE
IF EXISTS(SELECT 1 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_TYPE = 'BASE TABLE' 
                 AND  TABLE_NAME = 'Crosstab')
DROP TABLE Crosstab
GO

--CREATE TABLE FOR DEMONSTRATION PURPOSES

CREATE TABLE Crosstab
( Year      SMALLINT,
  Quarter   TINYINT, 
  Amount    DECIMAL(2,1) )

GO
--CHANGE THE VALUES FOR THE YEARS AND QUATERS AND ADD ADDITIONAL VALUES
INSERT INTO Crosstab VALUES (2021, 1, 1.1)
INSERT INTO Crosstab VALUES (2021, 2, 1.2)
INSERT INTO Crosstab VALUES (2021, 3, 1.3)
INSERT INTO Crosstab VALUES (2020, 4, 1.4)
INSERT INTO Crosstab VALUES (2020, 1, 2.1)
INSERT INTO Crosstab VALUES (2021, 2, 2.2)
INSERT INTO Crosstab VALUES (2021, 3, 2.3)
INSERT INTO Crosstab VALUES (2020, 4, 2.4)
INSERT INTO Crosstab VALUES (2020, 1, 2.1)
INSERT INTO Crosstab VALUES (2020, 2, 2.2)
INSERT INTO Crosstab VALUES (2020, 3, 2.3)
INSERT INTO Crosstab VALUES (2021, 4, 1.4)
INSERT INTO Crosstab VALUES (2021, 4, 2.4)
INSERT INTO Crosstab VALUES (2024, 1, 1.6)
INSERT INTO Crosstab VALUES (2024, 4, 2.4)
INSERT INTO Crosstab VALUES (2024, 3, 2.3)
GO


--SELECT the SUM of each quarter, grouped by year:
--THIS IS THE ACTUAL CROSSTAB QUERY

SELECT Year, 
    SUM(CASE Quarter WHEN 1 THEN Amount ELSE 0 END) AS Q1,
    SUM(CASE Quarter WHEN 2 THEN Amount ELSE 0 END) AS Q2,
    SUM(CASE Quarter WHEN 3 THEN Amount ELSE 0 END) AS Q3,
    SUM(CASE Quarter WHEN 4 THEN Amount ELSE 0 END) AS Q4
FROM dbo.Crosstab
GROUP BY Year
GO


-- Select all customers
SELECT  c.customer_id, a.state_code, a.zip_code
FROM  dbo.customer c
RIGHT JOIN dbo.address a
	ON c.customer_id = a.customer_id
WHERE a.is_default = 1
ORDER BY a.state_code
 

-- display product information for orders
SELECT
o.order_id,
o.processed_timestamp,
c.customer_id,
c.last_name,
li.quantity,
d.product_id,
d.name,
d.description
FROM  dbo.[order] o
INNER JOIN  dbo.customer c
	on c.customer_id = o.customer_id 
INNER JOIN dbo.order_line_item li
	on li.order_id = o.order_id
INNER JOIN dbo.product d
	on d.product_id = li.product_id
WHERE o.processed_timestamp >= '05/01/2021'
ORDER BY c.customer_id


--Total revenue (sales) per month, grouped by customer
SELECT o.customer_id, c.first_name, c.last_name, DATEPART(mm, o.processed_timestamp) AS OrderMonth, SUM(p.price_per_unit * li.quantity) AS Total_Revenue
FROM dbo.[order] o
LEFT JOIN dbo.customer c
	ON c.customer_id = o.customer_id
LEFT JOIN dbo.order_line_item li
	ON li.order_id = o.order_id
LEFT JOIN dbo.product p
	ON p.product_id = li.product_id
GROUP BY o.customer_id, c.first_name, c.last_name, DATEPART(mm, o.processed_timestamp)

SELECT * FROM product;

--Total revenue (sales) per month, grouped by product
SELECT p.product_id, p.name, DATEPART(mm, o.processed_timestamp) AS OrderMonth, SUM(li.quantity) AS Ammount_Sold, SUM(p.price_per_unit * li.quantity) AS Total_Revenue
FROM dbo.[order] o
LEFT JOIN dbo.order_line_item li
	ON o.order_id = li.order_id
LEFT JOIN dbo.product p
	ON p.product_id = li.product_id
GROUP BY p.product_id, p.name, DATEPART(mm, o.processed_timestamp)


--AGGREGATE QUERY showing total amount of customers who put in an order per date
SELECT o.processed_timestamp, COUNT(o.customer_id) as 'Number of Orders by Customer' 
FROM  [dbo].[order] o
GROUP BY o.processed_timestamp


-- Count of Orders by Customer
SELECT o.customer_id , COUNT(o.order_id) as 'Number of Orders by Customer' 
FROM  dbo.[order] o
GROUP BY o.customer_id

select * from dbo.[order]

-- Get total products in each category
-- Should be updated in the future to account for parent categories
SELECT c.name, COUNT(m.product_id) as 'Total Products'
FROM dbo.product_category c
LEFT OUTER JOIN dbo.product_category_map m
	ON m.product_category_id = c.product_category_id
GROUP BY c.name

-- Get all products ordered by a customer
DECLARE @customer_id VARCHAR(36);
SET @customer_id = '3473473b-3feb-45b5-a6af-56c77524e7c6';

SELECT p.product_id, p.name, p.product_image_url
FROM dbo.[order] o
LEFT OUTER JOIN dbo.order_line_item li
	ON li.order_id = o.order_id
LEFT OUTER JOIN dbo.product p
	ON p.product_id = li.product_id
WHERE o.customer_id = @customer_id
GROUP BY p.product_id, p.name, p.product_image_url
