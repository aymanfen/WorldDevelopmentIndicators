{{ config(materialized='table') }}

select distinct IndicatorName,IndicatorCode
from {{ ref('StagingArea') }}