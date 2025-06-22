CREATE EXTERNAL TABLE default.piper_raw (
  time_period STRING,
  area_name STRING,
  rental_price STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  'separatorChar' = ',',
  'quoteChar' = '"',
  'escapeChar' = '\\'
)
STORED AS TEXTFILE
LOCATION 's3://ds-dev-bkt/piper/piper_raw/'
TBLPROPERTIES (
  'skip.header.line.count' = '1',
  'classification' = 'csv'
)