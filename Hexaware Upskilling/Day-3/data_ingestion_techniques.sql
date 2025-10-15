--Manual COPY INTO
CREATE OR REPLACE STAGE azure_sales
  url = 'azure://unicron.blob.core.windows.net/simplecontainer/'
  credentials = (AZURE_SAS_TOKEN = '?sp=rl&st=2025-10-15T03:58:25Z&se=2025-10-15T12:13:25Z&sv=2024-11-04&sr=c&sig=XMRA6U4cJyr2Ls4omiAskyA3OoXTeF9YePG8JaOkl2w%3D');

LIST @azure_sales;

CREATE OR REPLACE TABLE employee(
    id INT,
    first_name VARCHAR(200),
    email VARCHAR(200),
    sign_up_date DATE,
    status VARCHAR(50)
);

COPY INTO employee 
FROM @azure_sales/emp_db.csv
FILE_FORMAT = (TYPE='CSV' FIELD_DELIMITER=',' FIELD_OPTIONALLY_ENCLOSED_BY='"')
ON_ERROR = 'CONTINUE';

SELECT * FROM employee;

--SNOW PIPE
CREATE OR REPLACE STAGE azure_simple_container
    url = 'azure://unicron.blob.core.windows.net/simplecontainer/'
    credentials = (AZURE_SAS_TOKEN = '?sp=rl&st=2025-10-15T03:58:25Z&se=2025-10-15T12:13:25Z&sv=2024-11-04&sr=c&sig=XMRA6U4cJyr2Ls4omiAskyA3OoXTeF9YePG8JaOkl2w%3D');

CREATE OR REPLACE PIPE azure_emp_pipe
AS 
COPY INTO employee 
FROM @azure_simple_container/Employee
FILE_FORMAT = (TYPE='CSV' FIELD_DELIMITER=',' FIELD_OPTIONALLY_ENCLOSED_BY='"')
ON_ERROR = 'CONTINUE';

SHOW PIPES;

ALTER PIPE azure_emp_pipe REFRESH;

SELECT * FROM employee;

