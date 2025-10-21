CREATE OR REPLACE TABLE dev_sales  (
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

COPY INTO dev_sales 
FROM @_100_million 
FILE_FORMAT = sales_format 
FILES = ('1000 Sales Records.csv');

CREATE OR REPLACE TRANSIENT TABLE test_sales
CLONE dev_sales;

SELECT * FROM dev_sales;
SELECT * FROM test_sales;

DELETE FROM dev_sales 
WHERE sales_channel = 'Offline';

SELECT COUNT(*) AS count FROM dev_sales;
SELECT COUNT(*) AS count FROM test_sales;

ALTER TABLE test_sales
SWAP WITH dev_sales;