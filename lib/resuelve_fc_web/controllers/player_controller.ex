defmodule ResuelveFcWeb.PlayerController do
  use ResuelveFcWeb, :controller

  alias ResuelveFc.Personnel
  alias ResuelveFc.Personnel.Player

  action_fallback ResuelveFcWeb.FallbackController

  def index(conn, _params) do
    players = Personnel.list_players()
    render(conn, "index.json", players: players)
  end

  def create(conn, %{"player" => player_params}) do
    # with {:ok, %Player{} = player} <- Personnel.create_player(player_params) do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", Routes.player_path(conn, :show, player))
    #   |> render("show.json", player: player)
    # end

    case Personnel.create_player(player_params) do
      {:ok, %Player{} = player} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.player_path(conn, :show, player))
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
