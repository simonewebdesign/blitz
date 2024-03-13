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

  def create(conn, %{"watching" => wat_params}) do
    wat_params = Map.put(wat_params, "user_id", "14c59c04-2a6a-4b8f-8b7d-dfe91f50e2e6")

    case Core.create_watching(wat_params) do
      {:ok, wat} ->
        # Start a background job to fetch the data at regular intervals
        DynamicSupervisor.start_child(Blitz.PeriodicJobDynamicSupervisor, {
          Blitz.PeriodicJob, {
            fn -> Blitz.Spider.perform(wat.id, wat.url, wat.css_selector) end,
            wat.fetch_frequency_seconds
          }
        })

        # Redirect to the newly created watching
        conn
        |> put_flash(:info, "Watching created successfully.")
        |> redirect(to: ~p"/watchings/#{wat}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    wat = Core.get_watching!(id)
    render(conn, :show, watching: wat)
  end

  def edit(conn, %{"id" => id}) do
    wat = Core.get_watching!(id)
    changeset = Core.change_watching(wat)
    render(conn, :edit, watching: wat, changeset: changeset)
  end

  def update(conn, %{"id" => id, "watching" => wat_params}) do
    wat = Core.get_watching!(id)

    case Core.update_watching(wat, wat_params) do
      {:ok, wat} ->
        conn
        |> put_flash(:info, "Watching updated successfully.")
        |> redirect(to: ~p"/watchings/#{wat}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, watching: wat, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    wat = Core.get_watching!(id)
    {:ok, _wat} = Core.delete_watching(wat)

    conn
    |> put_flash(:info, "Watching deleted successfully.")
    |> redirect(to: ~p"/watchings")
  end
end
