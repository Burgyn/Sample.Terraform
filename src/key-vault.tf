resource "azurerm_key_vault" "eshop" {
  name                = "mino-${lower(terraform.workspace)}-settings-plan"
  resource_group_name = azurerm_resource_group.eshop.name
  location            = azurerm_resource_group.eshop.location
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"
}
