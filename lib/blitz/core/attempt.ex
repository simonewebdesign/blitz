defmodule Blitz.Core.Attempt do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "attempts" do
    field :response_code, :integer
    field :response_data, :string
    field :watching_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(attempt, attrs) do
    attempt
    |> cast(attrs, [:response_code, :response_data, :watching_id, :parsed_value])
    |> validate_required([:watching_id])
  end
end
