{{ config(materialized='table') }}

select distinct Year
from {{ ref('StagingArea') }}