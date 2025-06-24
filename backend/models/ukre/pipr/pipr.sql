SELECT cast("Time period" as date) as time_period
, lower("Area name") as area_name
, "Rental price" as rental_price
FROM {{ source("priceindexofprivaterentsukmonthlypricestatistics", "priceindexofprivaterentsukmonthlypricestatistics.xlsx") }}
where time_period is not null