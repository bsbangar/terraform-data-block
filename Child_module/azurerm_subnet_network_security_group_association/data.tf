data "azurerm_subnet" "subnet_data" {
  for_each             = var.associationsc
  name                 = each.value.name-subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_network_security_group" "nsg_data" {
  for_each            = var.associationsc
  name                = each.value.name-nsg
  resource_group_name = each.value.resource_group_name
}
