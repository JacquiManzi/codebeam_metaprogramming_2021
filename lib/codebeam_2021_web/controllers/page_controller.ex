defmodule Codebeam2021Web.PageController do
  use Codebeam2021Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def user(conn, _params) do
    render(conn, "user.html")
  end

  def admin_user(conn, _params) do
    render(conn, "admin_user.html")
  end
end
