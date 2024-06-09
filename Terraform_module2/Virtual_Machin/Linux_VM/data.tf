data "azurerm_network_interface" "nic" {
  for_each = var.Linux_vm
  name     = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault" "keyvault" {
    for_each = var.Linux_vm
  name                = each.value.keyvault_name
  resource_group_name = each.value.keyvault_rg_name
}

data "azurerm_key_vault_secret" "key" {
    for_each = var.Linux_vm
  name         = each.value.username
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}

data "azurerm_key_vault_secret" "key1" {
    for_each = var.Linux_vm
  name         = each.value.password
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}