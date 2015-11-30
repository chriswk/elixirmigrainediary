defmodule Migrainediary.DeviceView do
  use Migrainediary.Web, :view

  def render("index.json", %{devices: devices}) do
    %{data: render_many(devices, Migrainediary.DeviceView, "device.json")}
  end

  def render("show.json", %{device: device}) do
    %{data: render_one(device, Migrainediary.DeviceView, "device.json")}
  end

  def render("device.json", %{device: device}) do
    %{id: device.id,
      device_id: device.device_id}
  end
end
