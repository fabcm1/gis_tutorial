defmodule GisTutorial.Locations do
  import Ecto.Query
  import Geo.PostGIS

  alias GisTutorial.Repo

  alias GisTutorial.Locations.Point

  def distances(geom) do
    query = from p in Point, limit: 5, select: st_distance(p.geom, ^geom)

    query
    |> Repo.one()
  end
end
