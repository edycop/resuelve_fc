defmodule ResuelveFcWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use ResuelveFcWeb, :controller

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(ResuelveFcWeb.ErrorView)
    |> render(:"404")
  end

  # This clause will handle invalid resource data.
  def call(conn, {:error, %Ecto.Changeset{}}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ResuelveFcWeb.ErrorView)
    |> render(:"422")
  end

  # The clause show a message when a resource couldn't be found
  def call(conn, nil) do
    conn
    |> put_status(:not_found)
    |> render(ResuelveFcWeb.ErrorView, "error.json", message: "The resource couldn't be found!")
  end
end
