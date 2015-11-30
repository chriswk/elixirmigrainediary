defmodule Mdiary.Api.V1.MigraineView do
  use Mdiary.Web, :view

  def render("index.json", %{migraines: migraines}) do
    %{data: render_many(migraines, Mdiary.MigraineView, "migraine.json")}
  end

  def render("show.json", %{migraine: migraine}) do
    %{data: render_one(migraine, Mdiary.MigraineView, "migraine.json")}
  end

  def render("migraine.json", %{migraine: migraine}) do
    %{id: migraine.id,
      occurrence_day: migraine.occurrence_day,
      latitude: migraine.latitude,
      longitude: migraine.longitude}
  end
end
