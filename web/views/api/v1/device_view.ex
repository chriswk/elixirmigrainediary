defmodule Mdiary.Api.V1.DeviceView do
  use Mdiary.Web, :view

  def render("index.json", %{devices: devices}) do
    %{data: render_many(devices, Mdiary.DeviceView, "device.json")}
  end

  def render("show.json", %{device: device}) do
    %{data: render_one(device, Mdiary.DeviceView, "device.json")}
  end

  def render("device.json", %{device: device}) do
    %{id: device.id,
      device_id: device.device_id,
      device_name: device.device_name,
      form_factor: device.form_factor,
      is_mobile: device.is_mobile}
  end
end
