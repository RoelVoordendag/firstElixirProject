defmodule FirstElixirProject.Repo.Migrations.AlterTilllocationLocation do
  use Ecto.Migration

  def change do
    alter table(:experience) do
      add :till, :date
    end
  end
end
