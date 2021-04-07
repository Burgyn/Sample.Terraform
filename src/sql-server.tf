resource "random_password" "password" {
  length           = 20
  special          = true
}

resource "azurerm_sql_server" "eshop" {
  name                         = "mino-${lower(terraform.workspace)}-eshop-sql"
  resource_group_name          = azurerm_resource_group.eshop.name
  location                     = azurerm_resource_group.eshop.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = random_password.password.result
}