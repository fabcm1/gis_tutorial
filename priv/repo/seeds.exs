# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GisTutorial.Repo.insert!(%GisTutorial.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GisTutorial.Repo
alias GisTutorial.Locations.Point

p1 = %Point{name: "A", geom: %Geo.Point{coordinates: {30, -60}, srid: 4326}}
p2 = %Point{name: "B", geom: %Geo.Point{coordinates: {30, 60}, srid: 4326}}
p3 = %Point{name: "C", geom: %Geo.Point{coordinates: {-30, 0}, srid: 4326}}
Repo.insert!(p1)
Repo.insert!(p2)
Repo.insert!(p3)

o = %Point{name: "O", geom: %Geo.Point{coordinates: {0, 0}, srid: 4326}}

alias GisTutorial.Locations

Locations.distances(o)

# ** (FunctionClauseError) no function clause matching in GisTutorial.PostgresTypes."-inlined-Elixir.Geo.PostGIS.Extension/1-"/1

#     The following arguments were given to GisTutorial.PostgresTypes."-inlined-Elixir.Geo.PostGIS.Extension/1-"/1:

#         # 1
#         %GisTutorial.Locations.Point{__meta__: #Ecto.Schema.Metadata<:built, "points">, id: nil, name: "O", geom: %Geo.Point{coordinates: {0, 0}, srid: 4326, properties: %{}}}

#     (gis_tutorial 0.1.0) GisTutorial.PostgresTypes."-inlined-Elixir.Geo.PostGIS.Extension/1-"/1
#     (gis_tutorial 0.1.0) deps/postgrex/lib/postgrex/type_module.ex:947: GisTutorial.PostgresTypes.encode_params/3
#     (postgrex 0.16.5) lib/postgrex/query.ex:75: DBConnection.Query.Postgrex.Query.encode/3
#     (db_connection 2.4.2) lib/db_connection.ex:1255: DBConnection.encode/5
#     (db_connection 2.4.2) lib/db_connection.ex:1355: DBConnection.run_prepare_execute/5
#     (db_connection 2.4.2) lib/db_connection.ex:1459: DBConnection.run/6
#     (db_connection 2.4.2) lib/db_connection.ex:595: DBConnection.parsed_prepare_execute/5
#     (db_connection 2.4.2) lib/db_connection.ex:587: DBConnection.prepare_execute/4
#     (ecto_sql 3.9.0) lib/ecto/adapters/postgres/connection.ex:70: Ecto.Adapters.Postgres.Connection.prepare_execute/5
#     (ecto_sql 3.9.0) lib/ecto/adapters/sql.ex:828: Ecto.Adapters.SQL.execute!/5
#     (ecto_sql 3.9.0) lib/ecto/adapters/sql.ex:820: Ecto.Adapters.SQL.execute/6
#     (ecto 3.9.1) lib/ecto/repo/queryable.ex:229: Ecto.Repo.Queryable.execute/4
#     (ecto 3.9.1) lib/ecto/repo/queryable.ex:19: Ecto.Repo.Queryable.all/3
#     (ecto 3.9.1) lib/ecto/repo/queryable.ex:151: Ecto.Repo.Queryable.one/3
#     (elixir 1.14.0) lib/code.ex:1245: Code.require_file/2
