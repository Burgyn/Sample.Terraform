resource "azurerm_app_service" "users" {
  name                = "mino-${terraform.workspace}-eshop-users"
  location            = azurerm_resource_group.eshop.location
  resource_group_name = azurerm_resource_group.eshop.name
  app_service_plan_id = azurerm_app_service_plan.eshop.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
    http2_enabled            = true
    always_on                = false
    websockets_enabled       = false
  }

  app_settings = {
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE" = "true"
    "WEBSITE_RUN_FROM_PACKAGE"        = "1"
  }

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLServer"
    value = "Server=tcp:${azurerm_sql_server.eshop.name}.database.windows.net,1433;Initial Catalog=${azurerm_mssql_database.users.name};Persist Security Info=False;User ID=${azurerm_sql_server.eshop.administrator_login};Password=${azurerm_sql_server.eshop.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
}

output "services_users_url" {
  value = "https://${azurerm_app_service.users.default_site_hostname}"
}