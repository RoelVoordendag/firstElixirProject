defmodule FirstElixirProject.Document do
  @moduledoc """
  The Document context.
  """

  import Ecto.Query, warn: false
  alias FirstElixirProject.Repo

  alias FirstElixirProject.Document.Experience

  @doc """
  Returns the list of experience.

  ## Examples

      iex> list_experience()
      [%Experience{}, ...]

  """
  def list_experience do
    Repo.all(Experience)
  end

  @doc """
  Gets a single experience.

  Raises `Ecto.NoResultsError` if the Experience does not exist.

  ## Examples

      iex> get_experience!(123)
      %Experience{}

      iex> get_experience!(456)
      ** (Ecto.NoResultsError)

  """
  def get_experience!(id), do: Repo.get!(Experience, id)

  @doc """
  Creates a experience.

  ## Examples

      iex> create_experience(%{field: value})
      {:ok, %Experience{}}

      iex> create_experience(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_experience(attrs \\ %{}) do
    %Experience{}
    |> Experience.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a experience.

  ## Examples

      iex> update_experience(experience, %{field: new_value})
      {:ok, %Experience{}}

      iex> update_experience(experience, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_experience(%Experience{} = experience, attrs) do
    experience
    |> Experience.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a experience.

  ## Examples

      iex> delete_experience(experience)
      {:ok, %Experience{}}

      iex> delete_experience(experience)
      {:error, %Ecto.Changeset{}}

  """
  def delete_experience(%Experience{} = experience) do
    Repo.delete(experience)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking experience changes.

  ## Examples

      iex> change_experience(experience)
      %Ecto.Changeset{data: %Experience{}}

  """
  def change_experience(%Experience{} = experience, attrs \\ %{}) do
    Experience.changeset(experience, attrs)
  end
end
