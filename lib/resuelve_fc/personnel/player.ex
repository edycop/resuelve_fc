defmodule ResuelveFc.Personnel.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :goals, :integer
    field :name, :string
    field :email, :string
    field :active, :boolean

    belongs_to :level, ResuelveFc.Personnel.Level
    belongs_to :team, ResuelveFc.Club.Team
    belongs_to :salary, ResuelveFc.Personnel.Salary

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :goals, :active, :email, :level_id, :team_id, :salary_id])
    |> validate_required([:name, :goals, :active, :email])
    |> unique_constraint(:email)
  end
end
