resource "azurerm_resource_group" "rgsc" {
  for_each = var.rgsc
  name = each.value.name
  location = each.value.location
}