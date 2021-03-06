defmodule WeightTracker.Repo do
  use Ecto.Repo,
    otp_app: :weight_tracker,
    adapter: Ecto.Adapters.Postgres
end
