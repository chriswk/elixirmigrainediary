defmodule Mdiary.Repo.Migrations.CreateDevice do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :device_id, :string
      add :device_name, :string
      add :form_factor, :text
      add :is_mobile, :boolean, default: false

      timestamps
    end

  end
end
