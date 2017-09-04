# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sure_halal,
  ecto_repos: [SureHalal.Repo]

# Configures the endpoint
config :sure_halal, SureHalalWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yQtY0Iuz9QNsc1b0TJxdAzypfNaJQbZQ9lS6N+6Qua/x1qRr6jOGNoDkkQIGlJRp",
  render_errors: [view: SureHalalWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SureHalal.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
