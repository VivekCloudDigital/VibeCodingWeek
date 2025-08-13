resource "azurerm_app_service_plan" "main" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  kind = "linux"

  sku {
    tier = "Standard"
    size = "S1"
  }

  reserved = true # For Linux
}
