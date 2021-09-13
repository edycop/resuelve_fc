defmodule ResuelveFcWeb.PlayerView do
  use ResuelveFcWeb, :view
  alias ResuelveFcWeb.PlayerView

  def render("index.json", %{players: players}) do
    %{data: render_many(players, PlayerView, "player.json")}
  end

  def render("show.json", %{player: player}) do
    %{data: render_one(player, PlayerView, "player.json")}
  end

  def render("player.json", %{player: player}) do
    player =
      player
      |> ResuelveFc.Repo.preload(:salary)
      |> ResuelveFc.Repo.preload(:level)
      |> ResuelveFc.Repo.preload(:team)

    %{
      name: player.name,
      goals: player.goals
    }
    |> Map.merge(%{
      salary: render_relationship(player.salary, ResuelveFcWeb.SalaryView, "salary.json"),
      level: render_relationship(player.level, ResuelveFcWeb.LevelView, "level.json"),
      team: render_relationship(player.team, ResuelveFcWeb.TeamView, "team.json")
    })
  end

  defp render_relationship(%Ecto.Association.NotLoaded{}, _, _), do: nil

  defp render_relationship(relation, view, template) do
    render_one(relation, view, template)
  end
end
