defmodule Blitz.Repo.Migrations.ChangeFieldsTypeToText do
  use Ecto.Migration

  def change do
    alter table(:attempts) do
      modify :response_code, :smallint
      modify :response_data, :text, length: 524288
      modify :watching_id, :binary_id, null: false
    end

    alter table(:watchings) do
      modify :retries, :smallint
      modify :url, :text, null: false, length: 4096
      modify :user_id, :binary_id, null: false
    end
  end
end
