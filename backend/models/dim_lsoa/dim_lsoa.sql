select
    lsoa,
    lsoa_name,
    ST_AsText(geometry) AS lsoa_polygon_wkt,
    ST_AsText(ST_Centroid(geometry)) AS lsoa_centroid_wkt
from (
    select
        lower(LSOA21CD) AS lsoa,
        lower(LSOA21NM) AS lsoa_name,
        ST_Transform(geometry, 'EPSG:4326', 'EPSG:4326') AS geometry  -- Source CRS is already correct
    from {{ source('geojsons', 'Lower_layer_Super_Output_Areas_2021_EW_BFC_V8_-8407643096148449625.geojson') }}
)