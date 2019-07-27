defmodule ExHubspot.ErrorTest do
  @moduledoc false

  use ExUnit.Case, async: false

  alias Hubspot.Request

  test "hubspot companies request with 500 returns error" do
    response = Request.get_request("/not_valid")
    assert response == {:error, 500}
  end
end
