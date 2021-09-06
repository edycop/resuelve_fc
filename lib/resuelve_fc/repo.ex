defmodule ResuelveFc.Repo do
  use Ecto.Repo,
    otp_app: :resuelve_fc,
    adapter: Ecto.Adapters.Postgres
end
