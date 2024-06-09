data "azurerm_resource_group" "rg1" {
  name     = "sneha_vm_rg"
}

data "azurerm_storage_account" "st1" {
  name                     = "snehasa"
  resource_group_name      = data.azurerm_resource_group.rg1.name
}