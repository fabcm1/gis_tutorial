defmodule GisTutorial.Locations.Place do
  use Ecto.Schema

  @type t :: %__MODULE__{
          id: pos_integer,
          name: String.t() | nil,
          geom: Geo.Point.t()
        }

  @type changeset :: Ecto.Changeset.t(%__MODULE__{})

  schema "places" do
    field :name, :string
    field :geom, Geo.PostGIS.Geometry
  end
end
