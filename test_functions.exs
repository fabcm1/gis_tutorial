alias GisTutorial.Repo
alias GisTutorial.Locations.Place
alias GisTutorial.Locations

[h1, h2] = Repo.all(Place)

IO.inspect(Locations.find_neighborhoods(h1))

IO.inspect(Locations.find_neighborhoods(h2))
