defmodule Mdiary.SessionView do
  use Mdiary.Web, :view

  def render("new.json", assigns) do
    Pison.encode!(assigns.users)
  end
end
