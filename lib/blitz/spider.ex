defmodule Blitz.Spider do
  def fetch() do
    HTTPoison.get! "http://example.com"
  end

  def parse(response, selector) do
    {:ok, document} =
      response.body
      |> Floki.parse_document

    text =
      document
      |> Floki.find(selector)
      |> Floki.text
      |> String.trim_leading()
      |> String.trim_trailing()

    %{text: text, url: response.request_url}
  end
end
