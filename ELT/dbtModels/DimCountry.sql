{{ config(materialized='table') }}

select distinct CountryName,CountryCode
from {{ ref('StagingArea') }}