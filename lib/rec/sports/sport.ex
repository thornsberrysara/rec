defmodule Rec.Sports.Sport do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sports" do
    field :sport_name, :string
    has_many :groups, Rec.Groups.Group, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(sport, attrs) do
    sport
    |> cast(attrs, [:sport_name])
    |> cast_assoc(:groups)
    |> validate_required([:sport_name])
  end
end
