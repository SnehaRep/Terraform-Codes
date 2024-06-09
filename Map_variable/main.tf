variable "map_variable" {
  
}

resource "azurerm_resource_group" "rg" {
  name     = "Sneha_map_rg1"
  location = "West Europe"
}

resource "azurerm_storage_account" "st" {
  depends_on = [azurerm_resource_group.rg]
  for_each = var.map_variable
  name                     = each.value.stname
  resource_group_name      = each.value.rg_name
  location                 = each.value.stlocation
  account_tier              = each.value.st_account_tier
  account_replication_type = each.value.st_account_replication_type

}