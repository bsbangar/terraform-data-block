data "azurerm_storage_account" "storage_data" {
  for_each            = var.scsc
  name                = each.value.name-storage
  resource_group_name = each.value.resource_group_name
}