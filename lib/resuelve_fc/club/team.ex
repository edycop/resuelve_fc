defmodule ResuelveFc.Club.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :goals, :integer
    field :name, :string
    field :score_month, :integer

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :goals, :score_month])
    |> validate_required([:name, :goals, :score_month])
  end
end
