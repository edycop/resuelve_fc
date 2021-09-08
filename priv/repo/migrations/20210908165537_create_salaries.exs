defmodule ResuelveFc.Repo.Migrations.CreateSalaries do
  use Ecto.Migration

  def change do
    create table(:salaries) do
      add :base_salary, :float
      add :full_salary, :float
      add :bonus, :float

      timestamps()
    end

  end
end
