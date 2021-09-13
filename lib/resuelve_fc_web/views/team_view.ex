defmodule ResuelveFcWeb.TeamView do
  use ResuelveFcWeb, :view
  alias ResuelveFcWeb.TeamView

  def render("show.json", %{team: team}) do
    %{data: render_one(team, TeamView, "team.json")}
  end

  def render("team.json", %{team: team}) do
    %{
      name: team.name
    }
  end

end
