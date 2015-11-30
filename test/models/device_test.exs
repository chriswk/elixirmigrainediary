defmodule Mdiary.DeviceTest do
  use Mdiary.ModelCase

  alias Mdiary.Device

  @valid_attrs %{device_id: "some content", device_name: "some content", form_factor: "some content", is_mobile: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Device.changeset(%Device{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Device.changeset(%Device{}, @invalid_attrs)
    refute changeset.valid?
  end
end
