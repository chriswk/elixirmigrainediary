defmodule Migrainediary.Repo.Migrations.CreateDevice do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :device_id, :string

      timestamps
    end

  end
end
