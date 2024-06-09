
resource "azurerm_mssql_server" "sqlserver" {
  name                         = "sneha-sqlserver"
  resource_group_name          = data.azurerm_resource_group.rg1.name
  location                     = data.azurerm_resource_group.rg1.location
  version                      = "12.0"
  administrator_login          = "snehaadmin"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "sqldb" {
  name           = "sneha_sql-db"
  server_id      = azurerm_mssql_server.sqlserver.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
  enclave_type   = "VBS"

  tags = {
    foo = "bar"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}