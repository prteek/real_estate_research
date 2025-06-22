{{ config(
    post_hook="
CREATE EXTERNAL TABLE IF NOT EXISTS default.piper_raw (
  time_period STRING,
  area_name STRING,
  rental_price STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION 's3://ds-dev-bkt/piper/piper_raw/'
TBLPROPERTIES (
  'skip.header.line.count' = '1',
  'classification' = 'csv'
)",
) }}

SELECT cast("Time period" as date) as time_period
, lower("Area name") as area_name
, "Rental price" as rental_price
FROM {{ source("priceindexofprivaterentsukmonthlypricestatistics", "priceindexofprivaterentsukmonthlypricestatistics.xlsx") }}