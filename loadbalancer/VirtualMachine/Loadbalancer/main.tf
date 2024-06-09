resource "azurerm_public_ip" "lb_pip" {
  for_each = var.Lb
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = each.value.allocation_method
}

resource "azurerm_lb" "lb" {
  for_each = var.Lb
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  frontend_ip_configuration {
    name                 = each.value.ip_config_name
    public_ip_address_id = azurerm_public_ip.lb_pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "backend" {
  for_each = var.Lb
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.pool_name
}

resource "azurerm_network_interface_backend_address_pool_association" "association1" {
  for_each = var.Lb
  network_interface_id = data.azurerm_network_interface.nic1[each.key].id
  ip_configuration_name = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend[each.key].id
}

resource "azurerm_network_interface_backend_address_pool_association" "association2" {
  for_each = var.Lb
  network_interface_id = data.azurerm_network_interface.nic2[each.key].id
  ip_configuration_name = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend[each.key].id
}

resource "azurerm_lb_probe" "probe" {
  for_each = var.Lb
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.probe_name
  port            = 80
}

resource "azurerm_lb_rule" "rule" {
  for_each = var.Lb
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = each.value.ip_config_name
  backend_address_pool_ids = [ azurerm_lb_backend_address_pool.backend[each.key].id ]
  probe_id = azurerm_lb_probe.probe[each.key].id
}



