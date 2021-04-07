resource "azurerm_app_service" "service" {
  for_each            = var.services
  name                = "mino-${lower(terraform.workspace)}-eshop-${lower(each.value.name)}-api"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  app_service_plan_id = each.value.app_service_plan_id != "" ? each.value.app_service_plan_id : var.default_app_service_plan_id

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

}

################################
# OUTPUT
################################
output "services" {
  value = [
    for name, default_site_hostname in zipmap(values(var.services)[*]["name"], values(azurerm_app_service.service)[*]["default_site_hostname"]):
    map("name", name, "host", "https://${default_site_hostname}")
  ]
  description = "Services"
}