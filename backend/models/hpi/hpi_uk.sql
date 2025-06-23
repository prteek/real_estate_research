{{ config(
    pre_hook="
CREATE EXTERNAL TABLE IF NOT EXISTS real_estate.hpi_raw (
  time_period STRING,
  area_name STRING,
  area_code STRING,
  average_price STRING,
  sales_volume STRING,
  detached_price STRING,
  semi_detached_price STRING,
  terraced_price STRING,
  flat_price STRING,
  new_build_price STRING,
  non_new_build_price STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION 's3://real-estate-research/hpi/hpi_raw/'
TBLPROPERTIES (
  'skip.header.line.count' = '1',
  'classification' = 'csv'
)",
) }}

select cast(time_period as date) as time_period
, area_name
, area_code
, cast(average_price as double) as average_price
, cast(sales_volume as int) as sales_volume
, cast(detached_price as double) as detached_price
, cast(semi_detached_price as double) as semi_detached_price
, cast(terraced_price as double) as terraced_price
, cast(flat_price as double) as flat_price
, cast(new_build_price as double) as new_build_price
, cast(non_new_build_price as double) as non_new_build_price
from {{ source('hpi', 'hpi_raw') }}
