defmodule FirstElixirProject.DocumentTest do
  use FirstElixirProject.DataCase

  alias FirstElixirProject.Document

  describe "experience" do
    alias FirstElixirProject.Document.Experience

    @valid_attrs %{companyName: "some companyName", description: "some description", from: ~D[2010-04-17], tilllocation: "some tilllocation"}
    @update_attrs %{companyName: "some updated companyName", description: "some updated description", from: ~D[2011-05-18], tilllocation: "some updated tilllocation"}
    @invalid_attrs %{companyName: nil, description: nil, from: nil, tilllocation: nil}

    def experience_fixture(attrs \\ %{}) do
      {:ok, experience} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Document.create_experience()

      experience
    end

    test "list_experience/0 returns all experience" do
      experience = experience_fixture()
      assert Document.list_experience() == [experience]
    end

    test "get_experience!/1 returns the experience with given id" do
      experience = experience_fixture()
      assert Document.get_experience!(experience.id) == experience
    end

    test "create_experience/1 with valid data creates a experience" do
      assert {:ok, %Experience{} = experience} = Document.create_experience(@valid_attrs)
      assert experience.companyName == "some companyName"
      assert experience.description == "some description"
      assert experience.from == ~D[2010-04-17]
      assert experience.tilllocation == "some tilllocation"
    end

    test "create_experience/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Document.create_experience(@invalid_attrs)
    end

    test "update_experience/2 with valid data updates the experience" do
      experience = experience_fixture()
      assert {:ok, %Experience{} = experience} = Document.update_experience(experience, @update_attrs)
      assert experience.companyName == "some updated companyName"
      assert experience.description == "some updated description"
      assert experience.from == ~D[2011-05-18]
      assert experience.tilllocation == "some updated tilllocation"
    end

    test "update_experience/2 with invalid data returns error changeset" do
      experience = experience_fixture()
      assert {:error, %Ecto.Changeset{}} = Document.update_experience(experience, @invalid_attrs)
      assert experience == Document.get_experience!(experience.id)
    end

    test "delete_experience/1 deletes the experience" do
      experience = experience_fixture()
      assert {:ok, %Experience{}} = Document.delete_experience(experience)
      assert_raise Ecto.NoResultsError, fn -> Document.get_experience!(experience.id) end
    end

    test "change_experience/1 returns a experience changeset" do
      experience = experience_fixture()
      assert %Ecto.Changeset{} = Document.change_experience(experience)
    end
  end

  describe "city" do
    alias FirstElixirProject.Document.City

    @valid_attrs %{image: "some image", lat: "120.5", lon: "120.5", name: "some name"}
    @update_attrs %{image: "some updated image", lat: "456.7", lon: "456.7", name: "some updated name"}
    @invalid_attrs %{image: nil, lat: nil, lon: nil, name: nil}

    def city_fixture(attrs \\ %{}) do
      {:ok, city} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Document.create_city()

      city
    end

    test "list_city/0 returns all city" do
      city = city_fixture()
      assert Document.list_city() == [city]
    end

    test "get_city!/1 returns the city with given id" do
      city = city_fixture()
      assert Document.get_city!(city.id) == city
    end

    test "create_city/1 with valid data creates a city" do
      assert {:ok, %City{} = city} = Document.create_city(@valid_attrs)
      assert city.image == "some image"
      assert city.lat == Decimal.new("120.5")
      assert city.lon == Decimal.new("120.5")
      assert city.name == "some name"
    end

    test "create_city/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Document.create_city(@invalid_attrs)
    end

    test "update_city/2 with valid data updates the city" do
      city = city_fixture()
      assert {:ok, %City{} = city} = Document.update_city(city, @update_attrs)
      assert city.image == "some updated image"
      assert city.lat == Decimal.new("456.7")
      assert city.lon == Decimal.new("456.7")
      assert city.name == "some updated name"
    end

    test "update_city/2 with invalid data returns error changeset" do
      city = city_fixture()
      assert {:error, %Ecto.Changeset{}} = Document.update_city(city, @invalid_attrs)
      assert city == Document.get_city!(city.id)
    end

    test "delete_city/1 deletes the city" do
      city = city_fixture()
      assert {:ok, %City{}} = Document.delete_city(city)
      assert_raise Ecto.NoResultsError, fn -> Document.get_city!(city.id) end
    end

    test "change_city/1 returns a city changeset" do
      city = city_fixture()
      assert %Ecto.Changeset{} = Document.change_city(city)
    end
  end
end
