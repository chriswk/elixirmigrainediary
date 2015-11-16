defmodule Migrainediary.MigraineController do
  use Migrainediary.Web, :controller

  alias Migrainediary.Migraine

  plug :scrub_params, "migraine" when action in [:create, :update]

  def index(conn, _params) do
    migraines = Repo.all(Migraine)
    render(conn, "index.json", migraines: migraines)
  end

  def create(conn, %{"migraine" => migraine_params}) do
    changeset = Migraine.changeset(%Migraine{}, migraine_params)

    case Repo.insert(changeset) do
      {:ok, migraine} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", migraine_path(conn, :show, migraine))
        |> render("show.json", migraine: migraine)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Migrainediary.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    migraine = Repo.get!(Migraine, id)
    render(conn, "show.json", migraine: migraine)
  end

  def update(conn, %{"id" => id, "migraine" => migraine_params}) do
    migraine = Repo.get!(Migraine, id)
    changeset = Migraine.changeset(migraine, migraine_params)

    case Repo.update(changeset) do
      {:ok, migraine} ->
        render(conn, "show.json", migraine: migraine)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Migrainediary.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    migraine = Repo.get!(Migraine, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(migraine)

    send_resp(conn, :no_content, "")
  end
end
