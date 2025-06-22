select cast(time_period as date) as time_period
, area_name
, cast(rental_price as double) as rental_price
from {{ source('piper', 'piper_raw') }}
where area_name = 'united kingdom'