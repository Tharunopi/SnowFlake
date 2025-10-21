SHOW STAGES;

LIST @_100_million;

CREATE OR REPLACE FILE FORMAT sales_format 
    TYPE = 'CSV'
    FIELD_DELIMITER = ',' 
    SKIP_HEADER = 1;

CREATE TABLE sales_records (
    Region VARCHAR(100),
    Country VARCHAR(100),
    Item_Type VARCHAR(100),
    Sales_Channel VARCHAR(50),
    Order_Priority CHAR(1),
    Order_Date DATE,
    Order_ID INT PRIMARY KEY,
    Ship_Date DATE,
    Units_Sold INT,
    Unit_Price DECIMAL(10, 2),
    Unit_Cost DECIMAL(10, 2),
    Total_Revenue DECIMAL(15, 2),
    Total_Cost DECIMAL(15, 2),
    Total_Profit DECIMAL(15, 2)
);

COPY INTO sales_records 
FROM @_100_million 
FILE_FORMAT = sales_format 
FILES = ('1000 Sales Records.csv');

SELECT * FROM sales_records;

UPDATE sales_records 
SET country = 'India';

CREATE OR REPLACE TABLE sales_data_time_travelled
CLONE sales_records
BEFORE (STATEMENT => '01bfd9dc-0001-66d1-000c-40860003d192');

SELECT * FROM sales_data_time_travelled;