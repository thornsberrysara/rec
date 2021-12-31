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
        sport: :""
      })
      |> Rec.Groups.create_group()

    group
  end
end
