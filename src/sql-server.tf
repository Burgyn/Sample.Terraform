resource "random_password" "password" {
  length           = 20
  special          = true
}

resource "azurerm_sql_server" "eshop" {
  name                         = "mino-${terraform.workspace}-eshop-sql"
  resource_group_name          = azurerm_resource_group.eshop.name
  location                     = azurerm_resource_group.eshop.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = random_password.password.result
}

resource "azurerm_mssql_database" "users" {
  name      = "mino-eshop-users-db"
  server_id = azurerm_sql_server.eshop.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  sku_name  = "BC_Gen5_2"
}