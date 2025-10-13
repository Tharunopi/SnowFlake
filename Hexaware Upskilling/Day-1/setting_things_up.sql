CREATE OR REPLACE WAREHOUSE tharun WITH 
    WAREHOUSE_TYPE = 'SNOWPARK-OPTIMIZED'
    WAREHOUSE_SIZE = 'MEDIUM'
    AUTO_SUSPEND = 300
    AUTO_RESUME = TRUE
    COMMENT = 'Training warehouse just to practice.'

CREATE OR REPLACE DATABASE tharun_learning

CREATE OR REPLACE SCHEMA day_1
    COMMENT = 'All day-1 learning will be executed from this schema'

USE WAREHOUSE tharun