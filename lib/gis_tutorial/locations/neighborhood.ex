defmodule GisTutorial.Locations.Neighborhood do
  use Ecto.Schema

  @type t :: %__MODULE__{
          id: pos_integer,
          name: String.t() | nil,
          type: :district | :condominium,
          geom: Geo.MultiPolygon.t()
        }

  @type changeset :: Ecto.Changeset.t(%__MODULE__{})

  schema "neighborhoods" do
    field :name, :string
    field :type, Ecto.Enum, values: [:district, :condominium], default: :district
    field :geom, Geo.PostGIS.Geometry
  end
end
