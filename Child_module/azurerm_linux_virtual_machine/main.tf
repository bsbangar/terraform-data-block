resource "azurerm_linux_virtual_machine" "vmsc" {
  for_each = var.vmsc
  
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = "P@ssword1234!"
  disable_password_authentication = false
  network_interface_ids =[ data.azurerm_network_interface.nic_data[each.key].id]

#   admin_ssh_key {
#     username   = each.value.admin_username
#     # public_key = file("~/.ssh/id_rsa.pub")
#   }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

data "azurerm_network_interface" "nic_data" {
  for_each = var.vmsc
  name                = each.value.name-nic
  resource_group_name = each.value.resource_group_name
}
