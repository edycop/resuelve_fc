defmodule ResuelveFc.Repo.Migrations.CreateLevels do
  use Ecto.Migration

  def change do
    create table(:levels) do
      add :name, :string
      add :score_month, :integer

      timestamps()
    end

  end
end
