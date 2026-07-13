resource "azurerm_storage_container" "scsc" {
  for_each              = var.scsc
  name                  = each.value.name
  storage_account_id    = data.azurerm_storage_account.storage_data[each.key].id
  container_access_type = each.value.container_access_type
}

data "azurerm_storage_account" "storage_data" {
  for_each            = var.scsc
  name                = each.value.name-storage
  resource_group_name = each.value.resource_group_name
}
