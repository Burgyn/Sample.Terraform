provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "eshop" {
  name     = "mino-eshop-rsg"
  location = "West Europe"
}
