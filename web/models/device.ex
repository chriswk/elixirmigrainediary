defmodule Migrainediary.Device do
  use Migrainediary.Web, :model

  schema "devices" do
    field :device_id, :string

    timestamps
  end

  @required_fields ~w(device_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
