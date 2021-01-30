defmodule FirstElixirProjectWeb.CityController do
  require Logger
  require String.Chars
  require HTTPoison
  require System
  require Poison

  use FirstElixirProjectWeb, :controller

  alias FirstElixirProject.Document
  alias FirstElixirProject.Document.City

  action_fallback FirstElixirProjectWeb.FallbackController

  def index(conn, _params) do
    city = Document.list_city()
    render(conn, "index.json", city: city)
  end

  def getImageSplashUrl(queryTerm) do
    Logger.info("SEARCH TERM #{queryTerm}")

    case HTTPoison.get(
           "https://api.unsplash.com/search/photos/?client_id=#{
             System.get_env("CLIENT_ID_UNSPLASh")
           }query=#{queryTerm}"
         ) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Poison.decode!(body)

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        false

      {:error, %HTTPoison.Error{reason: reason}} ->
        exit(reason)
    end

    # case HTTPoison.get(url) do
    #   {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
    #     IO.puts(body)

    #   {:ok, %HTTPoison.Response{status_code: 404}} ->
    #     IO.puts("Not found :(")

    #   {:error, %HTTPoison.Error{reason: reason}} ->
    #     IO.inspect(reason)
    # end
  end

  #  RETURN TRUE HERE AND MAKE CITY
  def create(location) do
    hd(getImageSplashUrl(location)["results"])["urls"]["regular"]

    # if false, do: 1, else: 2

    # Process.exit()

    # with {:ok, %City{} = city} <- Document.create_city(city_params) do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", Routes.city_path(conn, :show, city))
    #   |> render("show.json", city: city)
    # end
  end

  def show(conn, %{"id" => id}) do
    city = Document.get_city!(id)
    render(conn, "show.json", city: city)
  end

  def update(conn, %{"id" => id, "city" => city_params}) do
    city = Document.get_city!(id)

    with {:ok, %City{} = city} <- Document.update_city(city, city_params) do
      render(conn, "show.json", city: city)
    end
  end

  def delete(conn, %{"id" => id}) do
    city = Document.get_city!(id)

    with {:ok, %City{}} <- Document.delete_city(city) do
      send_resp(conn, :no_content, "")
    end
  end
end
