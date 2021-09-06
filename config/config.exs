# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :resuelve_fc,
  ecto_repos: [ResuelveFc.Repo]

# Configures the endpoint
config :resuelve_fc, ResuelveFcWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kVmCWcC/Koh2efDU2SVS6bBcOtBh12+CGaZ55hMpWXQUulkJGsUv1P57av/mYYqT",
  render_errors: [view: ResuelveFcWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ResuelveFc.PubSub,
  live_view: [signing_salt: "WlDeOdpg"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
