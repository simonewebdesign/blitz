defmodule BlitzWeb.WatchingHTML do
  use BlitzWeb, :html

  embed_templates "watching_html/*"

  @doc """
  Renders a watching form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def watching_form(assigns)
end
