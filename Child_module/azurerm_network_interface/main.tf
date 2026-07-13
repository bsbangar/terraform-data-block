resource "azurerm_network_interface" "nicsc" {
  for_each = var.nicsc
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
   name = "internal"
   subnet_id = data.azurerm_subnet.subnet_data[each.key].id
   private_ip_address_allocation = "Dynamic" 
   public_ip_address_id = data.azurerm_public_ip.pip_data[each.key].id
  }
}

data "azurerm_subnet" "subnet_data" {
  for_each = var.nicsc
  name                 = each.value.name-subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip_data" {
    for_each = var.nicsc
  name = each.value.name-pip
  resource_group_name = each.value.resource_group_name
}