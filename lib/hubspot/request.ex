defmodule Hubspot.Request do
  @moduledoc """
  Module for Hubspot API request.
  Makes request and parses response or returns error code / timeout
  """

  @doc """
  Make GET request to Hubspot.
  Will return object, timeout or status code for error
  """
  def get_request(path) do
    path
    |> hubspot_api_url()
    |> HTTPoison.get()
    |> handle_response
  end

  defp hubspot_api_url(path) do
    "#{base_url() <> path}?hapikey=" <> Application.get_env(:ex_hubspot, :api_key)
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    {:ok, decode!(body)}
  end
  defp handle_response({:ok, %HTTPoison.Response{status_code: status_code}}) do
    {:error, status_code}
  end
  defp handle_response({:error, %HTTPoison.Error{id: nil, reason: :timeout}}) do
    {:error, "timeout"}
  end

  defp decode!(json) do
    Jason.decode!(json, keys: :atoms)
  end

  defp base_url, do: Application.get_env(:ex_hubspot, :api_base_url)
end
