alias GisTutorial.Repo
alias GisTutorial.Locations.{Place, Neighborhood}
alias GisTutorial.Locations

[n1, n2] = Repo.all(Neighborhood)

# IO.inspect(Locations.find_neighborhoods(h1))

# IO.inspect(Locations.find_neighborhoods(h2))

# IO.inspect(Locations.distances(h1))

Ecto.Adapters.SQL.query!(
  Repo,
  "SELECT ST_AsGeoJSON(geom) FROM neighborhoods where id = $1",
  [2]
)
|> IO.inspect()

# {"type":"MultiPolygon","coordinates":[[[[-46.183978128,-23.544782107],[-46.183623546,-23.543072508],[-46.181679911,-23.53914757],[-46.183557882,-23.537293417],[-46.18723503,-23.532067938],[-46.188876614,-23.530237767],[-46.193525579,-23.533320146],[-46.193880161,-23.535463319],[-46.193197262,-23.537606458],[-46.186092488,-23.542687243],[-46.183978128,-23.544782107]]]]}
