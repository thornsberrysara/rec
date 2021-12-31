defmodule Rec.Repo.Migrations.CreateSports do
  use Ecto.Migration

  def change do
    create table(:sports) do
      add :sport_name, :string

      timestamps()
    end
  end
end
