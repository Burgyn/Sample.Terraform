provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {

}

resource "azurerm_resource_group" "eshop" {
  name     = "mino-${terraform.workspace}-eshop-rsg"
  location = "West Europe"
}
