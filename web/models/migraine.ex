defmodule Mdiary.Migraine do
  use Mdiary.Web, :model

  schema "migraines" do
    field :occurrence_day, Ecto.Date
    field :latitude, :float
    field :longitude, :float

    timestamps
  end

  @required_fields ~w(occurrence_day latitude longitude)
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
