resource "azurerm_lb" "lbsc" {
    for_each = var.lbsc
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.pip_data[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "lbsc-pool" {
  for_each = var.lbsc
  loadbalancer_id = data.azurerm_lb.lbsc[each.key].id
  name            = each.value.name-pool

}

resource "azurerm_lb_backend_address_pool_address" "lbsc-pool-address" {
  for_each = var.lbsc
  name                    = each.value.name-pool-address
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.lbsc[each.key].id
  virtual_network_id      = data.azurerm_virtual_network.lbsc[each.key].id
  ip_address              = "10.1.1.4"
}