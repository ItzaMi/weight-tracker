# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :weight_tracker,
  ecto_repos: [WeightTracker.Repo]

# Configures the endpoint
config :weight_tracker, WeightTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "O3Jp/SbNia0n7alK4G9siwGrsXttLZvA3p0SO9O47/yw5AiX2LpvbQFjPuDtKbdQ",
  render_errors: [view: WeightTrackerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: WeightTracker.PubSub,
  live_view: [signing_salt: "eOtm24lo"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
