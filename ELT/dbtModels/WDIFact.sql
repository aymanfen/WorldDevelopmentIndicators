{{ config(materialized='table') }}

select * from {{ref ('StagingArea')}}