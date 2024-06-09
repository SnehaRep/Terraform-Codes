resource "azurerm_virtual_network" "vnet" {
  for_each = var.Linux_vm

  name                = each.value.vnet_name
  address_space       = each.value.vnet_address_space
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name
}