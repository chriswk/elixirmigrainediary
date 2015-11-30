use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mdiary, Mdiary.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :mdiary, Mdiary.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "mdiary",
  password: "mdiary",
  database: "mdiary_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
