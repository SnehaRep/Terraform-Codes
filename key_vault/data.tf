data "azurerm_resource_group" "rg" {
  name     = "sneha_vm_rg"
}

data "azurerm_virtual_network" "vnet" {
  name                = "sneha_vnet"
  resource_group_name = data.azurerm_resource_group.rg.name

}

data "azurerm_subnet" "sub1" {
  name                 = "vmsubnet"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

data "azurerm_key_vault_secret" "password" {
  name = "password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "username" {
  name = "username"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault" "keyvault" {
  name                = "keyvaultsneha"
  resource_group_name = data.azurerm_resource_group.rg.name
}