defmodule Mdiary.Api.V1.DeviceController do
  use Mdiary.Web, :controller

  alias Mdiary.Device

  plug :scrub_params, "device" when action in [:create, :update]

  def index(conn, _params) do
    devices = Repo.all(Device)
    render(conn, "index.json", devices: devices)
  end

  def create(conn, %{"device" => device_params}) do
    changeset = Device.changeset(%Device{}, device_params)

    case Repo.insert(changeset) do
      {:ok, device} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", device_path(conn, :show, device))
        |> render("show.json", device: device)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Mdiary.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    device = Repo.get!(Device, id)
    render(conn, "show.json", device: device)
  end

  def update(conn, %{"id" => id, "device" => device_params}) do
    device = Repo.get!(Device, id)
    changeset = Device.changeset(device, device_params)

    case Repo.update(changeset) do
      {:ok, device} ->
        render(conn, "show.json", device: device)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Mdiary.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    device = Repo.get!(Device, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(device)

    send_resp(conn, :no_content, "")
  end
end
