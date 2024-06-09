data "azurerm_subnet" "subnet" {
    for_each = var.Linux_vm
  name = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name = each.value.rg_name

}