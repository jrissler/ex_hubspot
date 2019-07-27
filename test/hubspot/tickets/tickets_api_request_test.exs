defmodule ExHubspot.TicketsApiRequestTest do
  @moduledoc false

  use ExUnit.Case, async: false

  alias Hubspot.{Request, Paths}

  test "hubspot tickets request with success returns tickets" do
    response = Request.get_request(Paths.tickets_path())
    {:ok, body} = response

    assert length(body.objects) == 2

    assert body.hasMore == true
    assert body.offset == 144

    first_ticket = List.first(body.objects)

    assert first_ticket.isDeleted == false
    assert first_ticket.objectId == 1
    assert first_ticket.objectType == "TICKET"
    assert first_ticket.portalId == 112
    assert first_ticket.properties == %{}
  end
end
