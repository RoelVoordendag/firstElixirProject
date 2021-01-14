defmodule FirstElixirProjectWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :firstElixirProject,
    module: FirstElixirProjectWeb.Auth.Guardian,
    error_handler: FirstElixirProjectWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
