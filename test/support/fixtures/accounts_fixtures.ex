defmodule Platform.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Platform.Accounts` context.
  """

  @doc """
  Generate a player.
  """
  def player_fixture(attrs \\ %{}) do
    {:ok, player} =
      attrs
      |> Enum.into(%{
        score: 42,
        username: "some username"
      })
      |> Platform.Accounts.create_player()

    player
  end
end
