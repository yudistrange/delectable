defmodule DelectableWeb.PageController do
  use DelectableWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
