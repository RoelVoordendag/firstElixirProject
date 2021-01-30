defmodule FirstElixirProjectWeb.ExperienceController do
  alias FirstElixirProjectWeb.CityController
  require Logger
  require Map

  use FirstElixirProjectWeb, :controller

  alias FirstElixirProject.Document
  alias FirstElixirProject.Document.Experience

  action_fallback FirstElixirProjectWeb.FallbackController

  def index(conn, _params) do
    experience = Document.list_experience()
    render(conn, "index.json", experience: experience)
  end

  def create(conn, %{"experience" => experience_params}) do
    experience_params =
      Map.put(
        experience_params,
        "location_id",
        CityController.create(experience_params["location"])
      )

    # Insert new item and show id as last
    with {:ok, %Experience{} = experience} <- Document.create_experience(experience_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.experience_path(conn, :show, experience))
      |> render("show.json", experience: experience)
    end
  end

  def show(conn, %{"id" => id}) do
    experience = Document.get_experience!(id)
    render(conn, "show.json", experience: experience)
  end

  def update(conn, %{"id" => id, "experience" => experience_params}) do
    experience = Document.get_experience!(id)

    with {:ok, %Experience{} = experience} <-
           Document.update_experience(experience, experience_params) do
      render(conn, "show.json", experience: experience)
    end
  end

  def delete(conn, %{"id" => id}) do
    experience = Document.get_experience!(id)

    with {:ok, %Experience{}} <- Document.delete_experience(experience) do
      send_resp(conn, :no_content, "")
    end
  end
end
