resource "azurerm_bastion_host" "bastion" {
  for_each = var.bhsc
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
 ip_configuration {
    name                 = each.value.name-bastion-ip
    subnet_id            = data.azurerm_subnet.subnet_data[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip_data[each.key].id
  }

}

