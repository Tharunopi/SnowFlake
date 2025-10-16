CREATE OR REPLACE STAGE stage_1;

CREATE OR REPLACE TABLE bitcoin (
    SNo INT,
    Name VARCHAR,
    Symbol VARCHAR,
    Date DATE,
    High FLOAT,
    Low FLOAT,
    Open FLOAT,
    Close FLOAT,
    Volume INT,
    Marketcap BIGINT
);

LIST @stage_1;

CREATE OR REPLACE FILE FORMAT bitcoin_csv 
TYPE = 'CSV'
SKIP_HEADER = 1
FIELD_DELIMITER = ','
FIELD_OPTIONALLY_ENCLOSED_BY = '"';

COPY INTO bitcoin 
FROM @stage_1
FILE_FORMAT = bitcoin_csv
PURGE = TRUE;

SELECT * FROM bitcoin;