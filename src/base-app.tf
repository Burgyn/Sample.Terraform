module "base-app" {
  source                      = "./application"
  application_name            = "base-app"
  default_app_service_plan_id = azurerm_app_service_plan.eshop.id

  resource_group = {
    name     = azurerm_resource_group.eshop.name
    location = azurerm_resource_group.eshop.location
  }

  sql_server = {
    id                           = azurerm_sql_server.eshop.id
    name                         = azurerm_sql_server.eshop.name,
    administrator_login          = azurerm_sql_server.eshop.administrator_login,
    administrator_login_password = azurerm_sql_server.eshop.administrator_login_password
  }

  key_vault = {
    id = azurerm_key_vault.eshop.id
  }

  services = {
    "authorization" = {
      name                = "authorization"
      create_database     = true
      app_service_plan_id = ""
    },
    "users" = {
      name                = "users"
      create_database     = true
      app_service_plan_id = ""
    },
    "tenant" = {
      name                = "tenant"
      create_database     = true
      app_service_plan_id = ""
    },
    "emails" = {
      name                = "emails"
      create_database     = false
      app_service_plan_id = ""
    }
  }
}

################################
# OUTPUT
################################
output "base_services" {
  value = module.base-app.services
}