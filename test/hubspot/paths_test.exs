defmodule ExHubspot.PathTest do
  @moduledoc false

  use ExUnit.Case, async: false

  alias Hubspot.Paths

  test "owners_path" do
    assert Paths.owners_path() == "/owners/v2/owners"
  end

  test "companies_path" do
    assert Paths.companies_path() == "/companies/v2/companies/paged"
  end
end
