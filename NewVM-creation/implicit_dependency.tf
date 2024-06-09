terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.97.1"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg1" {
  name     = "sneha_rg1"
  location = "West Europe"
}

resource "azurerm_resource_group" "rg3" {
  depends_on = [ azurerm_resource_group.rg1 ]
  name     = "sneha_rg3"
  location = "West US"
}

resource "azurerm_storage_account" "st3" {
  depends_on = [ azurerm_resource_group.rg3 ]
  name                     = "stsnehast3"
  resource_group_name      = "sneha_rg3"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

