defmodule GisTutorial.Repo do
  use Ecto.Repo,
    otp_app: :gis_tutorial,
    adapter: Ecto.Adapters.Postgres
end
