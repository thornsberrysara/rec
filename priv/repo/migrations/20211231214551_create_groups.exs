defmodule Rec.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :sport, :string
      add :name, :string
      add :description, :string
      add :location, :string

      timestamps()
    end
  end
end
