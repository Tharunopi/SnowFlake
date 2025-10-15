CREATE OR REPLACE STAGE sales_json;

SHOW STAGES;

LIST @sales_json;

CREATE OR REPLACE TABLE sales_from_json (
    order_id VARCHAR(10),
    order_date DATE,
    customer_name VARCHAR(100),
    total DECIMAL(10, 2),
    status VARCHAR(20)
);

CREATE OR REPLACE FILE FORMAT json_file_format
    TYPE = 'JSON'
    STRIP_OUTER_ARRAY = TRUE;


COPY INTO sales_from_json
FROM 
(SELECT 
    $1:order_id::VARCHAR AS order_id,
    $1:date::DATE AS date,
    $1:customer::VARCHAR AS customer_name,
    $1:total::FLOAT AS total_amount,
    $1:status::VARCHAR AS status
FROM @sales_json/orders_data.json
(FILE_FORMAT => json_file_format));

SELECT * FROM sales_from_json
LIMIT 3 OFFSET 1;
