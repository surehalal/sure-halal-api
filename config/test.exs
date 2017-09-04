use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sure_halal, SureHalalWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :sure_halal, SureHalal.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "root",
  database: "sure_halal_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
