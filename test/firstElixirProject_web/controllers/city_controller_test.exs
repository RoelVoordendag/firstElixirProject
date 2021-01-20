defmodule FirstElixirProjectWeb.CityControllerTest do
  use FirstElixirProjectWeb.ConnCase

  alias FirstElixirProject.Document
  alias FirstElixirProject.Document.City

  @create_attrs %{
    image: "some image",
    lat: "120.5",
    lon: "120.5",
    name: "some name"
  }
  @update_attrs %{
    image: "some updated image",
    lat: "456.7",
    lon: "456.7",
    name: "some updated name"
  }
  @invalid_attrs %{image: nil, lat: nil, lon: nil, name: nil}

  def fixture(:city) do
    {:ok, city} = Document.create_city(@create_attrs)
    city
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all city", %{conn: conn} do
      conn = get(conn, Routes.city_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create city" do
    test "renders city when data is valid", %{conn: conn} do
      conn = post(conn, Routes.city_path(conn, :create), city: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.city_path(conn, :show, id))

      assert %{
               "id" => id,
               "image" => "some image",
               "lat" => "120.5",
               "lon" => "120.5",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.city_path(conn, :create), city: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update city" do
    setup [:create_city]

    test "renders city when data is valid", %{conn: conn, city: %City{id: id} = city} do
      conn = put(conn, Routes.city_path(conn, :update, city), city: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.city_path(conn, :show, id))

      assert %{
               "id" => id,
               "image" => "some updated image",
               "lat" => "456.7",
               "lon" => "456.7",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, city: city} do
      conn = put(conn, Routes.city_path(conn, :update, city), city: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete city" do
    setup [:create_city]

    test "deletes chosen city", %{conn: conn, city: city} do
      conn = delete(conn, Routes.city_path(conn, :delete, city))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.city_path(conn, :show, city))
      end
    end
  end

  defp create_city(_) do
    city = fixture(:city)
    %{city: city}
  end
end
