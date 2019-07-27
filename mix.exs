defmodule ExHubspot.MixProject do
  @moduledoc false

  use Mix.Project

  def project do
    [
      app: :ex_hubspot,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      preferred_cli_env: [vcr: :test, "vcr.delete": :test, "vcr.check": :test, "vcr.show": :test]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ExHubspot.Application, [env: Mix.env]},
      applications: applications(Mix.env)
    ]
  end

  defp applications(:test), do: applications(:default) ++ [:cowboy, :plug]
  defp applications(_),     do: [:httpoison]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.5.1"},
      {:jason, "~> 1.1.2"},
      {:plug_cowboy, "~> 2.1"},
      {:ex_doc, "~> 0.21.1", only: :dev},
      {:excoveralls, "~> 0.11.1", only: :test},
      {:credo, "~> 1.1.0", only: [:dev, :test]}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp description do
    """
    Library for connecting to HubSpot's APIs.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["James Rissler"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/jrissler/ex_hubspot"}
    ]
  end
end
