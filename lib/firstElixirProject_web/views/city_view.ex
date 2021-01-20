defmodule FirstElixirProjectWeb.CityView do
  use FirstElixirProjectWeb, :view
  alias FirstElixirProjectWeb.CityView

  def render("index.json", %{city: city}) do
    %{data: render_many(city, CityView, "city.json")}
  end

  def render("show.json", %{city: city}) do
    %{data: render_one(city, CityView, "city.json")}
  end

  def render("city.json", %{city: city}) do
    %{id: city.id,
      name: city.name,
      image: city.image,
      lat: city.lat,
      lon: city.lon}
  end
end
