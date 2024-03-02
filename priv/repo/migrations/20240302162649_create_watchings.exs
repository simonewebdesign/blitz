defmodule Blitz.Repo.Migrations.CreateWatchings do
  use Ecto.Migration

  def change do
    create table(:watchings, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :url, :string, null: false
      add :retries, :integer
      add :fetch_frequency_seconds, :integer
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:watchings, [:user_id])
  end
end
