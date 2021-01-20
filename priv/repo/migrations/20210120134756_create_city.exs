defmodule FirstElixirProject.Repo.Migrations.CreateCity do
  use Ecto.Migration

  def change do
    create table(:city) do
      add :name, :string
      add :image, :string
      add :lat, :decimal
      add :lon, :decimal

      timestamps()
    end

  end
end
