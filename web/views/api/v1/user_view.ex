defmodule Mdiary.Api.V1.UserView do
  use Mdiary.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Mdiary.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Mdiary.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      email: user.email,
      encrypted_password: user.encrypted_password}
  end
end
