module "eshop-app" {
  source                      = "./application"
  application_name            = "eshop-app"
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
    "catalog" = {
      name                = "catalog"
      create_database     = true
      app_service_plan_id = ""
    },
    "basket" = {
      name                = "basket"
      create_database     = true
      app_service_plan_id = ""
    },
    "orders" = {
      name                = "orders"
      create_database     = true
      app_service_plan_id = ""
    }
  }

  app_depends_on = [
    azurerm_key_vault_access_policy.groups
  ]
}

################################
# OUTPUT
################################
output "eshop_services" {
  value = module.eshop-app.services
}
