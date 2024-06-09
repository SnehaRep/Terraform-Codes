resource "azurerm_public_ip" "publicip" {
  for_each            = var.Linux_vm
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg_location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.pip_sku
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.Linux_vm
  name                = each.value.nic_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "sneha_vm" {
  for_each                        = var.Linux_vm
  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.rg_location
  size                            = each.value.size
  admin_username                  = each.value.admin_user
  admin_password                  = each.value.password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]


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