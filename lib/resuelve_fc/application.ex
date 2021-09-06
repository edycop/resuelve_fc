defmodule ResuelveFc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ResuelveFc.Repo,
      # Start the Telemetry supervisor
      ResuelveFcWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ResuelveFc.PubSub},
      # Start the Endpoint (http/https)
      ResuelveFcWeb.Endpoint
      # Start a worker by calling: ResuelveFc.Worker.start_link(arg)
      # {ResuelveFc.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ResuelveFc.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ResuelveFcWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
