defmodule FirstElixirProject.Document.Experience do
  use Ecto.Schema
  import Ecto.Changeset

  schema "experience" do
    field :companyName, :string
    field :description, :string
    field :from, :date
    field :tilllocation, :string

    timestamps()
  end

  @doc false
  def changeset(experience, attrs) do
    experience
    |> cast(attrs, [:companyName, :description, :from, :tilllocation])
    |> validate_required([:companyName, :description, :from, :tilllocation])
  end
end
