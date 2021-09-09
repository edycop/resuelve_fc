defmodule ResuelveFc.Club.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :goals, :integer, default: 0
    field :name, :string
    field :score_month, :integer, default: 0

    has_many :players, ResuelveFc.Personnel.Player

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :goals, :score_month])
    |> validate_required([:name, :goals, :score_month])
    |> unique_constraint(:name)
  end
end
