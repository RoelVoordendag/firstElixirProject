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
    |> cast(attrs, [:companyName, :description, :from, :till, :location_id])
    |> validate_required([:companyName, :description, :from, :till, :location_id])
  end
end
