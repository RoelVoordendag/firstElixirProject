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
end
