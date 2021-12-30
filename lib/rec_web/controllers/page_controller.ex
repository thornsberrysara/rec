defmodule RecWeb.PageController do
  use RecWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
