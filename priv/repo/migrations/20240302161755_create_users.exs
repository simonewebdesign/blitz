defmodule Blitz.Repo.Migrations.AddEmailToUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, size: 50

      timestamps(type: :utc_datetime)
    end
  end
end
