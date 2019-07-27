defmodule ExHubspot.CompaniesApiRequestTest do
  @moduledoc false

  use ExUnit.Case, async: false

  alias Hubspot.{Request, Paths}

  test "hubspot companies request with success returns companies" do
    response = Request.get_request(Paths.companies_path())
    {:ok, body} = response

    assert length(body.companies) == 2

    # TODO: should probably convert strings w dashes to underscores for atom
    assert body."has-more" == true
    assert body.offset == 6

    first_company = List.first(body.companies)

    assert first_company.additionalDomains == []
    assert first_company.companyId == 1
    assert first_company.isDeleted == false
    assert first_company.mergeAudits == []
    assert first_company.portalId == 112
    assert first_company.properties == %{}
  end
end
