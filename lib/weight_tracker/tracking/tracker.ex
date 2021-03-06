defmodule WeightTracker.Tracking.Tracker do
  use Ecto.Schema
  import Ecto.Changeset

  schema "weight_tracker" do
    field :weight, :decimal

    timestamps()
  end

  @doc false
  def changeset(tracker, attrs) do
    tracker
    |> cast(attrs, [:weight])
    |> validate_required([:weight])
  end
end
