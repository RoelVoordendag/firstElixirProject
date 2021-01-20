defmodule FirstElixirProject.Repo.Migrations.CreateExperience do
  use Ecto.Migration

  def change do
    create table(:experience) do
      add :companyName, :string
      add :description, :string
      add :from, :date
      add :till, :date
      add :location_id, :integer

      timestamps()
    end

  end
end
