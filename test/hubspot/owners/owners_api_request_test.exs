defmodule ExHubspot.OwnersApiRequestTest do
  @moduledoc false

  use ExUnit.Case, async: false

  alias Hubspot.{Request, Paths}

  test "hubspot owners request with success returns owners" do
    response = Request.get_request(Paths.owners_path())
    {:ok, body} = response

    assert length(body) == 2

    first_owner = List.first(body)

    assert first_owner.activeUserId == 1
    assert first_owner.createdAt == 1_532_007_246_362
    assert first_owner.email == "test@test.com"
    assert first_owner.firstName == "FName"
    assert first_owner.isActive == true
    assert first_owner.lastName == "LName"
    assert first_owner.ownerId == 1
    assert first_owner.portalId == 112
    assert first_owner.signature == ""
    assert first_owner.type == "PERSON"
    assert first_owner.updatedAt == 1_536_067_556_761
    assert first_owner.userIdIncludingInactive == 1

    assert length(first_owner.remoteList) == 2

    first_remote_list = List.first(first_owner.remoteList)

    assert first_remote_list.active == true
    assert first_remote_list.id == 1
    assert first_remote_list.ownerId == 1
    assert first_remote_list.portalId == 112
    assert first_remote_list.remoteId == "1"
    assert first_remote_list.remoteType == "HUBSPOT"
  end
end
