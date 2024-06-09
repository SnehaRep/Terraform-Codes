data "azurerm_network_interface" "nic1" {
  for_each = var.Lb
  name                = each.value.nic_name1
  resource_group_name = each.value.rg_name
}

data "azurerm_network_interface" "nic2" {
    for_each = var.Lb
  name                = each.value.nic_name2
  resource_group_name = each.value.rg_name

}