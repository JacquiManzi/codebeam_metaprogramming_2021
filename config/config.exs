# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :codebeam_2021,
  ecto_repos: [Codebeam2021.Repo]

# Configures the endpoint
config :codebeam_2021, Codebeam2021Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WQmr2nh7mZ3UQ7/FXtzoZHWMur5LNkWgGaL+dnJ69CZDtA8biLk78qJEmiL1jTFI",
  render_errors: [view: Codebeam2021Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Codebeam2021.PubSub,
  live_view: [signing_salt: "39DeWZGo"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
