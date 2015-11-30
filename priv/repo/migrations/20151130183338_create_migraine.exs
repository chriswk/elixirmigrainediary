defmodule Mdiary.Repo.Migrations.CreateMigraine do
  use Ecto.Migration

  def change do
    create table(:migraines) do
      add :occurrence_day, :date
      add :latitude, :float
      add :longitude, :float

      timestamps
    end

  end
end
