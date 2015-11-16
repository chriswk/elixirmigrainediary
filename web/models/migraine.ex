defmodule Migrainediary.Migraine do
  use Migrainediary.Web, :model

  schema "migraines" do
    field :occurrenceday, Ecto.Date
    field :latitude, :float
    field :longitude, :float
    field :userid, :string

    timestamps
  end

  @required_fields ~w(occurrenceday latitude longitude userid)
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
