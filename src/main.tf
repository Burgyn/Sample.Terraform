provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "eshop" {
  name     = "mino-${terraform.workspace}-eshop-rsg"
  location = "West Europe"
}
