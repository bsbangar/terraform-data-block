resource "azurerm_subnet_network_security_group_association" "associationsc" {
  for_each                  = var.associationsc
  subnet_id                 = data.azurerm_subnet.subnet_data[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg_data[each.key].id
}


