{{ config(materialized='table') }}


WITH source_data AS (

    SELECT 
        PARSE_JSON(RECORD_CONTENT) AS j
    FROM {{ source('raw', 'KAFKADATA') }}

),

parsed AS (

    SELECT
        j['column01']::string AS CountryName,
        j['column02']::string AS CountryCode,
        j['column03']::string AS IndicatorName,
        j['column04']::string AS IndicatorCode,
        TRY_TO_DOUBLE(j['column05']::string) AS Year2024,
        TRY_TO_DOUBLE(j['column06']::string) AS Year2023,
        TRY_TO_DOUBLE(j['column07']::string) AS Year2022,
        TRY_TO_DOUBLE(j['column08']::string) AS Year2021,
        TRY_TO_DOUBLE(j['column09']::string) AS Year2020,
        TRY_TO_DOUBLE(j['column10']::string) AS Year2019,
        TRY_TO_DOUBLE(j['column11']::string) AS Year2018,
        TRY_TO_DOUBLE(j['column12']::string) AS Year2017,
        TRY_TO_DOUBLE(j['column13']::string) AS Year2016,
        TRY_TO_DOUBLE(j['column14']::string) AS Year2015,
        TRY_TO_DOUBLE(j['column15']::string) AS Year2014,
        TRY_TO_DOUBLE(j['column16']::string) AS Year2013,
        TRY_TO_DOUBLE(j['column17']::string) AS Year2012,
        TRY_TO_DOUBLE(j['column18']::string) AS Year2011,
        TRY_TO_DOUBLE(j['column19']::string) AS Year2010,
        TRY_TO_DOUBLE(j['column20']::string) AS Year2009,
        TRY_TO_DOUBLE(j['column21']::string) AS Year2008,
        TRY_TO_DOUBLE(j['column22']::string) AS Year2007,
        TRY_TO_DOUBLE(j['column23']::string) AS Year2006,
        TRY_TO_DOUBLE(j['column24']::string) AS Year2005,
        TRY_TO_DOUBLE(j['column25']::string) AS Year2004,
        TRY_TO_DOUBLE(j['column26']::string) AS Year2003,
        TRY_TO_DOUBLE(j['column27']::string) AS Year2002,
        TRY_TO_DOUBLE(j['column28']::string) AS Year2001,
        TRY_TO_DOUBLE(j['column29']::string) AS Year2000

    FROM source_data
)

SELECT * FROM parsed
