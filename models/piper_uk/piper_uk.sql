select *
from {{ source('piper', 'raw') }}
where area_name = 'united kingdom'