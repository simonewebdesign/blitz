defmodule Blitz.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blitz.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some@email.com",
        name: "some name"
      })
      |> Blitz.Accounts.create_user()

    user
  end
end
