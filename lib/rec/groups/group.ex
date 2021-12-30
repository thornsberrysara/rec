defmodule Rec.Groups.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :description, :string
    field :location, :string
    field :name, :string
    field :num_of_players, :integer
    belongs_to :sport, Rec.Sports.Sport

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name, :description, :location, :num_of_players])
    |> validate_required([:name, :description, :location, :num_of_players])
  end
end
