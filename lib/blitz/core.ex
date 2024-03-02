defmodule Blitz.Core do
  @moduledoc """
  The Core context.
  """

  import Ecto.Query, warn: false
  alias Blitz.Repo

  alias Blitz.Core.Watching

  @doc """
  Returns the list of watchings.

  ## Examples

      iex> list_watchings()
      [%Watching{}, ...]

  """
  def list_watchings do
    Repo.all(Watching)
  end

  @doc """
  Gets a single watching.

  Raises `Ecto.NoResultsError` if the Watching does not exist.

  ## Examples

      iex> get_watching!(123)
      %Watching{}

      iex> get_watching!(456)
      ** (Ecto.NoResultsError)

  """
  def get_watching!(id), do: Repo.get!(Watching, id)

  @doc """
  Creates a watching.

  ## Examples

      iex> create_watching(%{field: value})
      {:ok, %Watching{}}

      iex> create_watching(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_watching(attrs \\ %{}) do
    %Watching{}
    |> Watching.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a watching.

  ## Examples

      iex> update_watching(watching, %{field: new_value})
      {:ok, %Watching{}}

      iex> update_watching(watching, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_watching(%Watching{} = watching, attrs) do
    watching
    |> Watching.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a watching.

  ## Examples

      iex> delete_watching(watching)
      {:ok, %Watching{}}

      iex> delete_watching(watching)
      {:error, %Ecto.Changeset{}}

  """
  def delete_watching(%Watching{} = watching) do
    Repo.delete(watching)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking watching changes.

  ## Examples

      iex> change_watching(watching)
      %Ecto.Changeset{data: %Watching{}}

  """
  def change_watching(%Watching{} = watching, attrs \\ %{}) do
    Watching.changeset(watching, attrs)
  end
end
