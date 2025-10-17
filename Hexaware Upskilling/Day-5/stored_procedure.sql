CREATE OR REPLACE FUNCTION make_name_to_email (name VARCHAR)
RETURNS VARCHAR NOT NULL
LANGUAGE SQL
AS 
$$
BEGIN
RETURN CONCAT(name, '@gmail.com');
END
$$;

DROP PROCEDURE make_name_to_email(VARCHAR);

SHOW FUNCTIONS LIKE '%make%';

SELECT make_name_to_email('tharun');

CREATE OR REPLACE TABLE emp(
    name VARCHAR,
    email VARCHAR
);

CREATE OR REPLACE TASK name_email
    WAREHOUSE = THARUN
    SCHEDULE = '1 HOUR'
    AS 
    INSERT INTO emp VALUES ('tharun_atithya_', make_name_to_email('tharun_atithya_'));

ALTER TASK name_email RESUME;

EXECUTE TASK name_email;

SELECT * FROM emp;