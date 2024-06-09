resource "azurerm_resource_group" "rg" {
  for_each = var.vnet
  name     = each.value.rg_name
  location = each.value.location
}

resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name           = subnet.value.sub_name
      address_prefix = subnet.value.address_prefix
    }
  }
}