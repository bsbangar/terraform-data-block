data "azurerm_subnet" "subnet_data" {
  for_each = var.bhsc
  name                 = each.value.name-subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip_data" {
    for_each = var.bhsc
  name = each.value.name-pip
  resource_group_name = each.value.resource_group_name
}