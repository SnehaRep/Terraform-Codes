resource "azurerm_subnet" "bastion_subnet" {
    for_each = var.Linux_vm
  name                 = "AzureBastionSubnet"
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.Bastion_address_prefixes
}

resource "azurerm_public_ip" "bastion_pip" {
    for_each = var.Linux_vm
  name                = each.value.bastion_pip
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion_host" {
    for_each = var.Linux_vm
  name                = each.value.bastion_host_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion_subnet[each.key].id
    public_ip_address_id = azurerm_public_ip.bastion_pip[each.key].id
  }
}