resource "azurerm_key_vault" "eshop" {
  name                = "mino-${lower(terraform.workspace)}-settings-plan"
  resource_group_name = azurerm_resource_group.eshop.name
  location            = azurerm_resource_group.eshop.location
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"
}


resource "azurerm_key_vault_access_policy" "groups" {
  key_vault_id = azurerm_key_vault.eshop.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  key_permissions = [
    "get",
    "list",
    "create",
    "update",
    "wrapKey",
    "unwrapKey",
    "sign",
    "verify",
    "recover"
  ]
  secret_permissions = [
    "get",
    "list",
    "set",
    "delete",
    "recover"
  ]
}