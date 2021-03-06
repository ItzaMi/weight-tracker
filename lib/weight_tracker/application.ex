defmodule WeightTracker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      WeightTracker.Repo,
      # Start the Telemetry supervisor
      WeightTrackerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: WeightTracker.PubSub},
      # Start the Endpoint (http/https)
      WeightTrackerWeb.Endpoint
      # Start a worker by calling: WeightTracker.Worker.start_link(arg)
      # {WeightTracker.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WeightTracker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WeightTrackerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
