defmodule Blitz.BasicSpider do
  use Crawly.Spider
  @impl Crawly.Spider
  def base_url do
    "http://example.com"
  end

  @impl Crawly.Spider
  def init() do
    [
      start_urls: [
        "http://example.com/"
      ]
    ]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} =
      response.body
      |>  Floki.parse_document

    text =
      document
      |> Floki.find("a")
      |> Floki.text
      |> String.trim_leading()
      |> String.trim_trailing()

      %Crawly.ParsedItem{
        :items => [
          %{text: text, url: response.request_url}
        ],
        :requests => []
      }
  end
end
