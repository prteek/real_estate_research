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

from (
select cast("Date" as date) as time_period
, lower("RegionName") as area_name
, lower("AreaCode") as area_code
, "AveragePrice" as average_price
, "SalesVolume" as sales_volume
, "DetachedPrice" as detached_price
, "SemiDetachedPrice" as semi_detached_price
, "TerracedPrice" as terraced_price
, "FlatPrice" as flat_price
, "NewPrice" as new_build_price
, "OldPrice" as non_new_build_price
from {{ source("house-price-index-data", "UK-HPI-full-file-2025-04.csv") }}
)