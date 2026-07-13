resource "azurerm_subnet" "snetsc" {
  for_each = var.snetsc
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes = each.value.address_prefixes
}

