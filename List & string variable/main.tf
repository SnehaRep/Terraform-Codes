variable "rg_name" {
  type = set(string)
}

resource "azurerm_resource_group" "example" {
  for_each = var.rg_name
  name     = each.key
  location = "West Europe"
}