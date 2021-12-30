defmodule Rec.GroupsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rec.Groups` context.
  """

  @doc """
  Generate a group.
  """
  def group_fixture(attrs \\ %{}) do
    {:ok, group} =
      attrs
      |> Enum.into(%{
        description: "some description",
        location: "some location",
        name: "some name",
        num_of_players: 42
      })
      |> Rec.Groups.create_group()

    group
  end
end
