data "azurerm_network_interface" "nic_data" {
  for_each = var.vmsc
  name                = each.value.name-nic
  resource_group_name = each.value.resource_group_name
}