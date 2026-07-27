data "azurerm_public_ip" "pip_data" {
    for_each = var.lbsc
  name = each.value.name-pip
  resource_group_name = each.value.resource_group_name
}