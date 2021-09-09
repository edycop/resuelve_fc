defmodule ResuelveFc.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :email, :string
      add :active, :boolean
      add :goals, :integer

      add :salary_id, references(:salaries, on_delete: :delete_all)
      add :level_id, references(:levels, on_delete: :delete_all)
      add :team_id, references(:teams, on_delete: :delete_all)

      timestamps()
    end

    create index(:players, [:salary_id])
    create index(:players, [:level_id])
    create index(:players, [:team_id])
  end
end
