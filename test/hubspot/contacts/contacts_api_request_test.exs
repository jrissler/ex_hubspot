defmodule ExHubspot.ContactsApiRequestTest do
  @moduledoc false

  use ExUnit.Case, async: false

  alias Hubspot.{Request, Paths}

  test "hubspot contacts request with success returns contacts" do
    response = Request.get_request(Paths.contacts_path())
    {:ok, body} = response

    assert length(body.contacts) == 2

    # TODO: should probably convert strings w dashes to underscores for atom
    assert body."has-more" == true
    assert body."vid-offset" == 207

    first_contact = List.first(body.contacts)

    assert first_contact.addedAt == 1_531_793_853_202
    assert first_contact."canonical-vid" == 1
    assert first_contact."form-submissions" == []
    assert first_contact."is-contact" == true
    assert first_contact."merge-audits" == []
    assert first_contact."merged-vids" == []
    assert first_contact."portal-id" == 112
    assert first_contact."profile-token" == "I-"
    assert first_contact."profile-url" == "https://app.hubspot.com/contacts/1/contact/1"
    assert first_contact.vid == 1

    assert first_contact.properties.company == %{value: "HubSpot"}
    assert first_contact.properties.firstname == %{value: "Cool"}
    assert first_contact.properties.lastmodifieddate == %{value: "1561491572126"}
    assert first_contact.properties.lastname == %{value: "Robot (Sample Contact)"}

    first_identity_profile = List.first(first_contact."identity-profiles")
    first_identity = List.first(first_identity_profile.identities)

    assert first_identity."is-primary" == true
    assert first_identity.timestamp == 1_531_793_853_018
    assert first_identity.type == "EMAIL"
    assert first_identity.value == "test@test.com"
  end
end
