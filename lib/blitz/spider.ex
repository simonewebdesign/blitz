defmodule Blitz.Spider do
  alias Blitz.{Core, Parser}
  require Logger

  def perform(id, url, css_selector) do
    Logger.info("Requesting #{url}")

    with {:ok, %HTTPoison.Response{status_code: status_code, body: body}} <- HTTPoison.get(url),
         {:ok, text} <- Parser.parse(body, css_selector) do
      Logger.info("Parsed text: #{text}")

      Core.create_attempt(%{
        response_code: status_code,
        response_data: body,
        watching_id: id,
        parsed_value: text
      })

      {:ok, text}
    else
      {:error, reason} ->
        Logger.error("Spider error: #{inspect(reason)}")
        {:error, reason}
    end
  end
end
