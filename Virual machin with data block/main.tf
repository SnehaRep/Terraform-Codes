resource "azurerm_public_ip" "publicip" {
  for_each = var.linuxvm
  name  = each.value.pip_name
  resource_group_name = each.value.rgname
  location            = each.value.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "nic" {
  for_each = var.linuxvm
  name = each.value.vm-nic
  location            = each.value.location
  resource_group_name = each.value.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnetid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_linux_virtual_machine" "sneha_vm" {
  name                            = "snehavm"
  resource_group_name             = "sneha_vm_rg"
  location                        = "Central India"
  size                            = "Standard_F2"
  admin_username                  = "snehaadmin"
  admin_password                  = "Password@1234"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id,
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