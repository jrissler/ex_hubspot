defmodule ExHubspot.ContactListsApiRequestTest do
  @moduledoc false

  use ExUnit.Case, async: false

  alias Hubspot.{Request, Paths}

  test "hubspot contact lists request with success returns contact lists" do
    response = Request.get_request(Paths.contact_lists_path())
    {:ok, body} = response

    assert length(body.lists) == 2

    # TODO: should probably convert strings w dashes to underscores for atom
    assert body."has-more" == true
    assert body.offset == 20

    first_contact_list = List.first(body.lists)

    assert first_contact_list.archived == false
    assert first_contact_list.createdAt == 1_531_793_910_848
    assert first_contact_list.deleteable == true
    assert first_contact_list.dynamic == true
    assert first_contact_list.internal == false
    assert first_contact_list.internalListId == 1
    assert first_contact_list.listId == 1
    assert first_contact_list.listType == "DYNAMIC"
    assert first_contact_list.name == "Instant Subscribers - Default HubSpot Blog"
    assert first_contact_list.portalId == 112
    assert first_contact_list.teamIds == []
    assert first_contact_list.updatedAt == 1_531_793_910_848

    first_filter = List.first(first_contact_list.filters) |> List.first
    assert first_filter.filterFamily == "PropertyValue"
    assert first_filter.operator == "SET_ANY"
    assert first_filter.property == "blog_default_hubspot_blog_5968043387_subscription"
    assert first_filter.type == "enumeration"
    assert first_filter.value == "instant"
    assert first_filter.withinTimeMode == "PAST"

    assert first_contact_list.metaData.error == ""
    assert first_contact_list.metaData.lastProcessingStateChangeAt == 1_531_793_927_694
    assert first_contact_list.metaData.lastSizeChangeAt == 1_531_793_927_922
    assert first_contact_list.metaData.listReferencesCount == nil
    assert first_contact_list.metaData.parentFolderId == nil
    assert first_contact_list.metaData.processing == "DONE"
    assert first_contact_list.metaData.size == 0
    # metaData
  end
end
