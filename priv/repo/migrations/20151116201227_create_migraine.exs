defmodule Migrainediary.Repo.Migrations.CreateMigraine do
  use Ecto.Migration

  def change do
    create table(:migraines) do
      add :occurrenceday, :date
      add :latitude, :float
      add :longitude, :float
      add :userid, :string

      timestamps
    end

  end
end
