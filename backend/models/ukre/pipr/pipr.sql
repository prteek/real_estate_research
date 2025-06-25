SELECT DATE '1899-12-30' + CAST("Time period" AS INTEGER) AS time_period
, lower("Area name") as area_name
, case when "Rental price" = '[x]' then null
else cast("Rental price" as double) end as rental_price
FROM {{ source("priceindexofprivaterentsukmonthlypricestatistics", "priceindexofprivaterentsukmonthlypricestatistics.xlsx") }}
where time_period is not null