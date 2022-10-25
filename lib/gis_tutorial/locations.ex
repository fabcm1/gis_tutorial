defmodule GisTutorial.Locations do
  import Ecto.Query
  import Ecto.Changeset
  import Geo.PostGIS

  alias GisTutorial.Repo

  alias GisTutorial.Locations.Place
  alias GisTutorial.Locations.Neighborhood

  @spec add_place(String.t(), {float(), float()}) ::
          {:ok, Place.t()} | {:error, Place.changeset()}
  def add_place(name, coordinates) do
    point = %Geo.Point{coordinates: coordinates, srid: 4326}

    %Place{}
    |> cast(%{name: name, geom: point}, [:name, :geom])
    |> Repo.insert()
  end

  @spec make_multipolygon(Geo.MultiPolygon.t(), [{float(), float()}]) :: Geo.MultiPolygon.t()
  def make_multipolygon(multipolygon \\ %Geo.MultiPolygon{}, points) do
    %Geo.MultiPolygon{coordinates: [[points] | multipolygon.coordinates], srid: 4326}
  end

  @spec add_neighborhood(Geo.MultiPolygon.t(), String.t(), :district | :condominium) ::
          {:ok, Neighborhood.t()} | {:error, Neighborhood.changeset()}
  def add_neighborhood(multipolygon, name, type \\ :district) do
    %Neighborhood{}
    |> cast(%{name: name, type: type, geom: multipolygon}, [:name, :type, :geom])
    |> Repo.insert()
  end

  def find_neighborhoods(point) do
    query = from nb in Neighborhood, select: nb.name, where: st_intersects(^point.geom, nb.geom)

    query
    |> Repo.all()
  end

  # def distances(geom) do
  #   query = from p in Place, select: st_distance_in_meters(p.geom, ^geom.geom)

  #   query
  #   |> Repo.all()
  # end

  def dump() do
    query = from p in Place, select: [p.id, p.name, st_as_text(p.geom)]

    query
    |> Repo.all()
  end
end
