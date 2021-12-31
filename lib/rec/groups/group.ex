defmodule Rec.Groups.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :sport, Ecto.Enum,
      values: [
        :soccer,
        :basketball,
        :tennis,
        :baseball,
        :golf,
        :running,
        :volleyball,
        :badminton,
        :swimming,
        :boxing,
        :table_tennis,
        :skiing,
        :ice_skating,
        :roller_skating,
        :rugby,
        :billiards,
        :football,
        :bowling,
        :ice_hockey,
        :snowboarding,
        :skateboarding,
        :cycling,
        :archery,
        :fishing,
        :gymnastics,
        :figure_skating,
        :rock_climbing
      ]

    field :name, :string
    field :description, :string
    field :location, :string

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:sport, :name, :description, :location])
    |> validate_required([:sport, :name, :description, :location])
    
  end
end
