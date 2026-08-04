data "azurerm_public_ip" "pip_data" {
    for_each = var.lbsc
  name = each.value.name-pip
  resource_group_name = each.value.resource_group_name
}

data "azurerm_lb" "lbsc" {
  for_each = var.lbsc
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}


data "azurerm_virtual_network" "lbsc" {
  for_each = var.lbsc
  name                = each.value.name-vnet
  resource_group_name = each.value.resource_group_name
}

data "azurerm_lb_backend_address_pool" "lbsc" {
  for_each = var.lbsc
  name            = each.value.name-pool
  loadbalancer_id = data.azurerm_lb.lbsc[each.key].id
}