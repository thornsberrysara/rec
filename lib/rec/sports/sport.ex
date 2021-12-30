defmodule Rec.Sports.Sport do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sports" do
    field :sport_name, :string

    timestamps()
  end

  @doc false
  def changeset(sport, attrs) do
    sport
    |> cast(attrs, [:sport_name])
    |> validate_required([:sport_name])
  end
end
