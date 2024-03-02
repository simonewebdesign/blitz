defmodule BlitzWeb.AttemptHTML do
  use BlitzWeb, :html

  embed_templates "attempt_html/*"

  @doc """
  Renders a attempt form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def attempt_form(assigns)
end
