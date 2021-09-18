defmodule ResuelveFcWeb.PlayerController do
  use ResuelveFcWeb, :controller

  alias ResuelveFc.Personnel
  alias ResuelveFc.Club
  alias ResuelveFc.Personnel.Player

  action_fallback ResuelveFcWeb.FallbackController

  def index(conn, _params) do
    players = Personnel.list_players()
    render(conn, "index.json", players: players)
  end

  def add(conn, %{"players" => params}) do
    Enum.each(params, fn player_info ->
      %{
        "name" => name,
        "level" => level,
        "goals" => goals,
        "base_salary" => base_salary,
        "bonus" => bonus,
        "full_salary" => _full_salary,
        "team" => team_name
      } = player_info

      level = Personnel.get_level_by_name(level)
      team = Club.get_team_by_name(team_name)
      salary = Personnel.get_salary_by_atrs(base_salary, bonus)

      {n_goals, _} = Integer.parse(goals)
      {n_bonus, _} = Integer.parse(bonus)

      full_salary =
        n_bonus *
          ((n_goals / level.score_month +
              (team.goals + n_goals) / (team.score_month + level.score_month)) / 2.0)

      ## update salary
      Personnel.update_salary(salary, %{full_salary: full_salary})

      ## update team goals
      Club.update_team(team, %{
        goals: team.goals + n_goals,
        score_month: team.score_month + level.score_month
      })

      create_struct = %{
        "player" => %{
          "active" => "true",
          "email" => "noemail@gmail.com",
          "goals" => goals,
          "level_id" => level.id,
          "name" => name,
          "salary_id" => salary.id,
          "team_id" => team.id
        }
      }

      create(conn, create_struct)
    end)

    render(conn, "error.json", message: "players adding ...")
  end

  def create(conn, %{"player" => player_params}) do
    case Personnel.create_player(player_params) do
      {:ok, %Player{} = player} ->
        conn
        |> put_status(:created)
        # |> put_resp_header("location", Routes.player_path(conn, :show, player))
        |> render("show.json", player: player)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ResuelveFcWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    player = Personnel.get_player!(id)
    render(conn, "show.json", player: player)
  end

  def update(conn, %{"id" => id, "player" => player_params}) do
    player = Personnel.get_player!(id)

    case Personnel.update_player(player, player_params) do
      {:ok, %Player{} = player} ->
        conn
        |> render("show.json", player: player)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ResuelveFcWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    player = Personnel.get_player!(id)

    with {:ok, %Player{}} <- Personnel.delete_player(player) do
      send_resp(conn, :no_content, "")
    end
  end
end
