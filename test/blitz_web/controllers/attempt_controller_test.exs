defmodule BlitzWeb.AttemptControllerTest do
  use BlitzWeb.ConnCase

  import Blitz.CoreFixtures

  @create_attrs %{response_code: 42, response_data: "some response_data", parsed_value: "some parsed_value"}
  @update_attrs %{response_code: 43, response_data: "some updated response_data", parsed_value: "some updated parsed_value"}
  @invalid_attrs %{response_code: nil, response_data: nil, parsed_value: nil}

  describe "index" do
    test "lists all attempts", %{conn: conn} do
      conn = get(conn, ~p"/attempts")
      assert html_response(conn, 200) =~ "Listing Attempts"
    end
  end

  describe "new attempt" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/attempts/new")
      assert html_response(conn, 200) =~ "New Attempt"
    end
  end

  describe "create attempt" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/attempts", attempt: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/attempts/#{id}"

      conn = get(conn, ~p"/attempts/#{id}")
      assert html_response(conn, 200) =~ "Attempt #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/attempts", attempt: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Attempt"
    end
  end

  describe "edit attempt" do
    setup [:create_attempt]

    test "renders form for editing chosen attempt", %{conn: conn, attempt: attempt} do
      conn = get(conn, ~p"/attempts/#{attempt}/edit")
      assert html_response(conn, 200) =~ "Edit Attempt"
    end
  end

  describe "update attempt" do
    setup [:create_attempt]

    test "redirects when data is valid", %{conn: conn, attempt: attempt} do
      conn = put(conn, ~p"/attempts/#{attempt}", attempt: @update_attrs)
      assert redirected_to(conn) == ~p"/attempts/#{attempt}"

      conn = get(conn, ~p"/attempts/#{attempt}")
      assert html_response(conn, 200) =~ "some updated response_data"
    end

    test "renders errors when data is invalid", %{conn: conn, attempt: attempt} do
      conn = put(conn, ~p"/attempts/#{attempt}", attempt: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Attempt"
    end
  end

  describe "delete attempt" do
    setup [:create_attempt]

    test "deletes chosen attempt", %{conn: conn, attempt: attempt} do
      conn = delete(conn, ~p"/attempts/#{attempt}")
      assert redirected_to(conn) == ~p"/attempts"

      assert_error_sent 404, fn ->
        get(conn, ~p"/attempts/#{attempt}")
      end
    end
  end

  defp create_attempt(_) do
    attempt = attempt_fixture()
    %{attempt: attempt}
  end
end
