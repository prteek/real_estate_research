## Hello Evidence

### Orders Table

```regions
select * from ukre.pipr_regions
```

<DataTable data={regions} />

```latest
select area_name
, average_price
, upper(area_code) as area_code
, "type"
from ukre.pipr_regions
where time_period = (select max(time_period) from ukre.pipr_regions)
```

<AreaMap
  data={latest}
  areaCol="area_code"
  geoJsonUrl="/lad.geojson"
  geoId="LAD24CD"
  value="average_price"
  min=1000
  max=2000
  tooltip={[
    {id: 'area_name', showColumnName: false},
    {id: 'average_price', fmt: 'gbp', valueClass: 'text-[green]', showColumnName: false}
]}
/>
