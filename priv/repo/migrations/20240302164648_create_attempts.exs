defmodule Blitz.Repo.Migrations.CreateAttempts do
  use Ecto.Migration

  def change do
    create table(:attempts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :response_code, :integer
      add :response_data, :string
      add :watching_id, references(:watchings, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:attempts, [:watching_id])
  end
end
