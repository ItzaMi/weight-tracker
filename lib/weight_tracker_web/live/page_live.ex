defmodule WeightTrackerWeb.PageLive do
  use WeightTrackerWeb, :live_view
  alias WeightTracker.Tracking

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> fetch()}
  end

  def handle_event("add", %{"weight" => weight}, socket) do
    Tracking.create_tracker(weight)
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, weights: Tracking.list_weight_tracker())
  end
end
