module "resource_group" {
  source = "../Child_module/azurerm_resource_group"
  rgsc   = var.rgs
}

module "virtual_network" {
  source     = "../Child_module/azurerum_virtual_network"
  vnetsc     = var.vnets
  depends_on = [module.resource_group]
}

module "subnets" {
  source     = "../Child_module/azurerm_subnet"
  snetsc     = var.snets
  depends_on = [module.virtual_network]
}

module "network_interface" {
  source     = "../Child_module/azurerm_network_interface"
  nicsc      = var.nics
  depends_on = [module.subnets, module.public_ip]
}

module "public_ip" {
  source     = "../Child_module/azurerm_public_ip"
  pipsc      = var.pips
  depends_on = [module.resource_group]
}

module "storage_acoount" {
  source     = "../Child_module/azurerm_Storage_account"
  sasc       = var.sas
  depends_on = [module.resource_group]
}

module "storage_container" {
  source     = "../Child_module/azurerm_storage_container"
  scsc       = var.scs
  depends_on = [module.storage_acoount]
}

module "azurerm_linux_virtual_machine" {
  source     = "../Child_module/azurerm_linux_virtual_machine"
  vmsc       = var.vms
  depends_on = [module.network_interface]
}

module "azurerm_network_security_group" {
  source     = "../Child_module/azurerm_network_security_group"
  nsgsc      = var.nsgs
  depends_on = [module.resource_group]
}

module "azurerm_subnet_network_security_group_association" {
  source        = "../Child_module/azurerm_subnet_network_security_group_association"
  associationsc = var.associations
  depends_on    = [module.subnets, module.azurerm_network_security_group]
}