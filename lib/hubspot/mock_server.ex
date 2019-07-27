defmodule ExHubspot.MockServer do
  @moduledoc """
  Mock Server to run tests
  """

  use Plug.Router

  plug Plug.Parsers, parsers: [:json], pass:  ["text/*"], json_decoder: Jason

  plug :match
  plug :dispatch

  get "/owners/v2/owners" do
    response = [
      %{
        activeUserId: 1,
        createdAt: 1_532_007_246_362,
        email: "test@test.com",
        firstName: "FName",
        hasContactsAccess: false,
        isActive: true,
        lastName: "LName",
        ownerId: 1,
        portalId: 112,
        remoteList: [
          %{active: true, id: 1, ownerId: 1, portalId: 112, remoteId: "1", remoteType: "HUBSPOT"},
          %{active: true, id: 2, ownerId: 2, portalId: 112, remoteId: "2", remoteType: "SALESFORCE"}
        ],
        signature: "",
        type: "PERSON",
        updatedAt: 1_536_067_556_761,
        userIdIncludingInactive: 1
      },
      %{
        activeUserId: 2,
        createdAt: 1_532_007_246_338,
        email: "test2@test.com",
        firstName: "FName",
        hasContactsAccess: false,
        isActive: true,
        lastName: "LName",
        ownerId: 1,
        portalId: 112,
        remoteList: [
          %{active: true, id: 1, ownerId: 1, portalId: 112, remoteId: "1", remoteType: "HUBSPOT"},
          %{active: true, id: 2, ownerId: 1, portalId: 112, remoteId: "2", remoteType: "SALESFORCE"}
        ],
        signature: "",
        type: "PERSON",
        updatedAt: 1_536_071_118_286,
        userIdIncludingInactive: 112
      }
    ]

    success(conn, response)
  end

  get "/companies/v2/companies/paged" do
    response = %{
      companies: [
        %{additionalDomains: [], companyId: 1, isDeleted: false, mergeAudits: [], portalId: 112, properties: %{}, stateChanges: []},
        %{additionalDomains: [], companyId: 2, isDeleted: false, mergeAudits: [], portalId: 122, properties: %{}, stateChanges: []}
      ],
      "has-more": true,
      offset: 6
    }

    success(conn, response)
  end

  get "/contacts/v1/lists/all/contacts/all" do
    response = %{
      contacts: [
        %{
          addedAt: 1_531_793_853_202,
          "canonical-vid": 1,
          "form-submissions": [],
          "identity-profiles": [
            %{
              "deleted-changed-timestamp": 0,
              identities: [
                %{
                  "is-primary": true,
                  timestamp: 1_531_793_853_018,
                  type: "EMAIL",
                  value: "test@test.com"
                },
                %{
                  timestamp: 1_531_793_853_087,
                  type: "LEAD_GUID",
                  value: "111-1111-111-111-11"
                }
              ],
              "saved-at-timestamp": 1_531_793_853_089,
              vid: 1
            }
          ],
          "is-contact": true,
          "merge-audits": [],
          "merged-vids": [],
          "portal-id": 112,
          "profile-token": "I-",
          "profile-url": "https://app.hubspot.com/contacts/1/contact/1",
          properties: %{
            company: %{value: "HubSpot"},
            firstname: %{value: "Cool"},
            lastmodifieddate: %{value: "1561491572126"},
            lastname: %{value: "Robot (Sample Contact)"}
          },
          vid: 1
        },
        %{
          addedAt: 1_531_793_853_435,
          "canonical-vid": 2,
          "form-submissions": [],
          "identity-profiles": [
            %{
              "deleted-changed-timestamp": 0,
              identities: [
                %{
                  "is-primary": true,
                  timestamp: 1_531_793_853_018,
                  type: "EMAIL",
                  value: "test2@hubspot.com"
                },
                %{
                  timestamp: 1_531_793_853_241,
                  type: "LEAD_GUID",
                  value: "22-2-22-2-22"
                }
              ],
              "saved-at-timestamp": 1_531_793_853_244,
              vid: 2
            }
          ],
          "is-contact": true,
          "merge-audits": [],
          "merged-vids": [],
          "portal-id": 112,
          "profile-token": "Fm",
          "profile-url": "https://app.hubspot.com/contacts/4741348/contact/51",
          properties: %{
            company: %{value: "HubSpot"},
            firstname: %{value: "FName"},
            lastmodifieddate: %{value: "1561482697216"},
            lastname: %{value: "Test2 (Sample Contact)"}
          },
          vid: 2
        }
      ],
      "has-more": true,
      "vid-offset": 207
    }

    success(conn, response)
  end

  get "/deals/v1/deal/paged" do
    response = %{
      deals: [
        %{
          associations: nil,
          dealId: 1,
          imports: [],
          isDeleted: false,
          portalId: 112,
          properties: %{
            hs_object_id: %{
              source: "CALCULATED",
              sourceId: nil,
              timestamp: 0,
              value: "1",
              versions: [
                %{
                  name: "hs_object_id",
                  source: "CALCULATED",
                  sourceVid: [],
                  value: "1"
                }
              ]
            }
          },
          stateChanges: []
        },
        %{
          associations: nil,
          dealId: 2,
          imports: [],
          isDeleted: false,
          portalId: 112,
          properties: %{
            hs_object_id: %{
              source: "CALCULATED",
              sourceId: nil,
              timestamp: 0,
              value: "2",
              versions: [
                %{
                  name: "hs_object_id",
                  source: "CALCULATED",
                  sourceVid: [],
                  value: "2"
                }
              ]
            }
          },
          stateChanges: []
        }
      ],
      hasMore: true,
      offset: 333
    }

    success(conn, response)
  end

  get "/crm-objects/v1/objects/tickets/paged" do
    response = %{
      objects: [
        %{
          isDeleted: false,
          objectId: 1,
          objectType: "TICKET",
          portalId: 112,
          properties: %{}
        },
        %{
          isDeleted: false,
          objectId: 2,
          objectType: "TICKET",
          portalId: 112,
          properties: %{}
        },
      ],
      hasMore: true,
      offset: 144
    }

    success(conn, response)
  end

  get "/contacts/v1/lists" do
    response = %{
      lists: [
        %{
          archived: false,
          createdAt: 1_531_793_910_848,
          deleteable: true,
          dynamic: true,
          filters: [
            [
              %{
                filterFamily: "PropertyValue",
                operator: "SET_ANY",
                property: "blog_default_hubspot_blog_5968043387_subscription",
                type: "enumeration",
                value: "instant",
                withinTimeMode: "PAST"
              }
            ]
          ],
          internal: false,
          internalListId: 1,
          listId: 1,
          listType: "DYNAMIC",
          metaData: %{
            error: "",
            lastProcessingStateChangeAt: 1_531_793_927_694,
            lastSizeChangeAt: 1_531_793_927_922,
            listReferencesCount: nil,
            parentFolderId: nil,
            processing: "DONE",
            size: 0
          },
          name: "Instant Subscribers - Default HubSpot Blog",
          portalId: 112,
          teamIds: [],
          updatedAt: 1_531_793_910_848
        },
        %{
          archived: false,
          createdAt: 1_531_793_911_121,
          deleteable: true,
          dynamic: true,
          filters: [
            [
              %{
                filterFamily: "PropertyValue",
                operator: "SET_ANY",
                property: "blog_default_hubspot_blog_5968043387_subscription",
                type: "enumeration",
                value: "daily",
                withinTimeMode: "PAST"
              }
            ]
          ],
          internal: false,
          internalListId: 2,
          listId: 2,
          listType: "DYNAMIC",
          metaData: %{
            error: "",
            lastProcessingStateChangeAt: 1_531_793_927_694,
            lastSizeChangeAt: 1_531_793_927_996,
            listReferencesCount: nil,
            parentFolderId: nil,
            processing: "DONE",
            size: 0
          },
          name: "Daily Subscribers - Default HubSpot Blog",
          portalId: 112,
          teamIds: [],
          updatedAt: 1_531_793_911_121
        }
      ],
      "has-more": true,
      offset: 20
    }

    success(conn, response)
  end

  defp success(conn, body) do
    conn
    |> Plug.Conn.send_resp(200, Jason.encode!(body))
  end
end
