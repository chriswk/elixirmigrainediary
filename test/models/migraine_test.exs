defmodule Migrainediary.MigraineTest do
  use Migrainediary.ModelCase

  alias Migrainediary.Migraine

  @valid_attrs %{latitude: "120.5", longitude: "120.5", occurrenceday: "2010-04-17", userid: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Migraine.changeset(%Migraine{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Migraine.changeset(%Migraine{}, @invalid_attrs)
    refute changeset.valid?
  end
end
