defmodule ResuelveFc.Personnel.Level do
  use Ecto.Schema
  import Ecto.Changeset

  schema "levels" do
    field :name, :string
    field :score_month, :integer, default: 0

    has_many :players, ResuelveFc.Personnel.Player

    timestamps()
  end

  @doc false
  def changeset(level, attrs) do
    level
    |> cast(attrs, [:name, :score_month])
    |> validate_required([:name, :score_month])
    |> unique_constraint(:name)
  end
end
