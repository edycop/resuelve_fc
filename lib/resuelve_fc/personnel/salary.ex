defmodule ResuelveFc.Personnel.Salary do
  use Ecto.Schema
  import Ecto.Changeset

  schema "salaries" do
    field :base_salary, :float
    field :bonus, :float
    field :full_salary, :float

    timestamps()
  end

  @doc false
  def changeset(salary, attrs) do
    salary
    |> cast(attrs, [:base_salary, :full_salary, :bonus])
    |> validate_required([:base_salary, :full_salary, :bonus])
  end
end
