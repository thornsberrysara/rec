defmodule Rec.GroupsTest do
  use Rec.DataCase

  alias Rec.Groups

  describe "groups" do
    alias Rec.Groups.Group

    import Rec.GroupsFixtures

<<<<<<< HEAD
    @invalid_attrs %{sport: nil}
=======
    @invalid_attrs %{description: nil, location: nil, name: nil, num_of_players: nil}
>>>>>>> master

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert Groups.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Groups.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
<<<<<<< HEAD
      valid_attrs = %{sport: :""}

      assert {:ok, %Group{} = group} = Groups.create_group(valid_attrs)
      assert group.sport == :""
=======
      valid_attrs = %{description: "some description", location: "some location", name: "some name", num_of_players: 42}

      assert {:ok, %Group{} = group} = Groups.create_group(valid_attrs)
      assert group.description == "some description"
      assert group.location == "some location"
      assert group.name == "some name"
      assert group.num_of_players == 42
>>>>>>> master
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Groups.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
<<<<<<< HEAD
      update_attrs = %{sport: :""}

      assert {:ok, %Group{} = group} = Groups.update_group(group, update_attrs)
      assert group.sport == :""
=======
      update_attrs = %{description: "some updated description", location: "some updated location", name: "some updated name", num_of_players: 43}

      assert {:ok, %Group{} = group} = Groups.update_group(group, update_attrs)
      assert group.description == "some updated description"
      assert group.location == "some updated location"
      assert group.name == "some updated name"
      assert group.num_of_players == 43
>>>>>>> master
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Groups.update_group(group, @invalid_attrs)
      assert group == Groups.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Groups.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Groups.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Groups.change_group(group)
    end
  end
end
