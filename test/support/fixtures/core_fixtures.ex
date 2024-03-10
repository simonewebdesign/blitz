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

  @doc """
  Generate a attempt.
  """
  def attempt_fixture(attrs \\ %{}) do
    {:ok, attempt} =
      attrs
      |> Enum.into(%{
        parsed_value: "some parsed_value",
        response_code: 42,
        response_data: "some response_data"
      })
      |> Blitz.Core.create_attempt()

    attempt
  end
end
