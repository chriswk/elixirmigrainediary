defmodule Migrainediary.UserTest do
  use Migrainediary.ModelCase

  alias Migrainediary.User

  @valid_attrs %{password: "password", password_confirmation: "password", username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    IO.puts changeset.errors
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
