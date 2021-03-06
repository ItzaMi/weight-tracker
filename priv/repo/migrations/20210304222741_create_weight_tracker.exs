defmodule WeightTracker.Repo.Migrations.CreateWeightTracker do
  use Ecto.Migration

  def change do
    create table(:weight_tracker) do
      add :weight, :decimal

      timestamps()
    end

  end
end
