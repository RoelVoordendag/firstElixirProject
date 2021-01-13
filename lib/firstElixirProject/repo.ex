defmodule FirstElixirProject.Repo do
  use Ecto.Repo,
    otp_app: :firstElixirProject,
    adapter: Ecto.Adapters.Postgres
end
