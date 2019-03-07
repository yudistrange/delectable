defmodule DelectableWeb.PageController do
  use DelectableWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def random(conn, _params) do
    send_resp(conn, 200, Poison.encode!(%{val: :random.uniform()}))
  end
end
