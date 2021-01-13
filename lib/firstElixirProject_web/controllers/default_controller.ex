defmodule FirstElixirProjectWeb.DefaultController do
  use FirstElixirProjectWeb, :controller

  def index(conn, _params) do
    text(conn, "lmao")
  end
end
