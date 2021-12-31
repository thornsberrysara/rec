defmodule Rec.SportsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rec.Sports` context.
  """

  @doc """
  Generate a sport.
  """
  def sport_fixture(attrs \\ %{}) do
    {:ok, sport} =
      attrs
      |> Enum.into(%{
        sport_name: "some sport_name"
      })
      |> Rec.Sports.create_sport()

    sport
  end
end
