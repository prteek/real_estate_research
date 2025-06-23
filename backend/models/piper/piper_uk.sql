{{ config(
    pre_hook="
CREATE EXTERNAL TABLE IF NOT EXISTS ukre.piper_raw (
  time_period STRING,
  area_name STRING,
  rental_price STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION 's3://db.ukre/piper_raw/'
TBLPROPERTIES (
  'skip.header.line.count' = '1',
  'classification' = 'csv'
)",
) }}

select cast(time_period as date) as time_period
, area_name
, cast(rental_price as double) as rental_price
from {{ source('piper', 'piper_raw') }}
where area_name = 'united kingdom'