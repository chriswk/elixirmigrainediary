defmodule Mdiary.Api.V1.UserController do
  use Mdiary.Web, :controller

  alias Mdiary.User
  alias Mdiary.SessionController

  plug Guardian.Plug.EnsureAuthenticated, on_failure: { SessionController, :unauthenticated_api }
  plug Guardian.Plug.EnsurePermissions, on_failure: { SessionController, :unauthenticated_api }, default: [:write_profile]

  plug :scrub_params, "user" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", user_path(conn, :show, user))
        |> render("show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Mdiary.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def edit(conn, params) do
    user = Guardian.Plug.current_resource(conn)
    changeset = User.update_changeset(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user, user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        render(conn, "show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Mdiary.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user)

    send_resp(conn, :no_content, "")
  end
end
