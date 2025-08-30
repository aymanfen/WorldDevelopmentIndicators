{{ config(materialized='table') }}

SELECT CountryName,CountryCode,IndicatorName,IndicatorCode,RIGHT(YearValue,4) as Year,IndicatorValue
FROM {{ ref('Unpivoted') }}