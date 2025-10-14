CREATE OR REPLACE TABLE world_sales(
    region VARCHAR(100),
    country VARCHAR(100),
    item_type VARCHAR(100),
    order_priority VARCHAR(100),
    sales_channel VARCHAR(100),
    order_date DATE,
    order_if VARCHAR(100),
    ship_date DATE,
    units_sold INT,
    unit_price FLOAT,
    unit_cost FLOAT,
    total_revenue FLOAT,
    total_cost FLOAT,
    total_profit FLOAT
);

SELECT * FROM world_sales;

DROP TABLE world_sales;