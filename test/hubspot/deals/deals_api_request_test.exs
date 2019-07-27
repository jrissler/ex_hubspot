defmodule ExHubspot.DealsApiRequestTest do
  @moduledoc false

  use ExUnit.Case, async: false

  alias Hubspot.{Request, Paths}

  test "hubspot contacts request with success returns contacts" do
    response = Request.get_request(Paths.deals_path())
    {:ok, body} = response

    assert length(body.deals) == 2

    # TODO: should probably convert strings w dashes to underscores for atom
    assert body.hasMore == true
    assert body.offset == 333

    first_deal = List.first(body.deals)

    assert first_deal.associations == nil
    assert first_deal.dealId == 1
    assert first_deal.imports == []
    assert first_deal.isDeleted == false
    assert first_deal.portalId == 112
    assert first_deal.stateChanges == []

    assert first_deal.properties.hs_object_id.source == "CALCULATED"
    assert first_deal.properties.hs_object_id.sourceId == nil
    assert first_deal.properties.hs_object_id.timestamp == 0
    assert first_deal.properties.hs_object_id.value == "1"

    first_version = List.first(first_deal.properties.hs_object_id.versions)

    assert first_version.name == "hs_object_id"
    assert first_version.source == "CALCULATED"
    assert first_version.sourceVid == []
    assert first_version.value == "1"
  end
end
