select
    msoa,
    msoa_name,
    ST_AsText(geometry) AS msoa_polygon_wkt,
    ST_AsText(ST_Centroid(geometry)) AS msoa_centroid_wkt
from (
    select
        lower(MSOA21CD) AS msoa,
        lower(MSOA21NM) AS msoa_name,
        ST_Transform(geom, 'EPSG:4326', 'EPSG:4326') AS geometry  -- Source CRS is already correct
    from {{ source('geojsons', 'MOSA_2021_EW_BFC_V6_8073017919673588333.geojson') }}
)