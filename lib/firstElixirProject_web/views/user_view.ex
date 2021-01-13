defmodule FirstElixirProjectWeb.UserView do
  use FirstElixirProjectWeb, :view

  def render("user.json", %{user: user, token: token}) do
    %{
      email: user.email,
      token: token
    }
  end
end
