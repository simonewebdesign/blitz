defmodule Blitz.Repo.Migrations.AddCSSSelectorToWatchingsAndParsedValueToAttempts do
  use Ecto.Migration

  def change do
    alter table(:watchings) do
      add :css_selector, :string, null: false
    end

    alter table(:attempts) do
      add :parsed_value, :string
    end
  end
end
