defmodule ResuelveFcWeb.PageController do
  use ResuelveFcWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
