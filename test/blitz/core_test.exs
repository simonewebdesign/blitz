defmodule Blitz.CoreTest do
  use Blitz.DataCase

  alias Blitz.Core

  describe "watchings" do
    alias Blitz.Core.Watching

    import Blitz.CoreFixtures

    @invalid_attrs %{url: nil, retries: nil, fetch_frequency_seconds: nil, css_selector: nil}

    test "list_watchings/0 returns all watchings" do
      watching = watching_fixture()
      assert Core.list_watchings() == [watching]
    end

    test "get_watching!/1 returns the watching with given id" do
      watching = watching_fixture()
      assert Core.get_watching!(watching.id) == watching
    end

    test "create_watching/1 with valid data creates a watching" do
      valid_attrs = %{url: "https://example.com", retries: 3, fetch_frequency_seconds: 5, css_selector: "some css_selector"}

      assert {:ok, %Watching{} = watching} = Core.create_watching(valid_attrs)
      assert watching.url == "https://example.com"
      assert watching.retries == 42
      assert watching.fetch_frequency_seconds == 42
      assert watching.css_selector == "some css_selector"
    end

    test "create_watching/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_watching(@invalid_attrs)
    end

    test "update_watching/2 with valid data updates the watching" do
      watching = watching_fixture()
      update_attrs = %{url: "some updated url", retries: 43, fetch_frequency_seconds: 43, css_selector: "some updated css_selector"}

      assert {:ok, %Watching{} = watching} = Core.update_watching(watching, update_attrs)
      assert watching.url == "some updated url"
      assert watching.retries == 43
      assert watching.fetch_frequency_seconds == 43
      assert watching.css_selector == "some updated css_selector"
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


  describe "attempts" do
    alias Blitz.Core.Attempt

    import Blitz.CoreFixtures

    @invalid_attrs %{response_code: nil, response_data: nil, parsed_value: nil}

    test "list_attempts/0 returns all attempts" do
      attempt = attempt_fixture()
      assert Core.list_attempts() == [attempt]
    end

    test "get_attempt!/1 returns the attempt with given id" do
      attempt = attempt_fixture()
      assert Core.get_attempt!(attempt.id) == attempt
    end

    test "create_attempt/1 with valid data creates a attempt" do
      valid_attrs = %{response_code: 42, response_data: "some response_data", parsed_value: "some parsed_value"}

      assert {:ok, %Attempt{} = attempt} = Core.create_attempt(valid_attrs)
      assert attempt.response_code == 42
      assert attempt.response_data == "some response_data"
      assert attempt.parsed_value == "some parsed_value"
    end

    test "create_attempt/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_attempt(@invalid_attrs)
    end

    test "update_attempt/2 with valid data updates the attempt" do
      attempt = attempt_fixture()
      update_attrs = %{response_code: 43, response_data: "some updated response_data", parsed_value: "some updated parsed_value"}

      assert {:ok, %Attempt{} = attempt} = Core.update_attempt(attempt, update_attrs)
      assert attempt.response_code == 43
      assert attempt.response_data == "some updated response_data"
      assert attempt.parsed_value == "some updated parsed_value"
    end

    test "update_attempt/2 with invalid data returns error changeset" do
      attempt = attempt_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_attempt(attempt, @invalid_attrs)
      assert attempt == Core.get_attempt!(attempt.id)
    end

    test "delete_attempt/1 deletes the attempt" do
      attempt = attempt_fixture()
      assert {:ok, %Attempt{}} = Core.delete_attempt(attempt)
      assert_raise Ecto.NoResultsError, fn -> Core.get_attempt!(attempt.id) end
    end

    test "change_attempt/1 returns a attempt changeset" do
      attempt = attempt_fixture()
      assert %Ecto.Changeset{} = Core.change_attempt(attempt)
    end
  end
end
