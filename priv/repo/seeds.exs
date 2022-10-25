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
alias GisTutorial.Locations
alias GisTutorial.Locations.{Place, Neighborhood}

Repo.insert!(%Place{
  name: "Hospital e Maternidade Mogi Mater",
  geom: %Geo.Point{coordinates: {-46.18896930975203, -23.52537944891618}, srid: 4326}
})

Repo.insert!(%Place{
  name: "Hospital Nossa Senhora Aparecida",
  geom: %Geo.Point{coordinates: {-46.186970608490526, -23.521726278775407}, srid: 4326}
})

Repo.insert!(%Neighborhood{
  name: "Vila Mogi Moderno",
  type: :district,
  geom: %Geo.MultiPolygon{
    coordinates: [
      [
        [
          {-46.183978127913214, -23.544782106648096},
          {-46.183623545839474, -23.543072507804673},
          {-46.181679910739845, -23.539147569965206},
          {-46.18355788247104, -23.537293417487263},
          {-46.18723502998777, -23.53206793807952},
          {-46.18887661366245, -23.53023776721763},
          {-46.19352557873821, -23.533320145592874},
          {-46.19388016081163, -23.53546331925704},
          {-46.19319726199222, -23.53760645802743},
          {-46.18609248776149, -23.542687242970576},
          {-46.183978127913214, -23.544782106648096}
        ]
      ]
    ],
    srid: 4326
  }
})

Repo.insert!(%Neighborhood{
  name: "Vila Bela Vista",
  type: :district,
  geom: %Geo.MultiPolygon{
    coordinates: [
      [
        [
          {-46.191570944297915, -23.52501088144549},
          {-46.19154206469411, -23.52700954816919},
          {-46.190340435064186, -23.52874084340199},
          {-46.18818393906651, -23.528494922177977},
          {-46.18610254491952, -23.52848508531946},
          {-46.18659607136674, -23.527550580407027},
          {-46.1872398015153, -23.52702922215094},
          {-46.18768196282689, -23.526149723910848},
          {-46.18831209905115, -23.525585095526974},
          {-46.188440990571124, -23.525138643440496},
          {-46.18874260678294, -23.524475035235902},
          {-46.18976945510222, -23.524328260360896},
          {-46.19166697706859, -23.524546632676216},
          {-46.191570944297915, -23.52501088144549}
        ]
      ]
    ],
    srid: 4326
  }
})
