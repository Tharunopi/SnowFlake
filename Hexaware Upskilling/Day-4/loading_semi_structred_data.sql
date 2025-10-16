CREATE OR REPLACE STAGE json_stage;

CREATE OR REPLACE FILE FORMAT json_file_format 
TYPE = 'JSON'
STRIP_OUTER_ARRAY = TRUE;

CREATE OR REPLACE TABLE us_ingredients(
    raw VARIANT
);

CREATE OR REPLACE TABLE films(
    raw VARIANT
);

LIST @json_stage;

COPY INTO us_ingredients
FROM @json_stage
FILE_FORMAT = json_file_format 
FILES = ('US_recipes.json')
PURGE = TRUE;

SELECT * FROM us_ingredients;

COPY INTO films
FROM @json_stage
FILE_FORMAT = json_file_format 
FILES = ('Film.JSON')
PURGE = FALSE;

SELECT * FROM films;

SELECT 
    $1:Title::VARCHAR AS Title,
    $1:Year::VARCHAR AS Year,
    $1:Rated::VARCHAR AS Rated,
    $1:Released::VARCHAR AS Released,
    $1:Runtime::VARCHAR AS Runtime,
    $1:Genre::VARCHAR AS Genre,
    $1:Director::VARCHAR AS Director,
    $1:Actors::VARCHAR AS Actors,
    $1:Images[1]::VARCHAR AS Image_1
FROM films;

CREATE OR REPLACE TABLE film_table
AS 
SELECT 
    $1:Title::VARCHAR AS Title,
    $1:Year::VARCHAR AS Year,
    $1:Rated::VARCHAR AS Rated,
    $1:Released::VARCHAR AS Released,
    $1:Runtime::VARCHAR AS Runtime,
    $1:Genre::VARCHAR AS Genre,
    $1:Director::VARCHAR AS Director,
    $1:Actors::VARCHAR AS Actors,
    $1:Images::ARRAY AS Images
FROM films;

SELECT * FROM film_table