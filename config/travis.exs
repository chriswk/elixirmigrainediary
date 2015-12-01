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
  username: "postgres",
  database: "mdiary_dev",
  hostname: "localhost",
  pool_size: 10

config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1
