defmodule ResuelveFc.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :goals, :integer
      add :score_month, :integer

      timestamps()
    end

    create unique_index(:teams, [:name])

  end
end
