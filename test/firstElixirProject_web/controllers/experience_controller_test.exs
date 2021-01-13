defmodule FirstElixirProjectWeb.ExperienceControllerTest do
  use FirstElixirProjectWeb.ConnCase

  alias FirstElixirProject.Document
  alias FirstElixirProject.Document.Experience

  @create_attrs %{
    companyName: "some companyName",
    description: "some description",
    from: ~D[2010-04-17],
    tilllocation: "some tilllocation"
  }
  @update_attrs %{
    companyName: "some updated companyName",
    description: "some updated description",
    from: ~D[2011-05-18],
    tilllocation: "some updated tilllocation"
  }
  @invalid_attrs %{companyName: nil, description: nil, from: nil, tilllocation: nil}

  def fixture(:experience) do
    {:ok, experience} = Document.create_experience(@create_attrs)
    experience
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all experience", %{conn: conn} do
      conn = get(conn, Routes.experience_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create experience" do
    test "renders experience when data is valid", %{conn: conn} do
      conn = post(conn, Routes.experience_path(conn, :create), experience: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.experience_path(conn, :show, id))

      assert %{
               "id" => id,
               "companyName" => "some companyName",
               "description" => "some description",
               "from" => "2010-04-17",
               "tilllocation" => "some tilllocation"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.experience_path(conn, :create), experience: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update experience" do
    setup [:create_experience]

    test "renders experience when data is valid", %{conn: conn, experience: %Experience{id: id} = experience} do
      conn = put(conn, Routes.experience_path(conn, :update, experience), experience: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.experience_path(conn, :show, id))

      assert %{
               "id" => id,
               "companyName" => "some updated companyName",
               "description" => "some updated description",
               "from" => "2011-05-18",
               "tilllocation" => "some updated tilllocation"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, experience: experience} do
      conn = put(conn, Routes.experience_path(conn, :update, experience), experience: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete experience" do
    setup [:create_experience]

    test "deletes chosen experience", %{conn: conn, experience: experience} do
      conn = delete(conn, Routes.experience_path(conn, :delete, experience))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.experience_path(conn, :show, experience))
      end
    end
  end

  defp create_experience(_) do
    experience = fixture(:experience)
    %{experience: experience}
  end
end
