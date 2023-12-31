defmodule Platform.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :username, :string
      add :score, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
