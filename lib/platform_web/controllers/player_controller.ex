defmodule PlatformWeb.PlayerController do
  use PlatformWeb, :controller

  alias Platform.Accounts
  alias Platform.Accounts.Player

  def index(conn, _params) do
    players = Accounts.list_players()
    render(conn, :index, players: players)
  end

  def new(conn, _params) do
    changeset = Accounts.change_player(%Player{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"player" => player_params}) do
    case Accounts.create_player(player_params) do
      {:ok, player} ->
        conn
        |> put_flash(:info, "Player created successfully.")
        |> redirect(to: ~p"/players/#{player}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    player = Accounts.get_player!(id)
    render(conn, :show, player: player)
  end

  def edit(conn, %{"id" => id}) do
    player = Accounts.get_player!(id)
    changeset = Accounts.change_player(player)
    render(conn, :edit, player: player, changeset: changeset)
  end

  def update(conn, %{"id" => id, "player" => player_params}) do
    player = Accounts.get_player!(id)

    case Accounts.update_player(player, player_params) do
      {:ok, player} ->
        conn
        |> put_flash(:info, "Player updated successfully.")
        |> redirect(to: ~p"/players/#{player}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, player: player, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    player = Accounts.get_player!(id)
    {:ok, _player} = Accounts.delete_player(player)

    conn
    |> put_flash(:info, "Player deleted successfully.")
    |> redirect(to: ~p"/players")
  end
end
