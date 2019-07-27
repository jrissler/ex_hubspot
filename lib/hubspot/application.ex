defmodule ExHubspot.Application do
  @moduledoc """
  Start up test server as part of our application’s supervision tree
  """

  use Application

  def start(_type, args) do
    children = case args do
      [env: :prod] -> []
      [env: :test] -> [{Plug.Cowboy, scheme: :http, plug: ExHubspot.MockServer, options: [port: 8081]}]
      [env: :dev] -> []
      [_] -> []
    end

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExHubspot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
