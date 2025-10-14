CREATE OR REPLACE VIEW single_person 
AS 
SELECT * FROM sales_data_day_2;

SHOW VIEWS;

SELECT * FROM single_person;

CREATE OR REPLACE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10, 2),
    total_amount DECIMAL(10, 2),
    payment_method VARCHAR(20),
    region VARCHAR(50),
    sales_rep VARCHAR(100)
);

INSERT INTO sales 
VALUES 
    (1, '2024-01-15', 'John Smith', 'Laptop Pro 15', 'Electronics', 2, 1299.99, 2599.98, 'Credit Card', 'North', 'Sarah Johnson');

CREATE OR REPLACE MATERIALIZED VIEW region_sales 
AS 
SELECT 
    region,
    SUM(total_amount) AS total_amount
FROM sales
GROUP BY region;

SELECT * FROM region_sales;

CREATE OR REPLACE SECURE VIEW region_sales_secure 
AS 
SELECT 
    region,
    CASE 
        WHEN region = 'North' THEN CONCAT(SUBSTR(TO_VARCHAR(SUM(total_amount)), 1, 2), '*****')
        ELSE TO_VARCHAR(SUM(total_amount))
    END AS sales_amount
FROM sales
GROUP BY region;

SELECT * FROM region_sales_secure;