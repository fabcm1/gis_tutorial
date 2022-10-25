defmodule GisTutorial.Repo.Migrations.Neighborhoods do
  use Ecto.Migration

  def up do
    create table(:neighborhoods) do
      add :name, :string
      add :type, :string
    end

    create table(:places) do
      add :name, :string
    end

    execute("SELECT AddGeometryColumn ('neighborhoods','geom',4326,'MULTIPOLYGON',2);")
    execute("CREATE INDEX neighborhoods_geom_idx ON neighborhoods USING GIST (geom);")

    execute("SELECT AddGeometryColumn ('places','geom',4326,'POINT',2);")
    execute("CREATE INDEX places_geom_idx ON places USING GIST (geom);")
  end

  def down do
    drop table(:neighborhoods)
    drop table(:places)
  end
end
