defmodule BlitzWeb.WatchingController do
  use BlitzWeb, :controller

  alias Blitz.Core
  alias Blitz.Core.Watching

  def index(conn, _params) do
    watchings = Core.list_watchings()
    render(conn, :index, watchings: watchings)
  end

  def new(conn, _params) do
    changeset = Core.change_watching(%Watching{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"watching" => watching_params}) do
    case Core.create_watching(watching_params) do
      {:ok, watching} ->
        conn
        |> put_flash(:info, "Watching created successfully.")
        |> redirect(to: ~p"/watchings/#{watching}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    watching = Core.get_watching!(id)
    render(conn, :show, watching: watching)
  end

  def edit(conn, %{"id" => id}) do
    watching = Core.get_watching!(id)
    changeset = Core.change_watching(watching)
    render(conn, :edit, watching: watching, changeset: changeset)
  end

  def update(conn, %{"id" => id, "watching" => watching_params}) do
    watching = Core.get_watching!(id)

    case Core.update_watching(watching, watching_params) do
      {:ok, watching} ->
        conn
        |> put_flash(:info, "Watching updated successfully.")
        |> redirect(to: ~p"/watchings/#{watching}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, watching: watching, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    watching = Core.get_watching!(id)
    {:ok, _watching} = Core.delete_watching(watching)

    conn
    |> put_flash(:info, "Watching deleted successfully.")
    |> redirect(to: ~p"/watchings")
  end
end
