defmodule FirstElixirProject.Document.Experience do
  use Ecto.Schema
  import Ecto.Changeset

  schema "experience" do
    field :companyName, :string
    field :description, :string
    field :from, :date
    field :till, :date
    field :location_id, :integer

    timestamps()
  end

  @doc false
  def changeset(experience, attrs) do
    experience
    |> cast(attrs, [:companyName, :description, :location, :from, :till])
    |> validate_required([:companyName, :description, :location, :from, :till])
  end
end
