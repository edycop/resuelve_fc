defmodule ResuelveFcWeb.LevelView do
  use ResuelveFcWeb, :view
  alias ResuelveFcWeb.LevelView

  def render("show.json", %{level: level}) do
    %{data: render_one(level, LevelView, "level.json")}
  end

  def render("level.json", %{level: level}) do
    %{
      name: level.name,
      score_month: level.score_month
    }
  end

end
