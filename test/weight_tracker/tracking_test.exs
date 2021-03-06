defmodule WeightTracker.TrackingTest do
  use WeightTracker.DataCase

  alias WeightTracker.Tracking

  describe "weight_tracker" do
    alias WeightTracker.Tracking.Tracker

    @valid_attrs %{weight: "120.5"}
    @update_attrs %{weight: "456.7"}
    @invalid_attrs %{weight: nil}

    def tracker_fixture(attrs \\ %{}) do
      {:ok, tracker} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracking.create_tracker()

      tracker
    end

    test "list_weight_tracker/0 returns all weight_tracker" do
      tracker = tracker_fixture()
      assert Tracking.list_weight_tracker() == [tracker]
    end

    test "get_tracker!/1 returns the tracker with given id" do
      tracker = tracker_fixture()
      assert Tracking.get_tracker!(tracker.id) == tracker
    end

    test "create_tracker/1 with valid data creates a tracker" do
      assert {:ok, %Tracker{} = tracker} = Tracking.create_tracker(@valid_attrs)
      assert tracker.weight == Decimal.new("120.5")
    end

    test "create_tracker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracking.create_tracker(@invalid_attrs)
    end

    test "update_tracker/2 with valid data updates the tracker" do
      tracker = tracker_fixture()
      assert {:ok, %Tracker{} = tracker} = Tracking.update_tracker(tracker, @update_attrs)
      assert tracker.weight == Decimal.new("456.7")
    end

    test "update_tracker/2 with invalid data returns error changeset" do
      tracker = tracker_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracking.update_tracker(tracker, @invalid_attrs)
      assert tracker == Tracking.get_tracker!(tracker.id)
    end

    test "delete_tracker/1 deletes the tracker" do
      tracker = tracker_fixture()
      assert {:ok, %Tracker{}} = Tracking.delete_tracker(tracker)
      assert_raise Ecto.NoResultsError, fn -> Tracking.get_tracker!(tracker.id) end
    end

    test "change_tracker/1 returns a tracker changeset" do
      tracker = tracker_fixture()
      assert %Ecto.Changeset{} = Tracking.change_tracker(tracker)
    end
  end
end
