defmodule Migrainediary.MigraineView do
  use Migrainediary.Web, :view

  def render("index.json", %{migraines: migraines}) do
    %{data: render_many(migraines, Migrainediary.MigraineView, "migraine.json")}
  end

  def render("show.json", %{migraine: migraine}) do
    %{data: render_one(migraine, Migrainediary.MigraineView, "migraine.json")}
  end

  def render("migraine.json", %{migraine: migraine}) do
    %{id: migraine.id,
      occurrenceday: migraine.occurrenceday,
      latitude: migraine.latitude,
      longitude: migraine.longitude,
      userid: migraine.userid}
  end
end
