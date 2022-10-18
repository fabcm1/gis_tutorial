defmodule GisTutorial.Repo.Migrations.Points do
  use Ecto.Migration

  def change do
    create table(:points) do
      add :name, :string
      add :geom, :geometry
    end
  end
end
