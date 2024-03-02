defmodule Blitz.CoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blitz.Core` context.
  """

  @doc """
  Generate a watching.
  """
  def watching_fixture(attrs \\ %{}) do
    {:ok, watching} =
      attrs
      |> Enum.into(%{
        fetch_frequency_seconds: 42,
        retries: 42,
        url: "some url"
      })
      |> Blitz.Core.create_watching()

    watching
  end
end
