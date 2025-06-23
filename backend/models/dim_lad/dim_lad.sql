{{ config(
    pre_hook="
CREATE EXTERNAL TABLE IF NOT EXISTS geo.dim_lad (
  lad STRING,
  lad_polygon_wkt STRING,
  lad_centroid_wkt STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION 's3://real-estate-research/hpi/hpi_raw/'
TBLPROPERTIES (
  'skip.header.line.count' = '1',
  'classification' = 'csv'
)",
) }}

select *
from from {{ source('dim_lad', 'dim_lad_raw') }}