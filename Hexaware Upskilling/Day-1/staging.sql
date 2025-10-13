CREATE OR REPLACE SCHEMA tharun_learning.external_stage;

CREATE OR REPLACE STAGE tharun_learning.external_stage.aws_stage
url = 's3://bucketsnowflakes3';

SHOW STAGES IN tharun_learning.external_stage;

CREATE OR REPLACE TABLE tharun_learning.day_1.orders(
    ORDER_ID VARCHAR(30),
    AMOUNT NUMBER(30, 2),
    PROFIT NUMBER(30, 2),
    QUANTITY NUMBER(38, 0),
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30)
);

COPY INTO tharun_learning.day_1.orders
FROM @tharun_learning.external_stage.aws_stage
    FILE_FORMAT = (TYPE='CSV' SKIP_HEADER=1)
    PATTERN = '.*OrderDetails.*';

SELECT * FROM orders;

SELECT * FROM @external_stage.aws_stage;

CREATE OR REPLACE STAGE aws_stage
    url = 's3://bucketsnowflakes3';

SHOW STAGES;