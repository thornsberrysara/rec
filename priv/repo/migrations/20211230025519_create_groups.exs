defmodule Rec.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string
      add :description, :string
      add :location, :string
      add :num_of_players, :integer

      timestamps()
    end
  end
end
