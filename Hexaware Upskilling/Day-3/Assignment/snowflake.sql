CREATE OR REPLACE TABLE sales_data(
    sale_id INT ,
    sale_date DATE,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    quantity INT,
    unit_price FLOAT,
    total_amount FLOAT
);

SELECT * FROM sales_data;