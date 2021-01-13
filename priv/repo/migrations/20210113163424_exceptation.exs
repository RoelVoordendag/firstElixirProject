defmodule FirstElixirProject.Repo.Migrations.Exceptation do
  use Ecto.Migration

  def change do
    rename table(:experience), :tilllocation, to: :location
  end
end
