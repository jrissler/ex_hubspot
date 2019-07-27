# ex_hubspot

Library for HubSpot's APIs.

## Installation

The package can be installed as:

  1. Add ex_hubspot to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ex_hubspot, "~> 0.0.1"}]
    end
    ```

  2. Run `mix deps.get` in your console to fetch from Hex


## Usage

```elixir
iex> ExHubspot.fetch_*("")
true

iex> ExHubspot.post_*("")
false
```
    
### Something Else

```elixir
defmodule xxx do
  use xxx
  
  def xx(x) do
    
  end
  
  defp xx(x, x \\ :empty) do
    x
    |> x(x, ~w(one two), ~w())
    |> ExHubspot.something.do(:hubspot)
  end
end
```

## Documentation
Hosted on [http://hexdocs.pm/jrissler/ExHubspot.html](http://hexdocs.pm/jrissler/ExHubspot.html)

## Author
James Rissler

ExHubspot is released under the [MIT License](https://github.com/appcues/exsentry/blob/master/LICENSE.txt).
