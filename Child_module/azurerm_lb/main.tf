resource "azurerm_lb" "lbsc" {
    for_each = var.lbsc
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.azurerm_resource_group

#   frontend_ip_configuration {
#     name                 = "PublicIPAddress"
#     public_ip_address_id = azurerm_public_ip.example.id
#   }
}