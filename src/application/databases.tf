locals {
  databases = { for key, value in var.services : key => value if value.create_database }
}

resource "azurerm_mssql_database" "users" {
  for_each  = local.databases
  name      = "mino-${lower(terraform.workspace)}-eshop-${lower(each.value.name)}-db"
  server_id = var.sql_server.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  sku_name  = "BC_Gen5_2"
}

resource "azurerm_key_vault_secret" "connection_string" {
  for_each     = local.databases
  name         = "${title(each.value.name)}-ConnectionStrings-DefaultConnection-${lower(terraform.workspace)}"
  value        = "Server=tcp:${var.sql_server.name}.database.windows.net,1433;Initial Catalog=mino-eshop-${lower(each.value.name)}-db;Persist Security Info=False;User ID=${var.sql_server.administrator_login};Password=${var.sql_server.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30"
  key_vault_id = var.key_vault.id
}