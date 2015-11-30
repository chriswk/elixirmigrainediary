defmodule Mdiary.GuardianHooks do
  use Guardian.Hooks

  def before_encode_and_sign(resource, type, claims) do
    IO.puts("Going to Mint: #{inspect(resource)} WITH TYPE #{inspect(type)} AND CLAIMS #{inspect(claims)}")
    { :ok, { resource, type, claims }}
  end

  def after_sign_in(conn, location) do
    user = Guardian.Plug.current_resource(conn, location)
    IO.puts("Signed into location with #{user.email}")
  end

  def before_sign_out(conn, nil), do: before_sign_out(conn, :default)

  def before_sign_out(conn, :all) do
    IO.puts("Signing out ALL THE PEOPLE")
    conn
  end

  def before_sign_out(conn, location) do
    user = Guardian.Plug.current_resource(conn, location)
    IO.puts("Signing out: #{user.email}")
    conn
  end
end
