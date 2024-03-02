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

  alias Blitz.Core.Attempt

  @doc """
  Returns the list of attempts.

  ## Examples

      iex> list_attempts()
      [%Attempt{}, ...]

  """
  def list_attempts do
    Repo.all(Attempt)
  end

  @doc """
  Gets a single attempt.

  Raises `Ecto.NoResultsError` if the Attempt does not exist.

  ## Examples

      iex> get_attempt!(123)
      %Attempt{}

      iex> get_attempt!(456)
      ** (Ecto.NoResultsError)

  """
  def get_attempt!(id), do: Repo.get!(Attempt, id)

  @doc """
  Creates a attempt.

  ## Examples

      iex> create_attempt(%{field: value})
      {:ok, %Attempt{}}

      iex> create_attempt(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_attempt(attrs \\ %{}) do
    %Attempt{}
    |> Attempt.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a attempt.

  ## Examples

      iex> update_attempt(attempt, %{field: new_value})
      {:ok, %Attempt{}}

      iex> update_attempt(attempt, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_attempt(%Attempt{} = attempt, attrs) do
    attempt
    |> Attempt.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a attempt.

  ## Examples

      iex> delete_attempt(attempt)
      {:ok, %Attempt{}}

      iex> delete_attempt(attempt)
      {:error, %Ecto.Changeset{}}

  """
  def delete_attempt(%Attempt{} = attempt) do
    Repo.delete(attempt)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking attempt changes.

  ## Examples

      iex> change_attempt(attempt)
      %Ecto.Changeset{data: %Attempt{}}

  """
  def change_attempt(%Attempt{} = attempt, attrs \\ %{}) do
    Attempt.changeset(attempt, attrs)
  end
end
