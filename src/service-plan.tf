resource "azurerm_app_service_plan" "eshop" {
  name                = "mino-${terraform.workspace}-eshop-plan"
  location            = azurerm_resource_group.eshop.location
  resource_group_name = azurerm_resource_group.eshop.name

  sku {
    tier = var.eshop_plan_sku.tier
    size = var.eshop_plan_sku.size
  }
}