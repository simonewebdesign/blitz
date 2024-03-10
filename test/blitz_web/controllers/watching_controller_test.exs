defmodule BlitzWeb.WatchingControllerTest do
  use BlitzWeb.ConnCase

  import Blitz.CoreFixtures

  @create_attrs %{url: "https://example.com", retries: 3, fetch_frequency_seconds: 5, css_selector: "some css_selector", user_id: "14c59c04-2a6a-4b8f-8b7d-dfe91f50e2e6"}
  @update_attrs %{url: "some updated url", retries: 43, fetch_frequency_seconds: 43, css_selector: "some updated css_selector"}
  @invalid_attrs %{url: nil, retries: nil, fetch_frequency_seconds: nil, css_selector: nil}

  describe "index" do
    test "lists all watchings", %{conn: conn} do
      conn = get(conn, ~p"/watchings")
      assert html_response(conn, 200) =~ "Listing Watchings"
    end
  end

  describe "new watching" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/watchings/new")
      assert html_response(conn, 200) =~ "New Watching"
    end
  end

  describe "create watching" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/watchings", watching: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/watchings/#{id}"

      conn = get(conn, ~p"/watchings/#{id}")
      assert html_response(conn, 200) =~ "Watching #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/watchings", watching: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Watching"
    end
  end

  describe "edit watching" do
    setup [:create_watching]

    test "renders form for editing chosen watching", %{conn: conn, watching: watching} do
      conn = get(conn, ~p"/watchings/#{watching}/edit")
      assert html_response(conn, 200) =~ "Edit Watching"
    end
  end

  describe "update watching" do
    setup [:create_watching]

    test "redirects when data is valid", %{conn: conn, watching: watching} do
      conn = put(conn, ~p"/watchings/#{watching}", watching: @update_attrs)
      assert redirected_to(conn) == ~p"/watchings/#{watching}"

      conn = get(conn, ~p"/watchings/#{watching}")
      assert html_response(conn, 200) =~ "some updated url"
    end

    test "renders errors when data is invalid", %{conn: conn, watching: watching} do
      conn = put(conn, ~p"/watchings/#{watching}", watching: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Watching"
    end
  end

  describe "delete watching" do
    setup [:create_watching]

    test "deletes chosen watching", %{conn: conn, watching: watching} do
      conn = delete(conn, ~p"/watchings/#{watching}")
      assert redirected_to(conn) == ~p"/watchings"

      assert_error_sent 404, fn ->
        get(conn, ~p"/watchings/#{watching}")
      end
    end
  end

  defp create_watching(_) do
    watching = watching_fixture()
    %{watching: watching}
  end
end
