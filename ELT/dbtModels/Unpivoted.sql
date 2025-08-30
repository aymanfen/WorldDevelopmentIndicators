{{ config(materialized='view') }}

SELECT CountryName,CountryCode,IndicatorName,IndicatorCode,YearValue,IndicatorValue
FROM {{ ref('RawData') }}
unpivot (
    IndicatorValue for YearValue in (Year2000,Year2001,Year2002,Year2003,Year2004,Year2005,Year2006,Year2007,Year2008,Year2009,Year2010,Year2011,
    Year2012,Year2013,Year2014,Year2015,Year2016,Year2017,Year2018,Year2019,Year2020,Year2021,Year2021,Year2022,Year2023,Year2024)
)