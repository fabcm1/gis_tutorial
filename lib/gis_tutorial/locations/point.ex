defmodule GisTutorial.Locations.Point do
  use Ecto.Schema

  schema "points" do
    field :name, :string
    field :geom, Geo.PostGIS.Geometry
  end
end
