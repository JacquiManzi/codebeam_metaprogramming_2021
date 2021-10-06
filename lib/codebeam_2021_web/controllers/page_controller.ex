defmodule Codebeam2021Web.PageController do
  use Codebeam2021Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def test(conn, _params) do
    render(conn, "test.html")
  end
end
