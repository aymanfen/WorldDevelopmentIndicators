import numpy as np
import pandas as pd

df=pd.read_csv("wdifact.csv")
df.drop_duplicates(inplace=True)

countries=[
    'Australia','Brazil','Canada','China','Denmark',
    'Finland','France','Germany','Hong Kong SAR, China',
    'India','Italy','Japan','Korea, Rep.','Luxembourg',
    'Mexico','Netherlands','New Zealand','Norway','Qatar',
    'Russian Federation','Saudi Arabia','Singapore','Spain','Sweden',
    'Switzerland','Turkiye','United Arab Emirates','United Kingdom','United States'
]

df=df[df['COUNTRYNAME'].isin(countries)]
data=df.pivot(index=['COUNTRYNAME','YEAR'],columns='INDICATORNAME',values='INDICATORVALUE').reset_index()


cols=['Agriculture, forestry, and fishing, value added (% of GDP)',
       'Industry (including construction), value added (% of GDP)',
       'Services, value added (% of GDP)',
       'Stocks traded, total value (% of GDP)', 
       'Tax revenue (% of GDP)',
       'Trade (% of GDP)']

for col in cols:
    data[f'{col}(current US$)']=data[f'{col}']*data['GDP (current US$)']

data['GDP per Capita']=data['GDP (current US$)']/data['Population, total']
data['GDP Growth']=data['GDP (current US$)'].pct_change()*100

data.to_csv("Facts.csv")