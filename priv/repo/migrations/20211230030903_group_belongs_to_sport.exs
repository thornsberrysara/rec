defmodule Rec.Repo.Migrations.GroupBelongsToSport do
  use Ecto.Migration

  def change do
    alter table(:groups) do
      add :sport_id, references(:sports)
    end
  end
end
