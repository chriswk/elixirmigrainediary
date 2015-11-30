defmodule Migrainediary.Repo.Migrations.AddDeviceNameAndFormFactorToDevices do
  use Ecto.Migration

  def change do
    alter table(:devices) do
      add :device_name, :text
      add :form_factor, :text
      add :is_mobile, :boolean
    end
  end
end
