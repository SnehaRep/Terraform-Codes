resource "azurerm_subnet" "vm_subnet" {
  for_each = var.Linux_vm

  name                 = "internal"
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}