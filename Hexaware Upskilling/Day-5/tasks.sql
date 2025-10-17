CREATE OR REPLACE TABLE timeframe(
    logged_timeframe DATE
);

ALTER TABLE timeframe
ADD COLUMN company VARCHAR;

CREATE OR REPLACE TASK add_timeframe
    WAREHOUSE = THARUN
    SCHEDULE = '1 MINUTE'
    AS 
    INSERT INTO timeframe VALUES (CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

SELECT * FROM timeframe;

SHOW TASKS;

EXECUTE TASK add_timeframe;

CREATE OR REPLACE TASK fix_nulls 
    WAREHOUSE = THARUN
    AFTER add_timeframe 
    AS 
    UPDATE timeframe 
    SET company = "hexaware"
    WHERE company = NULL;

ALTER TASK add_timeframe SUSPEND;