
alias ResuelveFc.Personnel.Level
alias ResuelveFc.Personnel.Salary
# alias ResuelveFc.Personnel.Player
alias ResuelveFc.Club.Team

ResuelveFc.Repo.delete_all(Level)
ResuelveFc.Repo.delete_all(Salary)
ResuelveFc.Repo.delete_all(Team)

if Mix.env() == :dev do
  ResuelveFc.Repo.insert!(%Team{
    goals: 10,
    name: Faker.Team.name,
    score_month: 0
  })

  levels = [{"A", 5}, {"B", 10}, {"C", 15}, {"Cuauh", 20}]

  Enum.each(levels, fn {name, score} ->
    ResuelveFc.Repo.insert!(%Level{
      name: name,
      score_month: score
    })
  end)

  ResuelveFc.Repo.insert!(%Salary{
    base_salary: 100.0,
    bonus: 50.0
  })

  # ResuelveFc.Repo.insert!(%Player{
  #   goals: 10,
  #   name: Faker.Person.name,
  #   email: Faker.Internet.email,
  #   active: true
  #   level: %User{name: "John Doe"}
  # }
end
