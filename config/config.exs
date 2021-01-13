# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :firstElixirProject,
  ecto_repos: [FirstElixirProject.Repo]

# Configures the endpoint
config :firstElixirProject, FirstElixirProjectWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KShaBvQjgG32bm5qNBtHRQ9oPoYmV1pw9G0G7smIz2jPT8hYZzt2g6/j3udfALod",
  render_errors: [view: FirstElixirProjectWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: FirstElixirProject.PubSub,
  live_view: [signing_salt: "TFWvL0Ve"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :firstElixirProject, FirstElixirProjectWeb.Auth.Guardian,
  issuer: "FirstElixirProject",
  secret_key: "OGwU+/26eu5Cy2ail6SKaSuntnY+dUImIbXD8VvVYglSe1RYnzx/v8I9IDOPEilJ"
