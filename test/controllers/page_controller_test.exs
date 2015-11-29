defmodule Migrainediary.PageControllerTest do
  use Migrainediary.ConnCase

  test "GET /pages" do
    conn = get conn(), "/pages"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
