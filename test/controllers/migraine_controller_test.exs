defmodule Migrainediary.MigraineControllerTest do
  use Migrainediary.ConnCase

  alias Migrainediary.Migraine
  @valid_attrs %{latitude: "120.5", longitude: "120.5", occurrenceday: "2010-04-17", userid: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, migraine_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    migraine = Repo.insert! %Migraine{}
    conn = get conn, migraine_path(conn, :show, migraine)
    assert json_response(conn, 200)["data"] == %{"id" => migraine.id,
      "occurrenceday" => migraine.occurrenceday,
      "latitude" => migraine.latitude,
      "longitude" => migraine.longitude,
      "userid" => migraine.userid}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, migraine_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, migraine_path(conn, :create), migraine: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Migraine, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, migraine_path(conn, :create), migraine: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    migraine = Repo.insert! %Migraine{}
    conn = put conn, migraine_path(conn, :update, migraine), migraine: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Migraine, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    migraine = Repo.insert! %Migraine{}
    conn = put conn, migraine_path(conn, :update, migraine), migraine: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    migraine = Repo.insert! %Migraine{}
    conn = delete conn, migraine_path(conn, :delete, migraine)
    assert response(conn, 204)
    refute Repo.get(Migraine, migraine.id)
  end
end
