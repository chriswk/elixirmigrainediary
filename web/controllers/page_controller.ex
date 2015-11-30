defmodule Mdiary.PageController do
  use Mdiary.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
