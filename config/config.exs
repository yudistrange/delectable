# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :delectable,
  ecto_repos: [Delectable.Repo]

# Configures the endpoint
config :delectable, DelectableWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+To9OPpjkqX4tQ1LS8FT0FKAPRb13RB3ZKbj2y6K80okR/6VWo/eK6GnLHWMl12s",
  render_errors: [view: DelectableWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Delectable.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
