--Permanent table
CREATE OR REPLACE TABLE sales_data(
    sale_id INT PRIMARY KEY,
    amount FLOAT
);

--Transient table
CREATE OR REPLACE TRANSIENT TABLE sales_stage(
    sale_id INT PRIMARY KEY,
    region VARCHAR(30)
);

--Tempoary table 
CREATE OR REPLACE TEMPORARY TABLE sales_temp(
    sale_id INT PRIMARY KEY,
    discount FLOAT
);

SHOW TABLES;

ALTER TABLE sales_data
SET DATA_RETENTION_TIME_IN_DAYS = 30;

INSERT INTO sales_data
VALUES 
    (1, 8456.25);

SELECT * FROM sales_data;

SHOW TABLES HISTORY;

DROP TABLE sales_data;

UNDROP TABLE sales_data;

ALTER TABLE sales_data RENAME TO sales_data_day_2;