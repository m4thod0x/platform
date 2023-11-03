defmodule Platform.Accounts.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :username, :string
    field :score, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:username, :score])
    |> validate_required([:username, :score])
  end
end
