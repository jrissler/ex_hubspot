defmodule Hubspot.Paths do
  @moduledoc """
  Module for HubSpot API paths.
  """

  @doc """
  HubSpot owners api path.
  https://developers.hubspot.com/docs/methods/owners/owners_overview
  """
  def owners_path() do
    "/owners/v2/owners"
  end

  # TODO: account for pagination
  @doc """
  HubSpot companies api path.
  https://developers.hubspot.com/docs/methods/companies/get-all-companies
  """
  def companies_path() do
    "/companies/v2/companies/paged"
  end

  @doc """
  HubSpot contacts api path.
  https://developers.hubspot.com/docs/methods/contacts/get_contacts
  """
  def contacts_path() do
    "/contacts/v1/lists/all/contacts/all"
  end

  @doc """
  HubSpot contact lists api path.
  https://developers.hubspot.com/docs/methods/lists/get_lists
  """
  def contact_lists_path() do
    "/contacts/v1/lists"
  end

  @doc """
  HubSpot deals api path.
  https://developers.hubspot.com/docs/methods/deals/get-all-deals
  """
  def deals_path() do
    "/deals/v1/deal/paged"
  end

  @doc """
  HubSpot tickets api path.
  https://developers.hubspot.com/docs/methods/tickets/get-all-tickets
  """
  def tickets_path() do
    "/crm-objects/v1/objects/tickets/paged"
  end
end
