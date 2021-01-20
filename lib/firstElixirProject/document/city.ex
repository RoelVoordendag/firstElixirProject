defmodule FirstElixirProject.Document.City do
  use Ecto.Schema
  import Ecto.Changeset

  schema "city" do
    field :image, :string
    field :lat, :decimal
    field :lon, :decimal
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:name, :image, :lat, :lon])
    |> validate_required([:name, :image, :lat, :lon])
  end
end
