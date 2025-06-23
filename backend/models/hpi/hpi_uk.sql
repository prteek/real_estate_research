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
, case when average_price = '' then null
        else cast(average_price as double) end as average_price
, case when sales_volume = '' then null
        else cast(sales_volume as int) end as sales_volume
, case when detached_price = '' then null
        else cast(detached_price as double) end as detached_price
, case when semi_detached_price = '' then null
        else cast(semi_detached_price as double) end as semi_detached_price
, case when terraced_price = '' then null
        else cast(terraced_price as double) end as terraced_price
, case when flat_price = '' then null
        else cast(flat_price as double) end as flat_price
, case when new_build_price = '' then null
        else cast(new_build_price as double) end as new_build_price
, case when non_new_build_price = '' then null
        else cast(non_new_build_price as double) end as non_new_build_price
from {{ source('hpi', 'hpi_raw') }}
