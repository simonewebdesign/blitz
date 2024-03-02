defmodule BlitzWeb.AttemptController do
  use BlitzWeb, :controller

  alias Blitz.Core
  alias Blitz.Core.Attempt

  def index(conn, _params) do
    attempts = Core.list_attempts()
    render(conn, :index, attempts: attempts)
  end

  def new(conn, _params) do
    changeset = Core.change_attempt(%Attempt{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"attempt" => attempt_params}) do
    case Core.create_attempt(attempt_params) do
      {:ok, attempt} ->
        conn
        |> put_flash(:info, "Attempt created successfully.")
        |> redirect(to: ~p"/attempts/#{attempt}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    attempt = Core.get_attempt!(id)
    render(conn, :show, attempt: attempt)
  end

  def edit(conn, %{"id" => id}) do
    attempt = Core.get_attempt!(id)
    changeset = Core.change_attempt(attempt)
    render(conn, :edit, attempt: attempt, changeset: changeset)
  end

  def update(conn, %{"id" => id, "attempt" => attempt_params}) do
    attempt = Core.get_attempt!(id)

    case Core.update_attempt(attempt, attempt_params) do
      {:ok, attempt} ->
        conn
        |> put_flash(:info, "Attempt updated successfully.")
        |> redirect(to: ~p"/attempts/#{attempt}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, attempt: attempt, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    attempt = Core.get_attempt!(id)
    {:ok, _attempt} = Core.delete_attempt(attempt)

    conn
    |> put_flash(:info, "Attempt deleted successfully.")
    |> redirect(to: ~p"/attempts")
  end
end
