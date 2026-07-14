resource "azurerm_subnet_network_security_group_association" "associationsc" {
  for_each                  = var.associationsc
  subnet_id                 = data.azurerm_subnet.subnet_data[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg_data[each.key].id
}


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
