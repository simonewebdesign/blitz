defmodule Blitz.Core.Watching do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "watchings" do
    field :url, :string
    field :css_selector, :string
    field :retries, :integer
    field :fetch_frequency_seconds, :integer
    field :user_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(watching, attrs) do
    watching
    |> cast(attrs, [:url, :retries, :fetch_frequency_seconds, :css_selector, :user_id])
    |> validate_required([:url, :css_selector, :user_id])
  end
end
