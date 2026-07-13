# module "resource_group" {
#   source = "../Child_module/azurerm_resource_group"
#   rgsc   = var.rgs
# }

# module "virtual_network" {
#   source     = "../Child_module/azurerum_virtual_network"
#   vnetsc     = var.vnets
#   depends_on = [module.resource_group]
# }

# module "subnets" {
#   source     = "../Child_module/azurerm_subnet"
#   snetsc     = var.snets
#   depends_on = [module.virtual_network]
# }

# module "network_interface" {
#   source     = "../Child_module/azurerm_network_interface"
#   nicsc      = var.nics
#   depends_on = [module.subnets, module.public_ip]
# }

# module "public_ip" {
#   source     = "../Child_module/azurerm_public_ip"
#   pipsc      = var.pips
#   depends_on = [module.resource_group]
# }
