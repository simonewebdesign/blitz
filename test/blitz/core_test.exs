defmodule Blitz.CoreTest do
  use Blitz.DataCase

  alias Blitz.Core

  describe "watchings" do
    alias Blitz.Core.Watching

    import Blitz.CoreFixtures

    @invalid_attrs %{url: nil, retries: nil, fetch_frequency_seconds: nil}

    test "list_watchings/0 returns all watchings" do
      watching = watching_fixture()
      assert Core.list_watchings() == [watching]
    end

    test "get_watching!/1 returns the watching with given id" do
      watching = watching_fixture()
      assert Core.get_watching!(watching.id) == watching
    end

    test "create_watching/1 with valid data creates a watching" do
      valid_attrs = %{url: "some url", retries: 42, fetch_frequency_seconds: 42}

      assert {:ok, %Watching{} = watching} = Core.create_watching(valid_attrs)
      assert watching.url == "some url"
      assert watching.retries == 42
      assert watching.fetch_frequency_seconds == 42
    end

    test "create_watching/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_watching(@invalid_attrs)
    end

    test "update_watching/2 with valid data updates the watching" do
      watching = watching_fixture()
      update_attrs = %{url: "some updated url", retries: 43, fetch_frequency_seconds: 43}

      assert {:ok, %Watching{} = watching} = Core.update_watching(watching, update_attrs)
      assert watching.url == "some updated url"
      assert watching.retries == 43
      assert watching.fetch_frequency_seconds == 43
    end

    test "update_watching/2 with invalid data returns error changeset" do
      watching = watching_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_watching(watching, @invalid_attrs)
      assert watching == Core.get_watching!(watching.id)
    end

    test "delete_watching/1 deletes the watching" do
      watching = watching_fixture()
      assert {:ok, %Watching{}} = Core.delete_watching(watching)
      assert_raise Ecto.NoResultsError, fn -> Core.get_watching!(watching.id) end
    end

    test "change_watching/1 returns a watching changeset" do
      watching = watching_fixture()
      assert %Ecto.Changeset{} = Core.change_watching(watching)
    end
  end
end
