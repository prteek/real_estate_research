select a.*
, b.type
from ukre.pipr a inner join geo.area_types b on a.area_name = b.area_name
where b.type = 'region'