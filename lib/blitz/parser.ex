defmodule Blitz.Parser do
  # def fetch(url) do
  #   HTTPoison.get! url
  # end

  def parse(response_body, css_selector) do
    {:ok, document} =
      response_body
      |> Floki.parse_document()

    text =
      document
      |> Floki.find(css_selector)
      |> Floki.text()
      |> String.trim_leading()
      |> String.trim_trailing()

    # %{text: text, url: response.request_url}
    {:ok, text}
  end
end
